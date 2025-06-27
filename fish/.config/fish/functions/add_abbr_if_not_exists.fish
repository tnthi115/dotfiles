function add_abbr_if_not_exists --description "Add abbreviation or redefine it if command is different"
    # The first argument is the abbreviation name
    set -l abbr_name $argv[1]
    # All remaining arguments form the command
    set -l abbr_command $argv[2..-1]
    set -l new_command_str (string join " " -- $abbr_command)

    # Get the current definition of the abbreviation, if it exists
    set -l current_def (abbr --show $abbr_name)

    if test -z "$current_def"
        # If the abbreviation doesn't exist, add it
        abbr -a -- $abbr_name $abbr_command
    else
        # If it exists, extract the command part from the definition
        set -l current_cmd (string replace "abbr -a -- $abbr_name " "" -- "$current_def")

        # Remove surrounding quotes if they exist (e.g., for commands with spaces)
        if string match -q -r "^'.*'\$" -- "$current_cmd"
            set current_cmd (string sub -s 2 -l (math (string length "$current_cmd") - 2) -- "$current_cmd")
        end

        # Compare the current command with the new one
        if test "$current_cmd" != "$new_command_str"
            # If they are different, erase the old abbreviation and add the new one
            abbr -e -- $abbr_name
            abbr -a -- $abbr_name $abbr_command
        end
    end
end


