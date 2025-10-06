function pa1(mode, letter_index)
    % pa1.m
    %
    % Created on: Sep 23, 2025
    % Author: Luiza Brunelli, Pranhav Sundararajan
    %
    % Main function for Programming Assignment 1.
    % To run a specific problem, call this function from the MATLAB command window
    % with the data mode (either debug or unknown) and letter index (a through k)
    %
    % Example:
    %   pa1('debug', 'a')
    %   pa1('unknown', 'h')
    %
    % Both debug and unknowns will produce the same output files. I am including debug vs. unknown
    % as separate cases as you may want to have additional error evaluation between expected output and
    % result of your functions to publish in the pa1 report. In this template, they will look the same.
    %
    % In the case of the unknown data, there is not output data for you to compare to.
    %
    % IMPORTANT: Do not write all your code in this single file.
    % Your implementation should be modular. Create separate, reusable functions
    % in their own .m files within the 'programs' directory. For example:
    % - read_cal_data.m
    % - point_cloud_registration.m
    % - pivot_calibration.m
    % - write_output.m
    % You are welcome to organize these functions into sub-directories 
    % (e.g. put all read data functions in a new sub directory 'data')

    % Add any extra directories to the MATLAB path
    addpath('problems');  % Add the problems subfolder
    addpath('programs/problems');
    % you can add any more directories you make here

    % Check if an argument was provided
    if nargin < 2
        error("Please provide the problem to solve as an argument. Example: pa1('debug', 'a')");
    end

    % Validate and normalize arguments
    if ~ischar(mode) && ~isstring(mode)
        error("Mode must be a string or character array. Expected 'debug' or 'unknown'.");
    end
    if ~ischar(letter_index) && ~isstring(letter_index)
        error("Letter index must be a string or character array. Expected a single letter 'a' through 'k'.");
    end

    % Convert to lowercase and ensure it's a char array
    mode = lower(char(mode));
    letter_index = lower(char(letter_index));

    % Check if inputs are valid
    if ~ismember(mode, {'debug', 'unknown'})
        error("Mode must be either 'debug' or 'unknown'. Got: '%s'", mode);
    end
    if letter_index < 'a' || letter_index > 'k'
        error("Letter index must be between 'a' and 'k'. Got: '%s'", letter_index);
    end

    % Check if letter_index is a single character
    if length(letter_index) ~= 1
        error("Letter index must be a single character. Got: '%s'", letter_index);
    end

    % Check mode-specific letter constraints
    if strcmp(mode, 'debug')
        if letter_index < 'a' || letter_index > 'g'
            error("Debug mode only supports letters 'a' through 'g'. Got: '%s'", letter_index);
        end
    elseif strcmp(mode, 'unknown')
        if letter_index < 'h' || letter_index > 'k'
            error("Unknown mode only supports letters 'h' through 'k'. Got: '%s'", letter_index);
        end
    end

    % --- Data File Paths ---
    data_dir = '../PA1 Student Data/';
    output_dir = '../output/';

    % Create output directory if it doesn't exist
    if ~exist(output_dir, 'dir')
    mkdir(output_dir);
    end

    % --- Main Problem-Solving Logic ---
    fprintf('Running solution for %s %c...\n', mode, letter_index);

    % --- TODO: read data files --
    % I would recommend reading all of the cal data files once and saving all the data 
    % to arrays etc so that you don't have to keep opening and closing files with each problem part.
    calbody_name = sprintf('pa1-%s-%c-calbody.txt', mode, letter_index);
    calreadings_name = sprintf('pa1-%s-%c-calreadings.txt', mode, letter_index);
    calbody_file = fullfile(data_dir, calbody_name);
    calreadings_file = fullfile(data_dir, calreadings_name);

    empivot_name = sprintf('pa1-%s-%c-empivot.txt', mode, letter_index);
    empivot_file = fullfile(data_dir, empivot_name);

    optpivot_name = sprintf('pa1-%s-%c-optpivot.txt', mode, letter_index);
    optpivot_file = fullfile(data_dir, optpivot_name);
    % Write function(s) to read the data files and save the data for access later in the problems

    % NOTE: the functions are not written, so you will have to design the inputs and outputs
    % For debugging, it may use useful to display/print these intermediary steps

    % -- TODO: Problem 4a --
    % Call function problem4a.m
    % Output frame F_A and anything else necessary
    % See file problem4a.m for further details
    % ------------

    % --- TODO: Problem 4b ---
    % Call function problem4b.m
    % Output frame F_D and anything else necessary
    % See file problem4b.m for further details
    % --------------------------

    % --- TODO: Problem 4d ---
    % Call function problem4d.m
    % Output C_expected
    % see file problem4d.m for further details
    % --------------------------

    % --- TODO: Problem 5 ---
    % Call function problem5.m
    % implement logic for EM pivot calibration
    % Output final EM post coordinates Px, Py, Pz
    % see file problem5.m for further details
    % --------------------------

    % --- TODO: Problem 6 ---
    % Call function problem6.m
    % implement logic for optical pivot calibration
    % Output final optical post coordinates Px, Py, Pz
    % see file problem6.m for further details
    % --------------------------

    % -- TODO: Output ---
    % Defining output file name and location to generate
    output_name = sprintf('pa1-%s-%c-output-1.txt', mode, letter_index);
    output_file = fullfile(output_dir, output_name);
    % Write file header, EM post position, optical post position, and C_expected to output_file. 
    % You can make this a function that you call (ie. write_output.m)
    % ---------------------------

    switch mode
        case 'debug'
            % -- OPTIONAL: error analysis ----
            % Write any functions etc to perform error analysis for the report. 
            % These may want to reference the following file in PA1 Student Data: 
            debug_output_name = sprintf('pa1-%s-%c-output1.txt', mode, letter_index);
            debug_output_file = fullfile(data_dir, debug_output_name);

            % The auxilliary data file shows example/expected deviations between actual and estimated 
            % --------------------------------
        case 'unknown'
            % you can put any functions needed (if any) for organizing data etc for the report.
        otherwise
            
    end

end