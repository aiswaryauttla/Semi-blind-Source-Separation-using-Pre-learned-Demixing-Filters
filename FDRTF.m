function [g, G, res, res2]=FDRTF(L,xL,xR,delay,Nshift)
% Conventional Frequency-domain estimator of relative transfer function
% (relative impulse response) between xL and xR
% inputs: xL, xR ... signals from microphones
%         L ... length of the estimated impulse response
%         delay ... global delay of the estimated relative impulse response
%                   due to causality
%         Nshift ... shift between windows in the short-time Fourier
%         transform
% outputs: g ... estimated relative impulse response
%          G ... estimated relative transfer function
%          res ... output of target-cancellation filter built up from g
%          (time-domain output of the blocking matrix built up from G)
%
% coded by Zbynek Koldovsky, January 2015

if nargin<5
    Nshift=32;
end

% Delaying the target channel due to causality
xR=[zeros(delay,1); xR(1:end-delay)];

% short-time Fourier transform
XL=stft(xL',L,Nshift);
XR=stft(xR',L,Nshift);


PLR=mean(conj(XL).*XR,2);
PL=mean(conj(XL).*XL,2);

G=PLR./PL;

g=real(ifft(G));

if nargout>2
    res=filter(g,1,xL)-xR;
end

if nargout>3
    G_rep = repmat(G,1,size(XL,2));
    res_Freq= G_rep.*XL -XR;
    res2 = istft(res_Freq, Nshift, L);
end

end
%%%%%%%%%%%%%%

function X = stft(x, n, wshift, NFFT, window)

if(nargin<4)
    NFFT = n;
end

if(nargin<5)
    window = boxcar(n);
end

N = length(x);
N = ceil((N-n)/wshift)*wshift + n;

x = [x zeros(1,N-length(x))];

nwindow=(N-n)/wshift;

X=zeros(NFFT, nwindow + 1);

for i=0:nwindow
    X(1:n,i+1)=x(i*wshift+1:i*wshift+n)'.*window;
end
X=fft(X);
end