function display_mountain(filename)
    formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f';
    T = readtable(filename,'Delimiter','\t', ...
        'Format',formatSpec,'ReadRowNames',true);
    disp(T);

    function plot_mountain()
        h1 = surf(T{:,:});

        number_stride = 1:size(T,1);
        number_size = 1:size(T,2);

        set(gca,'XTick',number_stride) 	% set Xticks
        set(gca,'YTick',number_size)  	% set Yticks

        set(gca,'xticklabel',T.Properties.VariableNames);
        set(gca,'yticklabel',T.Properties.RowNames);
        xlabel('Stride(x4bytes)');
        ylabel('Size(bytes)');
        zlabel('Throughput(MB/s)');
    end

    figure;
    
    subplot(221); plot_mountain();
	view(37.5,30); %view(3) sets the default 3-D view: -37.5,30
    title('Memory Mountain 3D View');
    
    subplot(222); plot_mountain();
    view(0,0);
    title('Temporal Locality Ridge');
    
    subplot(223); plot_mountain();
    view(90,0);
    title('Spatial Locality Ramp');
    
    subplot(224); plot_mountain();
    view(2); %sets the default 2-D view
    title('Memory Mountain Top View');

end

% Reference
% Access Data in a Table http://cn.mathworks.com/help/matlab/matlab_prog/access-data-in-a-table.html