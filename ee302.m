function varargout = ee302(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ee302_OpeningFcn, ...
                   'gui_OutputFcn',  @ee302_OutputFcn, ...
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

function ee302_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);


function varargout = ee302_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function edit15_Callback(hObject, eventdata, handles)

function stablity_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function right_Callback(hObject, eventdata, handles)

function right_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function left_Callback(hObject, eventdata, handles)

function left_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function axis_Callback(hObject, eventdata, handles)


function axis_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s6_Callback(hObject, eventdata, handles)

function s6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5_Callback(hObject, eventdata, handles)

function s5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

function s4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3_Callback(hObject, eventdata, handles)

function s3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2_Callback(hObject, eventdata, handles)

function s2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1_Callback(hObject, eventdata, handles)

function s1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s0_Callback(hObject, eventdata, handles)

function s0_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function calculate_Callback(hObject, eventdata, handles)


s6=str2num(get(handles.s6,'string'));
s5=str2num(get(handles.s5,'string'));
s4=str2num(get(handles.s4,'string'));
s3=str2num(get(handles.s3,'string'));
s2=str2num(get(handles.s2,'string'));
s1=str2num(get(handles.s1,'string'));
s0=str2num(get(handles.s0,'string'));

r=[s6 s5 s4 s3 s2 s1 s0];
index = find(r ~= 0);
r = r(index : end); 

m=length(r);
n=round(m/2);
q=1;
k=0;

if(m~=0)
    
for p = 1:length(r) 
    if rem(p,2)==0
        c_even(k)=r(p); 
    else
        c_odd(q)=r(p); 

        k=k+1;
        q=q+1;
    end
end
a=zeros(m,n); 

if m/2 ~= round(m/2)
    c_even(n)=0;
end

a(1,:)=c_odd;
a(2,:)=c_even;

if a(2,1)==0
    a(2,1)=0.01;
end

for i=3:m
    
    for j=1:n-1
        x=a(i-1,1);
        if x==0 
            x=0.01;
        end

        a(i,j)=((a(i-1,1)*a(i-2,j+1))-(a(i-2,1)*a(i-1,j+1)))/x;
    end
    
    if a(i,:)==0
        order=(m-i+1);
        c=0;
        d=1;
        for j=1:n-1
            a(i,j)=(order-c)*(a(i-1,d));
            d=d+1;
            c=c+2;
        end
    end
    
    if a(i,1)==0
        a(i,1)=0.01;
    end
    
end

Right_poles=0;
Left_poles=0;
Imaginary_poles=0;
%for i=1:m-1
 %   if sign(real(a(i,1)))*sign(real(a(i+1,1)))==-1
  %      Right_poles=Right_poles+1;
   % end
%end


Roots=roots(r);
for i=1:length(Roots)
    if real(Roots(i))==0
        Imaginary_poles=Imaginary_poles+1;
    end
end
for i=1:length(Roots)
    if real(Roots(i))>0
        Right_poles=Right_poles+1;
    end
end

Left_poles=m-Right_poles-Imaginary_poles-1;
Stablity="Unstable";
if(Right_poles==0)
    Stablity="Marginally Stable";
end

if(Left_poles==m-1)
   Stablity="Stable";
end
set(handles.stablity,'string',num2str(Stablity))
set(handles.right,'string',num2str(Right_poles))
set(handles.left,'string',num2str(Left_poles))
set(handles.axis,'string',num2str(Imaginary_poles))
set(handles.pop,'string',num2str(" "))

