# VS Code

VS Code is an amazing IDE which allows you to work with any file type(py, sql, ipnb, docker, env, md, json, js, html, css, xlsx, pdf etc.), amazing interaction with git, docker etc.
VS Code also allows fully customized and programmable user and workspace settings and comes with hundreds of useful extensions. As we agreed to use PyCharm for Python development, we will keep using VS Code only for things which cannot be done in PyCharm effectively. 
- converting `ipynb` files to `py` files and converting `py` files into `ipynb` files. As of July 2020 VSCode was the only IDE doing this conversion properly in both directions.
- the extensions for git and the visualization of changes in VS Code is amazing

# Adding multiple folders into PYTHONPATH and using the Run mode
* Create a `.env` file if you havent already
* Set a PYTHONPATH environment variable with the paths you need for developing, running, testing windows: `PYTHONPATH=./src;./tests`, linux: `PYTHONPATH=./src:./tests`

## VS Code Keyboard shortcuts

`ALT + Z` to trigger word wrap
`CTRL + SHIFT + P` to trigger the command palette
`CTRL + P` to search for a file within the repository