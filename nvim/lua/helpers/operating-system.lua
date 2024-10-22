local M = {}

M.get_os = function()
  local os_name

  if package.config:sub(1,1) == '\\' then
    os_name = "Windows"
  else
    local f = io.popen("uname -s", "r")
    local uname_output = f:read("*l")
    f:close()

    if uname_output == "Linux" then
      os_name = "Linux"
    elseif uname_output == "Darwin" then
      os_name = "macOS"
    else 
      os_name = "Unknown"
    end
  end

  return os_name
end 

M.get_package_manager = function(os_name)
  assert(os_name == "Linux" or os_name == "Windows", "Error: OS " .. os_name .. " is not Linux or Windows")

  if os_name == "Windows" then
    return "winget"
  end

  local file = io.open("/etc/os-release", "r")

  assert(not (file == nil), "Error: /etc/os-release file could not be found.")

  for line in file:lines() do
    if line:match("^ID=") then
      local distro_id = line:gsub('ID=', ''):gsub('"', ''):lower()
      
      if distro_id == "ubuntu" or distro_id == "debian" then
        return "apt-get"
      elseif distro_id == "arch" then 
        return "pacman"
      else
        error("Error: Unsuported distro")
      end

      break
    end
  end
  file:close()
  
end

M.get_package_manager_options = function(package_manager)
  local options = ""

  if package_manager == "npm" then
    return options .. "install -g"    
  elseif package_manager == "winget" then
    return options .. "install --silent"
  elseif package_manager == "apt_get" then
    return options .. "install --quiet"
  elseif package_manager == "pacman" then
    return options .. "-Syu --noconfirm"
  end

end

M.run_shell_command = function(command, admin_priviledges)

  local password = ""

  if admin_priviledges then
    password = vim.fn.inputsecret("Password: ")
  end

  local command_str = table.concat(command, " ")
  
  command_str = string.format(command_str, password)

  local exit_code = vim.fn.system(command_str)

  return exit_code

end

M.check_if_installed = function(package_manager, package)
  local options = ""

  if package_manager == "npm" then
    options = "list -g --depth=0"
  elseif package_manager == "winget" then
    options = "list --id"
  elseif package_manager == "apt_get" then
    options = "list --installed | grep"
  elseif package_manager == "pacman" then
    options = "-Qi"
  end

  local command = table.concat({ package_manager, options, package}, " ")
  
  local result = vim.fn.system(command)

  return result
end


M.install_if_not_exists = function(package, package_manager)  
  local os_name = M.get_os()

  if not package_manager then
    package_manager = M.get_package_manager(os_name)
  end
  
  if M.check_if_installed(package_manager, package) == 0 then
    return
  end

  local admin_priviledges 
  local null_output = ""
  
  if os_name == "Linux" then 
    admin_priviledges = "echo '%s' | sudo -S" 
    --  null_output = ">/dev/null 2>&1"
  else 
    admin_priviledges = ""
    null_output = ""
  end 

  local options = M.get_package_manager_options(package_manager)

  local install_command = { admin_priviledges, package_manager, options, package, null_output }

  local status = M.run_shell_command(install_command, admin_priviledges)

  assert(status == 0, "Error: installation of " .. package .. " failed (Command: " .. table.concat(install_command, " ") .. ").\n")
end

return M
