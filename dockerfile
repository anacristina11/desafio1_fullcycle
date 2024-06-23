FROM golang as build

WORKDIR /

COPY main.go main.go

RUN go build main.go

FROM scratch

WORKDIR /app
COPY --from=build main .

ENTRYPOINT [ "./main" ]