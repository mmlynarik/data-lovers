# VS Code

VS Code is an amazing IDE which allows you to work with any file type(py, sql, ipnb, docker, env, md, json, js, html, css, xlsx, pdf etc.), amazing interaction with git, docker etc.

VS Code allows fully customized user and workspace settings and comes with hundreds of useful extensions. 

- converting `ipynb` files to `py` files and converting `py` files into `ipynb` files. As of July 2020 VSCode was the only IDE doing this conversion properly in both directions.
- the extensions for VS Code and the option to fully customize your IDE via `JSON` files give you a tailored solution for your needs

# Adding multiple folders into PYTHONPATH and using the Run mode
* Create a `.env` file if you havent already
* Set a PYTHONPATH environment variable with the paths you need for developing, running, testing windows: `PYTHONPATH=./src;./tests`, linux: `PYTHONPATH=./src:./tests`

# Pylint
If you are experiencing problems with pylint make sure it is setup correctly. 

Pylint must be installed in the virtual environment you are currently using and its path needs to be set properly. You can make sure of it in the `settings.json` file.

```
"python.pythonPath": "/home/jurajpalka/venvs/finapp/bin/python",
"python.linting.pylintPath": "/home/jurajpalka/venvs/finapp/bin/pylint",
"python.linting.pylintEnabled": true,
"python.linting.enabled": true,
```

If you are experiencing problems with pylint import error even though the code works just fine, add the source folders of your project to your PYTHONPATH in a `.env` file.

Example:
```
PYTHONPATH=./src:./tests
```

## VS Code Keyboard shortcuts

`CTRL + F` to search/replace within currently open file

`CTRL + SHIFT + F` to search/replace within the workspace 

`` CTRL + ` `` to toggle the terminal

`` CTRL + SHIFT + ` `` to open the terminal

`CTRL + P` to search for a file within the repository

`CTRL + B` to hide the explorer

`ALT + Z` to trigger word wrap

`CTRL + SHIFT + P` to trigger the command palette

# Comparison of some basic differences to PyCharm

## VS Code main benefits

* Remote Interpreter, great compatibility with WSL (critical)
* The Run mode = Debugger data view includes filters (very useful)
* higher customization and an extension for anything (personal preference)
* better for developing also other stuff than python (personal preference)
* you need to setup configurations in JSON settings files, which prepares you better for moving your code to production (useful)
* including settings configuration in a JSON file transfers the setup also to other people via git; no need to explain how to configure your IDE (useful)
* easy conversion to and from jupyter notebooks (very useful if you use them)
* free integration with jupyter notebooks (useful if you use them)
* you can sync your user settings to your GitHub account and get going right away on any machine
 
## PyCharm main benefits

* the integrated python console allows row after row code execution;  in VS Code you must launch the debugger (critical)
* shows variables all the time, VS Code doesn't show variables unless run in debugger mode (very useful)
* includes as many Python consoles as you need while Code has only the terminal, for a console you need to run the debugger (critical) 
* easier to use for people who do not want to spend time setting up paths, variables and other configs (useful)
* PyCharm shows variable types directly next to the variable, in VS Code you need to hover over the variable to see its type (useful)
* PyCharm debugger has a feature RUN to coursor which is very handy, in VS Code you need to set breakpoints to achieve the same behaviour (useful)
* initially I liked VCS implementation in VSCode more, now I got used to the PyCharm one and prefer it instead, I guess it is a matter of getting used to one or the other (personal preference)

## Conclusion
For casual development of analytics scripts and calculation logic PyCharm Community Edition is the best option

For developing code that ends up in production, VSCode is a better option for the way it handles configurations and for the fact that the remote interpreter is free.