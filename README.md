# Frontend project with React and CI/CD

- [Frontend project with React and CI/CD](#frontend-project-with-react-and-cicd)
  - [Install React + TypeScript + Vite](#install-react--typescript--vite)
    - [Expanding the ESLint configuration](#expanding-the-eslint-configuration)
  - [integrating GraphQL with RTK-Query](#integrating-graphql-with-rtk-query)

## Install React + TypeScript + Vite

[Vite](https://vitejs.dev/guide/) is a build tool that aims to provide a faster and leaner development experience for modern web projects. It consists of two major parts:

```sh
npm create vite@latest
```

### Expanding the ESLint configuration

If you are developing a production application, we recommend updating the configuration to enable type aware lint rules:

- Configure the top-level `parserOptions` property like this:

```js
export default {
  // other rules...
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
    project: ["./tsconfig.json", "./tsconfig.node.json"],
    tsconfigRootDir: __dirname,
  },
};
```

- Replace `plugin:@typescript-eslint/recommended` to `plugin:@typescript-eslint/recommended-type-checked` or `plugin:@typescript-eslint/strict-type-checked`
- Optionally add `plugin:@typescript-eslint/stylistic-type-checked`
- Install [eslint-plugin-react](https://github.com/jsx-eslint/eslint-plugin-react) and add `plugin:react/recommended` & `plugin:react/jsx-runtime` to the `extends` list

## integrating GraphQL with RTK-Query

**Redux Toolkit** is the official toolset for efficient Redux development. This makes life much easier for developers by reducing boilerplate code and incorporating many more advanced features built on top of Redux.

**RTK-Query** is an optional add-on that comes built-in with Redux Toolkit. To put simply, it is a powerful data fetching and caching tool that comes with many advanced features.

**GraphQL** is a querying language for APIs.

**Graphql-codegen** library is used to automatically generate our queries and types from our graphql schema and document files.

```sh
npm i graphql graphql-codegen --save

npm i @graphql-codegen/cli @graphql-codegen/client-preset @rtk-query/graphql-request-base-query @graphql-codegen/typescript-resolvers @graphql-codegen/typescript-rtk-query --save-dev
```
