function S = getSchemaItem(schemaName, instance)
%Get instance of a controlledTerms schema as a struct

    rootDir = oms.localpath('schemaInstances');

    fileName = strcat(instance, '.jsonld');
    filePath = fullfile(rootDir, schemaName, fileName);

    S = loadjson(filePath);
end