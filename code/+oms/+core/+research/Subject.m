classdef Subject < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'biologicalSex', 'species', 'studiedState', 'internalIdentifier'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Subject'
		description_ = 'Structured information on a subject.'
	end

	properties
		isPartOf           oms.abstract.OpenMindsSchema % N/A
		studiedState       oms.abstract.OpenMindsSchema % N/A
		biologicalSex      oms.abstract.OpenMindsSchema % N/A
		internalIdentifier char                 % Term or code that identifies someone or something within a particular product.
		lookupLabel        char                 % N/A
		phenotype          oms.abstract.OpenMindsSchema % N/A
		species            oms.abstract.OpenMindsSchema % N/A
		strain             oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = Subject(biologicalSex, species, studiedState, internalIdentifier, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.biologicalSex = biologicalSex;
			obj.species = species;
			obj.studiedState = studiedState;
			obj.internalIdentifier = internalIdentifier;
		end

	end

end