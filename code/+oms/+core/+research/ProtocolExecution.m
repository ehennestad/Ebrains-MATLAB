classdef ProtocolExecution < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'input', 'output', 'protocol'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/ProtocolExecution'
		description_ = 'Structured information on a protocol execution.'
	end

	properties
		description            char                 % Longer statement or account giving the characteristics of someone or something.
		input                  oms.abstract.OpenMindsSchema % N/A
		lookupLabel            char                 % N/A
		output                 oms.abstract.OpenMindsSchema % N/A
		parameterSet           double               % Manner, position, or direction in which digital or physical properties are set to determine a particular function, characteristics or behavior of something.
		preparationType        oms.abstract.OpenMindsSchema % N/A
		protocol               oms.abstract.OpenMindsSchema % N/A
		semanticallyAnchoredTo oms.abstract.OpenMindsSchema % N/A
		studyTarget            oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = ProtocolExecution(input, output, protocol, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.input = input;
			obj.output = output;
			obj.protocol = protocol;
		end

	end

end