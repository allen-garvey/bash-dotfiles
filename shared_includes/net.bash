#Network related aliases

alias hosts="sudo -E vim /etc/hosts;"

#prints out http headers for url - arg $1 is url
#http://stackoverflow.com/questions/10060098/getting-only-response-header-from-http-post-using-curl
function curlhead() { curl -s -D - $1 -o /dev/null; }

#alias for simple python server
#serves current directory on localhost:3000
alias simpleserver="python -m SimpleHTTPServer 3000"