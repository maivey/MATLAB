%{
    Morgan Ivey

    Revision History
    -----------------------
    Date: 07/17/2017

    Version 1: this script uses structures and dynamic variables to calculate
    the distance between two basic shapes, as specified by the user, as well as
    the ratio of areas of two basic shapes.

    Focus: Structures, conditionals

    Status:07/17/2017, Works
%}

%Good practice:
clear all; close all; clc;

%create empty structure arrays for circle, right triangle, and square using
%struct and names for each attribute
Circle = struct('Radius',[],'Center',[],'Area',[]);
RightTriangle = struct('SideLengths',[],'Center',[],'Area',[]);
Square = struct('SideLength',[],'Center',[],'Area',[]);
%create structure 'shapes' with substructures Circle, RightTriangle, and
%Square using struct function
shapes = struct('Circle',Circle,'RightTriangle',RightTriangle,'Square',Square);

%set indx to one to use throughout script for indexing shape number
indx = 1;
%create structure Myshapes to fill dynamically throughout script
Myshapes = struct;
%create empty cell to store names of shapes depending on user inputs
shape_type = cell(0,1);


%ask user if they would like to create shapes A shape exists if user says
%'y' to each question
cir_opt = input('Create a circle? (y for yes, anything else for no)','s');
%create dynamic fieldname for each shape
if cir_opt == 'y'
    %set shape_Indx to the concatenation of 'shape' and the number indx (if
    %user says 'y' for cir_opt, then shape_Indx is one (circle is 'shape1')
    shape_Indx = ['shape',num2str(indx)];
    %use the shape_Indx to assign corresponding substructures (shapes) and
    %random values for each attribute (Radius, Center, Area)
    Myshapes.(shape_Indx) = Circle;
    %use randi(30) to create random values from 1-30
    Myshapes.(shape_Indx).Radius = randi(30);
    %create 1x2 vector with random values from 1-30 for attribute Center
    Myshapes.(shape_Indx).Center = [randi(30), randi(30)];
    %Calculate the Area using formula (pi*radius)^2
    Myshapes.(shape_Indx).Area = pi*(Myshapes.(shape_Indx).Radius)^2;
    %add 'Circle' to cell shape_type to keep track of what shapes are
    %created. If Circle was created first, then the first row, first col of
    %shape_type is the char 'Circle'
    shape_type{indx} = 'Circle';
    %if user created circle, increase the index by 1, so that the next
    %shape is shape2
    indx = indx + 1;   
end
tri_opt = input('Create a right triangle? (y for yes, anything else for no)','s');
%create dynamic field name for RightTriangle. Same logic follows from
%above.
if tri_opt == 'y'
    shape_Indx = ['shape',num2str(indx)]; 
    Myshapes.(shape_Indx) = RightTriangle;
    %create 1x2 vector with random values from 1-30 for attribute
    %SideLengths
    Myshapes.(shape_Indx).SideLengths = [randi(30), randi(30)];
    %create 1x2 vector with random values from 1-30 for attribute
    %SideLengths
    Myshapes.(shape_Indx).Center = [randi(30), randi(30)];
    %calculate area by 0.5* 1st element of SideLength* 2nd element of
    %SideLength
    Myshapes.(shape_Indx).Area = 0.5*Myshapes.(shape_Indx).SideLengths(1)*...
    Myshapes.(shape_Indx).SideLengths(2);
    %add Triangle to the shape_type cell. if triangle is the first shape it
    %will be in the first row, first col of shape_type. If the user has
    %already created a circle, then the index is now 2, so it will be
    %stored in the second col of shape_type
    shape_type{indx} = 'Triangle';
    %increase the index by 1, so if another shape is created, the index
    %will be one number higher than RightTriangle
    indx = indx + 1;
end
squ_opt = input('Create a square? (y for yes, anything else for no)','s');
%same logic follows as above
if squ_opt == 'y'
    shape_Indx = ['shape',num2str(indx)];
    Myshapes.(shape_Indx) = Square;
    Myshapes.(shape_Indx).SideLength = randi(30);
    Myshapes.(shape_Indx).Center = [randi(30),randi(30)];
    %calculate area by squaring the SideLength
    Myshapes.(shape_Indx).Area = Myshapes.(shape_Indx).SideLength^2;
    shape_type{indx} = 'Square';
end

%set num_shapes equal to the length of cell shape_type
num_shapes = length(shape_type);

disp('========================================================');
%use if else statements and num_shapes to determine if the user has created
%less than two shapes. if num_shapes is zero, the length of shape_type is
%zero (as calculated above), so the user did not respond 'y' for any of the
%shape creations. Display to command window that they did not create any
%shapes and exit program
if num_shapes == 0
    disp('You have not created any shapes.');
    disp('Bye!');
%if num_shapes is one, the user responded 'y' only once when prompted.
%Subsequent calculations cannot be made. Display this to command window.
elseif num_shapes == 1
    disp('You have not created at least two shapes, therefore calculations cannot be made.');
    disp('Bye!');
%else, the user created at least two shapes and calculations can now be
%made
else
    disp('The shapes that have non-zero areas are:');
    
    %use for loop to display the shapes created by the user, using the
    %indexes for each shape corresponding to which shape is shape1, shape2,
    %or shape3 depending on how many shapes the user created above
    for indx=1:length(shape_type)
        shape_Indx = ['shape',num2str(indx)];
        disp('-----------------------------------------');
        %Display the shapes created by the user in the command window,
        %along with their attributes
        disp([shape_Indx, '=', shape_type{indx}]);
        disp([shape_Indx, '='])
        disp(Myshapes.(shape_Indx))
    end

    %Prompt user to choose two shapes upon which to make a calculation of
    %the distance between each shapes' center.
    disp('============================================================');
    disp('Now, select two shapes you want to know the distance between.');

    %set dum_var and dum_var2 equal to true to account for user trying to
    %enter a shape that has not been created, or using the wrong name when
    %referring to a shape that has been created, tell them, and ask for
    %their input again Using a while loop, set dum_var and dum_var2 equal
    %to false when the user inputs a correct shape
    dum_var = true;
    dum_var2 = true;
    %create shape_list cell of all fieldnames that have been created in
    %Myshapes (for example, 'shape1' or 'shape2')
    shape_list = fieldnames(Myshapes);
    while dum_var
        dist_first = input('Choose the first shape: ', 's');
        %Use strcmp to determine if the user input a string that is the
        %same as in shape_list. Use any() to determine if it is in any of
        %the cells of shape_list
        if any(strcmp(shape_list,dist_first))
            %assign firstShape with dynamic fieldname, using user input
            %dist_first to firstShape
            firstShape = Myshapes.(dist_first);
            dum_var = false;
            while dum_var2
                %same logic follows as first while loop and if statement
                dist_second = input('Choose the second shape: ', 's');
                if any(strcmp(dist_second,shape_list))
                    secondShape = Myshapes.(dist_second);
                    dum_var2 = false;
                else
                    disp('*** User input for second shape is invalid. Try again.');
                end
            end
        else
            disp('*** User input for first shape is invalid. Try again.');
        end

    end
    %calculate the distance between the centers of firstShape and
    %secondShape using the formula: d = the square root of [(the first
    %element of firstShape's center minus the first element of
    %secondShape's center)squared plus (the second element of firstShape's
    %center minus the second element of secondShape's center)squared]
    dist_btw = sqrt(((firstShape.Center(1)-secondShape.Center(1))^2) +...
        ((firstShape.Center(2)-secondShape.Center(2))^2));
    %Display the distance (d) in the command window using three digits of
    %precision (decimal places) using formatSpec %.3f
    fprintf('The distance between the selected shapes is: %.3f\n', dist_btw);

    %same logic as distance calculation applies to area ratio calculation
    disp('==========================================================');
    disp('Now, select two shapes you want to know the area ratio of.')
    dum_var = true;
    dum_var2 = true;
    shape_list = fieldnames(Myshapes);
    while dum_var
        dist_first = input('Choose the first shape: ', 's');
        if any(strcmp(shape_list,dist_first))
            firstShape = Myshapes.(dist_first);
            dum_var = false;
            while dum_var2
                dist_second = input('Choose the second shape: ', 's');
                if any(strcmp(dist_second,shape_list))
                    secondShape = Myshapes.(dist_second);
                    dum_var2 = false;
                else
                    disp('*** User input for second shape is invalid. Try again.');
                end
            end
        else
            disp('*** User input for first shape is invalid. Try again.');
        end

    end
    %calculate the ratio of the areas of firstShape and secondShape, which
    %is area of the user's first shape choice divided by area of the user's
    %second shape choice
    ratio_area = firstShape.Area/secondShape.Area;
    %display the ratio of the areas to the user using three digits of
    %precision
    fprintf('The ratio of areas of the selected shapes is: %.3f\n', ratio_area);
end 