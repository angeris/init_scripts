export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# added by Anaconda 2.2.0 installer
export PATH="/Users/Guille/anaconda/bin:$PATH"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# added by Anaconda3 2.3.0 installer
export PATH="/Users/Guille/anaconda/bin:$PATH"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/Guille/.bash_profile file was backed up as /Users/Guille/.bash_profile.macports-saved_2015-11-06_at_10:28:13
##

# MacPorts Installer addition on 2015-11-06_at_10:28:13: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

alias ls='ls -ahlGpF'
alias rgdb="arm-none-eabi-gdb  --command=~/.gdbinit.arm"
alias scpi="screen /dev/tty.SLAB_USBtoUART 115200"
alias scpir="screen -r"
alias reload_bash="source ~/.bash_profile"
alias csdir="cd ~/Documents/Stanford/Classes/Spring\ 2016/CS41" 
alias rnm="arm-none-eabi-nm"
alias rdump="arm-none-eabi-objdump"
alias rld="arm-none-eabi-ld"
alias cdres="cd ~/Documents/Stanford/Research"
alias rreadelf="arm-none-eabi-readelf"
alias rgcc="arm-none-eabi-gcc"
alias cdsplash="cd ~/Documents/Stanford/Personal/Splash/Spring2016"
