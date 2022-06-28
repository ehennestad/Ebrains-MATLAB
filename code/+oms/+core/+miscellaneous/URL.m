classdef URL < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'URL'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/URL'

	end

	properties
		URL char                 % N/A
	end

	methods

		function obj = URL(URL, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.URL = URL;
		end

	end

end