classdef Person < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'givenName'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Person'
		description_ = 'Structured information on a person.'
	end

	properties
		digitalIdentifier  oms.abstract.OpenMindsSchema % N/A
		contactInformation oms.abstract.OpenMindsSchema % N/A
		familyName         char                 % Name borne in common by members of a family.
		givenName          char                 % Name given to a person, including all potential middle names, but excluding the family name.
		affiliation        double               % Declaration of a person being closely associated to an organization.
	end

	methods

		function obj = Person(givenName, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.givenName = givenName;
		end

	end

end