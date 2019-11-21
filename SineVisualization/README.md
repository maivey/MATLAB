# Sine Visualization
### Introduction
This script will visualize the sine function using a circle in an animated plot. The sine visualization using a circle is shown in following link: https://www.youtube.com/watch?v=xaDDm5MSe4k
This script programs an animated plot using the same principles.

The principles of the sine visualization are as follows:

1. Make a circle

2. Draw a horizontal line from the center of the circle, extending to the right, to the edge of the circle

3. Rotate the line in Step 2 about the center of the circle, this creates an angle

4. Trace the point on the circle where the line and the circle intersect

This script plots an initial plot with a circle, a line from the center of the circle to the edge of the circle, a single point at the center of the circle that will move up and down, parallel to the intersection point of the radial line and the circle, a horizontal line that will be drawn from the single point to the intersection of the radial line and the circle, and finally, the graph of the sine function

To visualize this, create a function file called sinvis() which takes in a single input and returns no output.

---

### Part 1: sinvis() Function
1. Create a function called sinvis() which takes in a single input and returns no output

2. Check to make sure the input is a positive, scalar, integer value

    a. If it is not, then throw an error

    b. This input represents the number of periods over which to visualize the sine function. This becomes useful later.

### Part 2: Draw a circle 
Inside of the sinvis() function, create 5 different plots and animate all 5 plots. The first plot to create is a circle. To draw a circle, we will make use of the polar coordinate system. It’s a very simple system that allows us to draw circles.

Normally, we draw plots using an X and Y coordinate system (known as the Cartesian coordinate system). It specifies an X distance from the origin and a Y distance from the origin. Using these two values, we can plot a single point. The polar coordinate system uses an angle and a radius value to plot a single point. The angle is measured from the +X axis and runs counter-clockwise through the 4 quadrants. The radius is the distance measured from the origin. To convert from polar coordinates to Cartesian coordinates, we look at the following diagram (Fig. 1):

![alt text](https://d2jmvrsizmvf4x.cloudfront.net/xvxH5qh7TNyCvMXMBiYu_image002.gif)

The X and Y values are given as:<br>
      <img src="https://latex.codecogs.com/gif.latex?X&space;=&space;i\cos&space;\theta" title="X = i\cos \theta" /><br>
      <img src="https://latex.codecogs.com/gif.latex?Y&space;=&space;i\sin&space;\theta" title="Y = i\sin \theta" /><br>
Since we are using the unit circle, the radius value (r) is 1.
1. Create a vector of angle values from 0 to 360 degrees (or 2π)

    - The more elements in the vector, the smoother the circle will look

2. Calculate the X and Y values using the angle vector and the equations above

3. Plot the circle using the ENTIRE X and Y vector and create a plot handle specific to the circle

### Part 3: Draw Sine
1. Create a vector of values that starts at 0 and ends at 360×(<i>the function’s input</i>). This represents the total range over which we will be animating our plot (the range being the X values)

    - The more elements in your vector, the smoother the curve will look. Use ~1000

2. Create a second vector of values that takes the sine of each value in the first vector

3. Plot the FIRST point of each vector and create a plot handle specific to the sine function

### Part 4: Draw Radial Line
1. Create a two element vector of X values where the first element is the X location of the circle’s center, and the second element is first element in the vector created in Part 3 Step 1.

2. Create a two element vector of Y values where the first element is the Y location of the circle’s center, and the second element is the first element in the vector created in Part 3 Step 2.

3. Plot these two vectors and create a plot handle specific to the radial line

### Part 5: Draw Horizontal Line
1. Create a two element vector of X values where the first element is the X location of the circle’s center, and the second element is the first element in the vector created in Part 3 Step 1.

2. Create a two element vector of Y values where both elements are the first element in the vector created in Part 3 Step 2.

3. Plot these two vectors and create a plot handle specific to the horizontal line

### Part 6: Draw Point
1. Plot a single point with an X value equal to X value of the center of the circle, and a Y value equal to the first element in the vector created in Part 3 Step 2. Be sure to add a marker, and specify no lines. Create a plot handle specific to the point

### Part 7: Animate the Plot
After plotting the initial plots, set the axis to be [-2 2 -2 2]. Label the axes, and provide a title.
The animation for the plot does the following:

1. Shift the axis boundaries

2. Plot the circle centered in the plot

3. Plot the sine series

4. Plot the radial line

5. Plot the horizontal line

6. Plot the point

To accomplish this, do the following in a for loop that executes the same number of times as the number of elements of the vector created in Part 3 Step 1:
1. Calculate the NEW X values for the circle. We will be shifting the circle over to the right. The center is originally at (0,0), which is the first element in the vectors created in Part 3 Steps 1-2. The new center is now shifted over one element so that it is now the SECOND element (or third, or fourth…). But we do not shift the Y location. Only the X location.

2. Set the XData for the circle plot. We will not need to set the YData because the YData did not change.

3. Set the XData for the sine plot. The sine plot increases in the number of data points plotted every time the loop runs. The XData is given by the vector created in Part 3 Step 1

4. Set the YData for the sine plot. The sine plot increases in the number of data points plotted every time the loop runs. The YData is given by the vector created in Part 3 Step 2

5. Calculate the new vectors for the radial line. Don’t forget that the center point of the circle has shifted in the X direction.

6. Set the XData and YData for the radial line.

7. Calculate the new vectors for the horizontal line. Don’t forget that the center point of the circle has shifted in the X direction.

8. Set the XData and YData for the horizontal line.

9. Set the XData and YData for the point.

10. Call the drawnow function to redraw the plot

11. Change the values of the axis to shift to the right the same distance as the circle was shifted.
