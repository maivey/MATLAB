%{
Morgan Ivey

Revision History
-----------------------
Date: 07/19/2017

Version 1: this script takes an input text file, containing a message,
encrypts it, then produces an output text file, containing the encrypted
message

Focus:File I/O, for loops

Status:07/19/2017, Works
%}

%Good practice:

clear all; close all; clc;

%assign parent_dir to the location of where all the files are stores to
%import and export throughout the rest of the script
parent_dir = '.../Files/';
%set current directory to parent_dir
cd(parent_dir)

%name the file name (orig_f_name) and file extention (orig_f_ext) of the original text
orig_f_name = 'original_message';
orig_f_ext = '.txt';
%load the data from the text file containing the sample message into MATLAB 
%using the importdata() function.
%Concatenate the parent_dir, '/', the name of the file(orig_f_name), and the extension
%of the file(orig_f_ext) so the data loads as a cell array
orig_message = importdata(strcat(parent_dir,orig_f_name,orig_f_ext)); 


%set variable enc_name equal to the name of the excel file
enc_name = 'enc_key';
%set enc_ext equal to .xlsx since it is an excel file
enc_ext = '.xlsx';
%Load the encryption key into MATLAB using the xlsread() function.
%Concatenate the parent_dir, '/', the name of the file(enc_name), and the extension
%of the file(enc_ext)
%str is the cell array containing the letters and special characters from 
   %the encryption key
%num is the matrix containing the numbers from the encryption key and
%alldata is a cell array of all data in the spreadsheet
[num, str, alldata] = xlsread(strcat(parent_dir,'/',enc_name,enc_ext));

%go through all 95 of the second and third columns to determine if they are
%numbers. If they are, convert them to strings, to be able to compare them
%to each character of the original message
for i = 1:length(alldata(:,1)) 
    if isnumeric(alldata{i,2})
        alldata{i,2} = num2str(alldata{i,2});
    end
    if isnumeric(alldata{i,3})
        alldata{i,3} = num2str(alldata{i,3});
    end
end

%create cell enc_message the same size as the original message orig_lines
enc_message = cell(size(orig_message));
%for loop to loop j from 1 to the number of rows in original message
for j = 1:length(orig_message) %i = number of rows
    %nested for loop to loop i from 1 to the length of the number of characters
    %in original message for each row line (j)
     for i = 1:length(orig_message{j}) %j = number of characters in each row
         %nested for loop to loop k from length of number of characters in 
         %2nd column of alldata (the encryption key)
         for k = 1:length(alldata(:,2))
             %use if statement, comparing each character in each line of the original message,
             %to each character in the the second collumn of the encryption key 
             %if they are equal, then set index to be the corresponding index in the
             %first column of the encryption key.
             %Then set each character of each line of the encrypted message 
             %equal to the corresponding encrypted character in the third collumn of
             %the encryption key
             if orig_message{j}(i) == alldata{k,2}
                 index = alldata{k,1};
                 enc_message{j}(i) = alldata{index,3}; 
             end
         end
     end
end


%use fopen to create the file "enc_text.txt" and open as 'w', meaning it
%is available to write to
enc_text = fopen('enc_text.txt', 'w');
%Write from enc_message created above to the new text file enc_text
%by using fprintf for each line
%%format spec is '%s\r\n' to skip to a new line when writing the encrypted message to file.
%The \r stands for return
for i = 1:length(enc_message)
    fprintf(enc_text, '%s\r\n', enc_message{i,1});
end
%close the file enc_text using fclose
fclose(enc_text);

%Display that it is done writing encrypted file
disp('Done writing the encrypted file.');
