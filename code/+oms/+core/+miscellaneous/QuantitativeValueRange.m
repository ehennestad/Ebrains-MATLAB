classdef QuantitativeValueRange < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'maxValue', 'minValue'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/QuantitativeValueRange'

	end

	properties
		maxValue (1,1) double         % Greatest quantity attained or allowed.
		minValue (1,1) double         % Smallest quantity attained or allowed.
		unit     oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = QuantitativeValueRange(maxValue, minValue, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.maxValue = maxValue;
			obj.minValue = minValue;
		end

	end

end