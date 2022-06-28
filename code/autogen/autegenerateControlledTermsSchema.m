function autegenerateControlledTermsSchema(schemaName)
%autegenerateControlledTermsSchema Autogenerate a controlled terms schema
% using an m-file template

    % Get filepath for mfile template
    rootDir = oms.localpath('code');
    folder = fullfile(rootDir, '+oms');

    mFilename = 'Template';
    fcnSourcePath = fullfile(folder, [mFilename, '.m']);
    
    schemaName(1) = upper(schemaName(1));
    
    % Modify the template function by adding the variable/schema name
    fcnContentStr = fileread(fcnSourcePath);
    fcnContentStr = strrep(fcnContentStr, mFilename, schemaName);
    fcnContentStr = strrep(fcnContentStr, upper(mFilename), upper(schemaName));

    fcnTargetPath = fullfile(folder, '+ct');
    fcnFilename = [ schemaName, '.m' ];
        
    if ~exist(fcnTargetPath, 'dir'); mkdir(fcnTargetPath); end
    
    % Create a new m-file and write the modified function template to the file.
    fid = fopen(fullfile(fcnTargetPath, fcnFilename), 'w');
    fwrite(fid, fcnContentStr);
    fclose(fid);
end