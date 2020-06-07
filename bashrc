# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4 foldmethod=marker
# ----------------------------------------------------------------------------
#  Author: Mubarak Alrashidi (DeaDSouL)
# Package: dsBash
#    Info: Setting up your bash environment
# License: GNU/GPL v3
#     URL: https://github.com/DeaDSouL/dsBash
# ----------------------------------------------------------------------------



# ----------------------------------------------------------------------------
#       DO NOT EDIT ABOVE THIS LINE, UNLESS YOU ARE A DEVELOPER ;)
# ----------------------------------------------------------------------------

# Modify the following to fit your needs

# Whether you're using a dark or light background in your terminal
TERMBG='dark' # light | dark

# ----------------------------------------------------------------------------
#     DO NOT EDIT BELOW THIS LINE, UNLESS YOU KNOW WHAT YOU ARE DOING.
# ----------------------------------------------------------------------------



# ----------------------------------------------------------------------------
# getting the real script's directory #{{{
# source: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    TARGET="$(readlink "$SOURCE")"
    if [[ $TARGET == /* ]]; then
        #echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
        SOURCE="$TARGET"
    else
        DSBASHDIR="$( dirname "$SOURCE" )"
        #echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DSBASHDIR')"
        SOURCE="$DSBASHDIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    fi
done
#echo "SOURCE is '$SOURCE'"
#RDIR="$( dirname "$SOURCE" )"
DSBASHDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
#if [ "$DSBASHDIR" != "$RDIR" ]; then
#    echo "DIR '$RDIR' resolves to '$DSBASHDIR'"
#fi
#echo "DIR is '$DSBASHDIR'"
#}}}
# Loading bash & alias configurations #{{{
[[ -f "${DSBASHDIR}/alias" ]] && source "${DSBASHDIR}/alias";

# Note: maclin always should be loaded first
case $OSTYPE in
    linux-gnu)
        [[ -f "${DSBASHDIR}/bashrc.maclin" ]] && source "${DSBASHDIR}/bashrc.maclin";
        [[ -f "${DSBASHDIR}/bashrc.linux" ]] && source "${DSBASHDIR}/bashrc.linux";
        [[ -f "${DSBASHDIR}/alias.maclin" ]] && source "${DSBASHDIR}/alias.maclin";
        [[ -f "${DSBASHDIR}/alias.linux" ]] && source "${DSBASHDIR}/alias.linux";
        osesche='\e'	# Escape character‌​ for 'echo' in colors
        load_linux=true;
        load_maclin=true;
    ;;
    darwin*)
        [[ -f "${DSBASHDIR}/bashrc.maclin" ]] && source "${DSBASHDIR}/bashrc.maclin";
        [[ -f "${DSBASHDIR}/bashrc.mac" ]] && source "${DSBASHDIR}/bashrc.mac";
        [[ -f "${DSBASHDIR}/alias.maclin" ]] && source "${DSBASHDIR}/alias.maclin";
        [[ -f "${DSBASHDIR}/alias.mac" ]] && source "${DSBASHDIR}/alias.mac";
        osesche='\x1B'	# Escape character‌​ for 'echo' in colors
        load_mac=true;
        load_maclin=true;
    ;;
    freebsd*)
        echo 'FreeBSD is not supoorted yet !'
    ;;
    *)
        echo "${OSTYPE} : Unknown Operating System!"
    ;;
esac
#}}}
# Colors #{{{
# Usage: echo -e '${BRed}test'
# Reset
NC=${osesche}'[0m'              # No Color: Text Reset
# Regular Colors
BLACK=${osesche}'[0;30m'        # Black
RED=${osesche}'[0;31m'          # Red
GREEN=${osesche}'[0;32m'        # Green
YELLOW=${osesche}'[0;33m'       # Yellow
BLUE=${osesche}'[0;34m'         # Blue
PURPLE=${osesche}'[0;35m'       # Purple
CYAN=${osesche}'[0;36m'         # Cyan
WHITE=${osesche}'[0;37m'        # White
# Bold
BBLACK=${osesche}'[1;30m'       # Black
BRED=${osesche}'[1;31m'         # Red
BGREEN=${osesche}'[1;32m'       # Green
BYELLOW=${osesche}'[1;33m'      # Yellow
BBLUE=${osesche}'[1;34m'        # Blue
BPURPLE=${osesche}'[1;35m'      # Purple
BCYAN=${osesche}'[1;36m'        # Cyan
BWHITE=${osesche}'[1;37m'       # White
# Underline
UBLACK=${osesche}'[4;30m'       # Black
URED=${osesche}'[4;31m'         # Red
UGREEN=${osesche}'[4;32m'       # Green
UYELLOW=${osesche}'[4;33m'      # Yellow
UBLUE=${osesche}'[4;34m'        # Blue
UPURPLE=${osesche}'[4;35m'      # Purple
UCYAN=${osesche}'[4;36m'        # Cyan
UWHITE=${osesche}'[4;37m'       # White
# Background
ON_BLACK=${osesche}'[40m'       # Black
ON_RED=${osesche}'[41m'         # Red
ON_GREEN=${osesche}'[42m'       # Green
ON_YELLOW=${osesche}'[43m'      # Yellow
ON_BLUE=${osesche}'[44m'        # Blue
ON_PURPLE=${osesche}'[45m'      # Purple
ON_CYAN=${osesche}'[46m'        # Cyan
ON_WHITE=${osesche}'[47m'       # White
# High Intensity
IBLACK=${osesche}'[0;90m'       # Black
IRED=${osesche}'[0;91m'         # Red
IGREEN=${osesche}'[0;92m'       # Green
IYELLOW=${osesche}'[0;93m'      # Yellow
IBLUE=${osesche}'[0;94m'        # Blue
IPURPLE=${osesche}'[0;95m'      # Purple
ICYAN=${osesche}'[0;96m'        # Cyan
IWHITE=${osesche}'[0;97m'       # White
# Bold High Intensity
BIBLACK=${osesche}'[1;90m'      # Black
BIRED=${osesche}'[1;91m'        # Red
BIGREEN=${osesche}'[1;92m'      # Green
BIYELLOW=${osesche}'[1;93m'     # Yellow
BIBLUE=${osesche}'[1;94m'       # Blue
BIPURPLE=${osesche}'[1;95m'     # Purple
BICYAN=${osesche}'[1;96m'       # Cyan
BIWHITE=${osesche}'[1;97m'      # White
# High Intensity backgrounds
ON_IBLACK=${osesche}'[0;100m'   # Black
ON_IRED=${osesche}'[0;101m'     # Red
ON_IGREEN=${osesche}'[0;102m'   # Green
ON_IYELLOW=${osesche}'[0;103m'  # Yellow
ON_IBLUE=${osesche}'[0;104m'    # Blue
ON_IPURPLE=${osesche}'[0;105m'  # Purple
ON_ICYAN=${osesche}'[0;106m'    # Cyan
ON_IWHITE=${osesche}'[0;107m'   # White
#}}}
# Setting FG color #{{{
if [[ $TERMBG == 'light' ]]; then 
    FG=${BLACK}
else
    FG=${WHITE}
fi
#}}}
# ----------------------------------------------------------------------------





# ----------------------------------------------------------------------------
# Notes & URLs #{{{
# http://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
# http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
#}}}
