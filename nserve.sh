ngrokServeHomestead() {
  port=8000
  
  if [[ $# -eq 0 ]]; then
    previousLine=''
    currentDirectory=$(pwd)
    currentDirectoryArray=(${currentDirectory//// })
    siteToServe=''
    while IFS='' read -r line || [[ -n "$line" ]]; do
        if [[ "${line}" == *to:* ]] && [[ "${line}" == *${currentDirectoryArray[${#currentDirectoryArray[@]}-1]}* ]]; then
            siteToServeArray=(${previousLine//:/ })
            siteToServe=${siteToServeArray[${#siteToServeArray[@]}-1]}
        fi
        previousLine=$line
    done < ~/Homestead/Homestead.yaml
  else
    siteToServe=$1
    if [[ $# == 2 ]]; then
      port=$2
    fi
  fi

  ngrok http -host-header=$siteToServe $port
}

alias nserve=ngrokServeHomestead
