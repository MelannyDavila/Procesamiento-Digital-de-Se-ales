function varargout = Proyecto_1_PDS(varargin)
% PROYECTO_1_PDS MATLAB code for Proyecto_1_PDS.fig
%      PROYECTO_1_PDS, by itself, creates a new PROYECTO_1_PDS or raises the existing
%      singleton*.
%
%      H = PROYECTO_1_PDS returns the handle to a new PROYECTO_1_PDS or the handle to
%      the existing singleton*.
%
%      PROYECTO_1_PDS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYECTO_1_PDS.M with the given input arguments.
%
%      PROYECTO_1_PDS('Property','Value',...) creates a new PROYECTO_1_PDS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proyecto_1_PDS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proyecto_1_PDS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proyecto_1_PDS

% Last Modified by GUIDE v2.5 27-Dec-2020 15:55:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proyecto_1_PDS_OpeningFcn, ...
                   'gui_OutputFcn',  @Proyecto_1_PDS_OutputFcn, ...
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


% --- Executes just before Proyecto_1_PDS is made visible.
function Proyecto_1_PDS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proyecto_1_PDS (see VARARGIN)
global abierta
global punio
global mano_abierta
global mano_cerrada
% abierta= imread ('abierta.jpg');
% punio= imread ('punio.jpg');
% mano_abierta=imread ('mano_abierta.jpg');
% mano_cerrada=imread ('mano_cerrada.jpg');
% axes(handles.grafico);
% imshow(abierta);
% axes(handles.caratula);
% imshow(mano_abierta);

% Choose default command line output for Proyecto_1_PDS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proyecto_1_PDS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proyecto_1_PDS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global abierta
global punio
global mano_cerrada
global mano_abierta
senal=zeros(1,1000);
A=arduino('COM11','Uno')
inicio=true
while inicio
senal=zeros(1,200);
for numero=1:200
acele=readVoltage(A,'A0');
% if acele>=0.45
% axes(handles.caratula);
% imshow(mano_cerrada);
% axes(handles.grafico);
% imshow(punio);
% else
% axes(handles.caratula);
% imshow(mano_abierta);
% axes(handles.grafico);
% imshow(abierta);
% end
senal(numero)=acele;
axes(handles.axes1)
plot(senal)
drawnow
if ~inicio
break
end
end
end
clear A

% --- Executes on button press in btn_salir.
function btn_salir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opc=questdlg('Desea Salir?','SALIR','SI','NO','NO');
if strcmp(opc,'NO')
return
end
clear,clc,close all;
clc
close all
clear all
senal=zeros(1,1000);
a=arduino('COM10','Uno');
figure
for i=1:5
senal=zeros(1,100);
for numero=1:500
emg=readVoltage(a,'A0')
senal(numero)=emg;
plot(senal)
title('Electromiograma')
xlabel('Tiempo')
ylabel('señal')
drawnow
end
end
clear a
