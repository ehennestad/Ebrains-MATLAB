classdef CellType < oms.abstract.OpenMindsSchema & oms.mixin.hasInstance

    properties
        name
        definition
        description
        ontologyIdentifier
    end

    methods
        
        function obj = CellType(name, definition, description, ontologyIdentifier)
            
            if ~nargin; return; end
            
            obj.name = name;
            obj.definition = definition;
            obj.description = description;
            obj.ontologyIdentifier = ontologyIdentifier;
        end

    end

end