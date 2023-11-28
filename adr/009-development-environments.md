# ADR-009: How we manage different development environments

## 1. The beginning
This Architectural Decision Record (ADR) describes how we plan to handle various development environments for testing, prototyping and releasing the different products

## 2. Decision Drivers
- **Consistency in Deployment**: Making sure that the app acts the same way at all stages of development and deployment.
- **Quality Assurance**: Setting up a structured space for testing before sending to production.
- **User Testing**: Allowing real people to try out new features or changes in a controlled setting.
- **Continuous Integration and Deployment (CI/CD)**: Setting up effective ways to develop, test, and deploy software all the time.
- **Updating the product**: Allows to test new functionnalities without affecting the user base using the product.

## 3. Alternative Options
- **Single Environment Approach**: putting development, testing, and production all in the same environment (not chosen because of risk and lack of control).

## 4. Outcome of the Decision
We are going to put our production-level apps in three different environments:
- **Development (dev) Environment**: Shows the most recent changes to the any branch. This will allow developers to preview their work before it's sent to real user for testing
- **User Acceptance Testing (uat) Environment**: A stable space where end users can try out new features before they are made live. During the testing phase, it is frozen to keep it consistent. This is the prototyping phase.
- **Production (prd) Environment**: The final phase released to the users.

We host our website with **Vercel**, which offers a unique way to handle these situations:
- A preview URL is made for every push on every branch. You can get to the development URL (finesse-frontend-uat.vercel.app).
- The preview URL is changed to the dev URL (finesse-frontend-dev.vercel.app) when a pull request is merged into the main branch.
- As we have not yet decided where we want to host the production we don't have a set URL for this yet.

## 5. Reasons
- This setup makes it easy to tell the difference between the different stages of development, which makes sure that changes are tested before testing on selected users.
- Because the development environment is dynamic, changes can be made and tests can be run quickly.
- The UAT environment is a good place to make sure the quality of the changes and get feedback from users before they go live.
- Using Vercel makes our CI/CD pipeline better because it automates the deployment process and gives us feedback on changes right away through preview URLs.

## 6. What It Means
- The team must follow the rules for using these environments in a structured way to avoid problems and make sure that the change from development to production goes smoothly.
- To keep track of features and changes in different environments, you need to communicate and document well.
- Once the production environment is set up, it will need a plan for deployment and rollback to make sure it is reliable and has as little downtime as possible.

## 7. Thoughts about the future
- Setting up the production environment with the right security and scalability controls.
- Adding monitoring and logging tools to all environments to make it easier to see problems and fix them.

The goal is to make the development environments more structured so that products are more reliable, of higher quality, and better all around experience for users.
