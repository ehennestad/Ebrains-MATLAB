classdef Dataset < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'fullName', 'shortName', 'hasVersion', 'author', 'description'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Dataset'
		description_ = 'Structured information on data originating from human/animal studies or simulations (concept level).'
	end

	properties
		author            oms.abstract.OpenMindsSchema % N/A
		digitalIdentifier oms.abstract.OpenMindsSchema % N/A
		hasVersion        oms.abstract.OpenMindsSchema % N/A
		custodian         oms.abstract.OpenMindsSchema % N/A
		description       char                 % Longer statement or account giving the characteristics of someone or something.
		fullName          char                 % Whole, non-abbreviated name of something or somebody.
		homepage          oms.abstract.OpenMindsSchema % N/A
		howToCite         char                 % Preferred format for citing a particular object or legal person.
		shortName         char                 % Shortened or fully abbreviated name of something or somebody.
	end

	methods

		function obj = Dataset(fullName, shortName, hasVersion, author, description, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.fullName = fullName;
			obj.shortName = shortName;
			obj.hasVersion = hasVersion;
			obj.author = author;
			obj.description = description;
		end

	end

end