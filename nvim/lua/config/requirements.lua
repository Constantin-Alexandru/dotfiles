--    __________                   .__                                      __
--    \______   \ ____  ________ __|__|______   ____   _____   ____   _____/  |_  ______
--     |       _// __ \/ ____/  |  \  \_  __ \_/ __ \ /     \_/ __ \ /    \   __\/  ___/
--     |    |   \  ___< <_|  |  |  /  ||  | \/\  ___/|  Y Y  \  ___/|   |  \  |  \___ \
--     |____|_  /\___  >__   |____/|__||__|    \___  >__|_|  /\___  >___|  /__| /____  >
--            \/     \/   |__|                     \/      \/     \/     \/          \/
--
--    Author: Alexandru Constantin © 2025
--
--    This file contains the install of the tools used by different plugins.
--    The owner of this config is not held responsible for supporting other setups.
--    If you wish to use this yourself, change it to your specifications yourself.

local install_from_command = require "helpers.os".install_from_command

install_from_command({ "sudo", "pacman", "--noconfirm", "-Syu", "fzf" })
