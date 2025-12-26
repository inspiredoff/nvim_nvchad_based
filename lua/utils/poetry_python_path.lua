--- Utility function to get Python path from Poetry virtual environment
-- @module poetry_python_path
-- @alias M

local M = {}

--- Get Python interpreter path from Poetry environment
-- @return string Path to Python interpreter in Poetry virtual environment
function M.get_poetry_python_path()
  local handle = io.popen("poetry env info --path 2>/dev/null")
  if not handle then
    return nil
  end

  local output = handle:read("*a")
  handle:close()

  if output and output ~= "" then
    -- Remove trailing newline and construct Python path
    local env_path = string.gsub(output, "\n$", "")
    return env_path .. "/bin/python"
  else
    return nil
  end
end

return M

