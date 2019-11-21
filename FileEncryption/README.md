# File Encryption

A script that takes an input text file, containing any message, and encrypt it, producing an output text file, containing the encrypted message.

1. Start by writing a sample message. Save this message as a text file. So, it should have a .txt extension.

2. Load that text file containing the sample message into MATLAB using the <code>importdata()</code> function. In MATLAB, the message should be a <i>n</i> × 1 cell array, where <i>n</i> is the number of lines in the original message.

3. Make the encryption key. Assign each character (numbers, uppercase letters, lowercase case letters, special characters like #) in the original message an encrypted character. An encrypted character can be any character, not just those that produce the original message. Do not forget to encrypt spaces.

The script handles all characters on a keyboard. There are 94.

Make the encryption key using excel. Put an index in the first column, put the 94 characters in the second column, then put the corresponding encrypted character in the third column.

4. Load the encryption key into MATLAB using the <code>xlsread()</code> function.

The <code>xlsread()</code> function is not that sophisticated because it cannot simultaneously bring in numbers and letters (or special characters) at once, so generate a cell array containing the number and special characters from the encryption key AND a matrix containing the numbers from the encryption key.

    Import the encryption key, creating the cell array and matrix by writing this:

    [num, str] = xlsread(strcat(parent_dir,'\',enc_name,end_ext));

    str is the cell array containing the number and special characters from the encryption key 
    num is the matrix containing the numbers from the encryption key

5. Combine  <code>num</code> and <code>str</code> into one cell array. The first column should be the index (1:94), the second column should be all of the possible original characters, and the third column should be the encrypting characters. There should be one encrypting character per original character.

6. For each line of the original sample message, search for each character in the second column of the encryption key. Once found, note the location of the corresponding encryption character, which should be the index. Develop a new cell array of the same size as the cell array containing the original sample message. Store the encryption characters in the new cell array as the script moves from one character to the next, one line to the next, in the original sample message.

7. Print the new cell array, containing the entire encrypted message, to a new text file. The encrypted message's format, specifically the number of characters/line and the number of lines, must match the original message's format.

Note: Use <code>'%s\r\n'</code> to skip to a new line when writing the encrypted message to file. The r stands for return.

Make sure to tell the user that the encrypted file has been written. Do this through the Command Window.
