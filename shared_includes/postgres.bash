# shared includes for postgres

function pg_backup(){
	if [[ "$#" -ne 1 ]] ; then
    	echo "usage: ${FUNCNAME[0]} database_name";
    	return 1;
	fi

	local database_name="$1";
	local current_timestamp=$(date -u '+%Y-%m-%d_%H-%M-%S-utc');
	local output_file="${database_name}__${current_timestamp}.sql";

	# test if database exists first
	# https://stackoverflow.com/questions/14549270/check-if-database-exists-in-postgresql-using-shell
	psql "$database_name" -c '' && \
	pg_dump "$database_name" | gzip --best > "./${output_file}.gz"
}

function pg_backup_data(){
	if [[ "$#" -ne 1 ]] ; then
    	echo "usage: ${FUNCNAME[0]} database_name";
    	return 1;
	fi

	local database_name="$1";
	local current_timestamp=$(date -u '+%Y-%m-%d_%H-%M-%S-utc');
	local output_file="${database_name}__${current_timestamp}__data-only.sql";

	# test if database exists first
	# https://stackoverflow.com/questions/14549270/check-if-database-exists-in-postgresql-using-shell
	psql "$database_name" -c '' && \
	pg_dump "$database_name" --data-only | gzip --best > "./${output_file}.gz"
}

function pg_backup_schema(){
	if [[ "$#" -ne 2 ]] ; then
    	echo "usage: ${FUNCNAME[0]} database_name schema_name";
    	return 1;
	fi

	local database_name="$1";
	local schema_name="$2";
	local current_timestamp=$(date -u '+%Y-%m-%d_%H-%M-%S-utc');
	local output_file="${database_name}--${schema_name}__${current_timestamp}.sql";

	# test if database exists first
	# https://stackoverflow.com/questions/14549270/check-if-database-exists-in-postgresql-using-shell
	psql "$database_name" -c '' && \
	pg_dump "$database_name" --schema="$schema_name" | gzip --best > "./${output_file}.gz"
}

function pg_import(){
	if [[ "$#" -ne 2 ]] ; then
    	echo "usage: ${FUNCNAME[0]} database_name import_file.sql";
    	return 1;
	fi

	local database_name="$1";
	local import_file="$2";
	
	psql "$database_name" -v ON_ERROR_STOP=1 < "$import_file"
}