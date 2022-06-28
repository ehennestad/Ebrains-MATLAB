classdef FileRepository < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'hostedBy', 'IRI', 'name'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/FileRepository'
		description_ = 'Structured information on a file repository.'
	end

	properties
		format         oms.abstract.OpenMindsSchema % N/A
		hash           oms.abstract.OpenMindsSchema % N/A
		hostedBy       oms.abstract.OpenMindsSchema % N/A
		IRI            char                 % Stands for Internationalized Resource Identifier which is an internet protocol standard that builds on the URI protocol, extending the set of permitted characters to include Unicode/ISO 10646.
		name           char                 % Word or phrase that constitutes the distinctive designation of a being or thing.
		repositoryType oms.abstract.OpenMindsSchema % N/A
		storageSize    oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = FileRepository(hostedBy, IRI, name, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.hostedBy = hostedBy;
			obj.IRI = IRI;
			obj.name = name;
		end

	end

end