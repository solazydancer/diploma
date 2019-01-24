#!/bin/bash
. /etc/profile
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
# added by Anaconda2 2.5.0 installer
export PATH="/Users/dariaskok/anaconda/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
PATH=$PATH:/Library/PostgreSQL/9.5/bin
cd /Users/dariaskok/Documents/git/my_vkr
bundle exec rake parse_authors