FROM golang:1.16

WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"

RUN go get -u github.com/spf13/cobra@latest && \
    go install github.com/golang/mock/mockgen@v1.5.0 && \
    go install github.com/spf13/cobra-cli@latest

RUN apt-get update && apt-get install sqlite3 -y

RUN usermod -u 1000 www-data
RUN mkdir -p /var/www/.cache
RUN chown -R www-data:www-data /go
RUN chown -R www-data:www-data /var/www/.cache

# to thunder-tests
RUN mkdir -p /var/www/.cache && \
    mkdir -p /var/www/.vscode-server/data/Machine && \
    mkdir -p /var/www/.gnupg && \
    mkdir -p /var/www/.ssh && \
    chown -R www-data:www-data /go /var/www/.cache /var/www/.vscode-server /var/www/.gnupg /var/www/.ssh


USER www-data

CMD ["tail", "-f", "/dev/null"]