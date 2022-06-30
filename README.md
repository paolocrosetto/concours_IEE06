# IEE06: Concours IE INRAE -- Epreuve pratique  --  Paris 29 juin 2022

This github repo contains all the material needed for the practical task. 

## The task

You are *expected* to:

- **clone** or download this github repo locally
- **read** this documentation
- **solve** the two tasks, using the programming language of your choice (among *Python*, *Fortran*)
- **comment** on your work and answer questions

Your work will be projected overhead for you and the whole jury to see. You can address comprehension questions to the jury anytime.

You **can** use google, stackoverflow, or any other online resource you might find useful.

You **can not** message a friend to help you solve the task. 

## Hardware

### Your PC
You have a choice of operating system:
  * linux (ubuntu 18 LTS)
  * Windows VM

A special account **"candidat"** has been created on each OS.

For storing your work, you will use a specific directory:
  * "Candidat" for linux (in the home directory)
  * The same directory shared with the Windows VM as the **Z:** drive (also named Candidat)
  
## Software
In either operating system, the system is pre-loaded with, among others:
  * Notepad++/Geany
  * VSCode
  * git command line
  * python 3
  * C++, Fortran (gcc compilers)

Shortcuts for accessing these tools have been attached to either the menu bar (linux) or
the task bar (Windows). There is also a shortcut for Firefox.

## Exercise 1: coding

[Identity.txt](Identity.txt) is a file that contains tab-separated text, over 4 columns.
The first line contains the name of the variables. 

Here are the first 5 lines of the file:

<pre>
#name age country city
Sarah 18 England Manchester
Tom 17 Germany Friburg
tim 25 germany berlin
Pierre 32 FRANCE Narbonne
...
</pre>

_A._ **In the language of your choice** (Fortran/Python) write a program that list for each country,
the number of people and their mean age. The expected output should look like this:

<pre>
  country persons_nb mean_age
1 ENGLAND          1     18.0
3  FRANCE          2     36.5
2 GERMANY          2     21.0
4   ITALY          1     29.0
</pre>

_B._ **Add at least three lines to the file, save and run the code again**

_C._ **Commit your changes to your local branch**


## Exercise 2: code review (Python/Fortran)

We produced a code implementing the same functionality both in Python and Fortran. 

You can find the code in the files:

**Python**: code_review.py

**Fortran**: code_review.f90, tools.f90

Using the file in the language of your choice, please:

- read the code
- what does it do? add the documentation to the function with a comment
- add an example with a print statement
- commit your changes to your local branch
