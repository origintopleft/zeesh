function zle-accept-line-with-ssh () {
    # prevent replacing empty lines with "ssh -p"
    if [[ ${BUFFER} == "" ]]; then
        zle .accept-line
        return
    fi

	firstword=${BUFFER[(w)1]}
	# Rough translation: "if @ is in firstword"
	if [[ ${firstword[(i)@]} -le ${#firstword} ]]; then # Lit: "if the index of '@' within firstword is less than the length of firstword"
		origbuffer=$BUFFER

		cmd=${firstword%@*} # set cmd to everything BEFORE the @
		host=${firstword#*@} # set host to everything AFTER the @
		# ports!
		if [[ ${host[(i):]} -le ${#host} ]]; then
			port="-p ${host#*:}"
			host=${host%:*}
		fi
		args=${origbuffer#${firstword} } # set args to everything AFTER the first word
		[[ $args == $firstword ]] && args="" # Prevent "command command@host" from running a command with no args

		if [[ $cmd == "" ]] && [[ $args == "" ]]; then
			BUFFER="ssh $port $host"
		else
			BUFFER="ssh $port -t $host \"$cmd ${args}\""
		fi
	fi
	unset host port cmd
	zle .accept-line
}

zle -N accept-line zle-accept-line-with-ssh
