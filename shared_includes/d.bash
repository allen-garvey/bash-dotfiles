#shared includes for dlang

#setup src directory and makefile if it doesn't exist for new D project
function d_setup() {
	local d_setup_dir="${DOTFILES_DIR}dlang/";
	
	mkdir -p ./src; 
	mkdir -p ./bin; 
	
	if [ ! -f ./GNUmakefile ]; then 
		cat "${d_setup_dir}default_GNUmakefile" >> ./GNUmakefile; 
	fi

	if [ ! -f ./makefile ]; then 
		cat "${d_setup_dir}default_makefile" >> ./makefile; 
	fi 
}