# shared includes for postgres


function pg_backup(){
	if [[ "$#" -ne 1 ]] ; then
    	echo "usage: pg_backup database_name";
    	return 1;
	fi

	local database_name="$1";
	local current_timestamp=$(date -u '+%Y-%m-%d_%H-%M-%S-utc');
	local output_file="${database_name}__${current_timestamp}.sql";

	# test if database exists first
	# https://stackoverflow.com/questions/14549270/check-if-database-exists-in-postgresql-using-shell
	psql "$database_name" -c '' && \
	pg_dump "$database_name" > "./${output_file}"
}