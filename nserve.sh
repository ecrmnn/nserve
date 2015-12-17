ngrokServeHomestead() {
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
  fi

  ngrok http -host-header=$siteToServe 8000
}

alias nserve=ngrokServeHomestead
