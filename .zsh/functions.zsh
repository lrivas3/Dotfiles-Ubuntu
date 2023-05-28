########################################################################################################################
########################### 			        SAVIFY                                           ###############################
#######################################################################################################################

# savify

function savi(){
    savify $1 -q best -f mp3 -o $XDG_MUSIC_DIR -g "%artist%/%album%"
}
#######################################################################################################################
########################### 			        IMPROVEMENTS                                           ###############################
#######################################################################################################################

# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}


# fzf improvement
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}
#######################################################################################################################
########################### 			        HACKING                                           ###############################
#######################################################################################################################



# Create
function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

# Extract nmap information
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

# destroy file
function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}


#######################################################################################################################
########################### 			        GIT                                           ###############################
#######################################################################################################################

function gcop () {
  git log \
    --reverse \
    --color=always \
    --format="%C(cyan)%h %C(blue)&ar%C(auto)%d \
              %C(yellow)%s%+b %C(black)%ae" "$@" | fzf -i -e +s \
      --reverse \
      --tiebreak=index \
      --no-multi \
      --ansi \
      --preview="echo {} |
                 grep -o '[a-f0-9]\{7\}' |
                 head -1 |
                 xargs -I % sh -c 'git show --color=always % |
                 diff-so-fancy'" \
      --header "enter: view, C-c: copy hash" \
      --bind "enter:execute:$_viewGitLogLine | less -R" \
      --bind "ctrl-c:execute:$_gitLogLineToHash |
              xclip -r -selection clipboard"
}

#######################################################################################################################
########################### 			        KUBERNETES                                    ###############################
#######################################################################################################################


# Ver las variables de entorno de los pods, todas, no solo las de los manifiestos

#function podsenv($pod){
#  kubectl -n set env pod/$pod --list
#}

#######################################################################################################################
########################### 			        CONVERT IMAGES TO ANOTHER FORMAT              ###############################
#######################################################################################################################

#uses imagemagick package
function topng(){
    for file in ./*; do convert $file "${file}.png"; done
}

########################################################################################################################
########################### 			        EXTRACT FILES              ###############################
#######################################################################################################################


function extract () {
    if [ -f $1 ] ; then
            case $1 in
            *.tar.bz2)    tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.tar.xz)    tar xf $1       ;;
            *.bz2)        bunzip2 $1     ;;
            *.rar)        unrar x $1     ;;
            *.gz)        gunzip $1       ;;
            *.tar)        tar xvf $1     ;;
            *.tbz2)        tar xvjf $1   ;;
            *.tgz)        tar xvzf $1    ;;
            *.zip)        unzip $1       ;;
            *.Z)        uncompress $1    ;;
            *.7z)        7z x $1         ;;
            *)        echo "No se como descomprimir este '$1'..." ;;
            esac
    else
            echo "'$1' no es un archivo valido!"
    fi
 }


