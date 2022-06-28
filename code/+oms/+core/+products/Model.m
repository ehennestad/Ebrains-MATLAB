classdef Model < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'scope', 'fullName', 'developer', 'abstractionLevel', 'shortName', 'hasVersion', 'description', 'studyTarget'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Model'
		description_ = 'Structured information on a computational model (concept level).'
	end

	properties
		abstractionLevel  oms.abstract.OpenMindsSchema % N/A
		developer         oms.abstract.OpenMindsSchema % N/A
		digitalIdentifier oms.abstract.OpenMindsSchema % N/A
		hasVersion        oms.abstract.OpenMindsSchema % N/A
		scope             oms.abstract.OpenMindsSchema % N/A
		studyTarget       oms.abstract.OpenMindsSchema % N/A
		custodian         oms.abstract.OpenMindsSchema % N/A
		description       char                 % Longer statement or account giving the characteristics of someone or something.
		fullName          char                 % Whole, non-abbreviated name of something or somebody.
		homepage          oms.abstract.OpenMindsSchema % N/A
		howToCite         char                 % Preferred format for citing a particular object or legal person.
		shortName         char                 % Shortened or fully abbreviated name of something or somebody.
	end

	methods

		function obj = Model(scope, fullName, developer, abstractionLevel, shortName, hasVersion, description, studyTarget, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.scope = scope;
			obj.fullName = fullName;
			obj.developer = developer;
			obj.abstractionLevel = abstractionLevel;
			obj.shortName = shortName;
			obj.hasVersion = hasVersion;
			obj.description = description;
			obj.studyTarget = studyTarget;
		end

	end

end