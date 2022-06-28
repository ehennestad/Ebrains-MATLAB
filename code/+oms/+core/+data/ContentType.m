classdef ContentType < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'name'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/ContentType'
		description_ = 'Structured information on the content type of a file instance, bundle or repository.'
	end

	properties
		fileExtension    double               % String of characters attached as suffix to the names of files of a particular format.
		description      char                 % Longer statement or account giving the characteristics of someone or something.
		relatedMediaType char                 % Reference to an official two-part identifier for file formats and format contents.
		name             char                 % Word or phrase that constitutes the distinctive designation of a being or thing.
		specification    char                 % Detailed and precise presentation of, or proposal for something.
		synonym          double               % Words or expressions used in the same language that have the same or nearly the same meaning in some or all senses.
	end

	methods

		function obj = ContentType(name, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.name = name;
		end

	end

end