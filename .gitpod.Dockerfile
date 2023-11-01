FROM gitpod/workspace-full:latest
USER gitpod
RUN sudo apt-get update -q && \
    sudo apt-get install -yq wkhtmltopdf inotify-tools