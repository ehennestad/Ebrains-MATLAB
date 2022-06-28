classdef Instance < oms.abstract.OpenMindsSchema

    properties
        name
        definition
        description
        ontologyIdentifier
    end

    methods
        
        function obj = Instance(schemaName, instance)

            s = getSchemaItem(schemaName, instance);
            
            obj.name = s.name;
            obj.definition = s.definition;
            obj.description = s.description;
            obj.ontologyIdentifier = s.preferredOntologyIdentifier;
        end

    end

end