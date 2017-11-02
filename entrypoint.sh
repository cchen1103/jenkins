#!/bin/sh

# usage instructions
usage() {

	cat <<- EOF

	usage: jenkins options

	    This docker image creates stand-alone jenkins server on http port 8080 or
			https 443. The container uses volume /jenkins to store all jenkins plugin,
			jobs and status.

			When use https, http will be automatically disabled. Using https requires
			provide path to private key file (use -k or --key) and certificate file
			(use -c or --cert).

	OPTIONS:
	    -h --help			show this help

	EXAMPLES:
	    Run jenkins server:
	    docker run -d -p 8080:8080 -v <local storage>:/jenkins \
				-v /var/run/docker.sock:/var/run/docker.sock cchen1103/jenkins

	    Show help message:
	    docker run cchen1103/jenkins --help
	EOF

}

# parse arguments
opt_parser() {

	local arg=
	for arg; do
		local delim=""
		case "${arg}" in
			--help) args="${args}-h ";;
			*) [[ "${arg:0:1}" == "-" ]] || delim="\""
				args="${args}${delim}${arg}${delim} ";;
		esac
	done

	#Reset the positional parameters to the short options
	eval set -- $args

	OPT=
	while getopts "hms" OPTION; do
		case $OPTION in
		h)
			usage
			exit 0
			;;
		*)
			printf "\nERROR: unknown argument.\n"
			usage
			exit -1;
			;;
		esac
	done

}

# main script starts here

main() {

	set -eo pipefail

	opt_parser $ARGS

	java -Djava.awt.headless=true -jar /jenkins.war ${OPT}

}

# set immutable input argument

readonly ARGS="$@"
main
