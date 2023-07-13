FROM debian:bullseye as build
ARG TARGETARCH
ARG TARGETVARIANT

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
        build-essential cmake libspeexdsp-dev pkg-config

WORKDIR /build

COPY src/main.cpp src/CMakeLists.txt ./src/
COPY Makefile ./

RUN make

# -----------------------------------------------------------------------------

FROM scratch

COPY --from=build /build/build/speexdsp-cli ./
