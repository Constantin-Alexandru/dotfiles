--    ________    _________
--    \_____  \  /   _____/
--     /   |   \ \_____  \
--    /    |    \/        \
--    \_______  /_______  /
--            \/        \/
--
--    Author: Alexandru Constantin © 2025
--
--    This file contains the helper functions to run operating system commands.
--    The owner of this config is not held responsible for supporting other setups.
--    If you wish to use this yourself, change it to your specifications yourself.

local M = {}

M.install_from_command = function(command, executable)
  local to_check = executable or command[#command]
  if vim.fn.executable(to_check) == 1 then
    return 0
  end
  print("Hello")

  local obj = vim.system(command, {}):wait()

  return obj.code
end

return M
