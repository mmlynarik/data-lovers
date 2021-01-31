## PyCharm

As having a unified IDE within the team makes cooperation and peer to peer advice easier, we decided to use a unified IDE for Python = PyCharm. 

[Download PyCharm Community Edition][1]

[PyCharm Overview][2]

### Configuration
If your imports don't work and you don't know why, try changing your configuration. 
1. Open `Edit Configurations`
2. Click `Templates`
3. Click `Python`
4. Set your working directory to the root of your project (assuming you want your code running from root)

In case you wish to set multiple source directories without root being the source, go to 
`File -> Settings -> Project Structure` and set the root directory and its sources. This is useful when you have a fully functional app in src and config files and scripts used for building artifacts in root and another directory for tests. (In such case, you would set the `src` and `tests` as sources.)

### PyCharm debugger
> Use the debugger when you are getting an issue within your code

The break point allows you to run the code only until the breakdown while creating all the variables until that point and their values.
Add a new watch for playing with the variables. This is useful for checking expressions based on the available variables at that point.
Use `step into` to get into a method if needed.
Use `step into my code` to get into the next line of your code. 
Use `step over` to skip a part of the code

### PyCharm keyboard shortcuts
`CTRL + ALT + S` to open settings<br>
`CTRL + N` to open a general search everywhere for any type of file<br>
`CTRL + R` to find and replace string in the opened file<br>
`CTRL + ALT + L` to format your current code<br>
`CTRL + ALT + SHIFT + L` to reformat the entire file<br>
`CTRL + ALT + T` when highlighted a word it opens a dropdown box for surround with<br>
`ALT + SHIFT + E` to execute the currently selected line in the console<br>
`SHIFT + ESC` to hide the active tab (project, tools etc.)<br>
`CTRL + E` to open recently open/changed files<br>
`ALT + 1` to open/close projects tab<br>
`ALT + 9` to open/close git tab<br>
`CTRL + SHIFT + A` to open search for actions<br>
`CTRL + SHIFT + F12` to hide all windows except the code<br>
`CTRL + SHIFT + F` to search within all your files in the project<br>
`ALT + ENTER` when on a definition of a function it will give you an option to generate a docstring<br>
`CTRL + ALT + O` to optimize imports<br>
`CTRL + ALT + SHIFT + Insert` to create a scratch file (write code into a file without creating it, it is deleted after the file is closed)<br>

### Pycharm file status highlights
What do file colors mean is described in [file status highlights][3].

### Rollback changed file 
Changed files are blue. To undo your changes go to the left vertical column and click on `0: Commit` (under 1:Project). In `Default Changelist` you can see your changed files. After double click on the file you will see your changes. If you want to undo the changes you must right-click on the file and choose `Rollback...`.

### Python Interpreter
We run code with Python interpreter: `name of your virtural enviroment`. You can check it in the right bottom. If there is another interpreter you have to change it. You set this: `File` -> `Settings` -> `Project:general` -> `Python Interpreter` and choose `Python interpreter: name of your virtual enviroment`. If you don‘t see it in the scrolling menu you must click on the gear icon next to the scrolling menu and select `Add...`. Then you must choose `Existing Enviroment` and browse the folder with your enviroment and select the file `python.exe`.
u set this

### Python Console
Running code with `Python Console` is for interactive work. You set this: `Run` -> `Edit Configurations...` and mark `Run with Python console`.

### Random tips
For full focus on your code, use the Zen mode. (useful when writing documentation in markdown)

[1]: https://www.jetbrains.com/pycharm/
[2]: https://www.youtube.com/watch?v=BPC-bGdBSM8&list=PLQ176FUIyIUZ1mwB-uImQE-gmkwzjNLjP
[3]: https://jetbrains.com/help/pycharm/file-status-highlights.html#editor