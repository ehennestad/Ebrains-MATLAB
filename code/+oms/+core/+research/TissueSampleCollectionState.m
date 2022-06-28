classdef TissueSampleCollectionState < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/TissueSampleCollectionState'

	end

	properties
		additionalRemarks char                 % Mention of what deserves additional attention or notice.
		age               char                 % Mention of what deserves additional attention or notice.
		lookupLabel       char                 % N/A
		pathology         oms.abstract.OpenMindsSchema % N/A
		weight            oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = TissueSampleCollectionState(varargin)		end

	end

end