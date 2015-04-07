  function varargout = Projecto1(varargin)
%Projecto1 M-file for Projecto1.fig
%      Projecto1, by itself, creates a new Projecto1 or raises the existing
%      singleton*.
%
%      H = Projecto1 returns the handle to a new Projecto1 or the handle to
%      the existing singleton*.
%
%      Projecto1('Property','Value',...) creates a new Projecto1 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Projecto1_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      Projecto1('CALLBACK') and Projecto1('CALLBACK',hObject,...) call the
%      local function named CALLBACK in Projecto1.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Projecto1

% Last Modified by GUIDE v2.5 14-Dec-2013 16:17:16


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Projecto1_OpeningFcn, ...
                   'gui_OutputFcn',  @Projecto1_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Projecto1 is made visible.
function Projecto1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Projecto1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
axes(handles.axes6);
imshow('Dinamica\gait.JPG')

% Update handles structure
guidata(hObject, handles);
axes(handles.axes7);
imshow('Dinamica\IST_Logo.png')
% UIWAIT makes Projecto1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Executes on button press in exitbutton.


% --- Outputs from this function are returned to the command line.
function varargout = Projecto1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(Projecto1);
global Momentos_ang Massa M spline antropometria y splinef gjuntas;
[Momentos_ang,Massa,M,spline,antropometria,y,splinef,gjuntas]=Dinamica(1);
Projecto2;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(Projecto1);
global Momentos_ang Massa M spline antropometria y splinef gjuntas;
[Momentos_ang,Massa,M,spline,antropometria,y,splinef,gjuntas]=Dinamica(0);
Projecto2;
