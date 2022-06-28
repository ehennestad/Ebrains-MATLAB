classdef ContactInformation < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'email'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/ContactInformation'

	end

	properties
		email char                 % Address to which or from which an electronic mail can be sent.
	end

	methods

		function obj = ContactInformation(email, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.email = email;
		end

	end

end