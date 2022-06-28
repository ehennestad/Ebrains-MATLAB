classdef File < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'IRI', 'isPartOf', 'name'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/File'
		description_ = 'Structured information on a file instances.'
	end

	properties
		content          char                 % Something that is contained.
		fileRepository   oms.abstract.OpenMindsSchema % N/A
		format           oms.abstract.OpenMindsSchema % N/A
		hash             oms.abstract.OpenMindsSchema % N/A
		IRI              char                 % Stands for Internationalized Resource Identifier which is an internet protocol standard that builds on the URI protocol, extending the set of permitted characters to include Unicode/ISO 10646.
		isPartOf         oms.abstract.OpenMindsSchema % N/A
		name             char                 % Word or phrase that constitutes the distinctive designation of a being or thing.
		specialUsageRole oms.abstract.OpenMindsSchema % N/A
		storageSize      oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = File(IRI, isPartOf, name, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.IRI = IRI;
			obj.isPartOf = isPartOf;
			obj.name = name;
		end

	end

end