if(m==7)
set(handles.s6a,'string',num2str(a(1,1)))
set(handles.s6b,'string',num2str(a(1,2)))
set(handles.s6c,'string',num2str(a(1,3)))
set(handles.s6d,'string',num2str(a(1,4)))
set(handles.s5a,'string',num2str(a(2,1)))
set(handles.s5b,'string',num2str(a(2,2)))
set(handles.s5c,'string',num2str(a(2,3)))
set(handles.s5d,'string',num2str(a(2,4)))
set(handles.s4a,'string',num2str(a(3,1)))
set(handles.s4b,'string',num2str(a(3,2)))
set(handles.s4c,'string',num2str(a(3,3)))
set(handles.s4d,'string',num2str(a(3,4)))
set(handles.s3a,'string',num2str(a(4,1)))
set(handles.s3b,'string',num2str(a(4,2)))
set(handles.s3c,'string',num2str(a(4,3)))
set(handles.s3d,'string',num2str(a(4,4)))
set(handles.s2a,'string',num2str(a(5,1)))
set(handles.s2b,'string',num2str(a(5,2)))
set(handles.s2c,'string',num2str(a(5,3)))
set(handles.s2d,'string',num2str(a(5,4)))
set(handles.s1a,'string',num2str(a(6,1)))
set(handles.s1b,'string',num2str(a(6,2)))
set(handles.s1c,'string',num2str(a(6,3)))
set(handles.s1d,'string',num2str(a(6,4)))
set(handles.s0a,'string',num2str(a(7,1)))
set(handles.s0b,'string',num2str(a(7,2)))
set(handles.s0c,'string',num2str(a(7,3)))
set(handles.s0d,'string',num2str(a(7,4)))

set(handles.r1,'string',num2str(Roots(1)))
set(handles.r2,'string',num2str(Roots(2)))
set(handles.r3,'string',num2str(Roots(3)))
set(handles.r4,'string',num2str(Roots(4)))
set(handles.r5,'string',num2str(Roots(5)))
set(handles.r6,'string',num2str(Roots(6)))
end

b=" ";

if(m==6)
set(handles.s6a,'string',num2str(b))
set(handles.s6b,'string',num2str(b))
set(handles.s6c,'string',num2str(b))
set(handles.s6d,'string',num2str(b))
set(handles.s5a,'string',num2str(a(1,1)))
set(handles.s5b,'string',num2str(a(1,2)))
set(handles.s5c,'string',num2str(a(1,3)))
set(handles.s5d,'string',num2str(b))
set(handles.s4a,'string',num2str(a(2,1)))
set(handles.s4b,'string',num2str(a(2,2)))
set(handles.s4c,'string',num2str(a(2,3)))
set(handles.s4d,'string',num2str(b))
set(handles.s3a,'string',num2str(a(3,1)))
set(handles.s3b,'string',num2str(a(3,2)))
set(handles.s3c,'string',num2str(a(3,3)))
set(handles.s3d,'string',num2str(b))
set(handles.s2a,'string',num2str(a(4,1)))
set(handles.s2b,'string',num2str(a(4,2)))
set(handles.s2c,'string',num2str(a(4,3)))
set(handles.s2d,'string',num2str(b))
set(handles.s1a,'string',num2str(a(5,1)))
set(handles.s1b,'string',num2str(a(5,2)))
set(handles.s1c,'string',num2str(a(5,3)))
set(handles.s1d,'string',num2str(b))
set(handles.s0a,'string',num2str(a(6,1)))
set(handles.s0b,'string',num2str(a(6,2)))
set(handles.s0c,'string',num2str(a(6,3)))
set(handles.s0d,'string',num2str(b))

set(handles.r1,'string',num2str(Roots(1)))
set(handles.r2,'string',num2str(Roots(2)))
set(handles.r3,'string',num2str(Roots(3)))
set(handles.r4,'string',num2str(Roots(4)))
set(handles.r5,'string',num2str(Roots(5)))
set(handles.r6,'string',num2str(b))
end

if(m==5)
set(handles.s6a,'string',num2str(b))
set(handles.s6b,'string',num2str(b))
set(handles.s6c,'string',num2str(b))
set(handles.s6d,'string',num2str(b))
set(handles.s5a,'string',num2str(b))
set(handles.s5b,'string',num2str(b))
set(handles.s5c,'string',num2str(b))
set(handles.s5d,'string',num2str(b))
set(handles.s4a,'string',num2str(a(1,1)))
set(handles.s4b,'string',num2str(a(1,2)))
set(handles.s4c,'string',num2str(a(1,3)))
set(handles.s4d,'string',num2str(b))
set(handles.s3a,'string',num2str(a(2,1)))
set(handles.s3b,'string',num2str(a(2,2)))
set(handles.s3c,'string',num2str(a(2,3)))
set(handles.s3d,'string',num2str(b))
set(handles.s2a,'string',num2str(a(3,1)))
set(handles.s2b,'string',num2str(a(3,2)))
set(handles.s2c,'string',num2str(a(3,3)))
set(handles.s2d,'string',num2str(b))
set(handles.s1a,'string',num2str(a(4,1)))
set(handles.s1b,'string',num2str(a(4,2)))
set(handles.s1c,'string',num2str(a(4,3)))
set(handles.s1d,'string',num2str(b))
set(handles.s0a,'string',num2str(a(5,1)))
set(handles.s0b,'string',num2str(a(5,2)))
set(handles.s0c,'string',num2str(a(5,3)))
set(handles.s0d,'string',num2str(b))

