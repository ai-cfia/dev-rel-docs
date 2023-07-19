## Creating a TypeScript React App with ESLint and Prettier

This guide walks you through the steps to set up a TypeScript-based React app with ESLint for code linting and Prettier for code formatting. Following these steps will help you maintain a clean and consistent codebase.

### Step 1: Create a TypeScript React App

In the terminal, use Create React App to set up a new TypeScript-based React application:

`npx create-react-app --template=typescript YOUR-PROJECT-NAME-HERE`

### Step 2: Initialize ESLint Configuration

`npm init @eslint/config`

### Step 3: When prompted, select the following option:

- "How would you like to use ESLint?" - Choose `To Check syntax, find problems, and enforce code style.`

### Step 4: When prompted, select the following option:

- "What type of module does your project use?" - Choose `JavaScript modules (import/export).`

### Step 5: When prompted, select the following option:

- "Which framework does your project use?" - Choose `react.`

### Step 6: When prompted, select the following option:

- "Does your project use TypeScript?" - Choose `Yes.`

### Step 7: When prompted, select the following option:

- "Where does your code run?" - Choose `Browser.`

### Step 8: When prompted, select the following option:

- "How would you like to define a style for your project?" - Choose `Use a popular style guide.`

### Step 9: When prompted, select the following option:

- "Which style guide do you want to follow?" - Choose `Standard.`

### Step 10: When prompted, select the following option:

- "What format do you want your config file to be in?" - Choose `JSON.`

### Step 11: When prompted, select the following option:

- "Would you like to install them now with npm?" - Choose `Yes.`

All necessary ESLint packages will be installed for your project.

### Step 12: In the terminal, install Prettier and ESLint related packages:

`npm install prettier eslint-config-prettier eslint-plugin-prettier --save-dev`

### Step 13: In the .eslintrc.json file, replace the existing content with the following configuration:

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
### Step 14: Create a file in the root directory called ‘.prettierrc’. Copy and paste this code in there:
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
### Step 15: In the package.json file, add the following two lines inside the "scripts" section:

```json
"lint": "eslint .",
"lint:fix": "eslint --fix ."
```
### Step 16: To format all the code in the project run: 

`npx prettier --write .`

### Step 17: To run ESLint run: 

`npm run lint`
