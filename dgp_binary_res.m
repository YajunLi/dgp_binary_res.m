function datt = dgp_binary_res(n)

% DGP binary response model
% binary choice model D=1(X*beta + epsilon >=0)
% n: length of data to be generated
% X: n by 3, first argument 1
% beta: 3 by 1
% epsilon ~ N(0,1) variance is standardized as beta and var(epsilon) not
% jointly identified

beta0=[1.5,2,-3]';          %  true value of params
epss=2*randn(n,1);          %  error 

xx=linspace(0,pi,n);
X(:,1) = 1;
X(:,2) = sin(xx)';
X(:,3) = rand(n,1)+0.5;

y_index = X*beta0 + epss;   %  create latent index
sum(y_index>=0)
D = y_index>=0;             %  create indicator

datt = [y_index X(:,2:end) D epss];
save('datt', 'datt');

end
