classdef Organization < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'fullName'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Organization'
		description_ = 'Structured information on an organization.'
	end

	properties
		digitalIdentifier oms.abstract.OpenMindsSchema % N/A
		fullName          char                 % Whole, non-abbreviated name of something or somebody.
		hasParent         oms.abstract.OpenMindsSchema % N/A
		homepage          oms.abstract.OpenMindsSchema % N/A
		shortName         char                 % Shortened or fully abbreviated name of something or somebody.
	end

	methods

		function obj = Organization(fullName, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.fullName = fullName;
		end

	end

end