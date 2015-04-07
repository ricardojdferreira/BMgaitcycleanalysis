function varargout = Projecto2(varargin)
% PROJECTO2 MATLAB code for Projecto2.fig
%      PROJECTO2, by itself, creates a new PROJECTO2 or raises the existing
%      singleton*.
%
%      H = PROJECTO2 returns the handle to a new PROJECTO2 or the handle to
%      the existing singleton*.
%
%      PROJECTO2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTO2.M with the given input arguments.
%
%      PROJECTO2('Property','Value',...) creates a new PROJECTO2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Projecto2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Projecto2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Projecto2

% Last Modified by GUIDE v2.5 18-Dec-2013 03:01:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Projecto2_OpeningFcn, ...
                   'gui_OutputFcn',  @Projecto2_OutputFcn, ...
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


% --- Executes just before Projecto2 is made visible.
function Projecto2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Projecto2 (see VARARGIN)

% Choose default command line output for Projecto2
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Projecto2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%set(gcf,'CloseRequestFcn',@my_close_req)
% --- Executes on button press in exitbutton.
% function my_close_req(src,event)
% % hObject    handle to exitbutton (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% % Get the current position of the GUI from the handles structure
% % to pass to the modal dialog.
% % delete(Main)
% selection = questdlg('Do you want to Exit?','Close Request','Yes','No','Yes');
% switch selection,
%     case 'Yes',
%         delete(gcf);
%     case 'No',
%         return
% end
% close all;



% --- Outputs from this function are returned to the command line.
function varargout = Projecto2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xtag = get(get(handles.uipanel5,'SelectedObject'), 'Tag');
switch xtag
    case 'radiobutton10'
        metodo=0;
    case 'radiobutton12'
        metodo=1;
    case 'radiobutton14'
        metodo=2;
    case 'radiobutton15'
        metodo=3;
    case 'radiobutton16'
        metodo=4;
    case 'radiobutton17'
        metodo=5;  
end
global Momentos_ang M spline antropometria y splinef gjuntas;
global KOA;
KOA=metodo;
if KOA==0|| KOA==2
delete(Projecto2);    
Projecto3;
end
if KOA==4|| KOA==5|| KOA==1||KOA==3
delete(Projecto2);    
GraficosDinamica(KOA,7,y,M,Momentos_ang,gjuntas,antropometria,spline,splinef);
Projecto2;
end
