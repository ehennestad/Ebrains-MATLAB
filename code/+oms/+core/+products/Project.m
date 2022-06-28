classdef Project < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'description', 'fullName', 'hasResearchProducts', 'shortName'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Project'
		description_ = 'Structured information on a research project.'
	end

	properties
		description         char                 % Longer statement or account giving the characteristics of someone or something.
		fullName            char                 % Whole, non-abbreviated name of something or somebody.
		hasResearchProducts oms.abstract.OpenMindsSchema % N/A
		homepage            oms.abstract.OpenMindsSchema % N/A
		coordinator         oms.abstract.OpenMindsSchema % N/A
		shortName           char                 % Shortened or fully abbreviated name of something or somebody.
	end

	methods

		function obj = Project(description, fullName, hasResearchProducts, shortName, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.description = description;
			obj.fullName = fullName;
			obj.hasResearchProducts = hasResearchProducts;
			obj.shortName = shortName;
		end

	end

end