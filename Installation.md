# Installation steps

# Step 0: Getting `R` #

If you don't have `R`, you should get the lastest version from http://www.r-project.org/


# Step 2: Downloading the lastest version of `rdspl` #

Get into the _Downloads_ section and download the lastest version of `rdspl` (click [here](https://code.google.com/p/rdspl/downloads/list)).

Keep in mind where the ZIP file was downloaded.

# Step 3: Install the package #

Once `R` is running and before installing the library you have to be shure that XML and xlsx libraries are installed, so

```
> install.packages('XML', dependencies = T)
> install.packages('xlsx', dependencies = T)
```

after that, you should enter the following code:

```
> install.packages('[where the zip file is]/rdspl_0.1.zip', repos = NULL)
```

# Step 4: Check if everything is Ok #

Run the following linges
```
> library(rdspl) # load the library, the following messages should appear
Loading required package: XML
Loading required package: xlsx
Loading required package: xlsxjars
Loading required package: rJava

# Running the demo
> demo(dspl)
```