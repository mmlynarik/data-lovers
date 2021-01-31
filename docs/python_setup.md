[Python path problems?][1]

# Set up virtualenvwrapper on Ubuntu in BASH
Make sure you set the following in `~/.bash_profile`:
* path to python
* path to the folder where you want to have your venvs, set the path to the WORKON_HOME variable
* path to the `virtualenvwrapper.sh`

```
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.8
export WORKON_HOME=$HOME/venvs
source $HOME/.local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$HOME/venvs
```

[1]: https://hackersandslackers.com/so-youve-fucked-up-your-python-path/