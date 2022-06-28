classdef TissueSampleCollection < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'type', 'biologicalSex', 'origin', 'species', 'studiedState'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/TissueSampleCollection'

	end

	properties
		laterality         oms.abstract.OpenMindsSchema % N/A
		origin             oms.abstract.OpenMindsSchema % N/A
		studiedState       oms.abstract.OpenMindsSchema % N/A
		type               oms.abstract.OpenMindsSchema % N/A
		additionalRemarks  char                 % Mention of what deserves additional attention or notice.
		biologicalSex      oms.abstract.OpenMindsSchema % N/A
		internalIdentifier char                 % Term or code that identifies someone or something within a particular product.
		lookupLabel        char                 % N/A
		phenotype          oms.abstract.OpenMindsSchema % N/A
		quantity           (1,1) uin64          % Total amount or number of things or beings.
		species            oms.abstract.OpenMindsSchema % N/A
		strain             oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = TissueSampleCollection(type, biologicalSex, origin, species, studiedState, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.type = type;
			obj.biologicalSex = biologicalSex;
			obj.origin = origin;
			obj.species = species;
			obj.studiedState = studiedState;
		end

	end

end