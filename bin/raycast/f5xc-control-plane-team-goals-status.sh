#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title f5xc control plane team goals/status
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.description Return the names of team members who have not posted goals/status yet.
# @raycast.author Tymon
# @raycast.authorURL https://github.com/tnthi115

# Define the list of names
names=("@Amruta Kulkarni" "@Anu Pant" "@Anvesh CHINTAKUNTA" "@Bolun Zhao" "@Dan Hauer" "@Graham Mainwaring" "@Harsh KUMAR" "@Jalaj SHARMA" "@KHULAN BAASAN " "@Kyle Dennison" "@Matt Sawyer" "@Nitish B" "@Shaun Adams")

# Check if the script was run with arguments
if [ $# -eq 0 ]; then
	echo "Error: Please provide at least one argument."
	echo "Usage: $0 <arg1> [<arg2> ...]"
	exit 1
fi

# Store command-line arguments in an array
args=("$@")

# Filter names and build the output string
filtered_names=()
for name in "${names[@]}"; do
	full_name="${name#*@}"
	first_name=$(echo "$full_name" | awk -F' ' '{print $1}' | tr '[:upper:]' '[:lower:]')
	[[ ! " ${args[*]} " =~ $first_name ]] && filtered_names+=("$name")
done

# Print the list of names not in arguments as a space-separated list
if [ ${#filtered_names[@]} -gt 0 ]; then
	echo "Names not in arguments:"
	echo "${filtered_names[*]}"

	# Copy to clipboard using pbcopy (macOS)
	echo "${filtered_names[*]}" | pbcopy
else
	echo "All names are in the arguments list."
fi
