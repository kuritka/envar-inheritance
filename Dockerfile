FROM alpine:latest
LABEL type=test
COPY envar-inheritance-caller/envar-inheritance-caller .
COPY envar-inheritance-printer/envar-inheritance-printer .
USER root
ENTRYPOINT ["/envar-inheritance-caller"]
