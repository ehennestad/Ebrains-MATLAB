classdef GRIDID < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'identifier'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/GRIDID'

	end

	properties
		identifier char                 % Term or code used to identify something or someone.
	end

	methods

		function obj = GRIDID(identifier, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.identifier = identifier;
		end

	end

end