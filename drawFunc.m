function drawFunc(hObject)

global xMin;
global xMax;
global yMin;
global yMax;
eqn = get(hObject,'String') %getappdata(hObject,'String');
meqn = modify_eqn_fun(eqn)
%axes = get(0,'mainAxes');%axes(handles.axes1);

try

h = ezplot(meqn,[xMin xMax yMin yMax]);
set(h,'Color','r');
set(h,'LineWidth',2);
set(gcf, 'renderer', 'opengl');
grid on;
catch err 
   set(handles.edit1,'String',sprintf('%s%30s',eqn,'Error')); 
end
    
    
end