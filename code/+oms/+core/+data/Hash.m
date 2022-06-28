classdef Hash < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'algorithm', 'digest'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Hash'
		description_ = 'Structured information on a hash.'
	end

	properties
		algorithm char                 % Procedure for solving a mathematical problem in a finite number of steps. Can involve repetition of an operation.
		digest    char                 % Summation or condensation of a body of information.
	end

	methods

		function obj = Hash(algorithm, digest, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.algorithm = algorithm;
			obj.digest = digest;
		end

	end

end