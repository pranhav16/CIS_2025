% --- TODO: Problem 6 ---
        % 1. Input the optical pivot data and the `d_i` points from the calbody file.
        %
        % 2. Implement the logic for optical pivot calibration. This is more complex
        %    and will require you to:
        %      a. For each frame in the optical pivot data, use your `point_cloud_registration`
        %         function to find the transformation from the optical tracker markers to the sensor.
        %      b. Use these calculated transformations in your `pivot_calibration` logic.
        %
        % 3. Display the final optical pivot coordinates.
        % --------------------------

addpath('programs');


data_dir = '/Users/luiza/Documents/CIS I/CIS_2025/CISPA_Matlab/PA1 Student Data';
calbody_file = fullfile(data_dir, 'pa1-debug-b-calbody.txt');
optpivot_file = fullfile(data_dir, 'pa1-debug-b-optpivot.txt');

fprintf('Reading optical pivot and calbody data...\n');

% Read the known locations of markers on the EM base (d_i)
fid = fopen(calbody_file, 'r');
header_line = fgetl(fid);
header_data = sscanf(header_line, '%d,');
ND = header_data(1);
d = zeros(ND, 3);
for i = 1:ND
    line = fgetl(fid);
    d(i, :) = sscanf(line, '%f, %f, %f');
end
fclose(fid);

% Read the optical pivot data (D_k and H_k for each frame)
[D_frames, H_frames] = read_optpivot_data(optpivot_file);
Nframes = length(D_frames);

fprintf('...Data read successfully.\n');

% optical pivot calibration logic
fprintf('Performing optical pivot calibration...\n');

% This cell array will store the H points after being transformed into the EM frame
H_prime_frames = cell(1, Nframes);

% Loop through each frame
for k = 1:Nframes
    D_k = D_frames{k}; % EM base markers 
    H_k = H_frames{k}; % ptical probe markers

    % for each frame, find the transformation F_D[k] from the EM base to the optical tracker
    [R_Dk, t_Dk] = find_transformation(d, D_k);
    
    % transform H_k from the optical frame to the EM frame
    [R_Dk_inv, t_Dk_inv] = invert_transform(R_Dk, t_Dk);

    % apply the inverse transform to each point in H_k
    H_prime_k = (R_Dk_inv * H_k' + t_Dk_inv)';
    H_prime_frames{k} = H_prime_k;
end

% use the transformed points with the pivot_calibration logic
% H_prime_frames are now = to the G_frames from Problem 5
P_dimple_opt = pivot_calibration(H_prime_frames);

% display final coordinates
fprintf('\n--- Problem 6 Results ---\n');
fprintf('Calculated Optical Pivot Post Position (P_dimple):\n');
fprintf('  X: %.4f, Y: %.4f, Z: %.4f\n', P_dimple_opt(1), P_dimple_opt(2), P_dimple_opt(3));