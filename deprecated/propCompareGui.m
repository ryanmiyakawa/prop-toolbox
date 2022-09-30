function varargout = propCompareGui(varargin)
% PROPCOMPAREGUI M-file for propCompareGui.fig
%      PROPCOMPAREGUI, by itself, creates a new PROPCOMPAREGUI or raises the existing
%      singleton*.
%
%      H = PROPCOMPAREGUI returns the handle to a new PROPCOMPAREGUI or the handle to
%      the existing singleton*.
%
%      PROPCOMPAREGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROPCOMPAREGUI.M with the given input arguments.
%
%      PROPCOMPAREGUI('Property','Value',...) creates a new PROPCOMPAREGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before propCompareGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to propCompareGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help propCompareGui

% Last Modified by GUIDE v2.5 05-Aug-2013 14:03:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @propCompareGui_OpeningFcn, ...
    'gui_OutputFcn',  @propCompareGui_OutputFcn, ...
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


% --- Executes just before propCompareGui is made visible.
function propCompareGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to propCompareGui (see VARARGIN)

% Choose default command line output for propCompareGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes propCompareGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = propCompareGui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4



function lambda_Callback(hObject, eventdata, handles)
% hObject    handle to lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambda as text
%        str2double(get(hObject,'String')) returns contents of lambda as a double


% --- Executes during object creation, after setting all properties.
function lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function paddedObjectRes_Callback(hObject, eventdata, handles)
% hObject    handle to paddedObjectRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paddedObjectRes as text
%        str2double(get(hObject,'String')) returns contents of paddedObjectRes as a double


% --- Executes during object creation, after setting all properties.
function paddedObjectRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paddedObjectRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function object_Callback(hObject, eventdata, handles)
% hObject    handle to object (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of object as text
%        str2double(get(hObject,'String')) returns contents of object as a double


% --- Executes during object creation, after setting all properties.
function object_CreateFcn(hObject, eventdata, handles)
% hObject    handle to object (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function objectPixelSize_Callback(hObject, eventdata, handles)
% hObject    handle to objectPixelSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of objectPixelSize as text
%        str2double(get(hObject,'String')) returns contents of objectPixelSize as a double


% --- Executes during object creation, after setting all properties.
function objectPixelSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to objectPixelSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dz_Callback(hObject, eventdata, handles)
% hObject    handle to dz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dz as text
%        str2double(get(hObject,'String')) returns contents of dz as a double


% --- Executes during object creation, after setting all properties.
function dz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in propagate.
function propagate_Callback(hObject, eventdata, handles)
handles = guidata(handles.output);

obj     = getVal('object', handles);
d1      = getVal('objectPixelSize', handles);
d2      = getVal('imagePixelSize', handles);
lambda  = getVal('lambda', handles);
dz      = getVal('dz', handles);

cb1     = getVal('checkbox1', handles, 'value');
cb2     = getVal('checkbox2', handles, 'value');
cb3     = getVal('checkbox3', handles, 'value');
cb4     = getVal('checkbox4', handles, 'value');

padRes  = getVal('paddedObjectRes', handles);

N = size(obj,1);


D2 = d2*N;

if (padRes ~= -1)
    % rescale for non-ft based prop
    obj_ft =  pad2(obj, padRes, padRes); % swap for ft based prop
    D1 = d1*padRes;
else
    obj_ft = obj;
    D1 = d1*N;
end


lambda_nm = lambda*1e9;


% redo parameters for non-ft methods:
if (padRes ~= -1)
    D1_um = D1*1e6/padRes * N;
    D2_um = D2*1e6/N * padRes;
    dz_mm = dz*1e3;
    N = padRes;
else
    D1_um = D1*1e6;
    D2_um = D2*1e6;
    dz_mm = dz*1e3;
end


set(handles.output, 'currentaxes', handles.axes1);
imagesc(1);
set(handles.output, 'currentaxes', handles.axes2);
imagesc(1);
set(handles.output, 'currentaxes', handles.axes3);
imagesc(1);
set(handles.output, 'currentaxes', handles.axes4);
imagesc(1);
    
if (cb1)
    set(handles.pt1, 'string', 'Calculating...');
    
    tic
    [x2, y2, out] = fresnelPropAngSpec(obj_ft, lambda, d1, d2, dz);
    set(handles.pt1, 'string',s2f(toc, 1e-5));
    set(handles.output, 'currentaxes', handles.axes1);
    imagesc(abs(out));
    
    handles.img1 = out;
end
if (cb2)
    set(handles.pt2, 'string', 'Calculating...');
    
    tic
    [x2, y2, out] = fresnelPropCZT(obj, lambda, d1, d2, N, dz);
    set(handles.pt2, 'string',s2f(toc, 1e-5));
    set(handles.output, 'currentaxes', handles.axes2);
    imagesc(abs(out));
    
    handles.img2 = out;

end
if (cb3)
    set(handles.pt3, 'string', 'Calculating...');
    
    fprintf('Obj_res = %d, D1_um = %g, D2_um = %g \n', size(obj,1), D1_um, D2_um);
    
    tic
    out = prop10(obj, D1_um, N, D2_um, dz_mm, lambda_nm, 0, 0);
    
    fprintf('prop10(obj, %0.2f, %d, %0.2f, %0.2f,%0.2f, 0, 0)\n', D1_um, N, D2_um, dz_mm, lambda_nm);
    set(handles.pt3, 'string', s2f(toc, 1e-5));
    set(handles.output, 'currentaxes', handles.axes3);
    imagesc(abs(out));
    handles.img3 = out;
end

if (cb4)
    set(handles.pt4, 'string', 'Calculating...');
    tic
    drawnow
    out = prop10d(obj, D1_um, N, D2_um, dz_mm, lambda_nm, 0, 0);
    set(handles.pt4, 'string', s2f(toc));
    set(handles.output, 'currentaxes', handles.axes4);
    imagesc(abs(out));
    handles.img4 = out;
    
end

guidata(handles.output, handles);




function out = getVal(tag, handles, valFlag)
handles = guidata(handles.output);

if nargin == 3 
    
    switch valFlag
        case 'value'
            out = get(handles.(tag), 'value');
        case 'imread'
            out = imread(get(handles.(tag), 'value'));
    end
    return
end

str = get(handles.(tag), 'string');

splt = regexp(str, ' ', 'split');
if length(splt) > 1
    unit = splt{2};
else
    unit = 'none';
end

evl = splt{1};

fac = 1;
switch unit
    case 'cm'
        fac = 1e-2;
    case 'mm'
        fac = 1e-3;
    case 'um'
        fac = 1e-6;
    case 'nm'
        fac = 1e-9;
    case 'km'
        fac = 1e3;
    case 'pm'
        fac = 1e-12;
    case 'none'
        fac = 1;
    otherwise % not a unit
        out = eval(str);
        return
end
out = eval(evl)*fac;



function imagePixelSize_Callback(hObject, eventdata, handles)
% hObject    handle to imagePixelSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of imagePixelSize as text
%        str2double(get(hObject,'String')) returns contents of imagePixelSize as a double


% --- Executes during object creation, after setting all properties.
function imagePixelSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imagePixelSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
