# Administrative
## Github instruction
In this working group, we primarily working with `git` to manage the workflow of different projects. The reason behind is that our projects requires complicated, multi-stage coding, and it is hard to distribute such tasks via conventional cloud or server. Most importantly, Github provides a good user-experience with the versioning, which means you can trace back the modification of the source codes and who did it.

Please work through the following 15-Minute git tutorial first: [https://try.github.io](https://try.github.io). Afterwards, you can install git on Windows or on UNIX.

### Install `git`
Windows user please klick [here](https://www.atlassian.com/git/tutorials/install-git#windows), and Mac user click [here](https://www.atlassian.com/git/tutorials/install-git#mac-os-x) to install `git`. For collaborating purpose, we also need to install [Github Desktop](https://desktop.github.com) on our computer.

### Initializing your local repository and cloning the online repo
Firstly, go to the command line. I found a great [introduction](https://launchschool.com/books/command_line/read/command_line_interface#commoncommands) for this, and it lists some common commands there:

Command	Description

`cd`	Change directory.

`ls`	List files and directories in current directory.

`pwd`	Display the path of the current directory.

`touch`	Create a file.

`mkdir`	Create a directory.

`rm`	Remove a file or directory. Warning: deleting a file or directory with this command is permanent!

`cp`	Copy a file or directory.

`mv`	Move or rename a file or directory.

`echo`	Print text to STDOUT.

`cat`	Display contents of a file.

`more`	Display contents of a file, starting at the top and letting the user scroll down.

`less`	Display contents of a file in an even more interactive way.

`head`	Display the first part of a file.

`tail`	Display the last part of a file.

`man`	Display documentation about a command.

Use `cd` and `mkdir` command to create a repository. In the future, you will be using this working directory to handle all the source codes. And then, type in `git init` to initialize a git repository in that folder.

