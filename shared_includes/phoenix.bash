#Elixir Phoenix and umbrella aliases

alias phxs="mix phx.server"
alias phxs_tunnel="UMBRELLA_DB_PORT=6789 phxs"

alias minitaur="ssh root@minitaur.test"
alias minitaur_db_tunnel="ssh -L 6789:localhost:5432 root@minitaur.test"

alias umbrella="sites umbrella"
alias photog="sites umbrella/apps/photog"

function shutterbug_webp(){
    if [[ "$#" -ne 1 ]] ; then
        echo "usage: ${FUNCNAME[0]} photos_source_dir";
        return 1;
    fi

    local source_dir="$1";

    sites umbrella/apps/photog;
    UMBRELLA_DB_PORT="6789" mix shutterbug "$source_dir" --webp
}

function guggenheim(){
    if [[ "$#" -ne 2 ]] ; then
        echo "usage: ${FUNCNAME[0]} source_dir description";
        return 1;
    fi

    local source_dir="$1";
    local description="$2"

    sites umbrella/apps/artour;
    UMBRELLA_DB_PORT="6789" mix guggenheim "$source_dir" "$description"
}

function distill_artour_site(){
    sites umbrella/apps/artour;
    UMBRELLA_DB_PORT="6789" mix distill.site
}

function distill_artour_html(){
    sites umbrella/apps/artour;
    UMBRELLA_DB_PORT="6789" mix distill.html
}