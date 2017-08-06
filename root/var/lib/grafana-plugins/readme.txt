Add custom plugin zip files from https://grafana.com/plugins to this
folder before building the container. If the Docker build script finds
zip files in root/var/lib/grafana-plugins it will unzip them and
delete the original zip file.