set(handles.r1,'string',num2str(Roots(1)))
set(handles.r2,'string',num2str(Roots(2)))
set(handles.r3,'string',num2str(Roots(3)))
set(handles.r4,'string',num2str(Roots(4)))
set(handles.r5,'string',num2str(b))
set(handles.r6,'string',num2str(b))
end

if(m==4)
set(handles.s6a,'string',num2str(b))
set(handles.s6b,'string',num2str(b))
set(handles.s6c,'string',num2str(b))
set(handles.s6d,'string',num2str(b))
set(handles.s5a,'string',num2str(b))
set(handles.s5b,'string',num2str(b))
set(handles.s5c,'string',num2str(b))
set(handles.s5d,'string',num2str(b))
set(handles.s4a,'string',num2str(b))
set(handles.s4b,'string',num2str(b))
set(handles.s4c,'string',num2str(b))
set(handles.s4d,'string',num2str(b))
set(handles.s3a,'string',num2str(a(1,1)))
set(handles.s3b,'string',num2str(a(1,2)))
set(handles.s3c,'string',num2str(b))
set(handles.s3d,'string',num2str(b))
set(handles.s2a,'string',num2str(a(2,1)))
set(handles.s2b,'string',num2str(a(2,2)))
set(handles.s2c,'string',num2str(b))
set(handles.s2d,'string',num2str(b))
set(handles.s1a,'string',num2str(a(3,1)))
set(handles.s1b,'string',num2str(a(3,2)))
set(handles.s1c,'string',num2str(b))
set(handles.s1d,'string',num2str(b))
set(handles.s0a,'string',num2str(a(4,1)))
set(handles.s0b,'string',num2str(a(4,2)))
set(handles.s0c,'string',num2str(b))
set(handles.s0d,'string',num2str(b))

set(handles.r1,'string',num2str(Roots(1)))
set(handles.r2,'string',num2str(Roots(2)))
set(handles.r3,'string',num2str(Roots(3)))
set(handles.r4,'string',num2str(b))
set(handles.r5,'string',num2str(b))
set(handles.r6,'string',num2str(b))
end

if(m==3)
set(handles.s6a,'string',num2str(b))
set(handles.s6b,'string',num2str(b))
set(handles.s6c,'string',num2str(b))
set(handles.s6d,'string',num2str(b))
set(handles.s5a,'string',num2str(b))
set(handles.s5b,'string',num2str(b))
set(handles.s5c,'string',num2str(b))
set(handles.s5d,'string',num2str(b))
set(handles.s4a,'string',num2str(b))
set(handles.s4b,'string',num2str(b))
set(handles.s4c,'string',num2str(b))
set(handles.s4d,'string',num2str(b))
set(handles.s3a,'string',num2str(b))
set(handles.s3b,'string',num2str(b))
set(handles.s3c,'string',num2str(b))
set(handles.s3d,'string',num2str(b))
set(handles.s2a,'string',num2str(a(1,1)))
set(handles.s2b,'string',num2str(a(1,2)))
set(handles.s2c,'string',num2str(b))
set(handles.s2d,'string',num2str(b))
set(handles.s1a,'string',num2str(a(2,1)))
set(handles.s1b,'string',num2str(a(2,2)))
set(handles.s1c,'string',num2str(b))
set(handles.s1d,'string',num2str(b))
set(handles.s0a,'string',num2str(a(3,1)))
set(handles.s0b,'string',num2str(a(3,2)))
set(handles.s0c,'string',num2str(b))
set(handles.s0d,'string',num2str(b))

