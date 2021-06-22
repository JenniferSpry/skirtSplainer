# SVG Playground

A little project to learn [Scalable Vector Graphics](https://developer.mozilla.org/en-US/docs/Web/SVG) made with [vue js](https://vuejs.org/).

## Project setup

### Docker setup
```
docker build -t jennepry/svg-playground-app .
docker run -it -p 80:80 --rm --name svg-playground-app jennepry/svg-playground-app
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
