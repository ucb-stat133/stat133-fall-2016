# Lab 9: Simulations and Shiny Apps

The goals of this lab are:

- getting started with simulations in R
- learn how to create a basic shiny app
- put in practice concepts from your introductory statistics course(s)


## Motivation

The idea is to simulate tossing a coin $n$ times in order to compute:

- the total number of heads and tails in $n$ tosses
- the relative frequencies of heads and tails
- how does the relative frequencies (of heads) varies over the series of tosses

From the conceptual point of view, you will use a shiny app to visualize the 
notion of __chance error__ when simulating tossing a coin a given number of 
times.



## Plot

There are two options for the displayed plot: 

1. shows the chance error (i.e. number of heads minus half the number of tosses) on the y-axis, and the number of tosses on the x-axis.
2. shows the percent error (i.e. proportion of heads) on the y-axis, and the number of tosses on the x-axis.


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "chance-error")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/chance-error")
runApp()
```
