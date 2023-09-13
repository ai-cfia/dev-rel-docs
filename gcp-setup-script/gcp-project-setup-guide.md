# GCP Project Setup Guide

This guide provides a step-by-step process to set up a Google Cloud Platform (GCP) project using the provided automation script. The script will help you create a new GCP project, link a billing account, set up an artifact repository, and configure a service account.

## Variables Explanation

Before running the script, it's essential to understand the variables used:

- `$PROJECT_ID` : The Google Cloud Platform project ID. This ID will be used to uniquely identify your project on GCP.
  
- `$BILLING_ACCOUNT_ID` : Your GCP Billing Account ID. You can find this on the GCP Console under "Billing".

- `$REPO_NAME` : Choose a name for your Docker repository.

- `$REGION` : Specify the Google Cloud region where you want to set up your repository.

- `$DESCRIPTION` (Optional) : Provide a description of the Docker repository for reference.

- `$SA_NAME` : Set a name for your service account.

- `$SA_DISPLAY_NAME` : Set a display name for the service account.

- `$FILE_NAME.json` : Choose a name for the JSON key file. This will be used to store the credentials for the service account.

- `$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com` : The email address format of your service account. This is constructed using the `$SA_NAME` and `$PROJECT_ID` variables.

- `$ROLE` : The role you want to assign to the service account. The script will iterate over a predefined set of roles and assign them to the service account.

**Note** :  The roles set by the script are the minimum required to build and deploy the application. These roles have been chosen to ensure the least privilege principle while allowing the necessary operations. If you need additional permissions or roles, you can add them to the service account after running the script. You can check the 

## Deployment Steps

1. Copy the script provided.
2. Save it to a file, e.g., `gcp_project_setup.sh`.
3. Make the script executable with the command `chmod +x gcp_project_setup.sh`.
4. Run the script using `./gcp_project_setup.sh`.

**Note** : The script name `gcp_project_setup.sh` is just an example, you can decide to call the script whatever fits you best.

## Adding A Role

If you wish to add a role to your service account, you will need to find the exact role of that name which you can find [here](https://cloud.google.com/iam/docs/understanding-roles),

1. Set the variable as your role ROLE="ROLE_NAME"
2. Run the command
`gcloud projects add-iam-policy-binding $PROJECT_ID \
       --member="serviceAccount:$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com" \--role=$ROLE`
