#!/bin/bash
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
# ----------------------------------------------------------------------------
#  Author: Mubarak Alrashidi (DeaDSouL)
# Package: dsBash
#    Info: Setting up your bash environment
# License: GNU/GPL v3
#     URL: https://github.com/DeaDSouL/dsBash
# ----------------------------------------------------------------------------
# .bash_profile --> This is the first file to be checked in MacOS.
# .profile -------> This is the first file to be checked in Linux.
# .bashrc --------> This is the most used file to configure bash.
# .bash_profile <- .profile <- .bashrc <- dsBash/bashrc
# ---------------------------------------------------------------------

echo 'Installing dsBash,...'

# ---------------------------------------------------------------------

# getting the real script's directory
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

# ---------------------------------------------------------------------

_BASH_PROFILE_CMD='[[ -f ~/.profile ]] && source ~/.profile;'
_PROFILE_CMD='[[ -f ~/.bashrc ]] && source ~/.bashrc;'
_DSBASHRC_CMD="[[ -f '${DSBASHDIR}/bashrc' ]] && source '${DSBASHDIR}/bashrc';"

# ---------------------------------------------------------------------

grep -l "$_BASH_PROFILE_CMD" ~/.bash_profile > /dev/null 2>&1 || echo "$_BASH_PROFILE_CMD" >> ~/.bash_profile
grep -l "$_PROFILE_CMD" ~/.profile > /dev/null 2>&1 || echo "$_PROFILE_CMD" >> ~/.profile
grep -l "$_DSBASHRC_CMD" ~/.bashrc > /dev/null 2>&1 || echo "$_DSBASHRC_CMD" >> ~/.bashrc

# ---------------------------------------------------------------------

source ~/.bash_profile

echo "${BBLUE}dsBash${NC} ${FG}was installed successfullyi !"
echo ''
echo "${FG}The current loaded aliases:"
ds.alias_loaded
echo ''
echo "${FG}To see the available aliases, try:${NC} ${BLUE}ds.alias_all"
echo "${FG}Enjoy${NC} ${YELLOW}:)"

