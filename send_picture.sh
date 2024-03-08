#!/bin/bash

# Step 1: Specify the folder where the pictures are saved
picture_folder="/Users/abrahambenson/Desktop/picture_script"

# Step 2: Compose email
recipient="abrahambenson5000@gmail.com"
subject="Picture Report"
body="Please find attached the latest picture."
email="From: abrahambenson90@gmail.com\nTo: $recipient\nSubject: $subject\n$body"

# Step 3: Find the latest picture in the folder
latest_picture=$(ls -t "$picture_folder" | head -n1)

# Step 4: Attach the latest picture to the email
attachment="$picture_folder/$latest_picture"

# Step 5: Send email
echo -e "$email" | mutt -s "$subject" -a "$attachment" -- "$recipient"
