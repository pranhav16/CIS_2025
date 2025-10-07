function [F_D] = problem4a(calbody_path, calreadings_path)
  % Read models
  [d, ~, ~] = read_calbody(calbody_path);   % Nd×3 (EM-base model LEDs)
  % Read per-frame readings
  [Dcells, Acells, ~] = read_calreadings(calreadings_path); % D[k] are Nd×3 in optical frame
  Nf = numel(Dcells);
  if(~(Nf == numel(Acells)))
      error('D and A do not have the same number of frames');
  end
  F_D = cell(1,Nf); 

  for k = 1:Nf
    Dk = Dcells{k};            % optical-tracker coords (observed)
    
    [R_dk, t_dk] = find_transformation(d, Dk);   % map Dk -> d
       % map Dk -> d
    F_D{k} = eye(4);
    

    F_D{k}(1:3,1:3) = R_dk;
    F_D{k}(1:3,4)   = t_dk;

  end
disp(F_D);
end
