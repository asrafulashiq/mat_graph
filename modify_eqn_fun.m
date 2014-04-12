function meqn = modify_eqn_fun(eqn)

    index = regexp(eqn,'\dx');
    len = length(eqn);
    strt = 1;
    meqn = '';
    for i=index 
        meqn = [meqn,eqn(strt:i),'*'];
        strt = i+1;
    end
    
    meqn = [meqn,eqn(strt:len)];
    
    meqn = strrep(meqn,'x','(x)');    
    
end