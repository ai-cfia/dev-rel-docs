#!binbash

# Prompt the user for required variables
echo Enter desired PROJECT_ID (e.g. cfia-ai-lab)
read PROJECT_ID

echo Enter your BILLING_ACCOUNT_ID (You can find this on the GCP Console under Billing)
read BILLING_ACCOUNT_ID

# Create a new project
gcloud projects create $PROJECT_ID

# Set the project as the active project
gcloud config set project $PROJECT_ID

# Link the billing account to the project
gcloud beta billing projects link $PROJECT_ID --billing-account=$BILLING_ACCOUNT_ID

# Retrieve and display a list of Google Cloud regions
echo Available Google Cloud regions
gcloud compute regions list --format=value(name)
echo

# Prompt user for necessary variables
read -p Enter a Google Cloud region from the above list  REGION
read -p Enter a name for your Google Cloud project ($PROJECT_NAME)  PROJECT_NAME
read -p Enter the Docker repository name ($REPO_NAME)  REPO_NAME
read -p Enter a description for the Docker repository ($DESCRIPTION) [Optional]  DESCRIPTION
read -p Enter a name for your service account ($SA_NAME)  SA_NAME
read -p Enter a display name for the service account ($SA_DISPLAY_NAME)  SA_DISPLAY_NAME
read -p Choose a name for the JSON key file ($FILE_NAME.json)  FILE_NAME


# Execute commands

# Create an artifact repository
gcloud artifacts repositories create $REPO_NAME 
   --repository-format=docker 
   --location=$REGION 
   --description=$DESCRIPTION

# Create a service account (SA)
gcloud iam service-accounts create $SA_NAME --display-name $SA_DISPLAY_NAME

# Create the key for the service account (SA)
gcloud iam service-accounts keys create $FILE_NAME.json --iam-account $SA_NAME@$PROJECT_ID.iam.gserviceaccount.com

# Automatically apply the roles to the service account
ROLES=(
    rolesartifactregistry.writer
    rolesiam.serviceAccountUser
    rolesrun.admin
)

for ROLE in ${ROLES[@]}; do
    gcloud projects add-iam-policy-binding $PROJECT_ID 
       --member=serviceAccount$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com 
       --role=$ROLE
done

echo All commands executed successfully!
