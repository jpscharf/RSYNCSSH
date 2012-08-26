##syncSSH##
===========

###Roadmap###
* Add ability to create and use a config file
* Add ability to update itself from the repository
* Create an install scrip that will download the latest version, create keys, copy keys to remote server, create a config file, and add a cron task.

###Usage###

A wrapper script for using rsync over ssh.

	Usage

	-h,--help						Alias of usage (-u, --usage)

	-H,--remote-host [user@]host	IP or DNS name of the ssh remote host.	
										*REQUIRED*
										
	-k,--keyfile keyfile			Path to the key/identity file to use for
        							authentication.
        							
    -l,--local-path localpath		Local path, source path for syncing.
    								(default: current directory)
    								
	-L,--log-file logfile			Location to save a log of the results.
                                    (default: .\syncSSH.log)
                                    
	-p,--port port					SSH port to use.
    								
    -q,--quiet                 		Run quietly with no output.
    
    -r,--remote-path remotepath		Remote path, destination path on
    								remote host for syncing.
    									*REQUIRED*
    								
    -u,--usage                 		Display the help/usage information.
    
    -v,--verbose					Verbose mode.  Causes script to print
        							debugging messages about its progress.
        							This is helpful in debugging connection,
        							authentication, and configuration problems.
        							Multiple -v options increase the verbosity.
        							The maximum is 3.
        							
	-V,--version                   	Display the version number and exit.
		