function [g, G, res] = TDRTF(N, xL, xR, delay)
% Least-square time-domain estimator of relative impulse response (relative
% transfer function) between xL and xR.
% inputs: xL, xR ... signals from microphones
%         N ... length of the estimated impulse response
%         delay ... global delay of the estimated relative impulse response
%                   due to causality
% outputs: g ... estimated relative impulse response
%          G ... estimated relative transfer function
%          res ... output of target-cancellation filter built up from g
%          (time-domain output of the blocking matrix built up from G)
%
% coded by Zbynek Koldovsky, January 2015
%
% The code utilizes block_levinson.m by Keenan Pepper (the block-Levinson 
% algorithm for fast computation of toeplitz(R)\p).

N=N-1;
% Delaying the target channel due to causality
xR = [zeros(delay,1); xR(1:end-delay,:)];

% Autocovariance of xL
R = zeros(N+1,1); 
% alternatively 
%R = 0.001*eye(N+1, 1); 
% when toeplitz(R) appears to be almost singular
r = xcorr(xL, xL, N);

R = R + flipud(r(1:N+1));

% Crosscorrelation between xL and xR
p = xcorr(xR, xL, N);
P = p(N+1:2*N+1);    

g = block_levinson(P, R); % fast computation of toeplitz(R)\p

if nargout>1
    G = fft(g);
    
    
end

if nargout>2
    res=filter(g,1,xL)-xR;
end

