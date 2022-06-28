function writeClassFromJsonSchema(category, schemaName)

    % Get schema source and open .m file:
    rootDir = oms.localpath('coreSchemas');
    sourceFolder = fullfile(oms.localpath('coreSchemas'), 'v3');
    targetFolder = fullfile(oms.localpath('code'), '+oms', '+core', ['+', category]);

    sourceFilename = sprintf('%s.schema.tpl.json', schemaName);
    S = loadjson(fullfile(sourceFolder, category, sourceFilename));

    className = schemaName;
    className(1) = upper(className(1));

    mFileTarget = fullfile(targetFolder, [className, '.m']);
    if ~isfolder(targetFolder); mkdir(targetFolder); end
    fid = fopen(mFileTarget, 'w');

    

    % Start class definition
    fwrite(fid, sprintf('classdef %s < oms.abstract.OpenMindsSchema', className));
    fwrite(fid, newline);
    fwrite(fid, newline);

    % Create property block 1
    fwrite(fid, sprintf('\tproperties (Constant, Hidden)'));
    fwrite(fid, newline);
    if ~isfield(S, 'required') && isfield(S, 'requires')
        S.required = S.requires;
        warning('Changed fieldname requires to required for schema %s', schemaName)
    end
    
    if isfield(S, 'required')
        requiredValues = cellfun(@(c) sprintf('''%s''', c), S.required, 'UniformOutput', false);
        requiredValuesStr = strjoin( requiredValues, ', ');
    else
        requiredValuesStr = '';
    end

    fwrite(fid, sprintf('\t\t%s = {%s}', 'required', requiredValuesStr));
    fwrite(fid, newline);
    writeMethodBlockEnd(fid)

    % Create property block 2
    fwrite(fid, sprintf('\tproperties (Constant)'));
    fwrite(fid, newline);
     
    fieldsA = {'x0x5F_type', 'description'};
    for i = 1:numel(fieldsA)
        if isfield( S, fieldsA{i} )
            if strcmp(fieldsA{i}, 'description')
                fieldName = 'description_';
            else
                fieldName = fieldsA{i};
            end
            fwrite(fid, sprintf('\t\t%s = ''%s''', fieldName, S.(fieldsA{i})));
        end
        fwrite(fid, newline);
    end
    writeMethodBlockEnd(fid);

    
    % Write main class properties
    propertyFields = fieldnames( S.properties );
    numCharacters = cellfun( @(c) numel(c), propertyFields);
    propertyNameLenghtMax = max(numCharacters);

    fwrite(fid, sprintf('\tproperties'));
    fwrite(fid, newline);

    for i = 1:numel(propertyFields)
        stmp = S.properties.(propertyFields{i});

        propName = stmp.title;
        propNamePadded = pad(propName, propertyNameLenghtMax);


        if isfield(stmp, 'x0x5F_linkedTypes')
            [~, linkedSchemaName] = fileparts(stmp.x0x5F_linkedTypes);
            if numel(linkedSchemaName) > 1
% %                 warning('Schema (%s) with multiple linked types is not supported yet', className)
% %                 fclose(fid);
% %                 delete(mFileTarget);
% %                 return
                dataType = 'oms.abstract.OpenMindsSchema';
            else
                dataType = func2str(getSchemaClass(linkedSchemaName));
            end
            
            try
                description = dataType.description;
            catch
                description = 'N/A';
            end

        elseif isfield(stmp, 'type')
            
            switch stmp.type
                case 'string'
                    dataType = 'char';
                case 'array'
                    dataType = 'double';
                case 'number'
                    dataType = '(1,1) double';
                case 'integer'
                    dataType = '(1,1) uin64';
                otherwise
                    dataType = '';
                    fprintf('unknown type: %s\n', stmp.type)
            end

            if isfield(stmp, 'description')
                description = stmp.description;
            else
                description = 'N/A';
            end
     
        else
            warning('Unknown schema definition for schema %s', className)
        end

        dataTypePadded = pad(dataType, 20);

        fwrite(fid, sprintf('\t\t%s %s %% %s', propNamePadded, dataTypePadded, description));
        fwrite(fid, newline);
    end
    writeMethodBlockEnd(fid)


    % Write constructor
    writeMethodBlockBegin(fid)
    
        % Write constructor method
        if isfield(S, 'required')

            fwrite(fid, sprintf('\t\tfunction obj = %s(%s, varargin)', className, strjoin(S.required, ', ') ));
            fwrite(fid, newline);
            
            % Test that num args matches required variables:
            writeFormattedLine(fid, 3, sprintf('if nargin < numel(obj.required)') )
            writeUnformattedLine(fid, 4, 'requiredValues = cellfun(@(c) sprintf(''%s'', c), obj.required, ''UniformOutput'',false);');
            writeUnformattedLine(fid, 4, 'error(''This schema requires the following variables: %s'', strjoin( requiredValues, '', ''))' ) 
            writeFormattedLine(fid, 3, 'end' )
    
            for i = 1:numel(S.required)
                fwrite(fid, sprintf('\t\t\tobj.%s = %s;', S.required{i}, S.required{i}));
                fwrite(fid, newline); 
            end

        else
            fwrite(fid, sprintf('\t\tfunction obj = %s(varargin)', className ));
        end
    
        writeFunctionEnd(fid)
        % Closed constructor metho
    
    fwrite(fid, newline); 
    writeMethodBlockEnd(fid)
    fwrite(fid, 'end'); % Class end

    fclose(fid);
    
    
end 

function writePropertyBlockBegin(fid, varargin)
    
    if isempty(varargin)
        str = sprintf('\tproperties');
        fwrite(fid, str);
    else
        fwrite(fid, sprintf( '\tproperties (%s)', strjoin(varargin, ', ')));
    end

end


function writeMethodBlockBegin(fid, varargin)
    
    if isempty(varargin)
        str = sprintf('\tmethods');
        fwrite(fid, str);
    else
        fwrite(fid, sprintf( '\tmethods (%s)', strjoin(varargin, ', ')));
    end
    fwrite(fid, newline);
    fwrite(fid, newline);

end

function writeFunctionEnd(fid)
    fwrite(fid, sprintf('\t\tend')); 
    fwrite(fid, newline); 
end

function writeMethodBlockEnd(fid)
    fwrite(fid, sprintf('\tend')); 
    fwrite(fid, newline);
    fwrite(fid, newline);
end

function writeFormattedLine(fid, indentLevel, formattedStr)
    tabExpression = repmat('\t', 1, indentLevel);
    fwrite(fid, sprintf( [tabExpression, formattedStr] ) );
    fwrite(fid, newline);
end

function writeUnformattedLine(fid, indentLevel, unformattedStr)
    tabExpression = repmat('\t', 1, indentLevel);
    fwrite(fid, [sprintf( tabExpression ), unformattedStr] );
    fwrite(fid, newline);
end 
