function varargout = grapherBeta(varargin)
% GRAPHERBETA MATLAB code for grapherBeta.fig
%      GRAPHERBETA, by itself, creates a new GRAPHERBETA or raises the existing
%      singleton*.
%
%      H = GRAPHERBETA returns the handle to a new GRAPHERBETA or the handle to
%      the existing singleton*.
%
%      GRAPHERBETA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAPHERBETA.M with the given input arguments.
%
%      GRAPHERBETA('Property','Value',...) creates a new GRAPHERBETA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before grapherBeta_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to grapherBeta_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help grapherBeta

% Last Modified by GUIDE v2.5 16-Sep-2014 00:35:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @grapherBeta_OpeningFcn, ...
                   'gui_OutputFcn',  @grapherBeta_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before grapherBeta is made visible.
function grapherBeta_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to grapherBeta (see VARARGIN)

% Choose default command line output for grapherBeta
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




%bg_image = imread('setting.png');
%set(handles.setting_button, 'CData', bg_image);

% UIWAIT makes grapherBeta wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = grapherBeta_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

global xMin;
global xMax;
global yMin;
global yMax;

eqn = get(hObject,'String') %getappdata(hObject,'String');
meqn = modify_eqn_fun(eqn)
%axes = get(0,'mainAxes');
axes(handles.axes1);

try

h = ezplot(meqn,[xMin xMax yMin yMax]);
set(h,'Color','m');
grid on;
catch err 
   set(handles.edit1,'String',sprintf('%s%30s',eqn,'Error')); 
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit1.
function edit1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a futurek version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
global xMin;
global xMax;
global yMin;
global yMax;
xMin = -14;
xMax = 14;
yMin = -8;
yMax = 8;

set(gca,'XTick',xMin:2:xMax);
set(gca,'YTick',yMin:2:yMax);
plot([xMin xMax],[0 0],'k-','LineWidth',3);%draw x axis
grid on;
hold on;
plot([0 0],[yMin yMax],'k-','LineWidth',3);
hold on;

axis normal;
axis equal;
axis image;
