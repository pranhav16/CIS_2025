% programs/pivot_calibration.m

function [P_dimple] = pivot_calibration(G_frames)
    % Performs pivot calibration to find the dimple post location.
    
    Nframes = length(G_frames);

    % Step 5.a: Define the local probe coordinate system using the first frame
    G_first_frame = G_frames{1}; % This is an NG x 3 matrix
    G0 = mean(G_first_frame, 1); % Centroid of the first frame
    g = G_first_frame - G0; % Local marker positions (NG x 3)

    % Initialize storage for rotations and translations from each frame
    rotations = cell(1, Nframes);
    translations = cell(1, Nframes);

    % Step 5.b: For each frame, compute the transformation F_G[k]
    for k = 1:Nframes
        G_k = G_frames{k}; % Get the data for the k-th frame (NG x 3)
        
        % Use your partner's find_transformation function.
        % It expects Nx3 inputs, which matches our format.
        [R, p] = find_transformation(g, G_k);
        
        rotations{k} = R;
        translations{k} = p;
    end

    % Step 5.c: Set up and solve the system of linear equations
    % The equation is P_dimple = R_k * t_G + p_k.
    % Rearranged: R_k * t_G - P_dimple = -p_k
    
    A = zeros(3 * Nframes, 6);
    b = zeros(3 * Nframes, 1);
    identity_neg = -eye(3);

    for k = 1:Nframes
        R_k = rotations{k};
        p_k = translations{k};
        
        start_row = 3 * (k - 1) + 1;
        
        % Populate A with [R_k, -I]
        A(start_row:start_row+2, 1:3) = R_k;
        A(start_row:start_row+2, 4:6) = identity_neg;

        % Populate b with -p_k
        b(start_row:start_row+2) = -p_k;
    end

    % Solve Ax = b for x = [t_G; P_dimple]
    x = A \ b;

    % The final answer, P_dimple, is the last 3 elements of x.
    P_dimple = x(4:6);
end