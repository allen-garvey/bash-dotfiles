function bash_profile() {

	if [ -x "$(command -v subl)" ]; then
		subl ~/.bash_profile;
	else
		vim ~/.bash_rc;
	fi
}