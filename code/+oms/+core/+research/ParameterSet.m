classdef ParameterSet < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'context', 'relevantFor', 'parameter'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/ParameterSet'
		description_ = 'Structured information on a used parameter set.'
	end

	properties
		context     char                 % N/A
		relevantFor oms.abstract.OpenMindsSchema % N/A
		parameter   double               % Digital or physical property determining a particular function, characteristic or behavior of something.
	end

	methods

		function obj = ParameterSet(context, relevantFor, parameter, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.context = context;
			obj.relevantFor = relevantFor;
			obj.parameter = parameter;
		end

	end

end