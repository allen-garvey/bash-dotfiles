#display weather
#give zipcode as optional argument
function weather(){ curl "wttr.in/$1"; }


#Music
#requires sox to be installed by package manager - it is automatically aliased to `play`
alias pinknoise="play -q -c 2 -n synth pinknoise band -n 1600 1500 tremolo .1 35;"