#!/bin/bash
image_name="anandasaisoorisetty/java-web-app-docker:Java-Project-${BUILD_NUMBER}"
arn="arn:aws:sns:us-east-1:351836203514:sample"
trivy_output=$(trivy $image_name)

# Extract the counts of critical and high-severity vulnerabilities from Trivy's output
critical_vulnr=$(echo "$trivy_output" | grep -i "CRITICAL" | wc -l)
high_vulnr=$(echo "$trivy_output" | grep -i "HIGH" | wc -l)

echo "High vulnerabilities: $high_vulnr"
echo "Critical vulnerabilities: $critical_vulnr"

if [[ $high_vulnr -gt 0 || $critical_vulnr -gt 0 ]]
then
    echo "Your image has high vulnerabilities" && aws sns publish --topic-arn $arn --message "Image vulnerabilities: High or critical vulnerabilities detected for image $image_name" --subject "Image Vulnerability Alert"
    exit 1
else
    echo "Your image has low vulnerabilities"
fi
