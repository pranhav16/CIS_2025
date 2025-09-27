 % --- TODO: Problem 5 ---
        % 1. Implement a function `read_pivot_data.m` to parse the EM pivot data. This will involve reading multiple
        %    frames of data.
        %
        % 2. Implement a function `pivot_calibration.m` that takes the pivot data
        %    and calculates the pivot point `p_em` by solving a system of linear equations.
        %
        % 3. Call your functions and display the final pivot coordinates.
        % --------------------------


% IMPORTANT: Update this path to where your data files are located.
% For example: '../PA1 Student Data/pa1-debug-a-empivot.txt'
data_dir = '/Users/luiza/Documents/CIS I/CIS_2025/CISPA_Matlab/PA1 Student Data'; % Assumes data is in a folder next to your project folder
file_name = 'pa1-debug-a-empivot.txt';
empivot_file = fullfile(data_dir, file_name);


% 1. Add your programs directory to the path if you haven't already
addpath('programs');

% 2. Read the pivot data from the file
fprintf('Reading EM pivot data from %s...\n', empivot_file);
G_frames = read_pivot_data(empivot_file);
fprintf('...Data for %d frames read successfully.\n', length(G_frames));

% 3. Call your pivot calibration function to get the dimple position
fprintf('Performing pivot calibration...\n');
P_dimple_em = pivot_calibration(G_frames);

% 4. Display the final EM post coordinates
fprintf('\n--- Problem 5 Results ---\n');
fprintf('Calculated EM Pivot Post Position (P_dimple):\n');
fprintf('  X: %.4f, Y: %.4f, Z: %.4f\n', P_dimple_em(1), P_dimple_em(2), P_dimple_em(3));