addpath(genpath('twonode'))

cur_sim_time = datestr(now,30);

show_plots = 0;

nTrials = 1000;

% Fix the random seed for reproducibility
rng(2718);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Create loading type trials (uneven input)

thesis_initpar_loading_spiking;

if show_plots
  figure; hold on;
end

data = struct();
for i = 1:nTrials
  [data(i).gsx, data(i).gsy, data(i).rt, data(i).spikesx, data(i).spikesy] = spikesim_special(par, 2, 4 );
  [data(i).xx, data(i).yy, data(i).tt, nullcline1, nullcline2] = mfsim_special(par, 2, 4, 0, 0); 
  
  if show_plots
    % Time evolution of gsx and gsy
    scatter(gsx, gsy, 5, 1:numel(gsx)); colormap(jet(numel(gsx))); colorbar
  end
  
  if mod(i,50)==0
    disp([1, i]);
  end
  
end

save(['thesis_MachensBrodySim_' cur_sim_time '_loading_uneven.mat'], 'data', 'nullcline1', 'nullcline2', 'par')

if show_plots
  plot(nullcline1(1,:)*1e-3, nullcline1(2,:)*1e-3);
  plot(nullcline2(1,:)*1e-3, nullcline2(2,:)*1e-3);
end



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Create loading type trials (even input)

thesis_initpar_loading_spiking;

if show_plots
  figure; hold on;
end

data = struct();
for i = 1:nTrials
  [data(i).gsx, data(i).gsy, data(i).rt, data(i).spikesx, data(i).spikesy] = spikesim_special(par, 4, 4 );
  [data(i).xx, data(i).yy, data(i).tt, nullcline1, nullcline2] = mfsim_special(par, 4, 4, 0, 0); 
  
  if show_plots
    % Time evolution of gsx and gsy
    scatter(gsx, gsy, 5, 1:numel(gsx)); colormap(jet(numel(gsx))); colorbar
  end
  
  if mod(i,50)==0
    disp([2, i]);
  end
  
end

save(['thesis_MachensBrodySim_' cur_sim_time '_loading_even.mat'], 'data', 'nullcline1', 'nullcline2', 'par')

if show_plots
  plot(nullcline1(1,:)*1e-3, nullcline1(2,:)*1e-3);
  plot(nullcline2(1,:)*1e-3, nullcline2(2,:)*1e-3);
end



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Create decision type trials (even input)

thesis_initpar_decision_spiking;

if show_plots
  figure; hold on;
end

data = struct();
for i = 1:nTrials
  [data(i).gsx, data(i).gsy, data(i).rt, data(i).spikesx, data(i).spikesy] = spikesim_special(par, 4, 4 );
  [data(i).xx, data(i).yy, data(i).tt, nullcline1, nullcline2] = mfsim_special(par, 4, 4, 0, 0); 
  
  if show_plots
    % Time evolution of gsx and gsy
    scatter(gsx, gsy, 5, 1:numel(gsx)); colormap(jet(numel(gsx))); colorbar
  end
  
  if mod(i,50)==0
    disp([3, i]);
  end
  
end

save(['thesis_MachensBrodySim_' cur_sim_time '_decision.mat'], 'data', 'nullcline1', 'nullcline2', 'par')

if show_plots
  plot(nullcline1(1,:)*1e-3, nullcline1(2,:)*1e-3);
  plot(nullcline2(1,:)*1e-3, nullcline2(2,:)*1e-3);
end
