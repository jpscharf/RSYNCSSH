#!/bin/sh
################################################
#
# RSYNCSSH
# 
# Version: 2.0.0-b4 (2012AUG21)
################################################

# Setup script variables
APP_VERSION="2.0.0-b4"
APP_BUILD="35"
APP_NAME="RSYNCSSH"
APP_DATE="2012AUG21"

# Usage Information
APP_USAGE="$(basename $0) $APP_VERSION [--quiet|-q] [--usage|-u] [--verbose|-v] [--version] -- use rsync over ssh
where:
    -k, --keyfile   NOT IMPLIM  path to the keyfile to use
                                default: \$HOME/.ssh/id_rsa
    -q, --quiet                 show nothing
    -v, --usage                 show this screen
    --verbose                   show everything
    --version                   show the version number"

# Process parameters
for arg
do
	case $arg in
		--verbose | [-]v*)
			# verbose
			APP_VERBOSE=$arg 
			;;
			
		--quiet | -q)
			# quiet mode
			APP_QUIET=">& /dev/null"
			;;

		--version)
			# version
			echo "$APP_NAME v$APP_VERSION [$APP_BUILD] ($APP_DATE)"
			exit
			;;
		
		--usage | -u)
		    # usage
		    echo "$APP_USAGE"
		    exit
		    ;;
		
		*)
			# unknown variable
			if [ "$APP_PARAM_ERROR" != "" ]
			then
				APP_PARAM_ERROR="$APP_PARAM_ERROR, $arg"
			else
				APP_PARAM_ERROR="Unknown Parameter(s): $arg"
			fi
			;;	
	
	esac

done

# Check for errors in parameters
if [ "$APP_PARAM_ERROR" != "" ]
then
	printf '\a'
	echo -e "$APP_NAME ($APP_VERSION): ABORTED\n$APP_PARAM_ERROR"
	exit
fi

# Setup Keyfile
if [ "$KEYFILE" = "" ]
then
    KEYFILE="$HOME/.ssh/id_rsa"
fi

#KEYFILE="/home/jpscharf/keys/rsync-svn-serenity"

# Setup Local Path
LOCAL_PATH="/home/jpscharf/svn_backups/"

# Setup remote path
REMOTE_PATH="/volume1/NetBackup/svn/"

# Setup SSH Host
SSH_HOST="jasonscharf.org"

# Setup ssh command
SSH_COM="ssh $APP_VERBOSE -p 7822 -oPreferredAuthentications=publickey -i $KEYFILE"

# Setup rsync command
RSYNC_COM="rsync -azl $APP_VERBOSE -e \"$SSH_COM\" $SSH_HOST:$REMOTE_PATH $LOCAL_PATH"

if [ "$APP_QUIET" = "" ]
then

	echo "################################################"
	echo $APP_VERSION $APP_NAME
	echo "################################################"

	echo "Keyfile Setup: $KEYFILE"
	echo "Local path configured: $LOCAL_PATH"
	echo "Remote path configure: $REMOTE_PATH"
	echo "SSH host configured: $SSH_HOST"
	echo -e "SSH command generated:\n$SSH_COM"
	echo -e  "rsync command generated:\n$RSYNC_COM"
	echo "Running...."
fi

# Run rsync
eval $RSYNC_COM $APP_QUIET

# wrap up
exit $?

#rsync -azlvvv -e $SSHCOM:/volume1/NetBackup/svn/ /home/jpscharf/svn_backups
#rsync -azlvvv -e $SSHCOM $SSHHOST:$REMOTE_PATH $LOCAL_PATH

# ssh -vvv -oPreferredAuthentications=publickey root@192.168
#  
#rsync -azl -e "ssh -p7822" /home/jpscharf/svn_backups/ root@jasonscharf.org:/volume1/NetBackup/svn/
#rsync -azlvvv -e "ssh -vvvv -p7822 -i /home/jpscharf/keys/rsync-svn-serenity" 
#jasonscharf.org:/volume1/NetBackup/svn/ /home/jpscharf/svn_backups/
