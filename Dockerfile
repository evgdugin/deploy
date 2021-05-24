############################
FROM golang:1.14 as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server .

####################################
FROM scratch

ENV DB_PORT=80

ENV DB_NAME="Ты проверил, всё работает! не забудь сохранить по пунктам!"

COPY --from=builder /app/ /

EXPOSE 80

CMD ["/server"]