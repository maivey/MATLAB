# Income Tax Calculator

This is a script that calculates the amount of income tax you owe. This script will take into account the gross income, and determine which tax percentage you fall under in order to determine how much income tax you owe.

        The following tax percentages will be used:

        Annual income from $0 - $9,999 is taxed at 10% 
        Annual income from $10,000 - $99,999 is taxed at 15%
        Annual income from $100,000- $499,999 is taxed at 25% 
        Annual income from $500,000 - $999,999 is taxed at 28%
        Income over $999,999 is taxed at 39.6%
---
### Part 1: Set-up arrays

- Establish an array with 4 values to hold the maximum income for each tax percentage. They are:
    - $9,999
    - $99,999 which is $99,999 - $9,999 
    - $499,999 which is $499,999 - $99,999 
    - $999,999 which is $999,999 - $499,999

- Create a 5 element array to hold the tax percentages. They are:
    - 0.1 which is 10%
    - 0.15 which is 15%
    - 0.25 which is 25%
    - 0.28 which is 28%
    - 0.396 which is 39.6%

### Part 2: Get the user's input:
- Prompt the user for their annual salary. Store this value in a vector.

### Part 3: Display the annual income.
- Display the annual income in the command window. 

### Part 4: Determine the annual income tax.
- Cycle through each of the tax brackets to determine how much the user owes.

- Example: If the user's annual income was $45,000, then they should be taxed the following:
        $45,000 × 0.15 = $6750
- Display the annual income tax in the command window too.
