FROM ubuntu:16.04

# ----------------------------------------------------------------
RUN apt update
RUN apt install -y 'g\+\+-mingw-w64-i686' make cmake
RUN rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD ./Toolchain-mingw32.cmake /app
ADD ./app.sh /app
RUN chmod a+x /app/app.sh

# ----------------------------------------------------------------

# Set the working directory for entry point
WORKDIR /share

# Run app.sh when the container launches
ENTRYPOINT ["/app/app.sh"]

