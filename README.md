syncSSH
========
A wrapper script for using rsync over ssh.

Usage: syncSSH [-k, --keyfile keyfile] [-l, --local-path localpath]  [-q,--quiet] [-r, remote-path remotepath]  [-u,--usage] [-v,--verbose] [-v, --version]

	-k, --keyfile keyfile			Path to the key/identity file to use for
        							authentication.
        							(default: ~/.ssh/id_rsa)
        							*NOT IMPLIMENTED*
        							
    -l, --local-path localpath		Local path, source path for syncing.
    								*NOT IMPLIMENTED*
    								
    -q, --quiet                 	Run quietly with no output.
    
    -r, --remote-path remotepath	Remote path, destination path on
    								remote host for syncing.
    								*NOT IMPLIMENTED*
    								
    -u, --usage                 	Display the help/usage information.
    
    -v, --verbose					Verbose mode.  Causes script to print
        							debugging messages about its progress.
        							This is helpful in debugging connection,
        							authentication, and configuration problems.
        							Multiple -v options increase the verbosity.
        							The maximum is 3.
        							
	--version                   	show the version number
		