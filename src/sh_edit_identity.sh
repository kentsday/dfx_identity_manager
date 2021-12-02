#############################################################
# Grab the script from an existing file -or- user input...  #
#                                                           #
# Copyright © 2020 Theodore R. Smith                        #
# License: Creative Commons Attribution v4.0 International  #
# From: https://github.com/hopeseekr/BashScripts/           #
# @see https://stackoverflow.com/a/64486155/430062          #
#############################################################
function grabScript()
{
    if [ ! -z "$1" ] &&  [ -f "$1" ]; then
        echo $(<"$1")
    else
        echo "" >&2
        echo "Please type/paste your identity file content." >&2
        echo "Press CTRL+D when finished." >&2
        echo "" >&2

        # Read user input until CTRL+D.
        # @see https://stackoverflow.com/a/38811806/430062
        readarray -t user_input

        # Output as a newline-dilemeted string.
        # @see https://stackoverflow.com/a/15692004/430062
        printf '%s\n' "${user_input[@]}"
    fi
}

SCRIPT=$(grabScript "$2")

# Preserve white spaces and newlines.
# @see https://stackoverflow.com/a/18018422/430062
echo "$SCRIPT" > ~/.config/dfx/identity/default/identity.pem

echo "identity updated"