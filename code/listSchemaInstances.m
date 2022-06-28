function schemaInstanceNames = listSchemaInstances(schemaName)
%getSchemaInstances Get name of schema instances

    rootDir = oms.localpath('schemaInstances');

    L = dir(fullfile(rootDir, schemaName, '*.jsonld'));
    schemaInstanceNames = {L.name};
    schemaInstanceNames = strrep(schemaInstanceNames, '.jsonld', '');
    schemaInstanceNames = transpose(schemaInstanceNames);
    return
    
    
    numInstances = numel(L);

    schemaInstances = cell(1, numInstances);

    for i = 1:numInstances
        schemaInstances{i} = loadjson(fullfile(L(i).folder, L(i).name)); 
    end
    
    schemaInstances = cat(1, schemaInstances{:});

    schemaInstanceNames = {schemaInstances.name};
end