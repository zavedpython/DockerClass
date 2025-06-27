FROM
LABEL
RUN
ADD
COPY
WORKDIR
ENV
ARGS
USER
VOLUME
EXPOSE
CMD
ENTRYPOINT
#################################################################
✅ FROM
Specifies the base image from which the Docker image is built.

dockerfile
FROM node:18-alpine
Example: Starts from a minimal Node.js 18 image.

✅ LABEL
Adds metadata to the image (key-value pairs).

LABEL maintainer="admin@example.com"
LABEL version="1.0"
Helps with documentation and automation tools.

✅ RUN
Executes a command during the build and commits the result to the image.

RUN apt-get update && apt-get install -y curl
Example: Installs dependencies or prepares environment.

✅ ADD
Copies files from host to image, like COPY, but also supports: Remote URLs & Automatic archive extraction (e.g. .tar.gz)

ADD myapp.tar.gz /app/
Unpacks archive into /app.

✅ COPY
Simpler and faster than ADD. Only copies local files into the image.

COPY ./src /app/src
Commonly used for code or config files.

✅ WORKDIR
Sets the working directory inside the image for subsequent commands.

WORKDIR /app
Avoids repeating full paths in RUN, CMD, etc.

✅ ENV
Defines environment variables in the image.

ENV NODE_ENV=production
Useful for configuration and conditional logic.

✅ ARG
Defines build-time variables (unlike ENV, not kept in final image).

ARG VERSION=latest
RUN echo "Building version $VERSION"
Use --build-arg VERSION=1.2 at build time.

✅ USER
Specifies the user to run containers as (security best practice).

USER appuser
Avoids running processes as root.

✅ VOLUME
Declares a mount point for external persistent storage.

VOLUME /data
Data stored here survives container restart.

✅ EXPOSE
Documents the port(s) the container will listen on.

EXPOSE 3000
Used by tools like Docker Compose or when publishing ports.

✅ CMD
Sets the default command to run when the container starts (can be overridden).

CMD ["node", "app.js"]
Only one CMD allowed. Overridden if command is passed at runtime.

✅ ENTRYPOINT
Defines a fixed executable to run. Often used for wrapper scripts.

ENTRYPOINT ["docker-entrypoint.sh"]
Can be combined with CMD for arguments.

🔁 ENTRYPOINT vs CMD

ENTRYPOINT ["echo"]
CMD ["Hello"]
Result: docker run myimage → echo Hello



