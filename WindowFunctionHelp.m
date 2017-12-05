function varargout = WindowFunctionHelp(varargin)
% WINDOWFUNCTIONHELP MATLAB code for WindowFunctionHelp.fig
%      WINDOWFUNCTIONHELP, by itself, creates a new WINDOWFUNCTIONHELP or raises the existing
%      singleton*.
%
%      H = WINDOWFUNCTIONHELP returns the handle to a new WINDOWFUNCTIONHELP or the handle to
%      the existing singleton*.
%
%      WINDOWFUNCTIONHELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WINDOWFUNCTIONHELP.M with the given input arguments.
%
%      WINDOWFUNCTIONHELP('Property','Value',...) creates a new WINDOWFUNCTIONHELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WindowFunctionHelp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WindowFunctionHelp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WindowFunctionHelp

% Last Modified by GUIDE v2.5 29-Nov-2017 14:50:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WindowFunctionHelp_OpeningFcn, ...
                   'gui_OutputFcn',  @WindowFunctionHelp_OutputFcn, ...
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


% --- Executes just before WindowFunctionHelp is made visible.
function WindowFunctionHelp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WindowFunctionHelp (see VARARGIN)

% Choose default command line output for WindowFunctionHelp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


%set(handles.helpText, 'String', fileread('WindowHelp.html'));

open('WindowHelp.html');

% UIWAIT makes WindowFunctionHelp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WindowFunctionHelp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
