FROM squidfunk/mkdocs-material:9.6.20

RUN adduser -D -u 1000 -h /home/appuser appuser
USER appuser

# Add mkdocs plugins here if needed
# RUN pip install mkdocs-glightbox mkdocs-llmstxt

ENTRYPOINT ["/sbin/tini", "--", "mkdocs"]
CMD ["serve", "--dirtyreload", "--dev-addr=0.0.0.0:8000"]