FROM alpine as downloader
RUN mkdir crxmake && \
  wget https://github.com/mcuadros/go-crxmake/releases/download/v0.2.0/crxmake_v0.2.0_linux_amd64.tar.gz -O - | \
  tar zx -C crxmake --strip-components 1

FROM scratch
COPY --from=downloader /crxmake /crxmake
WORKDIR /crxmake
CMD ["--help"]
ENTRYPOINT ["./crxmake"]
