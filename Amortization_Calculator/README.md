# Amortization Calculator

A few terms applicable to loans or mortgages: The principal is the amount that is borrowed. The interest rate is what the lender (lessor) effectively charges the lessee (borrower) for the loan. Interest rate models can be quite complicated, however, a simple model we will use in this homework is an annual interest rate. The loan term is the amount of time the lessee will make payments to satisfy the note (loan).

Code that determines about the first 90% of an amortization schedule and this code can also serve as an amortization calculator.

- Asks a user for the following inputs:
	- Purchase price (_pp_)

	- Percentage of the purchase price the user can afford as a down payment (_perc_)

	- Loan term in years (_term_)

	- Annual interest rate for the loan (_ir_)
	
- Using the inputs, calculate and display the principal (_P_) to the user (i.e. on the Command Window).

	_P_ = _pp_ – [[(_perc_/ 100 )] * _pp_]

- Calculate the annual interest rate (_in_) and the number of payments (_np_).
	_in_ = (_ir_ / 12) / 100
	_np_ = _term_ * 12

- Calculate the monthly payment (mp).

	_mp_ = [_in_ * _P_ * (1 + _in_)<sup>_np_</sup>] / [( 1 + _in_)<sup>_np_</sup> – 1]


- As a first step to filling in the amortization schedule, calculate the amount of interest paid for the first payment (_m1_).

	_m1_ = _P_ * _in_
	
- Display the monthly payment and the first month’s interest payment for the user.
