# VS Code

VS Code is an amazing IDE which allows you to work with any file type(py, sql, ipnb, docker, env, md, json, js, html, css, xlsx, pdf etc.), amazing interaction with git, docker etc.

VS Code allows fully customized user and workspace settings and comes with hundreds of useful extensions. 

In order to get along well with VSCode, understand the difference between User and Workspace settings. User settings are set for all Workspaces (most commonly for all your repositories) while the Workspace settings are valid only for the currently opened repository.

What we love about VSCode is to have a fully customizable settings files in `settings.json`. In this file, you can adjust and set any setting of your IDE that you like. This makes VSCode an amazing IDE in the long-run, the more time you spend in it, the more you can tailor it to your needs and preferences.

- converting `ipynb` files to `py` files and converting `py` files into `ipynb` files. As of July 2020 VSCode was the only IDE doing this conversion properly in both directions.
- the extensions for VS Code and the option to fully customize your IDE via `JSON` files give you a tailored solution for your needs

When coding in VSCode and you would like to see the documentation of the function, class, object, its methods and their arguments, just hit `CTRL + SPACE` and navigate with arrow keys through all the available options.
# Run and debug mode

Run and debug mode allows you to run your code line by line and observer all the variables and processes. It provides you with a Debug Console where you can run test code to try to fix an encountered error or just explore your code from a specific line. 

To debug python code you need to have a python extension installed which supports the python language. `ms-python.python` is recommended.

VSCode also supports multi-threaded debugger for each thread.

## How to launch
Hit `CTRL + SHIFT + D` and the bar for the Run and Debug mode will open.

If you have not yet created the `launch.json` file VS Code will walk you through creating it automatically just by choosing the programming language and file to open. `launch.json` sets how the workspace will run the code in the Run and Debug mode. For example you can set a custom PATH here if needed, which terminal should be used, from which file the code should run etc. 

If you have already created the `launch.json` the Run and Debug mode will open according to the configuration set up within the `launch.json`.

Hitting `F5` will launch the run and debug for the currently active file.

You can have multiple different configurations prepared within the `launch.json`. 

If you wish to stop the code execution on a specific method but after executing the previous methods, eg. `object.method1.method2.method3` you can do so with an inline breakpoint. Go to the place where you want to set the inline breakpoint and hit `SHIFT + F9`.

You can also set a function breakpoint, which will stop the code execution any time a specific function is hit. In the breakpoints bar hit the plus sign to add a function breakpoint.

## Breakpoints
If you do not set up any breakpoint, your code will run from start to finish unless an error or exception is raised.

Also if you do not wish to run the code line by line, set up a breakpoint. Once a breakpoint is set up the Run and Debug mode will execute the code until the first breakpoint. 

If you set conditional breakpoints, you can stop the code on a specific loop. Add conditional breakpoint use expression and `iterator == 15` to break on the 15th loop.

You can also set up breakpoint on hit count, e.g. if the breakpoint has been hit 5 times etc.

Manage your breakpoint within the breakpoints tab to have the control over all breakpoints in one place without scrolling through your code.

### Actions
* Continue/Pause (`F5`) Using continue button will run all the code up to the next breakpoint etc. This allows you to go through the parts of your code pretty quickly and always stop where you want.
* Step over (`F10`) Step over will run the next command from your current position within the code.
* Step into (`F11`)
* Step out (`SHIFT + F11`)
* Restart (`CTRL + SHIFT + F5`)
* Stop (`SHIFT + F5`)

If you would like to see breakpoints in ruler and thus navigate to the current or next breakpoint more easily within the file, add the following setting to `settings.json`

```
{
    "debug.showBreakpointsInOverviewRuler": true,
}
```

## Logpoints
Basically a replacement of writing print statements to your code for debugging purposes. For example, if you wish to measure the performance of some of your code chunk, set up a log message with printing the elapsed time. By using the logpoint the message will be printed into the Debug console instead of terminal and the code of the message won't polute your code at all. You can easily commit your code without deleting the print message as it exists only in your IDE. It also allows you to enable and disable the logpoints and thus keep them for later use in the future.

## Variables (Data inspection)
As your code runs line by line, you can observe the specific values of each object within the variables. The Data Viewer for pandas dataframes or numpy arrays comes very handy as you can go through your dataframe or array in very similar fashion as you would within a jupyter notebook. With the help of the debug console you can test your changes to the dataframe right away.

You can set a value of any particular variable and observe how the code would behave in case such data were present.

You can also watch the value of a variable or an expression. (How to use this? Give some example)

If your focus is on variables, you can filter them with typing.

[Official guide to Run and Debug from VSCode][1]
[Official overview of debugging Python code in VSCode][2]

# Linting
## Pylint
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

# VS Code Keyboard shortcuts

`CTRL + F` to search/replace within currently open file

`CTRL + SHIFT + F` to search/replace within the workspace 

`` CTRL + ` `` to toggle the terminal

`` CTRL + SHIFT + ` `` to open the terminal

`CTRL + SPACE` to show documentation of a function, class, method etc.

`CTRL + P` to search for a file within the repository

`CTRL + B` to hide the explorer bar

`ALT + Z` to trigger word wrap

`CTRL + SHIFT + P` to trigger the command palette

`CTRL + SHIFT + D` to open the Run and Debug mode

`CTRL + SHIFT + E` to open the File explorer

`F5` to run and debug currently active file

`CTRL + SHIFT + Y` to open the debug console

`ALT` when hovering over a function/class/method/variable hit ALT to see the extended documentation

`SHIFT + ALT + O` to organize imports

# VS Code and git

Extensions:
* GitLens - Git supercharged
* Git History
* Git Graph
* GitHub Pull Requests and Issues
# Comparison of some basic differences to PyCharm

## VS Code main benefits

* Remote Interpreter, great compatibility with WSL (critical)
* The Run and Debug mode Data view includes filters (very useful on larger datasets)
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

# VS Code troubleshooting
If you encounter the `Error: spawn cmd ENOENT` while using the RUN mode to preview an object on Windows, add `C:\Windows\System32` to your `PATH` system variable.

## Adding multiple folders into PYTHONPATH
* Create a `.env` file if you havent already
* Set a PYTHONPATH environment variable with the paths you need for developing, running, testing: `PYTHONPATH=./src:./tests`

You can also set and extend the PYTHONPATH directly within the `settings.json` file:
```
{
"python.envFile": "${workspaceFolder}/.env",
    "terminal.integrated.env.windows": {
        "PYTHONPATH":"${env:PYTHONPATH}:${workspaceFolder}/src":${workspaceFolder}/tests",
    },
}
```

Path extension syntax needs to be adjusted to your operating system.

Linux, MacOS `:` <br>
Windows `;`

[1]: https://code.visualstudio.com/docs/editor/debugging
[2]: https://code.visualstudio.com/docs/python/debugging