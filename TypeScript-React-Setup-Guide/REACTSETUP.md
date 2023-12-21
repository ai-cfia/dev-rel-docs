## Creating a TypeScript + SWC React App with Vite, ESLint, and Prettier

This guide walks you through the steps to set up a React app using Vite with TypeScript and SWC, and further enhancing it with ESLint for code linting and Prettier for code formatting. Following these steps will help you maintain a clean, consistent, and efficient codebase.

# Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Step 1: Setting Up the Project with Vite and SWC](#step-1-setting-up-the-project-with-vite-and-swc)
  - [Why Vite and SWC?](#why-vite-and-swc)
- [Step 2: Steps to Integrate ESLint and Prettier](#step-2-steps-to-integrate-eslint-and-prettier)
- [Step 3: In the .eslintrc.json file, replace the existing content with the following configuration](#step-3-in-the-eslintrcjson-file-replace-the-existing-content-with-the-following-configuration)
- [Step 4: Create a file in the root directory called ‘.prettierrc’. Copy and paste this code in there](#step-4-create-a-file-in-the-root-directory-called-prettierrc-copy-and-paste-this-code-in-there)
- [Step 5: In the package.json file, add the following two lines inside the "scripts" section](#step-5-in-the-packagejson-file-add-the-following-two-lines-inside-the-scripts-section)
- [Step 6: To format all the code in the project run](#step-6-to-format-all-the-code-in-the-project-run)
- [Step 7: To run ESLint run](#step-7-to-run-eslint-run)


## Getting Started

These instructions will get your copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have Node.js installed on your system. This project uses Node.js for package management and script execution.

### Installation

To set up the project on your local machine:

1. Clone the repository to your local machine.
2. Change into the project directory.
3. Install the required dependencies.

## Step 1: Setting Up the Project with Vite and SWC

1. Open your terminal.
2. Navigate to the desired directory.
3. Run the command to create a new Vite project. You will need to enter the project name and select options for the framework and variant:
   - Command: `npm create vite@latest`
   - Project name: Enter your project name.
   - Select framework: React
   - Select variant: TypeScript + SWC
4. After scaffolding is complete, navigate to your project directory.
5. Install the required dependencies.
6. Start the development server. Your application will be available at a local server URL.

### Why Vite and SWC?

#### Advantages of Vite over npx create-react-app:

- Faster Build Time: Vite significantly improves build time with an ESM-based dev server.
- Out-of-the-Box Features: Vite includes Hot Module Replacement (HMR) and TypeScript support.
- Simplified Configuration: Vite requires minimal configuration compared to create-react-app.

#### Benefits of Using SWC:

- Performance: SWC offers faster compilation of TypeScript/JavaScript than traditional compilers like Babel.
- Efficient Bundling: SWC includes bundling and minification for enhanced production performance.
- Lower Configuration Overhead: SWC simplifies the configuration process for TypeScript and modern JavaScript.

## Step 2: Steps to Integrate ESLint and Prettier

`npm install prettier eslint-config-prettier eslint-plugin-prettier --save-dev`

## Step 3: In the .eslintrc.json file, replace the existing content with the following configuration

```json
{
  "env": {
    "browser": true,
    "es2021": true,
    "jest": true
  },
  "extends": [
    "react-app",
    "react-app/jest",
    "standard-with-typescript",
    "plugin:react/recommended",
    "plugin:import/typescript",
    "plugin:prettier/recommended"
  ],
  "parserOptions": {
    "ecmaVersion": "latest",
    "sourceType": "module",
    "project": "./tsconfig.json"
  },
  "plugins": ["react", "@typescript-eslint", "prettier"],
  "rules": {
    "react/prop-types": "off",
    "react/react-in-jsx-scope": "off",
    "prettier/prettier": [
      "error",
      {
        "endOfLine": "auto"
      }
    ]
  }
}
```

## Step 4: Create a file in the root directory called ‘.prettierrc’. Copy and paste this code in there

```json
{
  "tabWidth": 2,
  "useTabs": false,
  "semi": true,
  "singleQuote": false,
  "trailingComma": "all",
  "printWidth": 80
}
```

## Step 5: In the package.json file, add the following two lines inside the "scripts" section

```json
"lint": "eslint .",
"lint:fix": "eslint --fix ."
```

## Step 6: To format all the code in the project run

`npx prettier --write .`

## Step 7: To run ESLint run

`npm run lint`
