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

### Web codigus

* **Mejorar el estilo de la web**
    * Ahora tiene el estilo por defecto de Mkdocs Material
    * No tiene el logotipo de Codigus
    * No tiene los colores del logotipo
    * No tiene fotos de los miembros
    * No tiene iconos

* **Añadir nuevos cursos**    
    * Paradigmas de Programación (En base al material del ordenador de Luis que está en el Drive de codigus)
    * ...

* **Añadir recursos relacionados a los curso**
    * Software de RUP
    * Herramienta de ingeniería inversa

### Curso Ingeniería del Software

* **Corregir la transcripción de los vídeos**
    * Como las transcripciones de los vídeos están generadas con la IA tienen erratas, especialmente en palabras técnicas.
    * Además no tienen una correcta puntuación.
    * Añadir puntuación y corregir las erratas ayuda en la lectura, en las búsquedas, etc.
* **Subir los vídeos a YouTube**
    * Ahora mismo los vídeos están en OneDrive
    * Se podrían subir adicionalmente a YouTube por si alguien tiene alguna preferencia por este player.
    * Favorece su descubrimiento por los usuarios de YouTube por su contenido.
* **Indexar documentación en los vídeos**
    * Identificar qué material se está mostrando en el vídeo en cada momento.
    * Esto permite etiquetar el material con los instantes en los que aparece en el vídeo.
    * Esto mejora el consumo de los materiales.
* **Editar los vídeos**
    * Recortar inicio y fin
    * Quitar el/los descanso/s
    * Tapar los nombres de los alumnos
    * *Asignado a Ale y Jony*

### Codigus Magnificus

https://github.com/codigus-dev/codigus-magnificus

* **Arreglar el sistema de generación de HTML desde asciidoc**
    * Usa una versión muy antigua de gradle para construir, pero no es compatible con Java moderno y algunas librerías requeridas no estaban en Maven Central la última vez que se probó
    * Se podría usar cualquier otra tecnología para convertir AsciiDoc a HTML, pero hay que tener en cuenta que se usa el plugin de PlantUML en los documentos.
* **Cambiar links que apuntan a USantaTecla para que apunten al repositorio de Codigus Magnificus**
    * Algunos están identificados en el README del repo https://github.com/codigus-dev/codigus-magnificus