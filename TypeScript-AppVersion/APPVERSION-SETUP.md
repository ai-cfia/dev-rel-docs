# TS-AppVersion Readme

TS-AppVersion is a package designed to extract version information from a
project's package.json and Git (if configured) and save it into a TypeScript
file. The package is intended to be used with TypeScript-based JavaScript
frameworks, such as Angular.

## Key Features and Usage

**Installation**:

```bash
npm i @saithodev/ts-appversion
```

### Running the Script

Before building the application, you need to run the TS-AppVersion script. This
can be achieved using "prestart" and "prebuild" scripts in your package.json:

## Getting Started

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

```text
version
name
description
versionDate
versionLong
gitTag
gitCommitHash
gitCommitDate
```

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
