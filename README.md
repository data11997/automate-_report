## Step 1: Specify the folder where the pictures are saved
* picture_folder="/Users/abrahambenson/Desktop/picture_script"

This line sets the variable picture_folder to the path where your pictures are saved. You need to replace /Users/abrahambenson/Desktop/picture_script with the actual path to your picture folder. This is the folder from which the script will retrieve the latest picture.

## Step 2: Compose email
recipient="abrahambenson5000@gmail.com"
subject="Picture Report"
body="Please find attached the latest picture."
email="From: abrahambenson90@gmail.com\nTo: $recipient\nSubject: $subject\n$body"

Here, you're setting up the email parameters. The recipient variable holds the email address where you want to send the email. The subject variable contains the subject of the email. The body variable holds the body text of the email. The email variable combines all these components into a single string.

## Step 3: Find the latest picture in the folder
latest_picture=$(ls -t "$picture_folder" | head -n1)

This line uses ls command to list files in the specified directory, sorted by modification time (-t option), and then uses head to extract the first line, which will be the latest picture file. The result is stored in the latest_picture variable.

## Step 4: Attach the latest picture to the email
attachment="$picture_folder/$latest_picture"

This line constructs the path to the latest picture by concatenating the picture_folder variable with the latest_picture variable. This will be used as the attachment in the email.

## Step 5: Send email
echo -e "$email" | mutt -s "$subject" -a "$attachment" -- "$recipient"
Here, the echo command is used to output the contents of the email variable. The -e option enables interpretation of backslash escapes in the string. This output is then piped (|) to the mutt command, which is a command-line email client. The -s option specifies the email subject, the -a option specifies the attachment, and -- separates the email body from the recipient email address ($recipient).
