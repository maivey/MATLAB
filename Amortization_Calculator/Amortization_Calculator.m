%{
    Morgan Ivey

    Revision History
    -----------------------
    Date: 07/05/2017
    Version:1, This program asks the user for four numbers- the purchase price, 
        percentage of the purchase price the user can afford as a down payment,
        loan term in years, and annual interest rate for the loan-
        then calculates the first 90% of an amortization schedule.
    Status:07/05/2017, Works 
%}

%Good practice
clc; clear all; close all;

%{
variables inputted by user: 
    pp = Purchase price; 
    perc = Percentage of the purchase price the user can afford as a down payment
    term = Loan term in years
    ir = Annual interest rate for the loan
    %}
prompt = 'Input the purchase price: ';           %asks user to input purchase price
pp = input(prompt);                              %assigns user input to variable pp
prompt = 'Input desired percentage of the purchase price for the downpayment,\nfor example, if it is 10%, enter 10: ';
perc = input (prompt);                           %assigns user input to variable perc
                                            
P = pp - ((perc/100) * pp);                      %calculates the Principle, assigns to variable P
formatSpec = 'The principal is $ %.2f\n';  
fprintf(formatSpec, P);                          %displays the Principle to the user in the command window

prompt = 'Input the annual interest rate, for example, if it is 4%, then\nenter 4: ';
ir = input(prompt);                              %assigns user input for interest rate to variable ir
prompt = 'Input the loan term in years: ';
term = input(prompt);                            %assigns user input for loan term to variable term

in = (ir / 12) / 100;                            %calculates annual interest rate; assigns to variable in
np = term * 12;                                  %calculates number of payments; assigns to variable np
mp = (in * P * (1 + in)^np)/((1+in)^np-1);       %calculates the monthly payment; assigns to varible mp
m1 = P * in;                                     %calculates the amount of interest paid for the first payment; 
                                                     %assigns to variable m1

disp('===============================');
formatSpec = 'The first payment is: [$] %.2f\n';
fprintf(formatSpec, mp);                         %displays the first month's payment (monthly payment) for the user          

formatSpec = 'The interest payment for the first month is: [$] %.2f\n';
fprintf(formatSpec, m1);                         %displays the first month's interest payment for the user
