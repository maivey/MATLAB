%{
    Morgan Ivey

        Revision History
        -----------------------
        Date: 07/06/2017
        Version:1, This program asks the user for their annual income, then
                    calculates their income tax according to which tax 
                     percentage they fall into.
        Status:07/06/2017, Works 
                                    %}

%Good practice:
clc; clear all; close all;

%Create array with 4 values to hold the maximum income for each tax percentage
max_inc = [9999, 99999, 499999, 999999];
%Create a 5 element array to hold the tax percentages
tax_perc = [.1, .15, .25, .28, .396];            

%Prompt the user for their annual salary and assign the user's 
%input to variable inc
prompt = 'Input your annual salary: ';
inc = input(prompt);                                

%if user enters a negative value for income, tell them to enter a 
%positive integer value. Then, prompt the user again and store the new 
%value to variable inc to run the rest of the program
if inc < 0
    disp('Please enter a positive integer value for income');
    prompt = 'Input your annual salary: ';
    inc = input(prompt);
end

%Cycle through each of the tax brackets to determine how much the user owes
%using if elseif statements

%Determine if income is less than $9,999 using the first element 
%of the array max_inc
if(inc <= max_inc(1))
    %Calculate tax using the 1st element of the array tax_perc (10%)
    tax = inc .* tax_perc(1);
%Determine if income is between $10,000 - $99,999 using the 
%corresponding elements of array max_inc
elseif((inc > max_inc(1)) && (inc <= max_inc(2)))
    %Calculate tax using the 2nd element of the array tax_perc (15%)
    tax = inc .* tax_perc(2);
%Determine if income is between $100,000- $499,999
elseif((inc > max_inc(2)) && (inc <= max_inc(3)))
    %Calculate tax using the 3rd element of the array tax_perc (25%)
    tax = inc .* tax_perc(3);
%Determine if income is between $500,000 - $999,999
elseif((inc > max_inc(3)) && (inc <= max_inc(4)))
    %Calculate tax using the 4rd element of the array tax_perc (28%)
    tax = inc .* tax_perc(4);
%Determine if income is over $999,999
elseif(inc > max_inc(4)) 
    %Calculate tax using the 5th element of the array tax_perc (39.6%) 
    tax = inc .* tax_perc(5);
end

%Display the user's annual income in the command window
disp('======================================');
fprintf('Your annual income is [$]: %.0f\n', inc);
%Display the annual income tax in the command window
fprintf('Your annual income tax is [$]: %.0f\n', tax);  