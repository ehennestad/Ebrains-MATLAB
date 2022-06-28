classdef QuantitativeValue < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'value'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/QuantitativeValue'
		description_ = 'Structured information on a quantitative value.'
	end

	properties
		value             (1,1) double         % Entry for a property.
		uncertainty       double               % Quantitative value range defining the uncertainty of a measurement.
		typeOfUncertainty oms.abstract.OpenMindsSchema % N/A
		unit              oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = QuantitativeValue(value, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.value = value;
		end

	end

end