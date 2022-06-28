classdef Affiliation < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'organization'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Affiliation'

	end

	properties
		startDate    char                 % Date in the Gregorian calendar at which something begins in time
		endDate      char                 % Date in the Gregorian calendar at which something terminates in time.
		organization oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = Affiliation(organization, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.organization = organization;
		end

	end

end