# Amortization Calculator

A few terms applicable to loans or mortgages: The principal is the amount that is borrowed. The interest rate is what the lender (lessor) effectively charges the lessee (borrower) for the loan. Interest rate models can be quite complicated, however, a simple model we will use in this homework is an annual interest rate. The loan term is the amount of time the lessee will make payments to satisfy the note (loan).

Code that determines about the first 90% of an amortization schedule and this code can also serve as an amortization calculator.

- Asks a user for the following inputs:
	- Purchase price (_pp_)

	- Percentage of the purchase price the user can afford as a down payment (_perc_)

	- Loan term in years (_term_)

	- Annual interest rate for the loan (_ir_)
	
- Using the inputs, calculate and display the principal (_P_) to the user (i.e. on the Command Window).
	
	<img src="https://latex.codecogs.com/gif.latex?P&space;=&space;pp&space;-&space;(\frac{perc}{100}&space;\ast&space;pp)" title="P = pp - (\frac{perc}{100} \ast pp)" />

- Calculate the annual interest rate (_in_) and the number of payments (_np_).

	<img src="https://latex.codecogs.com/gif.latex?in&space;=&space;\frac{\frac{ir}{12}}{100}" title="in = \frac{\frac{ir}{12}}{100}" />
	<br/><br/>
	
	<img src="https://latex.codecogs.com/gif.latex?np&space;=&space;term&space;\ast&space;12" title="np = term \ast 12" />

- Calculate the monthly payment (mp).

	<img src="https://latex.codecogs.com/gif.latex?mp&space;=&space;\frac{in&space;\ast&space;P&space;\ast&space;(1&plus;in)^np}{(1&plus;in)^{np}&space;-1}" title="mp = \frac{in \ast P \ast (1+in)^np}{(1+in)^{np} -1}" />


- As a first step to filling in the amortization schedule, calculate the amount of interest paid for the first payment (_m1_).

	<img src="https://latex.codecogs.com/gif.latex?m1&space;=&space;P&space;\ast&space;in" title="m1 = P \ast in" />
	
- Display the monthly payment and the first month’s interest payment for the user.
