classdef hasInstance < handle

    methods

        function obj = fromInstance(obj, instanceName)
            className = class(obj);
            classNameSplit = strsplit(className, '.');
            schemaName = classNameSplit{end};
            s = getSchemaItem(schemaName, instanceName);
            
            obj.name = s.name;
            obj.definition = s.definition;
            obj.description = s.description;
            obj.ontologyIdentifier = s.preferredOntologyIdentifier;
            if ~nargout; clear obj; end
        end

    end

end