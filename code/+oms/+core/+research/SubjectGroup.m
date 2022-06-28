classdef SubjectGroup < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'biologicalSex', 'species', 'studiedState'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/SubjectGroup'

	end

	properties
		studiedState       oms.abstract.OpenMindsSchema % N/A
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

		function obj = SubjectGroup(biologicalSex, species, studiedState, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.biologicalSex = biologicalSex;
			obj.species = species;
			obj.studiedState = studiedState;
		end

	end

end