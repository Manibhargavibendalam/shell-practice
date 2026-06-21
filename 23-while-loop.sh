# #!/bin/bash

# count=5

# echo="Starting countdown"

# while [ $count -gt 0 ]
# do 
#   echo "Time left: $count"
#   sleep 1  # Pause for 1 second
#   count=$((count-1)) # Decrement the count
# done

# echo "Times up!"

#!/bin/bash

# Define the path to your file
FILE_PATH="20-script-1.sh"

# Check if the file actually exists before reading
if [ ! -f "$FILE_PATH" ]; then
    echo "Error: File $FILE_PATH not found."
    exit 1
fi

# Loop through the file line by line
while IFS= read -r line; do
    # Process each line here
    echo "Processing line: $line"
    # printf '%s\n' "$line"
done < "$FILE_PATH"
