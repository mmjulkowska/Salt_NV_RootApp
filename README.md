# Salt_NV_RootApp
This Application was build to allow exploration of the natural variation in Root System Architecture.

The App can be either accessed here or run locally from your device.

To do this please open R and type in the following command:
library(shiny)
shiny::runGitHub("mmjulkowska/Salt_NV_RootApp", "mmjulkowska")

The required libraries to be installed are:
shiny, ggplot2, car, multcomp, RColorBrewer, doBy, plotrix, car, gplots, colorRamps, plotly

The code underlying the App is freely available at the github for use and reproduction or tweaking to your own results.

How to use the App:
1. In order to examine which RSA traits we scored, please have a look at the first tab, where we describe our experimental set-up and give a detailed description of all RSA traits collected

2. To compare the RSA phenotypes of individual accessions between different conditions studied in our study (0, 75 or 125 mM NaCl), please have a look at the second tab - you can select the accession from the menu either by clicking on one, or starting to type its name.
You can change the phenotype in the side panel. The histogram below the graph is showing the natural variation observed in the entire HapMap population.

3. To compare the phenotypes of (up to) 8 different accessions, please select the accessions in Tab 3. If you wish to select less than 8 accessions, just repeat the name of some accessions in the individual input boxes.
The letters above the graph represent the Tuckey pair-wise test with p-treshold value of 0.05.

4. To examine the relationship between RSA components at different conditions, you can have a look at the correlation plots in tab 4. 

5. To do cluster analysis on the three traits of your interest, you can select them in Tab 5.

Happy data exploration!
