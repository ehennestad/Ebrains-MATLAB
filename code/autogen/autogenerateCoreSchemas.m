function autogenerateCoreSchemas()
%autogenerateCoreSchemas Summary of this function goes here
%   Detailed explanation goes here

    rootdir = oms.localpath('coreSchemas');
    
    abspath = utility.path.listSubDir(rootdir, '', {}, inf);
    schemaFilepathArray = utility.path.listFiles(abspath, '.json');
    [~, schemaNames] = fileparts(schemaFilepathArray);
    schemaNames = strrep(schemaNames, '.schema.tpl', '');

    for i = 1:numel(schemaNames)
        getSchemaClass(schemaNames{i});
    end
end