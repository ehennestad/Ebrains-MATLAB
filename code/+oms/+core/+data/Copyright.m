classdef Copyright < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'holder', 'year'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Copyright'
		description_ = 'Structured information on the copyright.'
	end

	properties
		holder oms.abstract.OpenMindsSchema % N/A
		year   char                 % Cycle in the Gregorian calendar specified by a number and comprised of 365 or 366 days divided into 12 months beginning with January and ending with December.
	end

	methods

		function obj = Copyright(holder, year, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.holder = holder;
			obj.year = year;
		end

	end

end