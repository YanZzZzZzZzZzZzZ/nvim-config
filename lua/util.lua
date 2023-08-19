M = {}

M.table_contains = function(tbl, x)
  local found = false
  for _, v in pairs(tbl) do
    if v == x then
      found = true
    end
  end
  return found
end

M.scandir = function(directory)
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls -a "'..directory..'"')
  if (pfile ~= nil) then
    for filename in pfile:lines() do
      if (filename ~= "." and filename ~= "..") then
        i = i + 1
        t[i] = filename
      end
    end
    pfile:close()
    return t
  end
end

return M
