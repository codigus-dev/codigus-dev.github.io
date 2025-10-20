# Web codigus.dev

## Edición de la web

La web está implementada con [MkDocs Material](https://squidfunk.github.io/mkdocs-material/).

1. Crear una imagen docker (sólo una vez):

```bash
docker build --pull --no-cache --rm=true -t squidfunk/mkdocs-material .
```

2. Arrancar el servidor de previsualización de la documentación (con recarga automática):

```bash
docker run --name=mkdocs --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material
```

3. Generar la documentación en HTML:

```bash
docker run --rm -it -v ${PWD}:/docs -e GOOGLE_ANALYTICS_KEY=G-XXXXXXXX squidfunk/mkdocs-material build
```

4. Publicar la página con GitHub Pages:

```bash
docker run --name=mkdocs-publish --rm -it -u $(id -u):$(id -g) -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent -v ${PWD}:/docs squidfunk/mkdocs-material gh-deploy
```

## Mejoras de la web y el material

Las tareas se gestionan en el [GitHub Project](https://github.com/orgs/codigus-dev/projects/1/views/1)