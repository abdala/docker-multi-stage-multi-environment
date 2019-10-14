alias dc="docker-compose"
alias di="docker images"
alias dpa='docker ps --all'
alias drun="docker run --interactive --tty --rm"
alias drunv="drun --volume \$PWD:/app --workdir /app"
alias dip='docker inspect --format "{{ .NetworkSettings.IPAddress }}"'
alias drm='docker rm --volumes $(docker ps --quiet --filter "status=exited")'
alias dstop='docker stop $(docker ps --quiet)'
alias dgarbage='docker system prune'

dbu() { DOCKER_BUILDKIT=1 docker build --pull --tag $1 --file ${2:-'Dockerfile'} .; }
dcbu() { docker buildx bake --pull --file docker-compose.yml; }
dsh() { docker exec -it $(docker ps | grep $1 | awk '{print $1}' | head -n 1) ${2:-'sh'}; }
