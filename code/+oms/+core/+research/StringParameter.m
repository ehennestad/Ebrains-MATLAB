classdef StringParameter < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'name', 'value'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/StringParameter'

	end

	properties
		name  char                 % Word or phrase that constitutes the distinctive designation of a being or thing.
		value char                 % Entry for a property.
	end

	methods

		function obj = StringParameter(name, value, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.name = name;
			obj.value = value;
		end

	end

end