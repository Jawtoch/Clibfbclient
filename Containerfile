FROM docker.io/swift:5.7-jammy

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -qq install firebird-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

COPY ./Package.* ./
RUN swift package resolve

COPY . .
RUN swift build -c debug --static-swift-stdlib

WORKDIR /app
RUN cp -r "$(swift build --package-path /build -c debug --show-bin-path)" ./