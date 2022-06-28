function autogenerateAll()

    schemaNames = listSchemaNames();
    for i = 1:numel(schemaNames)
        autegenerateControlledTermsSchema(schemaNames{i});
    end


end