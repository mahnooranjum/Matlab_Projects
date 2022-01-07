function varargout = M20191215_Timer(varargin)
% M20191215_TIMER MATLAB code for M20191215_Timer.fig
%      M20191215_TIMER, by itself, creates a new M20191215_TIMER or raises the existing
%      singleton*.
%
%      H = M20191215_TIMER returns the handle to a new M20191215_TIMER or the handle to
%      the existing singleton*.
%
%      M20191215_TIMER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M20191215_TIMER.M with the given input arguments.
%
%      M20191215_TIMER('Property','Value',...) creates a new M20191215_TIMER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M20191215_Timer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M20191215_Timer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M20191215_Timer

% Last Modified by GUIDE v2.5 11-Apr-2020 12:48:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M20191215_Timer_OpeningFcn, ...
                   'gui_OutputFcn',  @M20191215_Timer_OutputFcn, ...
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


% --- Executes just before M20191215_Timer is made visible.
function M20191215_Timer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M20191215_Timer (see VARARGIN)

% Choose default command line output for M20191215_Timer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M20191215_Timer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M20191215_Timer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function hoursIn_Callback(hObject, eventdata, handles)
% hObject    handle to hoursIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hoursIn as text
%        str2double(get(hObject,'String')) returns contents of hoursIn as a double


% --- Executes during object creation, after setting all properties.
function hoursIn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hoursIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minutesIn_Callback(hObject, eventdata, handles)
% hObject    handle to minutesIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minutesIn as text
%        str2double(get(hObject,'String')) returns contents of minutesIn as a double


% --- Executes during object creation, after setting all properties.
function minutesIn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minutesIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function secondsIn_Callback(hObject, eventdata, handles)
% hObject    handle to secondsIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of secondsIn as text
%        str2double(get(hObject,'String')) returns contents of secondsIn as a double


% --- Executes during object creation, after setting all properties.
function secondsIn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to secondsIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in starter.
function starter_Callback(hObject, eventdata, handles)
% hObject    handle to starter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    % initialize variables
    NUM_SECONDS_PER_DAY = 86400.0;
    hoursIn = get(handles.hoursIn,'String');
    minutesIn = get(handles.minutesIn,'String');
    secondsIn = get(handles.secondsIn,'String');
    string = [hoursIn ':' minutesIn ':' secondsIn];
    timeStrings = {string};
    % convert times to fractional days using datenum
    timeFractionalDays = datenum(timeStrings);
    % leave only the part with the most recent day fraction
    timeDayFraction = mod(timeFractionalDays,1);
    % multiply by number of seconds in a day
    timeInSeconds = timeDayFraction .* NUM_SECONDS_PER_DAY;

for i=1:timeInSeconds
    t = round(timeInSeconds - i);
    obj = seconds(t);
    obj.Format = 'hh:mm:ss';
    t = char(duration(obj));
    arr = regexp(t, ":", 'split');
    h = char(arr(1));
    m = char(arr(2));
    s = char(arr(3));
    set(handles.hoursIn,'string',h);
    set(handles.minutesIn,'string',m);
    set(handles.secondsIn,'string',s);
    pause(1);
end
beep;