#Network related aliases

alias hosts="sudo -E vim /etc/hosts;"

#prints out http headers for url - arg $1 is url
#http://stackoverflow.com/questions/10060098/getting-only-response-header-from-http-post-using-curl
function curlhead() {
	if [[ -z $1 ]]; then
		>&2 echo "usage: ${FUNCNAME[0]} url"
		return 1;
	fi

	if [ -x "$(command -v http)" ]; then
		http $1 --head;
	elif [ -x "$(command -v curl)" ]; then
		curl -s -D - $1 -o /dev/null;
	else
		>&2 echo "curl or HTTPie required for ${FUNCNAME[0]}"
		return 1;
	fi
}

#alias for simple python server
#serves current directory on localhost:3000
function simpleserver() {

	if [ -x "$(command -v php)" ]; then
		php -S localhost:3000
	elif [ -x "$(command -v python)" ]; then
		python -m SimpleHTTPServer 3000
	else
		>&2 echo "php or python required for ${FUNCNAME[0]}"
		return 1;
	fi
}

# based on: https://stackoverflow.com/questions/4421633/who-is-listening-on-a-given-tcp-port-on-mac-os-x
function get_listener() {
	if [[ -z $1 ]]; then
		>&2 echo "usage: ${FUNCNAME[0]} port"
		return 1;
	fi

	local PORT=$1

	lsof -nP -iTCP:"$PORT" | grep LISTEN || echo "Nothing listening on port $PORT"
}

function kill_listener() {
	if [[ -z $1 ]]; then
		>&2 echo "usage: ${FUNCNAME[0]} port"
		return 1;
	fi

	local PORT=$1

	local PID=$(lsof -nP -iTCP:$PORT | grep LISTEN | awk -F ' ' '{print $2}')

	if [[ ! -z "$PID" ]]; then
		kill -9 "${PID}";
	fi
}
