FROM alpine
RUN mkdir -p /app/crxmake && \
  wget https://github.com/mcuadros/go-crxmake/releases/download/v0.2.0/crxmake_v0.2.0_linux_amd64.tar.gz -O - | \
  tar zx -C /app/crxmake --strip-components 1

COPY entrypoint.sh /app/entrypoint.sh
ENV PATH /app/crxmake:$PATH
CMD ["crxmake"]
ENTRYPOINT ["/app/entrypoint.sh"]