set(handles.r1,'string',num2str(Roots(1)))
set(handles.r2,'string',num2str(Roots(2)))
set(handles.r3,'string',num2str(b))
set(handles.r4,'string',num2str(b))
set(handles.r5,'string',num2str(b))
set(handles.r6,'string',num2str(b))
end

if(m==2)
set(handles.s6a,'string',num2str(b))
set(handles.s6b,'string',num2str(b))
set(handles.s6c,'string',num2str(b))
set(handles.s6d,'string',num2str(b))
set(handles.s5a,'string',num2str(b))
set(handles.s5b,'string',num2str(b))
set(handles.s5c,'string',num2str(b))
set(handles.s5d,'string',num2str(b))
set(handles.s4a,'string',num2str(b))
set(handles.s4b,'string',num2str(b))
set(handles.s4c,'string',num2str(b))
set(handles.s4d,'string',num2str(b))
set(handles.s3a,'string',num2str(b))
set(handles.s3b,'string',num2str(b))
set(handles.s3c,'string',num2str(b))
set(handles.s3d,'string',num2str(b))
set(handles.s2a,'string',num2str(b))
set(handles.s2b,'string',num2str(b))
set(handles.s2c,'string',num2str(b))
set(handles.s2d,'string',num2str(b))
set(handles.s1a,'string',num2str(a(1,1)))
set(handles.s1b,'string',num2str(b))
set(handles.s1c,'string',num2str(b))
set(handles.s1d,'string',num2str(b))
set(handles.s0a,'string',num2str(a(2,1)))
set(handles.s0b,'string',num2str(b))
set(handles.s0c,'string',num2str(b))
set(handles.s0d,'string',num2str(b))

set(handles.r1,'string',num2str(Roots(1)))
set(handles.r2,'string',num2str(b))
set(handles.r3,'string',num2str(b))
set(handles.r4,'string',num2str(b))
set(handles.r5,'string',num2str(b))
set(handles.r6,'string',num2str(b))
end

if(m==1)
set(handles.s6a,'string',num2str(b))
set(handles.s6b,'string',num2str(b))
set(handles.s6c,'string',num2str(b))
set(handles.s6d,'string',num2str(b))
set(handles.s5a,'string',num2str(b))
set(handles.s5b,'string',num2str(b))
set(handles.s5c,'string',num2str(b))
set(handles.s5d,'string',num2str(b))
set(handles.s4a,'string',num2str(b))
set(handles.s4b,'string',num2str(b))
set(handles.s4c,'string',num2str(b))
set(handles.s4d,'string',num2str(b))
set(handles.s3a,'string',num2str(b))
set(handles.s3b,'string',num2str(b))
set(handles.s3c,'string',num2str(b))
set(handles.s3d,'string',num2str(b))
set(handles.s2a,'string',num2str(b))
set(handles.s2b,'string',num2str(b))
set(handles.s2c,'string',num2str(b))
set(handles.s2d,'string',num2str(b))
set(handles.s1a,'string',num2str(b))
set(handles.s1b,'string',num2str(b))
set(handles.s1c,'string',num2str(b))
set(handles.s1d,'string',num2str(b))
set(handles.s0a,'string',num2str(b))
set(handles.s0b,'string',num2str(b))
set(handles.s0c,'string',num2str(b))
set(handles.s0d,'string',num2str(b))

set(handles.r1,'string',num2str(b))
set(handles.r2,'string',num2str(b))
set(handles.r3,'string',num2str(b))
set(handles.r4,'string',num2str(b))
set(handles.r5,'string',num2str(b))
set(handles.r6,'string',num2str(b))

set(handles.stablity,'string',num2str("Stable"))
set(handles.right,'string',num2str(0))
set(handles.left,'string',num2str(0))
set(handles.axis,'string',num2str(0))
set(handles.pop,'string',num2str("Routh Table can not be constructed"))
end
end

