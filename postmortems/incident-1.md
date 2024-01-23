# Nachet backend classification not working (incident #1)

### Owner

Jonathan Lopez (@SonOfLope) and Thomas Cardin (@ThomasCardin)

### Status

Final

### Incident date

17/01/2024 at 15:53

### Published

19/01/2024 at 9:00

## Executive summary

https://nachet.ninebasetwo.xyz/ -> Capture (the button next to Video Feed) ->
Load (Load an image from the sample) -> Classify

Returned a 500 internal server error with the following
[stack trace](https://bit.ly/3ScnqCk)

### Impact

We couldn't load and classify any images using the Azure AI Model.

### Root Causes

The API Key of the Azure AI Model was regenerated. So, the current one used in
production wasn't valid. Therefore, any request made to the model was returning
a 401 Unauthorized.

## Problem summary

### Product(s) affected

Nachet

### % of product affected

Global - all traffic served to nachet

### Revenue impact

Around 200$ lost

### Trigger / Detection

The detection was found by nachet team (including frontend and backend) and our
team lead.

1. Load button: Uploading a image bigger than 1Mo (default value)

2. Classify button following the load button click: Regenerating the API Key
of the Azure AI Model used inside nachet.

### Impact

User impact

- We couldn't load and classify any images using the Azure AI Model.

DevSecOps Impact

- It was necessary to resolve the issue, so all other tasks had to be halted
for us.

Nachet Team Impact

- We had to take our time to explain the various components of the Nachet system,
including the AI models deployed on Azure.

Revenue Impact

- The time of developers and DevSecOps personnel.


### Root Causes

1. To test the classification, it was necessary to upload an image by clicking
on the "load" button. This resulted in a 413 Request Entity Too Large error.
Therefore, a modification was made to the Nginx ingress to increase the upload
size. This resolved the issue.

2. After clicking the "classify" button, a 500 error appeared.
The API Key of the Azure AI Model was regenerated. So, the current one used
in production wasn't valid. Therefore, any request made to the model was
returning a 401 Unauthorized.

In conclusion, the API Key used in production should only be accessible by
the DevSecOps team to prevent its regeneration/modification.

### Resolution

Changing the API Key inside our Vault with the new value and increasing the
maximum upload limite to the nachet backend.

## Action Items

### Nachet backend team (NBT):
|Action items|Type|Priority|Owner|Tracking bug|
|--------|-------|-------|-------|-------|
|Instrument the application|mitigate|P0|NBT|[issue 50](#ref-50)|

### Nachet frontend team (NFT):
|Action items|Type|Priority|Owner|Tracking bug|
|--------|-------|-------|-------|-------|
|Instrument the application|mitigate|P0|NFT|[issue 88](#ref-88)|

### DevSecOps Team (DT):
|Action items|Type|Priority|Owner|Tracking bug|
|--------|-------|-------|-------|-------|
|Monitor API Key regeneration|detect|P1|DT|[issue 22](#ref-22)|
|Add 500 internal server error alerts|detect|P1|DT|[issue 23](#ref-23)|
|Disallow API Key changes without approval|mitigate|P1|DT|[issue 21](#ref-21)|
|Support instrumented applications|mitigate|P1|DT|[issue 13](#ref-13)|

## Lessons Learned

Before searching for the perfect solution to the error, proceed step by step.
That being said, testing the product locally and attempting to replicate the
issue would have helped us narrow down the scope of the problem more quickly.
For instance, this approach would have enabled us to identify the specific
failing component, such as disk, network, CPU, or memory failure. In this
case, it was just an invalid API Key and a misconfiguration of the ingress.

### What went well

Once the error was identified, resolving the problem
did not take much time.

### What went wrong

The stack trace returned by the error was misleading. Identifying the error was
not straightforward, so a significant amount of time was spent finding an
issue related to the TLS/SSL layer.

### Where we got lucky

Reproducing the error locally made the identification of the error quick.

## Timeline

**2023-01-10 (14:00):** A request has been made for the application to
be deployed by 2023-01-15 (8:00).

**2023-01-12 (14:00):** The application has been deployed. The frontend can
communicate with the backend.

**2023-01-17 (15:00):** One of our clients claims that the classification
is not working.

**2023-01-17 (15:10):** A DevSecOps confirms a 500 Internal Server Error for
Capture -> Load (with sample image) -> Classify.

**2023-01-17 (15:15):** An issue is opened with the DevSecOps Team
regarding the problem.

**2023-01-17 (15:30):** The DevSecOps team is now working on the problem.

**2023-01-17 (16:00):** The team tries to find a solution to the problem,
but the solutions provided do not resolve the root cause.

**2023-01-18 (8:00):** The upload limit is increased on the backend Ingress.

**2023-01-18 (8:30):** Increasing the upload limit solves part of the problem,
but not the 500 Internal Server Error.

**2023-01-18 (9:15):** Replication of the problem locally.

**2023-01-18 (10:00):** Discussions are exchanged with the backend team to
better understand the software structure.

**2023-01-18 (10:45):** A hypothesis is put forward by the backend team and
the team lead that the AI model may have undergone changes.

**2023-01-18 (11:30):** Tests are performed locally, and an error still occurs,
but this time it's a 401.

**2023-01-18 (11:40):** A comparison between the API Key of the model and the one
in production is done.

**2023-01-18 (11:45):** There is confirmation of a divergence between the API
of the model and the one in production.

**2023-01-18 (12:00):** The API Key of the model in production is modified.

**2023-01-18 (13:05):** Problem resolved.

## Glossary

nachet

- nachet-backend: https://github.com/ai-cfia/nachet-backend

- nachet-frontend: https://github.com/ai-cfia/nachet-frontend

## Supporting information

<a id="ref-50"></a> <https://github.com/ai-cfia/nachet-backend/issues/50>

<a id="ref-88"></a> <https://github.com/ai-cfia/nachet-frontend/issues/88>

<a id="ref-13"></a> <https://github.com/ai-cfia/infra/issues/13>

<a id="ref-21"></a> <https://github.com/ai-cfia/infra/issues/21>

<a id="ref-22"></a><https://github.com/ai-cfia/infra/issues/22>

<a id="ref-23"></a><https://github.com/ai-cfia/infra/issues/23>
