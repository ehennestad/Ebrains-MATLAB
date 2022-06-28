classdef Funding < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'funder'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Funding'
		description_ = 'Structured information on used funding.'
	end

	properties
		acknowledgement char                 % Offical declaration or avowal of appreciation of an act or achievement.
		awardNumber     char                 % Machine-readable identifier for a benefit that is conferred or bestowed on the basis of merit or need.
		awardTitle      char                 % Human-readable identifier for a benefit that is conferred or bestowed on the basis of merit or need.
		funder          oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = Funding(funder, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.funder = funder;
		end

	end

end