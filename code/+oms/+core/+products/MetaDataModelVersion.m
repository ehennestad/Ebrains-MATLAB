classdef MetaDataModelVersion < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'accessibility', 'type', 'fullDocumentation', 'versionInnovation', 'releaseDate', 'shortName', 'versionIdentifier', 'funding', 'license'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/MetaDataModelVersion'

	end

	properties
		developer              oms.abstract.OpenMindsSchema % N/A
		digitalIdentifier      oms.abstract.OpenMindsSchema % N/A
		isAlternativeVersionOf oms.abstract.OpenMindsSchema % N/A
		isNewVersionOf         oms.abstract.OpenMindsSchema % N/A
		license                oms.abstract.OpenMindsSchema % N/A
		serializationFormat    oms.abstract.OpenMindsSchema % N/A
		specificationFormat    oms.abstract.OpenMindsSchema % N/A
		type                   oms.abstract.OpenMindsSchema % N/A
		accessibility          oms.abstract.OpenMindsSchema % N/A
		copyright              oms.abstract.OpenMindsSchema % N/A
		custodian              oms.abstract.OpenMindsSchema % N/A
		description            char                 % Longer statement or account giving the characteristics of someone or something.
		fullDocumentation      oms.abstract.OpenMindsSchema % N/A
		fullName               char                 % Whole, non-abbreviated name of something or somebody.
		funding                oms.abstract.OpenMindsSchema % N/A
		homepage               oms.abstract.OpenMindsSchema % N/A
		howToCite              char                 % Preferred format for citing a particular object or legal person.
		keyword                double               % Significant word or concept that are representative of something or someone.
		otherContribution      double               % Giving or supplying of something (such as money or time) as a part or share other than what is covered elsewhere.
		relatedPublication     oms.abstract.OpenMindsSchema % N/A
		releaseDate            char                 % Fixed date on which a product is due to become or was made available for the general public to see or buy
		repository             oms.abstract.OpenMindsSchema % N/A
		shortName              char                 % Shortened or fully abbreviated name of something or somebody.
		supportChannel         double               % Way of communication used to interact with users or customers.
		versionIdentifier      char                 % Term or code used to identify the version of something.
		versionInnovation      char                 % Documentation on what changed in comparison to a previously published form of something.
	end

	methods

		function obj = MetaDataModelVersion(accessibility, type, fullDocumentation, versionInnovation, releaseDate, shortName, versionIdentifier, funding, license, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.accessibility = accessibility;
			obj.type = type;
			obj.fullDocumentation = fullDocumentation;
			obj.versionInnovation = versionInnovation;
			obj.releaseDate = releaseDate;
			obj.shortName = shortName;
			obj.versionIdentifier = versionIdentifier;
			obj.funding = funding;
			obj.license = license;
		end

	end

end