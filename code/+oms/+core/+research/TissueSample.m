classdef TissueSample < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'type', 'biologicalSex', 'internalIdentifier', 'origin', 'species', 'studiedState'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/TissueSample'
		description_ = 'Structured information on a tissue sample.'
	end

	properties
		isPartOf           oms.abstract.OpenMindsSchema % N/A
		laterality         oms.abstract.OpenMindsSchema % N/A
		origin             oms.abstract.OpenMindsSchema % N/A
		studiedState       oms.abstract.OpenMindsSchema % N/A
		type               oms.abstract.OpenMindsSchema % N/A
		biologicalSex      oms.abstract.OpenMindsSchema % N/A
		internalIdentifier char                 % Term or code that identifies someone or something within a particular product.
		lookupLabel        char                 % N/A
		phenotype          oms.abstract.OpenMindsSchema % N/A
		species            oms.abstract.OpenMindsSchema % N/A
		strain             oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = TissueSample(type, biologicalSex, internalIdentifier, origin, species, studiedState, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.type = type;
			obj.biologicalSex = biologicalSex;
			obj.internalIdentifier = internalIdentifier;
			obj.origin = origin;
			obj.species = species;
			obj.studiedState = studiedState;
		end

	end

end