classdef Contribution < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'contributionType', 'contributor'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Contribution'
		description_ = 'Structured information on the contribution made to a research product.'
	end

	properties
		contributionType oms.abstract.OpenMindsSchema % N/A
		contributor      oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = Contribution(contributionType, contributor, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.contributionType = contributionType;
			obj.contributor = contributor;
		end

	end

end