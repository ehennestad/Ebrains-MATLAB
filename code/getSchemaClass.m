function clsHandle = getSchemaClass(schemaName)
%getSchemaClass Get function handle for a schema class given the schema name
%
% This function generates the schema class if it does not exits.

    % Go through the folder with core schemas and list all of them
    rootdir = oms.localpath('coreSchemas');
    %rootdir = {oms.localpath('coreSchemas'), oms.localpath('controlledTerms')};
    abspath = utility.path.listSubDir(rootdir, '', {}, inf);

    className = schemaName;
    className(1) = upper(className(1));

    schemaFilepathArray = utility.path.listFiles(abspath, '.json');
    [~, schemaNames] = fileparts(schemaFilepathArray);
    schemaNames = strrep(schemaNames, '.schema.tpl', '');
    

    % Find the filepath for the schema with the name given as input
    schemaName(1) = lower(schemaName(1));% filenames are always with first letter lowercase
    isMatch = strcmpi(schemaNames, schemaName);

    if ~any(isMatch) 
        % Maybe the schema is a controlledTerms schema?
        className = sprintf('oms.ct.%s', className);
        if ~exist(className, 'class')
            error('Schema not found for %s', schemaName)
        else
            clsHandle = str2func(className); return
        end
    end

    % Assemble the full classname (including packages) for schema based on
    % the folder hierarchy of the original json schemas.
    schemaFilepath = schemaFilepathArray{isMatch};
    subfolders = strsplit(schemaFilepath, filesep);

    if contains(schemaFilepath, 'controlledTerms')
        packageFolders = {'ct'};
    else
        packageFolders = subfolders([end-3, end-1]);
    end

    className = strjoin(['oms', packageFolders, className], '.');

    % Create the class schema if it does not exist
    if ~exist(className, 'class')
        writeClassFromJsonSchema(packageFolders{end}, schemaName);
    end

    clsHandle = str2func(className);
end