classdef SubjectState < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'ageCategory'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/SubjectState'
		description_ = 'Structured information on a temporary state of a subject.'
	end

	properties
		ageCategory       oms.abstract.OpenMindsSchema % N/A
		handedness        oms.abstract.OpenMindsSchema % N/A
		additionalRemarks char                 % Mention of what deserves additional attention or notice.
		age               char                 % Mention of what deserves additional attention or notice.
		lookupLabel       char                 % N/A
		pathology         oms.abstract.OpenMindsSchema % N/A
		weight            oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = SubjectState(ageCategory, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.ageCategory = ageCategory;
		end

	end

end