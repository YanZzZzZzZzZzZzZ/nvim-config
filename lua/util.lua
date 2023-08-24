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
  local pfile = popen('ls -a "' .. directory .. '"')
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

M.jump_end_bracket = function()
  local closers = {
    ")",
    "]",
    "}",
    ">",
    "'",
    '"',
    "`",
    ",",
    "(",
    "{",
    "[",
    "<",
  }
  local line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local after = line:sub(col + 1, -1)
  local closer_col = #after + 1
  local closer_i = nil
  for i, closer in ipairs(closers) do
    local cur_index, _ = after:find("%" .. closer)
    if cur_index and (cur_index < closer_col) then
      closer_col = cur_index
      closer_i = i
    end
  end
  if closer_i then
    vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
  else
    vim.api.nvim_win_set_cursor(0, { row, col + 1 })
  end
end

return M
