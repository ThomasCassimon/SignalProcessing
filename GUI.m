function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 29-Nov-2017 11:30:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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
end

% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%Create tab group
handles.tgroup = uitabgroup('Parent', handles.figure1,'TabLocation', 'top');
handles.dataPanel = uitab('Parent', handles.tgroup, 'Title', 'Raw data');
handles.plotPanel = uitab('Parent', handles.tgroup, 'Title', 'Plotting window');
handles.settingsPanel = uitab('Parent', handles.tgroup, 'Title', 'Processing settings');


%Place panels into each tab
set(handles.dataTable, 'Parent', handles.dataPanel)
set(handles.filterDataButton, 'Parent', handles.dataPanel)

set(handles.rawData, 'Parent', handles.plotPanel)
set(handles.processedData, 'Parent', handles.plotPanel)
set(handles.timeDomainPlot, 'Parent', handles.plotPanel)
set(handles.frequencyMagnitudePlot, 'Parent', handles.plotPanel)
set(handles.frequencyPhasePlot, 'Parent',handles.plotPanel)
set(handles.timeDomainTag, 'Parent', handles.plotPanel)
set(handles.frequencyDomainTag, 'Parent', handles.plotPanel)

set(handles.windowFunctionGroup, 'Parent', handles.settingsPanel)
set(handles.noiseRemovalGroup, 'Parent', handles.settingsPanel)

y = 0:1:10;
plotDFT(y,handles)

end

% UIWAIT makes GUI wait for user response (see UIRESUME)
%uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end



% --- Executes on button press in DataTabButton.
function DataTabButton_Callback(hObject, eventdata, handles)
% hObject    handle to DataTabButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end


% --- Executes on button press in PlotTabButton.
function PlotTabButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotTabButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end


% --- Executes on button press in rawData.
function rawData_Callback(hObject, eventdata, handles)          %CHECKBOX: show raw data or not
% hObject    handle to rawData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rawData

end


% --- Executes on button press in processedData.
function processedData_Callback(hObject, eventdata, handles)    %CHECKBOX: show processed data or not
% hObject    handle to processedData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of processedData

end


% --------------------------------------------------------------------
function settings_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

run('SettingsDialog.m');

end


% --------------------------------------------------------------------
function Help_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

run('helpWindow.m');

end


% --- Executes on button press in enableWindowFunctionCheckbox.
function enableWindowFunctionCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to enableWindowFunctionCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of enableWindowFunctionCheckbox

end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

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

end


% --------------------------------------------------------------------
function Open_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = uigetfile('*.xls*');

data = LoadDataFromExcel(filename);

set(handles.dataTable,'data',data);

end


% --- Executes on button press in filterDataButton.
function filterDataButton_Callback(hObject, eventdata, handles)
% hObject    handle to filterDataButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end

%Plots data on a graph in the GUI
%type specifies on which graph you want to plot
%type = 0 => time domain graph
%type = 1 => frequency domain magnitude graph
%type = 2 => frequency domain phase graph
function plotGraph(x, y, type, handles)

switch(type)
    case 0
        axes(handles.timeDomainPlot);
    case 1
        axes(handles.frequencyMagnitudePlot);
    case 2
        axes(handles.frequencyPhasePlot);
    otherwise
        fprintf('Bad argument %d for plotGraph function', type);
end

plot(x,y)

end
