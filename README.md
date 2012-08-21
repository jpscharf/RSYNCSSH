syncSSH
========
A wrapper script for using rsync over ssh.

Usage: syncSSH [-k, --keyfile][-q,--quiet] [-u,--usage] [-v,--verbose] [-v, --version]

	-k, --keyfile				Path to the key file to use for
        						authentication.
        						(default: $HOME/.ssh/id_rsa)
        						*NOT IMPLIMENTED*
    -l, --local-path			Local path, source path for syncing.
    							*NOT IMPLIMENTED*
    -q, --quiet                 Run quietly with no output.
    -r, --remote-path			Remote path, destination path on
    							remote host for syncing.
    							*NOT IMPLIMENTED*
    -u, --usage                 Display the help/usage information.
    -v, --verbose				Verbose mode.  Causes script to print
        						debugging messages about its progress.
        						This is helpful in debugging connection,
        						authentication, and configuration problems.
        						Multiple -v options increase the verbosity.
        						The maximum is 3.
	--version                   show the version number
		