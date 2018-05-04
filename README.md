# Administrative
Qixuan Yang. Update: May 3rd 2018.
## Github instruction
In this working group, we primarily working with `git` to manage the workflow of different projects. The reason behind is that our projects requires complicated, multi-stage coding, and it is hard to distribute such tasks via conventional cloud or server. Most importantly, Github provides a good user-experience with the versioning, which means you can trace back the modification of the source codes and who did it.

Please work through the following 15-Minute git tutorial first: [https://try.github.io](https://try.github.io). Afterwards, you can install git on Windows or on UNIX.

If you ever forget how to use the git, please klick here: [git - the simple guide - no deep shit!](http://rogerdudler.github.io/git-guide/).

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

Use `cd` and `mkdir` command to create a repository. In the future, you will be using this working directory to handle all the source codes. 

Then, type the following (Please substitute the John Doe with your name):
```shell
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```
type in `git init` to initialize a git repository in that folder.

### Working with this repo via command line

Then, please read the guide to complete the following task:

1. Cloning this repo: https://github.com/OpenGovSurv/Administrative.git

2. Create a file with "_.txt" in your off line repo. Please edit this file with the following content (Windows users can use `edit`, mac users `nano` or `vim`).

```shell
hello world.
```
 
 3. Create a branch with the name: first name_last name. Useful link: http://rogerdudler.github.io/git-guide/
 
 4. Add, commit and push this file on the your created branch.

```shell
git commit
```

 5. Modify content of the file main.r according to the description in this file. Add, commit and push your modified file on the master branch. Commit message should be:
 
```shell
git commit -m "<first name>_<last name>"
```
 
 6. After all of you have done this, pull out the files on the online repo to your local one. Merge with your own branch.
 
 ## Jupyter-Notebook
 We will use Jupyter-Notebook to coordinate, visualize the coding. Since we might run data cleansing and statistical modelling in R, webscraping and interactive plotting via Python, and data simulations in MATLAB or Julia, a notebook which can manage all these scripts can substantially enhance your coding experience (Although the installation can be tricky for Windows users ^^). Jupyter notebook based on Python/IPython, but you can also install APIs to realize the implementation of other languages there.
 
 Before we gestarted with Jupyter-Notebook, we need to download python (3.5 or higher). I strongly recommend to use the Anaconda distribution
 
 ### Anaconda, Python, Jupyter Notebook
 
 Please go to this page to [download Anaconda](https://www.anaconda.com/download/). Windows guys follow [this documentation] (https://docs.anaconda.com/anaconda/install/windows) and mac guys [this one](https://docs.anaconda.com/anaconda/install/mac-os#macos-graphical-install). Then, follow this [guide](https://conda.io/docs/user-guide/tasks/manage-python.html) to install ``python`` 3.6 , ``numpy`` and ``scipy``.
 
 Mac users can follow this [guide](http://jupyter.readthedocs.io/en/latest/install.html#) by using ``pip`` to install the jupyter notebook (If you have already Python3 on your device).
 
 Windows users should install ``pip`` by simply typing the following text in the command line.
 
  ```shell
 conda install pip
 ```
 
### Virtual Environment installation
Mac Users:
```shell
pip install virtualenv
virtualenv -p python3 .env
```
Windows Users:
 ```shell
pip install virtualenv
virtualenv -p python .env
 ```

 If Windows guys still have trouble with it, please do the following things (Borrowed from Deeplearning Programming Course at University of Konstanz):
 
 - Get the Linux for Windows Subsystem: [https://docs.microsoft.com/en-us/windows/wsl/install-win10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- Install python and pip for Windows and add python to PATH: [https://python-forum.io/Thread-Basic-Part-1-Python-3-6-and-pip-installation-under-Windows](https://python-forum.io/Thread-Basic-Part-1-Python-3-6-and-pip-installation-under-Windows) 
- Important: `DO NOT use any directories including the space character at any level!`

Install numpy: numpy can be troublesome - if `pip` fails to install them you can either try `easy_install`

```shell
easy_install numpy==1.14.2
easy_install scipy=0.19.1
```
if this also doesn't work, you can manually download precompiled versions of the libraries and install them using pip:

  - [https://www.lfd.uci.edu/~gohlke/pythonlibs/#numpy](https://www.lfd.uci.edu/~gohlke/pythonlibs/#numpy)
  - [http://www.lfd.uci.edu/~gohlke/pythonlibs/#scipy](http://www.lfd.uci.edu/~gohlke/pythonlibs/#scipy)

```shell
pip install ..\numpy*.whl
pip install ..\scripy*.whl
```

### Activate the virtual environment
Mac users
```shell
source .env/bin/activate 
cd YOUR_REPO
jupyter-notebook

deactivate # Leave the virtual environment
```

Windows users
```shell
.env\Scripts\activate
cd YOUR_REPO
jupyter-notebook

deactivate # Leave the virtual environment
```

### Install R-Kernel for Jupyter
Please follow this guide: [https://irkernel.github.io/installation/#binary-panel](https://irkernel.github.io/installation/#binary-panel)

### Task
Activate the virtual environment and jupyter-notebook. Create a R file named "<family name>_jupyter" (with the .ipynb suffix). Play around with the interface a little bit. Generate some random numbers for two different variables with the same length of observations, and plot a dot plot and a regression line (You can use `base` or `ggplot2`). Run this, customize the markdown. Save it. Then add, commit, push it on the master branch, with the message 

```shell
  init R
```

### Introduction to Python
- Work through the section of "Beginning Python" on this [blog](http://thepythonguru.com). 
- If you have time, have a look at the advanced section, particularly about recursion.
- Work through the list comprehension of python here on [Datacamp](https://www.datacamp.com/community/tutorials/python-list-comprehension)

## Numpy and Pandas (Transfer your coding knowledge or R into Python...)
- Work through the official tutorial of numpy: [https://docs.scipy.org/doc/numpy-1.14.0/user/quickstart.html](https://docs.scipy.org/doc/numpy-1.14.0/user/quickstart.html)
- Work through the official tutorial of pandas: [http://pandas.pydata.org/pandas-docs/version/0.15/10min.html#min](http://pandas.pydata.org/pandas-docs/version/0.15/10min.html#min)

## Working with np and pd

TBA









