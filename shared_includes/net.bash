#Network related aliases

alias hosts="sudo -E vim /etc/hosts;"

#prints out http headers for url - arg $1 is url
#http://stackoverflow.com/questions/10060098/getting-only-response-header-from-http-post-using-curl
function curlhead() { curl -s -D - $1 -o /dev/null; }

#alias for simple python server
#serves current directory on localhost:3000
function simpleserver() {
	port_num_regex='^[1-9]+[0-9]{3,}$'
	port_num='3000'

	if [[ $1 =~ $port_num_regex ]]; then
		port_num="$1"
	fi
	python -m SimpleHTTPServer "$port_num"
}
