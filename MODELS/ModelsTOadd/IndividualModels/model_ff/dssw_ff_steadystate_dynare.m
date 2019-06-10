function [ys_, check_] = dssw_ff_steadystate(ys_orig_, exo_)
% Steady state generated by Dynare preprocessor
    ys_=zeros(47,1);
    global M_
    
    beta=1/(M_.params(12)/400+1);
    sigma=M_.params(20);
    nu=M_.params(21);
    chi=M_.params(22);
    we=M_.params(23);
    g_star=1/(1-M_.params(19));
    alpha=M_.params(4);
    gamma=M_.params(19)/400;
    delta=M_.params(3);
    h=M_.params(8);
    lambda_w=M_.params(2);
    phi=M_.params(1);
    nu_l=M_.params(9);
    pic_star=M_.params(16)/400+1;
    
    f_omega = @(omega)solve_omega(omega,beta,sigma,nu,chi,we);
    ys_(23)=fzero(f_omega,0.8);
    ys_(20)=normcdf((log(ys_(23))+0.5*M_.params(20)^2)/M_.params(20),0,1);
    ys_(21)=normcdf((log(ys_(23))+0.5*M_.params(20)^2)/M_.params(20)-M_.params(20),0,1);
    ys_(22)=normpdf((log(ys_(23))+0.5*M_.params(20)^2)/M_.params(20),0,1)/ys_(23)/M_.params(20);
    ys_(2)=exp(M_.params(17)/400)*(1+M_.params(16)/400)/(1/(1+M_.params(12)/400));
    ys_(16)=ys_(2)/(M_.params(21)/(1/(1+M_.params(12)/400))*(1-ys_(23)*(1-ys_(20))-ys_(21))+(1+M_.params(23))*(ys_(23)*(1-ys_(20))+ys_(21)*(1-M_.params(22))));
    ys_(17)=ys_(16)/(1+M_.params(16)/400)-1+M_.params(3);
    ys_(6)=(1-M_.params(4))*(1+M_.params(18))^((-1)/(1-M_.params(4)))*(ys_(17)/M_.params(4))^((-M_.params(4))/(1-M_.params(4)));
    r_k=ys_(17);
    w=ys_(6);
    F2=ys_(21);
    R_e=ys_(16);
    f_k= @(k)solve_k(k,g_star,alpha,gamma,beta,delta,h,chi,lambda_w,phi,nu_l,r_k,w,F2,R_e,pic_star);
    ys_(10)=fzero(f_k,5);
    ys_(9)=ys_(10)*ys_(17)*(1-M_.params(4))/M_.params(4)/ys_(6);
    ys_(28)=ys_(10)^M_.params(4)*ys_(9)^(1-M_.params(4));
    ys_(1)=(1+M_.params(2))*M_.params(1)*ys_(9)^M_.params(9)/ys_(6);
    ys_(4)=(exp(M_.params(17)/400)-1/(1+M_.params(12)/400)*M_.params(8))/(ys_(1)*(exp(M_.params(17)/400)-M_.params(8)));
    ys_(12)=ys_(10)*(M_.params(3)+exp(M_.params(17)/400)-1);
    ys_(11)=exp(M_.params(17)/400)*ys_(10);
    ys_(14)=(ys_(23)*(1-ys_(20))+ys_(21)*(1-M_.params(22)))*ys_(11)*ys_(16)/ys_(2);
    ys_(15)=ys_(11)-ys_(14);
    ys_(19)=ys_(11)*ys_(23)*ys_(16)/ys_(14);
    ys_(25)=1;
    ys_(24)=ys_(25)/(1+M_.params(18));
    ys_(7)=M_.params(1)*1/(1-1/(1+M_.params(12)/400)*M_.params(10))*ys_(6)^((1+M_.params(2))*(1+M_.params(9))/M_.params(2))*ys_(9)^(1+M_.params(9));
    ys_(8)=ys_(9)*ys_(1)*1/(1-1/(1+M_.params(12)/400)*M_.params(10))*ys_(6)^((1+M_.params(2))/M_.params(2));
    ys_(26)=ys_(28)*ys_(24)*ys_(1)*1/(1-1/(1+M_.params(12)/400)*M_.params(5));
    ys_(27)=ys_(28)*ys_(1)*1/(1-1/(1+M_.params(12)/400)*M_.params(5));
    ys_(5)=ys_(6);
    ys_(13)=1;
    ys_(29)=1;
    ys_(18)=1;
    ys_(3)=1+M_.params(16)/400;
    ys_(30)=M_.params(17)/400;
    ys_(31)=0;
    ys_(32)=log(M_.params(1));
    ys_(33)=0;
    ys_(34)=log(M_.params(18));
    ys_(35)=log(1/(1-M_.params(19)));
    ys_(36)=0;
    ys_(37)=log(M_.params(20));
    ys_(38)=log(M_.params(21));
    ys_(39)=ys_(30)*100;
    ys_(40)=ys_(30)*100;
    ys_(41)=ys_(30)*100;
    ys_(42)=ys_(9)*100+M_.params(34);
    ys_(43)=ys_(30)*100;
    ys_(44)=100*(ys_(3)-1);
    ys_(45)=400*(ys_(2)-1);
    ys_(46)=ys_(30)*100+M_.params(35);
    ys_(47)=400*(ys_(19)-ys_(2));
    % Auxiliary equations
    check_=0;
end
