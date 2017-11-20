k5start -f ~/.guillean.keytab -u guillean

set -o vi # Set vi style

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/Guille/.bash_profile file was backed up as /Users/Guille/.bash_profile.macports-saved_2015-11-06_at_10:28:13
##

# MacPorts Installer addition on 2015-11-06_at_10:28:13: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Add npm to path
export PATH="/Users/Guille/.npm-global/bin:$PATH"

# Adding Julia to PATH
PATH="/Applications/Julia-0.6.app/Contents/Resources/julia/bin:${PATH}"

alias ls='ls -ahlGpF'
alias rgdb="arm-none-eabi-gdb"
alias scpi="screen /dev/tty.SLAB_USBtoUART 115200"
alias scar="pio device monitor"
alias scpir="screen -r"
alias reload_bash="source ~/.bash_profile"
alias csdir="cd ~/Documents/Stanford/Classes/Winter2017/EE180"
alias rnm="arm-none-eabi-nm"
alias rdump="arm-none-eabi-objdump"
alias rld="arm-none-eabi-ld"
alias cdres="cd ~/Documents/Stanford/Research"
alias rreadelf="arm-none-eabi-readelf"
alias rgcc="arm-none-eabi-gcc"
alias cdsplash="cd ~/Documents/Stanford/Personal/Splash/Spring2016"
alias cdgit="cd ~/Documents/Programming/GitHub"
alias cl="clear"
alias newmac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"
alias gw="wmctrl -r GTKWave -e 0,0,0,100,100"
alias mgcc="msp430-elf-gcc"
alias mgdb="msp430-elf-gdb"
alias mgdbss="gdb_agent_console ~/ti/msp430_gcc/msp430.dat"
alias stmup="/Users/Guille/Documents/Programming/GitHub/stm32loader/stm32loader.py"
alias vim="/Applications/MacVim.app/Contents/bin/vim"
alias cdweb="~/Documents/Writing/Website"

eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# MacPorts Installer addition on 2016-12-09_at_20:01:56: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2017-02-27_at_21:13:30: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="$PATH:/Users/Guille/.platformio/packages/toolchain-icestorm/bin"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="$PATH:/Applications/Scansion.app/Contents/MacOS"
export PYTHONPATH="$PYTHONPATH:/Users/Guille/Documents/Programming/GitHub/CS448H/magma"
export PATH="$PATH:/Users/Guille/ti/msp430_gcc/bin"
#export PATH="~/.npm-global/bin:$PATH"
#export NPM_CONFIG_PREFIX=~/.npm-global
export PATH="$PATH:/Users/Guille/Documents/Programming/Utilities/gcc-arm-none-eabi/bin"

export PYTHONPATH="$PYTHONPATH:/Users/Guille/Documents/Stanford/Research/brainflow"
export PYTHONPATH="$PYTHONPATH:/Users/Guille/Documents/Stanford/Research/bundlemethod/code/Python"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
