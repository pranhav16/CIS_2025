function M = read_block(fid, N)
  M = zeros(N,3);
  i = 1;
  while i <= N
    ln = fgetl(fid);
    if ~ischar(ln), error('Unexpected EOF'); end
    % skip blank lines
    if all(isspace(ln)), continue; end
    % grab first three numeric tokens on the line
    toks = regexp(ln, '[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?', 'match');
    if numel(toks) >= 3
      M(i,:) = str2double(toks(1:3));
      i = i + 1;
    end
  end
end