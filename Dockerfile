FROM golang:alpine as builder

RUN apk --update upgrade && \
    apk --no-cache --no-progress add git

ENV GO111MODULE on

RUN git clone https://github.com/emersion/hydroxide/ /hydroxide

WORKDIR /hydroxide
RUN go build ./cmd/hydroxide


FROM alpine:latest

WORKDIR /hydroxide
COPY --from=builder /hydroxide/hydroxide .

ENV XDG_CONFIG_HOME /.config
ENTRYPOINT [ "/hydroxide/hydroxide", "-smtp-host", "0.0.0.0" ]