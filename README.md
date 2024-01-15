# BusyBox with curl Docker Image

## Overview

This Docker image is designed to provide a minimalistic environment based on BusyBox with the inclusion of the `curl` utility. It is suitable for scenarios where a lightweight container with essential Unix utilities and HTTP request capabilities is required.

## Features

- **BusyBox Base:** Utilizes the lightweight BusyBox base image for an efficient and minimal footprint.
- **curl Utility:** Includes the `curl` command-line tool for making HTTP requests.
- **Secure Communication:** CA certificates are installed to support secure communication over HTTPS.

## Usage

### As a Base Image

Use this image as a base for your containers that require essential Unix utilities and HTTP request capabilities.

```Dockerfile
FROM elma7ask/busybox-curl
```

### Executing HTTP Requests

Execute HTTP requests within your container using the included `curl` utility.

```bash
docker run -it --rm elma7ask/busybox-curl curl https://example.com
```

## Building the Image

To build the Docker image locally, run the following command:

```bash
docker build -t elma7ask/busybox-curl .
```

## Metadata

- **Title:** BusyBox with curl
- **Description:** A minimal image based on BusyBox with the `curl` utility added.
- **Authors:** Wael Mohamed <wael.mohamed.ahmed2@gmail.com>
- **Version:** 1.0.0
- **License:** MIT

## Default Command

The default command to run when the container starts is `/bin/sh`.

## License

This Docker image is licensed under the [MIT License](LICENSE).
