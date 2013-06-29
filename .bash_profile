
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/alexanderterrono/.bash_profile file was backed up as /Users/alexanderterrono/.bash_profile.macports-saved_2011-11-19_at_15:12:21
##

# MacPorts Installer addition on 2011-11-19_at_15:12:21: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

#Setting path to have pg_config in it
PATH="/Library/PostgreSQL/9.1/bin/:${PATH}"
export PATH

#Adding Scala to the path
PATH="/usr/scala-2.9.2/bin:${PATH}"

#Adding llvm to the path
PATH="/Users/greg/Downloads/clang+llvm-3.2-x86_64-apple-darwin11/bin:${PATH}"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##
# Your previous /Users/greg/.bash_profile file was backed up as /Users/greg/.bash_profile.macports-saved_2013-05-23_at_01:40:18
##

# MacPorts Installer addition on 2013-05-23_at_01:40:18: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

