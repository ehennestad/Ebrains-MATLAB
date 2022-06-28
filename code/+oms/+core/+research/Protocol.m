classdef Protocol < oms.abstract.OpenMindsSchema

	properties (Constant, Hidden)
		required = {'description', 'name', 'technique'}
	end

	properties (Constant)
		x0x5F_type = 'https://openminds.ebrains.eu/core/Protocol'
		description_ = 'Structured information on a research project.'
	end

	properties
		description    char                 % Longer statement or account giving the characteristics of someone or something.
		behavioralTask oms.abstract.OpenMindsSchema % N/A
		name           char                 % Word or phrase that constitutes the distinctive designation of a being or thing.
		studyOption    oms.abstract.OpenMindsSchema % N/A
		technique      oms.abstract.OpenMindsSchema % N/A
	end

	methods

		function obj = Protocol(description, name, technique, varargin)
			if nargin < numel(obj.required)
				requiredValues = cellfun(@(c) sprintf('%s', c), obj.required, 'UniformOutput',false);
				error('This schema requires the following variables: %s', strjoin( requiredValues, ', '))
			end
			obj.description = description;
			obj.name = name;
			obj.technique = technique;
		end

	end

end