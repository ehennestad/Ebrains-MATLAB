figure; 

ax = axes;

numShapes = numel(S.mesh);

cmap = viridis(numShapes);

for i = 1:numel(S.mesh)
    h = patch('Faces',S.mesh{i}.F,'Vertices',S.mesh{i}.V);
    h.FaceColor = cmap(i,:);
    h.EdgeColor = ones(1,3).*0.5;
    hold(ax, 'on')
end
