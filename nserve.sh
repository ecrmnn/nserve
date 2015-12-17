ngrokServeHomestead() {
    ngrok http -host-header=$1 8000
}

alias nserve=ngrokServeHomestead