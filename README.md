# Web codigus.dev

## Edición local

This documentation is built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/).

1. Create custom Docker image with necessary extra plugins (only first time):

```bash
docker build --pull --no-cache --rm=true -t squidfunk/mkdocs-material .
```

2. Serve the documentation:

```bash
docker run --name=mkdocs --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material
```

3. Build the documentation:

```bash
docker run --rm -it -v ${PWD}:/docs -e GOOGLE_ANALYTICS_KEY=G-XXXXXXXX squidfunk/mkdocs-material build
```

## Publicación

```bash
docker run --name=mkdocs-publish --rm -it -u $(id -u):$(id -g) -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent -v ${PWD}:/docs squidfunk/mkdocs-material gh-deploy
```