function schemaNames = listSchemaNames()
    
    rootDir = oms.localpath('schemaInstances');
    L = dir(rootDir);
    keep = ~strncmp({L.name}, '.', 1);
    L = L(keep);
    
    schemaNames = {L.name}';

end