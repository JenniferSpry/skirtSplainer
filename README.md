# SVG Playground

A little project to learn [Scalable Vector Graphics](https://developer.mozilla.org/en-US/docs/Web/SVG) made with [vue js](https://vuejs.org/).

## Project setup

### Docker development
Build the images for the build stage.
```
docker build --target build -t jennepry/svg-playground-dev .
```

Run the dev server, mount current directory as volume (while ignoring the node_modules folder).
```
docker run -it -p 8080:8080 --rm --name svg-playground-dev -v /app/node_modules -v "$(pwd)":/app jennepry/svg-playground-dev npm run serve
```

Bash into running container.
```
docker container exec -it svg-playground-dev bash
```

### Docker deployment
```
docker build -t jennepry/svg-playground-app .
docker run -it -p 8080:80 --rm --name svg-playground-app jennepry/svg-playground-app
```

## Help
```
yarn install
```

### Compiles and hot-reloads for development
```
yarn serve
```

### Compiles and minifies for production
```
yarn build
```

### Run your unit tests
```
yarn test:unit
```

### Lints and fixes files
```
yarn lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
