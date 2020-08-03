k = 43 ; % strike price (Note that in MATLAB '%' indicates a comment)
s0 = 45 ; % price of the underlying asset (stock)
r = 0.10 ; % interest rate, contin. comp, decimal
d = 0.0 ; % dividend yield, contin. comp, decimal
sigma = 0.20 ; % standard deviation, annual, decimal
tau = 0.5 ; % time to maturity, years or fraction of a year
c0 = bscall(k,s0,sigma,tau,r,d); % activate function/procedure for call
premium
p0 = bsput(k,s0,sigma,tau,r,d); % activate function/procedure for put
premium
pp0 = c0 - s0. * exp(-d. * tau) + k. * exp(-r. * tau) ; % put—call parity: check on BS
formulas
% ---------------------------------------------------------------------------
% Setting up Stock Price data for graph
% ---------------------------------------------------------------------------
s = s0-10:1:s0+10; % S values are s0-10 to s0+10 in
increments of 1
c=bscall(k,s,sigma,tau,r,d); % Activate function/procedure for call
p=bsput (k,s,sigma,tau,r,d); % Activate function/procedure for put
% ---------------------------------------------------------------------------
% Function: Black-Scholes Call Premium - Dividend paying stock
% ---------------------------------------------------------------------------
function c = bscall(k,s,sigma,tau,r,d)
d1 = ( log( s./k ) + ( r - d + sigma.^2./2). * tau )./ ( sigma. * sqrt(tau) );
d2 = d1 - sigma. * sqrt(tau);
c=s. * exp(-d. * tau). * normcdf(d1) -k. * exp(-r. * tau). * normcdf(d2);
% ---------------------------------------------------------------------------
% Function: Black-Scholes Put Premium - Dividend paying stock
% ---------------------------------------------------------------------------
function p=bsput(k,s,sigma,tau,r,d)
d1 = ( log( s./k ) + ( r - d + sigma.^2./2). * tau )./ ( sigma. * sqrt(tau) );
d2 = d1 - sigma. * sqrt(tau);
p=k. * exp(-r. * tau). * normcdf(-d2) - s. * exp(-d1. * tau). * normcdf(-d1) ;

