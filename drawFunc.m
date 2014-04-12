function drawFunc(hObject,handles)

global xMin;
global xMax;
global yMin;
global yMax;
eqn = get(hObject,'String'); 
meqn = modify_eqn_fun(eqn);

try
    h = ezplot(meqn,[xMin xMax yMin yMax]);
    set(h,'Color','r');
    set(h,'LineWidth',2);
    set(gcf, 'renderer', 'opengl');
    grid on;
catch err 
    set(handles.edit_eqn,'String',sprintf('%s%30s',eqn,'Error')); 
end
    
    
end