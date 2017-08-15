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

### 1. Examine the phenotypes of individual accessions. 

![alt text](https://user-images.githubusercontent.com/14832460/29319232-ef6c5a8a-81db-11e7-9334-fc2b04c43aba.png)

To compare the RSA phenotypes of individual accessions between different conditions studied in our study (0, 75 or 125 mM NaCl), please have a look at the second tab - you can select the accession from the menu either by clicking on one, or starting to type its name.
You can change the phenotype in the side panel. The histogram below the graph is showing the natural variation observed in the entire HapMap population.

### 2. Compare the RSA phenotypes for significant differences between up to 8 accessions

![rsa_tab3](https://user-images.githubusercontent.com/14832460/29319371-7dc1174e-81dc-11e7-87ac-a856629d5491.png)

To compare the phenotypes of (up to) 8 different accessions, please select the accessions in Tab 3. If you wish to select less than 8 accessions, just repeat the name of some accessions in the individual input boxes.

The letters above the graph represent the Tuckey pair-wise test with p-treshold value of 0.05.

### 3. Examine the correlation between individual RSA traits at different conditions

![rsa_tab4](https://user-images.githubusercontent.com/14832460/29319382-85430ef0-81dc-11e7-8ee0-7f5204853c86.png)

To examine the correlations between the individual RSA traits in control or salt stress conditions, you can pick a phenotype on the side panel and examine the distribution of the accessions in the scatter plot. You can identify individual accessions by putting your coursor over the dot, revealing the accession name and its coordinates. 

The correlations were performed using Pearson correlation method.

### 4. Cluster the accessions based on the three traits of your interest. 

In our paper we performed cluster analysis on three traits that we thought to be most interesting. However, we do not exclude the possibility that other scientists might have a different opinion on importance of our traits - whether you want to examine RSA only under control conditions, or focus only on the root zonation. Therefore, we developed the feature allowing the user to perform their own clustering.

![rsa_tab5a](https://user-images.githubusercontent.com/14832460/29319384-8544cbd2-81dc-11e7-9efb-778f466bdb81.png)

In __Step 1__ the user can chose up to three phenotypes to perform the clustering. 

The relationship between the accessions is established depending on the chosen phenotype. For calculating the relationship between the accessions we used Ward's Hierarchical Clustering Method (ward.D2). 

![rsa_tab5b](https://user-images.githubusercontent.com/14832460/29319383-8543d718-81dc-11e7-8a7c-52e9135848be.png)

In __Step 2__ the user has to chose at what distance would the dendrogram tree be cut. The dendrogram representing the relationship between the accessions can be found in the second sub-tab of "Cluster Analysis".

![rsa_tab5c](https://user-images.githubusercontent.com/14832460/29319381-85407172-81dc-11e7-9ca7-fb5b59cb3fc4.png)

The cluster validation can be performed in __Step 3__, where the individual accessions are grouped depending on their cluster belonging. The individual phenotypes can be selected in the side panel. 

![rsa_tab5d](https://user-images.githubusercontent.com/14832460/29319380-8511c3a4-81dc-11e7-951e-ed83c15484af.png)

The file containing the data on which accessions belong to which cluster can be downloaded from __Step 4__ tab. 

Happy data exploration!
