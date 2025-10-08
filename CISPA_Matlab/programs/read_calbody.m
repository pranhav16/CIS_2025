function [d, a, c] = read_calbody(path)
  fid = fopen(path,'r');  assert(fid>0, 'Cannot open %s', path);
  header = fgetl(fid);
  nums = sscanf(header, '%d , %d , %d');  % Nd, Na, Nc (ignore trailing filename)
  if numel(nums) < 3
    nums = sscanf(regexprep(header,'[^\d,]',''),'%d,%d,%d');
  end
  Nd = nums(1); Na = nums(2); Nc = nums(3);
  d = read_block(fid, Nd);
  a = read_block(fid, Na);
  c = read_block(fid, Nc);
  fclose(fid);
end