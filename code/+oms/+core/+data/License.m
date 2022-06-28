classdef License < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'fullName', 'legalCode', 'shortName'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/License'
		description_ = 'Structured information on a used license.'
	end

	properties
		fullName  char                 % Whole, non-abbreviated name of something or somebody.
		legalCode char                 % Type of legislation that claims to cover the law system (complete or parts) as it existed at the time the code was enacted.
		shortName char                 % Shortened or fully abbreviated name of something or somebody.
		webpage   double               % Hypertext document (block of information) found on the World Wide Web.
	end

	methods

		function obj = License(fullName, legalCode, shortName, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.fullName = fullName;
			obj.legalCode = legalCode;
			obj.shortName = shortName;
		end

	end

end