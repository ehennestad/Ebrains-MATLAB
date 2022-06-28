function pathStr = localpath(keyword)

    rootDir = fileparts(fileparts(fileparts(mfilename('fullpath'))));

    if ~nargin
        pathStr = rootDir; return
    end

    switch keyword
        
        case 'code'
            pathStr = fullfile(rootDir, 'code');

        case 'schemaInstances'
            rootDir = fullfile(rootDir, 'schema');
            pathStr = fullfile(rootDir, 'openMINDS_instances-1', 'instances');
    
        case 'coreSchemas'
            rootDir = fullfile(rootDir, 'schema');
            pathStr = fullfile(rootDir, 'openMINDS-v2', 'schema.tpl.json', 'core');


        case 'controlledTerms'
            rootDir = fullfile(rootDir, 'schema');
            pathStr = fullfile(rootDir, 'openMINDS-v2', 'schema.tpl.json', 'controlledTerms');
    end

end