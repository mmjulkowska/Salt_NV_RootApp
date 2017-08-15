## Salt_NV_RootApp

This Application was build as a supplement to the paper __"Genetic components of root architecture remodeling in response to salt"__
by _Magdalena M. Julkowska Iko Koevoets, Selena Mol, Huub Hoefsloot, Richard Feron, Mark A. Tester, Joost J.B. Keurentjes, Arthur Korte, Michel A. Haring, Gert-Jan de Boer, Christa Testerink._

The manuscript is currently undergoing a review process. The App was build to allow interactive exploration of the natural variation in Root System Architecture of Arabidopsis thaliana.

The App can be either accessed [here](http://genseq-h0.science.uva.nl/shiny/Salt_NV_Root/) or run locally from your device.

To do this please open R and type in the following command:
`library(shiny)`
`shiny::runGitHub("mmjulkowska/Salt_NV_RootApp", "mmjulkowska")`
The required libraries to be installed are:

shiny, ggplot2, car, multcomp, RColorBrewer, doBy, plotrix, car, gplots, colorRamps, plotly

You install the packages by typing 
`install.packages("shiny")`
in your R command window.

The code underlying the App is freely available at the [github](https://github.com/mmjulkowska/Salt_NV_RootApp) for use and reproduction or tweaking to your own results.

## What can you do with the App:

###1. Examine the phenotypes of individual accessions. 

![alt text](https://user-images.githubusercontent.com/14832460/29319232-ef6c5a8a-81db-11e7-9334-fc2b04c43aba.png)

To compare the RSA phenotypes of individual accessions between different conditions studied in our study (0, 75 or 125 mM NaCl), please have a look at the second tab - you can select the accession from the menu either by clicking on one, or starting to type its name.
You can change the phenotype in the side panel. The histogram below the graph is showing the natural variation observed in the entire HapMap population.

###2. Compare the RSA phenotypes for significant differences between up to 8 accessions

![alt text](https://github.com/mmjulkowska/Salt_NV_RootApp//raw/master/src/common/images/RSA_Tab3.pdf, "RSA_Tab3.pdf")

To compare the phenotypes of (up to) 8 different accessions, please select the accessions in Tab 3. If you wish to select less than 8 accessions, just repeat the name of some accessions in the individual input boxes.

The letters above the graph represent the Tuckey pair-wise test with p-treshold value of 0.05.

###3. Examine the correlation between individual RSA traits at different conditions

###4. Cluster the accessions based on the three traits of your interest. 


Happy data exploration!
