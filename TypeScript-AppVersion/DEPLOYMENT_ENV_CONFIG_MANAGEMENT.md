# Deployment Environment Configuration management

TS-AppVersion automates the extraction and integration of version information
from a project's `package.json` and Git, providing a unified and accurate
versioning system. This approach ensures that the version details are
consistently embedded within the application, facilitating:

1. **Enhanced Traceability**: By maintaining precise version records in the
application, developers and QA teams can easily trace which version of the
codebase is deployed, aiding in debugging and issue resolution.
2. **Streamlined Deployment**: Automated versioning reduces manual errors and
the operational overhead associated with updating version numbers, leading to
smoother and more reliable deployment processes.
3. **Improved Communication**: Clear and accessible version information helps
in setting accurate expectations with stakeholders, ensuring that everyone is
informed about the current state and progress of the application.
4. **Compatibility Management**: For applications relying on multiple services
or modules, having accurate versioning assists in managing compatibility and
dependencies effectively.

By implementing TS-AppVersion, the overall management of application versions
becomes more structured and less prone to human error, contributing to a more
robust and transparent development lifecycle.

## Key Features

- **Environment-Specific Configuration**: Separate files for different
environments (`development`, `staging`, `production`) allow for tailored
configurations, ensuring that the application behaves appropriately under each
condition.
- **Dynamic Environment Selection**: The application automatically selects the
appropriate configuration based on the `NODE_ENV` environment variable,
facilitating smooth transitions between different stages of deployment.
- **Consistency Across Projects**: A standardized approach to managing
environment configurations promotes consistency, making it easier for
developers to understand and navigate different projects within the
organization.

## Usage

To effectively use the environment configuration setup, follow these steps:

1. **Environment File Creation**:
- Create the environment files (`environment.ts`, `environment.staging.ts`,
`environment.prod.ts`) in your project.
- Define the configuration settings relevant to each environment, such as API
endpoints, feature flags, or any other environment-specific variables.

2. **Setting the Environment Variable**:
- For local development, no additional setup is needed; `environment.ts` will
be used by default.
- For staging or production, set the `NODE_ENV` environment variable to
`staging` or `production`, respectively. This can be done in your CI/CD
pipeline, server configuration, or even locally for testing.

3. **Accessing Configuration in Code**:
- Import and use the environment configurations in your application code. The
build system should be set up to include the correct environment file based on
the value of `NODE_ENV`.

4. **Testing**:
- Ensure that the application behaves as expected in each environment by
testing with the respective configuration. This helps in identifying any
environment-specific issues early in the development cycle.

Remember to review and update the environment configurations as your project
evolves and new requirements emerge. Regularly checking that the settings align
with the current needs of each environment is key to maintaining a robust and
flexible configuration setup.

## Environment Configuration Guidelines

Managing different configurations for multiple deployment environments is
crucial for ensuring that applications behave correctly under various
conditions. This section provides general guidelines on structuring and
utilizing environment configurations in frontend projects.

### File Structure

Environment configurations are typically managed through separate files, each
representing settings for a specific deployment environment. Commonly used
environment files include:

- `environment.ts`: Serves as the default environment configuration, primarily
used for local development.
- `environment.staging.ts`: Contains settings specific to the staging
environment, simulating a production-like environment for testing.
- `environment.prod.ts`: Contains settings specific to the production
environment, used when the application is deployed to end-users.

### Selecting the Environment

The application should dynamically select the appropriate environment
configuration based on a distinguishing parameter, commonly the `NODE_ENV`
environment variable. The setup allows the application to import the
corresponding configuration file (`environment.ts`, `environment.staging.ts`,
or `environment.prod.ts`) based on the target deployment environment.

#### Configuration Steps:

1. **Setting the Environment Variable:**
- For local development, the default `environment.ts` is used.
- For staging or production, set the `NODE_ENV` environment variable to either
`staging` or `production` respectively.

2. **Importing the Configuration:**
- The build or runtime system should be configured to read the `NODE_ENV`
variable and import the corresponding environment file.
- This can be done within build scripts, package.json scripts, or through
environment variable settings in CI/CD pipelines.

### Best Practices

- **Consistency:** Ensure that all frontend components follow the same
structure and methodology for environment configuration to maintain consistency
across the project.
- **Documentation:** Clearly document the purpose of each environment file and
the process of setting the environment variable in `README.md` or a dedicated
documentation section.
- **Security:** Avoid storing sensitive information like API keys or passwords
directly in the environment files. Use secure methods like environment
variables or secret management services to handle sensitive data.

By adhering to these guidelines, teams can ensure a consistent and efficient
approach to managing environment configurations across different frontend
components.

**Installation**:

```bash
npm i @saithodev/ts-appversion
```

### Running the Script

Before building the application, you need to run the TS-AppVersion script. This
can be achieved using "prestart" and "prebuild" scripts in your package.json:

**Getting Started**

package.json:

```json
{
"scripts": {
"prestart": "ts-appversion",
"prebuild": "ts-appversion"
}
}
```

The package comes with a script that has to be run before your application is
built. You might want to use prestart and prebuild inside your package.json for
that.

## Command Arguments

The package provides several command arguments to customize its behavior, such
as specifying the root directory, output file location, Git folder location,
and more.

## Receiving the Versions

The script (npm i @saithodev/ts-appversion) generates a TypeScript file
(default location: ./src/_versions.ts) that exports an object containing
various version-related variables extracted from the package.json and Git
repository (if available). These variables include:

version
name
description
versionDate
versionLong
gitTag
gitCommitHash
gitCommitDate

## Environment-Related Versions

In some cases, it might be better to not display the version number or only the
short notation. You can use the environments to display different version
information.

environments/environment.ts:

```typescript
import versions from '../_versions';

export const environment = {
production: false,
version: versions.version,
};
```

environments/environment.staging.ts:

```typescript
import versions from '../_versions';

export const environment = {
production: false,
version: versions.version,
};
```

environments/environment.prod.ts:

```typescript
import versions from '../_versions';

export const environment = {
production: false,
version: versions.version,
};
```

## Example of Accessing the Version in the Environment Component

app.component.ts:

```typescript
import { environment } from '../environments/environment';

export class AppComponent {
return (
{environment.version !== "" ? "v" + environment.version : ""}{" "}
);
}
```

Overall, TS-AppVersion simplifies the process of managing version information
in TypeScript-based projects and provides flexibility in displaying different
version details based on the application's environment.
