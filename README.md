# nserve
Quickly serve Homestead sites using ngrok

#### Prerequisites
You need to [download](https://ngrok.com/download) ```ngrok``` before using this script.

#### Usage
Clone this repo or just copy the contents of ```nserve.sh``` into your ```.bash_profile```

```nserve``` will loop through your ```~/Homestead/Homestead.yaml``` and figure out in which directory you are and serve it. Will serve ```localhost``` if nothing is found.

```nserve domain``` will serve ```domain```

#### Contributors
- [mrtnsn](https://github.com/mrtnsn)
