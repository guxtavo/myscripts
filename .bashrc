# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
export ZZOFF=""  # desligue funcoes indesejadas
export ZZPATH="/home/gfigueir/redhat/git/myscripts/funcoeszz-13.2.sh"  # script
source "$ZZPATH"

# Variables
export PS1="[\W]\$ "
export PATH=$PATH:~/redhat/scripts::~/redhat/git/myscripts/rh
export HISTSIZE=9999999
#export PROMPT_COMMAND='history -a; history -n; echo -n "pwd: "; pwd; echo ""'

# User specific aliases
alias edit_alias="vi ~/.bashrc;. ~/.bashrc"
alias l="ls -l" 
alias lr="ls -ltr | tail -40" 
alias ssh="ssh -X -o TCPKeepAlive=yes"

# Red Hat specific aliases
alias dropbox="lftp ftp://gfigueir@flopbox.corp.redhat.com"
alias fubar="ssh -c blowfish gfigueir@fubar.gsslab.pnq.redhat.com"
alias optimus="ssh gfigueir@optimus.gsslab.rdu2.redhat.com"
alias gg="/home/gfigueir/redhat/git/support-scripts/internal/gg"
alias csr="~/redhat/git/myscripts/csr"
alias rhst="redhat-support-tool"
alias rter="printf '\e[8;40;105t'"
alias rh="cd ~/redhat/git/myscripts/rh"
alias p="dbus-send --session --dest=org.hexchat.service --print-reply --type=method_call /org/hexchat/Remote org.hexchat.plugin.Command string:'msg #gss-emea'"
alias c="csr -m|less"
alias x="xsos -ay .|more"

# User specific Functions
kb() { redhat-support-tool  kb $1 | less ; }
loc() { find . -name "*$1*" ; }
new() { mkdir ~/redhat/cases/$1; rhst getattachment -c $1 -asm -d ~/redhat/cases/$1 ; cd ~/redhat/cases/$1 ; }
cdc() { if [ -d  ~/redhat/cases/$1 ]; then cd ~/redhat/cases/$1 ; ls -l ; else mkdir ~/redhat/cases/$1; cd ~/redhat/cases/$1 ; ls -l ; fi ; }
erpm() { rpm2cpio $1 | cpio -idmv ; }
eimg() { bzcat $1 | cpio -idmv img.$1 ; }
iexec() { tmp_file=`mktemp`; \
          curl -s "$1" -o $tmp_file ; \
          chmod +x $tmp_file ; \
          $tmp_file; \
          rm -f $tmp_file ; }
eexec() { iexec http://etherpad.corp.redhat.com/ep/pad/export/${1}/latest?format=txt ; }

# tshark functions
t_con() { tshark -tad -r $1 -z "conv,tcp" -q ; }
t_phs() { tshark -tad -r $1 -z "io,phs" -q ;}
t_exp() { tshark -tad -r $1 -z "expert,note,tcp" -q ; }

# History specific command
shopt -s histappend
set -o emacs


