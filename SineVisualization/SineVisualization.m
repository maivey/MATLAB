function sinvis(numPeriods)
%SINVIS function visualizes the sine function using a unit circle in an
%animated plot
%input numPeroids: represents the number of periods over which to
%visualize the sine function.

%{
    Morgan Ivey

    Revision History
    -----------------------
    Date: 08/4/2017

    Version 1: this script is a function file that creates an animated plot
    that shows how the sine function traces using the unit circle. It plots
    an initial plot with a circle, a line from the center of the circle to
    the edge of the circle, a single point at the center of the circle that
    will move up and down, parallel to the intersection point of the radial
    line and the circle, a horizontal line that will be drawn from the
    single point to the intersection of the radial line and the circle, and
    finally, the graph of the sine function

    Focus:Animated Plotting

    Status:08/4/2017, Works
%}

%Check to make sure the input is a positive, scalar, integer value. if not,
%throw an error
if nargin == 1
    if numPeriods<0
        error('Input must be positive');
    elseif ~(isscalar(numPeriods))
        error('Input must be a scalar');
    elseif (round(numPeriods)==numPeriods)==0
        error('Input must be an integer');
    end
else
    error('Too few or too many arguments');
end


%Draw a Circle:
%Create a vector (my_ang) of 1000 linearly spaced angle values from 0 to 2pi
my_ang = linspace(0,2*pi,1000);
%calculate the x values using the entire angle vector using x=r*cos(my_ang)
%r=1 since it is the unit circle
x_val = cos(my_ang);
%calculate the y values using the entire angle vector using y=r*sin(my_ang)
%r=1 since it is the unit circle
y_val = sin(my_ang);
%hold on command to keep the circle on the figure
hold on;
%grid on to create grid on the figure
grid on;
%create plot handle for circle (plotCircle) and plot the x and y values
%calculated above (x_val and y_val), 'g' for a green line
plotCircle = plot(x_val,y_val, 'g');


%Draw Sine:
%Create a vector of values that starts at 0 and ends at 2pi×(the functions
%input). This represents the total range over which the plot will be
%animated(the range being the X values)
x_range = linspace(0,2*pi*numPeriods,1000);
%calculate the Y values, the second vector of values that takes the sine of
%each value in the first vector (x_range)
my_sin = sin(x_range);

%Plot the FIRST point of each vector (x_range(1) and my_sin(1)). Create a
%plot handle (plotSin) specific to the sine function. 'm' is for a magenta
%line
plotSin = plot(x_range(1), my_sin(1),'m');


%Draw Radial Line:
%Create a 2 element vector of X values where the 1st element is the X
%location of the circles center, and the 2nd element is 1st element in the
%vector x_range
x_radline = [0, x_range(1)];
%Create a 2 element vector of Y values where the 1st element is the Y
%location of the circles center, and the 2nd element is the first element
%in the vector my_sin
y_radline = [0, my_sin(1)];
%Plot these 2 vectors using plot() and create a plot handle (plotRadline)
%specific to the radial line. 'k' is for a black like
plotRadline = plot(x_radline,y_radline, 'k');

%Draw Horizontal Line:
%Create a 2 element vector of X values where the 1st element is the X
%location of the circles center, and the 2nd element is the 1st element in
%the vector in x_range
x_horiz = [0, x_range(1)];
%Create a 2 element vector of Y values where both elements are the 1st
%element in the vector my_sin
y_horiz = [my_sin(1), my_sin(1)];
%Plot these 2 vectors (and x_horiz and y_horiz) and create a plot handle
%(plotHoriz) specific to the horizontal line. 'r--' for red dashed line
plotHoriz = plot(x_horiz,y_horiz, 'r--');

%Draw Point:
%Plot a single point with an X value equal to X value of the center of the
%circle, and a Y value equal to the 1st element in the vector my_sin
my_point = [0, my_sin(1)];
%Create a plot handle (plotPoint) specific to the point. plot the 1st point
%by using the 1st and 2nd elements of my_point created above. use '*' for a
%star marker.
plotPoint = plot(my_point(1),my_point(2), '*');

%set axis to be sqaure to axis lines with equal lengths and adjust the
%increments between data units accordingly
axis square;
%set axis to be [-2 2 -2 2] (xmin,xmax=-2,2; ymin,ymax=-2,2)
axis([-2 2 -2 2]);
%Label the axes using xlabel() and ylabel(), use {} and seperate by comma
%to have parts of the label on seperate lines
xlabel({'Angle', '[Radians]'});
ylabel({'Sin(Angle)', '[Radians]'});
%provide a title using title()
title('Sine Visualization');

%create  for loop that executes the same number of times as the number of
%elements of the vector x_range, which is length of x_range
for i = 1:length(x_range)
    %calculate the new x values, take the cosine of each value in x_range
    x_new = cos(x_range);
    
    %set the XData for the circle, which is the x_val created initially
    %plus x_range(i), so that it shifts to the right each time the loop
    %executes. use set() and the plot handle specific to the circle
    %(plotCircle)
    set(plotCircle, 'XData', x_val + x_range(i));
    
    %Set the XData (the vector x_range) for the sine plot. The sine plot
    %increases in the # of data points plotted every time the loop runs.
    %set index from 1:i so it plots the  entire sine wave from the 1st
    %point to the last (increases every time the loop runs)
    set(plotSin, 'XData', x_range(1:i));
    %Set the YData(vector my_sin) for the sine plot. The sine plot
    %increases in the number of data points plotted every time the loop
    %runs (so set index to 1:i)
    set(plotSin, 'YData', my_sin(1:i));
    
    %calulate new vectors for the radial lines. add each x_range value to
    %the center of the circle (0) and to  each new cosine value (x_new)
    %for the x line (shifting to the right) for the x radial line
    x_radline1 = [0, x_new(i)]+x_range(i);
    %the new y radial line is a vector from 0 to sin of each index
    y_radline1 = [0, my_sin(i)];
    %Set the XData and YData for the radial line
    set(plotRadline, 'XData', x_radline1);
    set(plotRadline, 'YData', y_radline1);
    
    %calulate new vectors for the radial lines. add each x_range value to
    %the center of the circle (0) and to  each new cosine value (x_new)
    %for the x line (shifting to the right).
    x_horiz1 = [0, x_new(i)]+x_range(i);
    %the y radial line is the sine of each index
    y_horiz1 = [my_sin(i), my_sin(i)];
    %Set the XData and YData for the horizontal line
    set(plotHoriz, 'XData', x_horiz1);
    set(plotHoriz, 'YData', y_horiz1);
    
    %Set the XData and YData for the point. The new x-value of the point
    %shifts by x_range each time the loop runs. the y-value of the point is
    %the sine each x_range value.
    set(plotPoint, 'XData', x_range(i));
    set(plotPoint, 'YData', my_sin(i));
    
    %Call the drawnow function to redraw the plot
    drawnow;
    %Change the values of the axis to shift to the right the same distance
    %as the circle was shifted. (add x_range to the xMin and xMax values of
    %the axis each time the loop runs
    axis([-2+ x_range(i) 2+x_range(i) -2 2]);
end
hold off;
end