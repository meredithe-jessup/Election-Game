% 1. Initializations
% Baseline Platform Values
%   alpha   Big business
%   beta    Establishment ties
%   gamma   Foreign policy experience
%   delta   Libertarian	issues
%   epsilon Social issues

clear  all
format shortg

Run_Time = 10*60; % Specify max run time (secs) for re-opt process

% Baseline Platform Values (BPV) - Determine initial bounds
%     [ alpha |  beta | gamma | delta | epsilon]
BPV = [   0.1     0.8     0.5     0.9     0.6;   % A
          0.5     0.9    -0.1    -0.8    -0.4;   % B
          0.4    -1.0    -0.6     0.3     0.5;   % C
         -0.5    -0.9     0.1     0.8     0.4];  % D

% Voter Group Coefficients (VGC)
%     [ alpha |  beta | gamma | delta | epsilon]
VGC = [  -0.4     1.0     0.6    -0.3    -0.5;   % a
         -1.0     0.4     0.3    -0.6     0.9;   % b
          0.9     0.5    -0.8    -0.1     1.0;   % c
         -0.3     0.6    -1.0     0.4    -0.8;   % d
         -0.6     0.3    -0.4     1.0     0.1;   % e
          0.6    -0.3     0.4    -1.0    -0.1];  % f

disp('Initialized... Starting Proxy Opt')

% 2. Proxy NE as starting point
[Proxy, Infl, X]     = ProxyNE(BPV,VGC);

% 3. Re-optimize to search for equilibrium
[Policies,Influence,VGWins,VGScores,LCan,tRun] = ReOptGA(VGC,Proxy,Infl,X,Run_Time)
bar(VGWins(:,[1,2,3,4]),'stacked')
%
%
%% END