if(m==0)
b=" ";
set(handles.s6a,'string',num2str(b))
set(handles.s6b,'string',num2str(b))
set(handles.s6c,'string',num2str(b))
set(handles.s6d,'string',num2str(b))
set(handles.s5a,'string',num2str(b))
set(handles.s5b,'string',num2str(b))
set(handles.s5c,'string',num2str(b))
set(handles.s5d,'string',num2str(b))
set(handles.s4a,'string',num2str(b))
set(handles.s4b,'string',num2str(b))
set(handles.s4c,'string',num2str(b))
set(handles.s4d,'string',num2str(b))
set(handles.s3a,'string',num2str(b))
set(handles.s3b,'string',num2str(b))
set(handles.s3c,'string',num2str(b))
set(handles.s3d,'string',num2str(b))
set(handles.s2a,'string',num2str(b))
set(handles.s2b,'string',num2str(b))
set(handles.s2c,'string',num2str(b))
set(handles.s2d,'string',num2str(b))
set(handles.s1a,'string',num2str(b))
set(handles.s1b,'string',num2str(b))
set(handles.s1c,'string',num2str(b))
set(handles.s1d,'string',num2str(b))
set(handles.s0a,'string',num2str(b))
set(handles.s0b,'string',num2str(b))
set(handles.s0c,'string',num2str(b))
set(handles.s0d,'string',num2str(b))

set(handles.r1,'string',num2str(b))
set(handles.r2,'string',num2str(b))
set(handles.r3,'string',num2str(b))
set(handles.r4,'string',num2str(b))
set(handles.r5,'string',num2str(b))
set(handles.r6,'string',num2str(b))

set(handles.stablity,'string',num2str("Unstable"))
set(handles.right,'string',num2str(0))
set(handles.left,'string',num2str(0))
set(handles.axis,'string',num2str(0))
set(handles.pop,'string',num2str("Routh Table can not be constructed"))
end


function s6b_Callback(hObject, eventdata, handles)

function s6b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5b_Callback(hObject, eventdata, handles)

function s5b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4b_Callback(hObject, eventdata, handles)

function s4b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3b_Callback(hObject, eventdata, handles)

function s3b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2b_Callback(hObject, eventdata, handles)

function s2b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1b_Callback(hObject, eventdata, handles)

function s1b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s0b_Callback(hObject, eventdata, handles)

function s0b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s6a_Callback(hObject, eventdata, handles)

function s6a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5a_Callback(hObject, eventdata, handles)

function s5a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4a_Callback(hObject, eventdata, handles)

function s4a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3a_Callback(hObject, eventdata, handles)

function s3a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2a_Callback(hObject, eventdata, handles)

function s2a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1a_Callback(hObject, eventdata, handles)

function s1a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s0a_Callback(hObject, eventdata, handles)

function s0a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s6c_Callback(hObject, eventdata, handles)

function s6c_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5c_Callback(hObject, eventdata, handles)

function s5c_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4c_Callback(hObject, eventdata, handles)

function s4c_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3c_Callback(hObject, eventdata, handles)

function s3c_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2c_Callback(hObject, eventdata, handles)

function s2c_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1c_Callback(hObject, eventdata, handles)


function s1c_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s0c_Callback(hObject, eventdata, handles)

function s0c_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s6d_Callback(hObject, eventdata, handles)

function s6d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s5d_Callback(hObject, eventdata, handles)

function s5d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4d_Callback(hObject, eventdata, handles)

function s4d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s3d_Callback(hObject, eventdata, handles)

function s3d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2d_Callback(hObject, eventdata, handles)

function s2d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s1d_Callback(hObject, eventdata, handles)

function s1d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s0d_Callback(hObject, eventdata, handles)

function s0d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s4_Callback(hObject, eventdata, handles)


function r1_Callback(hObject, eventdata, handles)

function r1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r2_Callback(hObject, eventdata, handles)

function r2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r3_Callback(hObject, eventdata, handles)

function r3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r4_Callback(hObject, eventdata, handles)

function r4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r5_Callback(hObject, eventdata, handles)

function r5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r6_Callback(hObject, eventdata, handles)

function r6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pop_Callback(hObject, eventdata, handles)

function pop_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
