%% This file is where pa1.m will be used to solve PA1.
% It will write to the output directory in the directory above where this
% file is located. Simply run this script and the appropriate output file
% will be placed there. Change mode and letter_index to run the algorithm
% and calculate the output based on the input file you want  to use.

%For this to work properly, folder named PA1 Student Data must be placed at
%the same level as the programs directory and must contain the input text
%files.

mode = 'debug'; %debug or unknown


letter_index = 'a'; %a-g for debug and h-k for unknown

pa1(mode, letter_index);