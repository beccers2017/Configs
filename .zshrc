#######################################################
####### Anarchy ZSH configuration file    #######
#######################################################

### Set/unset ZSH options
#########################
# setopt NOHUP
# setopt NOTIFY
# setopt NO_FLOW_CONTROL
setopt INC_APPEND_HISTORY # append history as commands are entered
setopt SHARE_HISTORY # share history between shells
setopt APPEND_HISTORY # don't overwrite history
# setopt AUTO_LIST
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME
unsetopt BG_NICE
setopt CORRECT
setopt EXTENDED_HISTORY
# setopt HASH_CMDS
setopt MENUCOMPLETE
setopt ALL_EXPORT
setopt hist_verify # allow correction of !-expressions before running them
setopt hist_ignore_dups # don't save duplicate entries in history
setopt histignorealldups 
setopt histreduceblanks
setopt histignorespace
setopt hist_no_store # don't save 'history' cmd in history
setopt extended_history # add timestamps to history

### Set/unset  shell options
############################
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent 
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
setopt   nocorrectall; setopt correct
unsetopt bgnice autoparamslash beep
setopt clobber # > and >> work as expected
setopt multios # enable piping to multiple outputs
setopt interactivecomments # enable comments in interactive mode
setopt autocd # automatically change directory
setopt autopushd # use "pushd" instead of "cd", enabling use of "popd"
setopt pushdsilent # make "popd" be less verbose (like cd)
setopt pushdignoredups # don't record the same directory as multiple entries
setopt pushdtohome
setopt cdable_vars
setopt autocontinue
setopt long_list_jobs
setopt always_to_end
setopt menucomplete
setopt listpacked
setopt complete_in_word
setopt automenu
setopt globdots
setopt extendedglob
setopt markdirs
setopt numeric_glob_sort
setopt rc_quotes
setopt rec_exact
setopt autoparamslash
### Autoload zsh modules when they are referenced
#################################################
autoload -U history-search-end
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
#zmodload -ap zsh/mapfile mapfile
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

### Set variables
#################
PATH="/usr/local/bin:/usr/local/sbin/:$PATH"
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000
HOSTNAME="`hostname`"
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

### Load colors
###############
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done

### Set prompt
##############
PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="[%(!.${PR_LIGHT_GREEN}%n.$PR_CYAN%n)%(!.${PR_LIGHT_YELLOW}@.$PR_LIGHT_YELLOW@)$PR_NO_COLOR%(!.${PR_LIGHT_GREEN}%U%m%u.${PR_LIGHT_GREEN}%U%m%u)$PR_NO_COLOR:%(!.${PR_LIGHT_GREEN}%2c.${PR_CYAN}%2c)$PR_NO_COLOR]%(?..[${PR_LIGHT_GREEN}%?$PR_NO_COLOR])%(!.${PR_CYAN}#.${PR_LIGHT_GREEN}$) "
RPS1="$PR_LIGHT_GREEN(%D{%m-%d %H:%M})$PR_NO_COLOR"
unsetopt ALL_EXPORT

### Set alias
#############
alias ll="ls -al"
alias ls="ls --color=auto"
alias ping="ping -c 3"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias c="clear"
alias ports="netstat -tulanp"
alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot"
alias update="sudo yum update"
alias mount="sudo mount"
alias umount="sudo umount"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias hist="history"
alias j="jobs -l"
alias e="exit"
alias l="ls"
alias p="pwd"
alias h="cd ~"
alias /="cd /"
alias iptables="sudo iptables -L -nv"
alias systemctl="sudo systemctl"
alias firewall-cmd="sudo firewall-cmd"
alias yum="sudo yum"

### Bind keys
#############
autoload -U compinit
compinit
bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*' glob 'yes'
zstyle ':completion:*:functions' ignored-patterns '_*' # Ignore completion functions for unavailable commands
zstyle ':completion:*' ignore-parents parent pwd 
zstyle ':completion::*:(rm|vi|kill|diff):*' ignore-line true # Don't match the same filename multiple times

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

### Source plugins
##################
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function retlog() {
    if [[ -z $1 ]]; then
        echo '/var/log/nginx/access.log'
    else
        echo $1
    fi
}

# directory ls
dls() {
    print -l *(/)
}

# prints content of directories in a tree like format
if ! (( $+commands[tree] )); then
    tree() {
        find $@ -print | sed -e 's;[^/]*/;|___;g;s;___|; |;g'
fi
    }

function psg() {
    if [ ! -z $1  ]; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1
    else
        echo "Need name to grep for"
    fi
}

function extract () {
    if [ -f $1  ]; then
        case $1 in
            *.tar.bz2) tar xjf $1;;
            *.tar.gz) tar xzf $1;;
            *.bz2) bunzip2 $1;;
            *.rar) rar x $1;;
            *.gz) gunzip $1;;
            *.tar) tar xf  $1;;
            *.tbz2) tar xjf $1;;
            *.tgz) tar xzf $1;;
            *.zip) unzip $1;;
            *.Z) uncompress $1;;
            *) echo "'$1' cannot be extracted via extract()";;
        esac
    else
        echo "'$1' is not a valid file"
    fi   
}

newdirs() {
    I=1
    while( [[ $I -le $1  ]] ); dp
        ls -ld *(/om[$I])
        let I++
    done;
}

newfiles() {
    I=$1
    let I++
    ls -Alht | head -$I | tail -$1
}

removespace() {
    autoload zmv
    zmv -n '(**/)(* *)' '$1${2//( #-## # | ##)/-}'
}


