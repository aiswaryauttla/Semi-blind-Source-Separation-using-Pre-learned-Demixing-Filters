function out = BMoutput(x,h,D)
% Output of the Blocking-Matrix given by filter h with global delay D
% input: x ... a stereo audio recording

out = filter(h,1,x(:,1)) - [zeros(D,1);x(1:end-D,1)];

