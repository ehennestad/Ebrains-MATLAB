classdef FileBundle < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'isPartOf', 'name'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/FileBundle'
		description_ = 'Structured information on a bundle of file instances.'
	end

	properties
		format             oms.abstract.OpenMindsSchema % N/A
		patternOfFilenames char                 % Reliable sample / structure of characters valid for all names in a particular collection of files.
		groupedBy          oms.abstract.OpenMindsSchema % N/A
		hash               oms.abstract.OpenMindsSchema % N/A
		isPartOf           oms.abstract.OpenMindsSchema % N/A
		name               char                 % Word or phrase that constitutes the distinctive designation of a being or thing.
		storageSize        char                 % Word or phrase that constitutes the distinctive designation of a being or thing.
	end

	methods

		function obj = FileBundle(isPartOf, name, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.isPartOf = isPartOf;
			obj.name = name;
		end

	end

end