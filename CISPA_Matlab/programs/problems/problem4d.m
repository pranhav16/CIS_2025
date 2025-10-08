function [C_expected] = problem4d(calbody_path, calreadings_path)
    thisDir = fileparts(mfilename('fullpath'));
    % Two levels up
    parent2 = fileparts(fileparts(thisDir));
    %data_dir = '/Users/luiza/Documents/CIS I/CIS_2025/CISPA_Matlab/PA1 Student Data';
    addpath(genpath(parent2));

% Read models
  [d, a, c] = read_calbody(calbody_path);   % Nd×3 (EM-base model LEDs)
  % Read per-frame readings
  [Dcells, Acells, ~] = read_calreadings(calreadings_path); % D[k] are Nd×3 in optical frame
  Nf = numel(Dcells);
  if(~(Nf == numel(Acells)))
      error('D and A do not have the same number of frames');
  end
  F_D = cell(1,Nf); 
  F_A = cell(1,Nf);
  C_expected = cell(1,Nf);
  for k = 1:Nf
    Dk = Dcells{k};            % optical-tracker coords (observed)
    Ak = Acells{k};
    [R_dk, t_dk] = find_transformation(d, Dk);   % map Dk -> d
    [R_ak, t_ak] = find_transformation(a, Ak);   % map Dk -> d
    F_D{k} = eye(4);
    F_A{k} = eye(4);

    F_D{k}(1:3,1:3) = R_dk;
    F_D{k}(1:3,4)   = t_dk;
    F_A{k}(1:3,1:3) = R_ak;
    F_A{k}(1:3,4)   = t_ak;
  end

  for i = 1:Nf
        F_D_inv = [transpose(F_D{i}(1:3,1:3)),-1.*transpose(F_D{i}(1:3,1:3))*F_D{i}(1:3,4);0,0,0,1];
        T = [F_D_inv(1:3,1:3)*F_A{i}(1:3,1:3), F_D_inv(1:3,1:3)*F_A{i}(1:3,4) + F_D_inv(1:3,4); 0,0,0,1];

    for j = 1:size(c,1)
        
        C_e = transpose(T * transpose([c(j,:),1]));
        C_expected{i} = [C_expected{i};C_e];
    end
  end
end
