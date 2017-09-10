fluidPage(
navbarPage(title="Salt_NV_Root App", inverse=T,theme="bootstrap.css",
# start tabPanel # 1
tabPanel("Background Information",icon = icon("book"),
sidebarPanel(
fluidRow(
h2("About the App"),
helpText("This Application was build to allow further exploration of the natural variation in Root System Architecture. The accompanying paper:",br(), br(), 
h3("Genetic components of root architecture remodeling in response to salt"), 
h5("by Magdalena M. Julkowska Iko Koevoets, Selena Mol, Huub Hoefsloot, Richard Feron, Mark A. Tester, Joost J.B. Keurentjes, Arthur Korte, Michel A. Haring, Gert-Jan de Boer, Christa Testerink"), br(), 
"is currently re-submitted for publication", br(), br(),
"In this study we explore natural variation in RSA development under control and salt stress conditions by screening 347 Arabidopsis accessions of the HapMap population, and explore the association between the multi-trait phenotypes of root architecture and the genotype by using Genome Wide Association", br(),br(),br(),br(),
"App was designed by Magdalena Julkowska, with Shiny App package", br(),br(),
"Contact e-mail:", span("Magdalena.Julkowska@kaust.edu.sa", style="color:blue")),
downloadButton("dataAll", label="Download underlying data")
)),
mainPanel(
navbarPage(title="",
tabPanel("Experimental Set-Up", icon = icon("flask"),
helpText("The sterilized seeds were stratified in 0.1% agar at 4°C in the dark for 72 h and sown on square petri dishes (12 x 12 cm) containing 50 ml of control growth medium consisting of ½ Murashi-Skoog, 0.5% sucrose, 0.1% M.E.S. Monohydrate and 1% Daishin agar, pH 5.8 (KOH), dried for 1 h in a laminar flow. Plates were placed vertically at a 70° angle under long day conditions (21°C, 70% humidity, 16/8h light/dark cycle). Four days old seedlings were transferred to media supplemented with 0, 75 or 125 mM NaCl. Each plate contained four seedlings of two genotypes (two seedlings per genotype). Plates were placed in the growth chamber following a random design and scanned with Epson perfection V700 scanner at 200 dpi every other day until 8 days post transfer. The 8 days old seedlings grown in 0 mM NaCl were used for phenotyping of RSA in control conditions while for both salt stress conditions (75 and 125 mM NaCl) phenotypes of 12 days old seedlings were scored. "),br(),
img(src="setupik.png", align = "right",width="100%"), br(), br(),
helpText("The pictures were analyzed with EZ-Rhizo software (Armengaud et al., 2009). The collected data on RSA phenotypes was cleared of outliers by removing the samples that caused the standard deviation within the genotype be larger than the standard deviation within the HapMap population. ")),
tabPanel("Traits", icon = icon("key"),
helpText("Next to standard RSA traits given as output from EZ-Rhizo, we calculated those additional traits:", br(),
"Lateral Root Length ( = Total Root Size - Main Root Length)" ,br(),
"average Lateral Root Length (Lateral Root Length / number of Lateral Roots)", br(),
"RATIO of Main Root Length per Total Root Size (MRL / TRS)", br(),
"RATIO of Lateral Root Length per Main Root Length (LRL / MRL)", br(),
"RATIO of average Lateral Root Length per Main Root Length (aLRL / MRL)", br(),
"RATIO of Basal zone per Main Root Length (Basal/ MRL)", br(),
"RATIO of Branched zone per Main Root Length (Branched/ MRL)", br(),
"RATIO of Apical zone per Main Root Length (Apical/ MRL)", br(), br(),br(),
img(src="RSA.png", align="center",width="75%")))
)
# end tabPanel # 1
)),
# start tabPanel # 2
tabPanel("Explore the Phenotypes of Individual Accessions", icon=icon("leaf"),
sidebarPanel(
fluidRow(
h3("Examine the RSA one accession at the time"),
helpText("In the study of diversity panels, the phenotypes of individual accessions are often overlooked. Although in our study, we collected data from only four replicates, we wanted to share this data for more detailed examination. In the tabs below you can select the accession and phenotype of interest to be explored.", br(), br(),
strong("DISCLAIMER:"), "The RSA phenotypes of plants grown under control conditions were measured for 8 days old plants, while the RSA of plants grown under salt stress conditions was examined for 12 days old plants", br(), br(),
"The boxplot (upper panel) represent the variation within the selected accession based on the four replicates, while the histogram (lower panel), represents the variation observed for the entire HapMap population across different conditions studied" ),
selectInput("genotype", label=("Genotype of interest"), choices=unique(rsa$Genotype), selected="Col-0"),
selectInput("Trait", label=("Chose a phenotype to display"), choices=list("Total Root Size" = "TRS", "Main Root Length" = "MRPL", "Straightness" = "Straightness", "Main Root Vector Length" = "MRVL","Depth" = "Depth", "Main Root Vector Angle" = "MRVA", "Number of Lateral Roots" = "noLRpMR", "Lateral Root Length" = "LRL", "average Lateral Root Length" = "aLRL", "Lateral Root Density" = "LRDpMR", "Lateral Root Density (per branched zone)" = "LRDpBZ", "Branched Zone Length" = "Branched", "Basal Zone Length" = "Basal", "Apical Zone Length" = "Apical", "RATIO Main Root Length per Total Root Size" = "MRpTRS", "RATIO aLRL per MRL" = "aLRLpMRL", "RATIO LRL per MRL" = "LRLpMRL", "RATIO Basal per MRL" = "BasalpMRL", "RATIO Branched per MRL" = "BranchedpMRL", "RATIO Apical per MRL" = "ApicalpMRL", "Principal Component 1" = "PC1", "Principal Component 2" = "PC2", "Principal Component 3" = "PC3"), selected="TRS"), 
downloadButton("dwnldSub1", label = "Download Data")
)),
mainPanel(
plotOutput("plot1"),
plotOutput("histo1"))
# end tabPanel # 1
),
# start tabPanel # 3
tabPanel("Compare Individual Accessions", icon=icon("balance-scale"),
sidebarPanel(
fluidRow(
h3("Mix and Match"),
helpText("In this tab you can select up to eight genotypes to compare in different conditions, which are presented in individual sub-tabs.", br(), br(), "The boxplots represent the selected phenotype of eight chosen accessions, and the letters above the graphs represent the significant groups as calculated using Tukey pair-wise comparison with p-value < 0.05.", br(), br(),
strong("DISCLAIMER:"), "As the results presented in here are based only on four biological replicates, the significant differences between the accessions should be interpreted with caution."),
column(8, offset = 1,
selectInput("tr2", label=("Chose a phenotype to display"), choices=list("Total Root Size" = "TRS", "Main Root Length" = "MRPL", "Straightness" = "Straightness", "Main Root Vector Length" = "MRVL", "Depth" = "Depth", "Main Root Vector Angle" = "MRVA", "Number of Lateral Roots" = "noLRpMR", "Lateral Root Length" = "LRL", "average Lateral Root Length" = "aLRL", "Lateral Root Density" = "LRDpMR", "Lateral Root Density (per branched zone)" = "LRDpBZ", "Branched Zone Length" = "Branched", "Basal Zone Length" = "Basal", "Apical Zone Length" = "Apical", "RATIO Main Root Length per Total Root Size" = "MRpTRS", "RATIO aLRL per MRL" = "aLRLpMRL", "RATIO LRL per MRL" = "LRLpMRL", "RATIO Basal per MRL" = "BasalpMRL", "RATIO Branched per MRL" = "BranchedpMRL", "RATIO Apical per MRL" = "ApicalpMRL", "Principal Component 1" = "PC1", "Principal Component 2" = "PC2", "Principal Component 3" = "PC3"), selected="aLRL")),
column(4, offset =1, 
selectInput("gen1", label=("Genotype 1"), choices=unique(rsa$Genotype), selected="Col-0"),
selectInput("gen2", label=("Genotype 2"), choices=unique(rsa$Genotype), selected="C24"),
selectInput("gen3", label=("Genotype 3"), choices=unique(rsa$Genotype), selected="Cvi-0"),
selectInput("gen4", label=("Genotype 4"), choices=unique(rsa$Genotype), selected="Kin-0")), 
column(4, offset =1,
selectInput("gen5", label=("Genotype 5"), choices=unique(rsa$Genotype), selected="Tsu-0"), 
selectInput("gen6", label=("Genotype 6"), choices=unique(rsa$Genotype), selected="Sav-0a"), 
selectInput("gen7", label=("Genotype 7"), choices=unique(rsa$Genotype), selected="Gr-5"),
selectInput("gen8", label=("Genotype 8"), choices=unique(rsa$Genotype), selected="Ts-1")), 
downloadButton("dataAcc", label="Download data")
)),
mainPanel(
navbarPage("",
tabPanel("0 mM NaCl", plotOutput("plot2a")), 
tabPanel("75 mM NaCl", plotOutput("plot2b")),
tabPanel("125 mM NaCl", plotOutput("plot2c"))))
# end tabPanel # 3
),
# start tabPanel # 4
tabPanel("Explore the Correlations between Individual Traits", icon=icon("line-chart"),
sidebarPanel(
fluidRow(
h3("How does it correlate?"),
helpText("In this tab you can explore the correlations between individual traits. The values representing individual accessions are based on the average calculated per accession per condition. The names of the accessions are plotted next to the points representing the individual line. The Pearson correlation coefficient (r) and p-value are plotted above the graphs", br(),
"We hope that those correlation graphs will be helpful to select accessions showing extreme phenotypes, that can be used in, for example for bulked segregant analysis or in depth individual study of the accession."),
selectInput("Trait3", label=("Trait 1"), choices=list("Total Root Size 0 mM NaCl" = "TRS.m_0", "Total Root Size 75 mM NaCl" = "TRS.m_75", "Total Root Size 125 mM NaCl" = "TRS.m_125", "Main Root Length 0 mM NaCl" = "MRPL.m_0", "Main Root Length 75 mM NaCl" = "MRPL.m_75", "Main Root Length 125 mM NaCl" = "MRPL.m_125", "Straightness 0 mM NaCl" = "Straightness.m_0", "Straightness 75 mM NaCl" = "Straightness.m_75", "Straightness 125 mM NaCl" = "Straightness.m_125", "Main Root Vector Length 0 mM NaCl" = "MRVL.m_0", "Main Root Vector Length 75 mM NaCl" = "MRVL.m_75", "Main Root Vector Length 125 mM NaCl" = "MRVL.m_125", "Depth 0 mM NaCl" = "Depth.m_0", "Depth 75 mM NaCl" = "Depth.m_75", "Depth 125 mM NaCl" = "Depth.m_125", "Main Root Vector Angle 0 mM NaCl" = "MRVA.m_0", "Main Root Vector Angle 75 mM NaCl" = "MRVA.m_75", "Main Root Vector Angle 125 mM NaCl" = "MRVA.m_125", "Number of Lateral Roots 0 mM NaCl" = "noLRpMR.m_0", "Number of Lateral Roots 75 mM NaCl" = "noLRpMR.m_75", "Number of Lateral Roots 125 mM NaCl" = "noLRpMR.m_125", "Lateral Root Length 0 mM NaCl" = "LRL.m_0", "Lateral Root Length 75 mM NaCl" = "LRL.m_75", "Lateral Root Length 125 mM NaCl" = "LRL.m_125", "average Lateral Root Length 0 mM NaCl" = "aLRL.m_0", "average Lateral Root Length 75 mM NaCl" = "aLRL.m_75", "average Lateral Root Length 125 mM NaCl" = "aLRL.m_125", "Lateral Root Density 0 mM NaCl" = "LRDpMR.m_0", "Lateral Root Density 75 mM NaCl" = "LRDpMR.m_75", "Lateral Root Density 125 mM NaCl" = "LRDpMR.m_125", "Lateral Root Density (per branched zone) 0 mM NaCl" = "LRDpBZ.m_0", "Lateral Root Density (per branched zone) 75 mM NaCl" = "LRDpBZ.m_75", "Lateral Root Density (per branched zone) 125 mM NaCl" = "LRDpBZ.m_125", "Branched Zone Length 0 mM NaCl" = "Branched.m_0", "Branched Zone Length 75 mM NaCl" = "Branched.m_75", "Branched Zone Length 125 mM NaCl" = "Branched.m_125", "Basal Zone Length 0 mM NaCl" = "Basal.m_0", "Basal Zone Length 75 mM NaCl" = "Basal.m_75", "Basal Zone Length 125 mM NaCl" = "Basal.m_125", "Apical Zone Length 0 mM NaCl" = "Apical.m_0", "Apical Zone Length 75 mM NaCl" = "Apical.m_75", "Apical Zone Length 125 mM NaCl" = "Apical.m_125", "RATIO MRL per TRS 0 mM NaCl" = "MRpTRS.m_0", "RATIO MRL per TRS 75 mM NaCl" = "MRpTRS.m_75", "RATIO MRL per TRS 125 mM NaCl" = "MRpTRS.m_125", "RATIO aLRL per MRL 0 mM NaCl" = "aLRLpMRL.m_0", "RATIO aLRL per MRL 75 mM NaCl" = "aLRLpMRL.m_75", "RATIO aLRL per MRL 125 mM NaCl" = "aLRLpMRL.m_125", "RATIO LRL per MRL 0 mM NaCl" = "LRLpMRL.m_0", "RATIO LRL per MRL 75 mM NaCl" = "LRLpMRL.m_75", "RATIO LRL per MRL 125 mM NaCl" = "LRLpMRL.m_125", "RATIO Basal per MRL 0 mM NaCl" = "BasalpMRL.m_0", "RATIO Basal per MRL 75 mM NaCl" = "BasalpMRL.m_75", "RATIO Basal per MRL 125 mM NaCl" = "BasalpMRL.m_125", "RATIO Branched per MRL 0 mM NaCl" = "BranchedpMRL.m_0", "RATIO Branched per MRL 75 mM NaCl" = "BranchedpMRL.m_75", "RATIO Branched per MRL 125 mM NaCl" = "BranchedpMRL.m_125", "RATIO Apical per MRL 0 mM NaCl" = "ApicalpMRL.m_0", "RATIO Apical per MRL 75 mM NaCl" = "ApicalpMRL.m_75", "RATIO Apical per MRL 125 mM NaCl" = "ApicalpMRL.m_125", "Principal Component 1 0 mM NaCl" = "PC1.m_0", "Principal Component 1 75 mM NaCl" = "PC1.m_75", "Principal Component 1 125 mM NaCl" = "PC1.m_125", "Principal Component 2 0 mM NaCl" = "PC2.m_0", "Principal Component 2 75 mM NaCl" = "PC2.m_75", "Principal Component 2 125 mM NaCl" = "PC2.m_125", "Principal Component 3 0 mM NaCl" = "PC3.m_0","Principal Component 3 75 mM NaCl" = "PC3.m_75", "Principal Component 3 125 mM NaCl" = "PC3.m_125"), selected="aLRL.m_75"),
selectInput("Trait4", label=("Trait 2"), choices=list("Total Root Size 0 mM NaCl" = "TRS.m_0", "Total Root Size 75 mM NaCl" = "TRS.m_75", "Total Root Size 125 mM NaCl" = "TRS.m_125", "Main Root Length 0 mM NaCl" = "MRPL.m_0", "Main Root Length 75 mM NaCl" = "MRPL.m_75", "Main Root Length 125 mM NaCl" = "MRPL.m_125", "Straightness 0 mM NaCl" = "Straightness.m_0", "Straightness 75 mM NaCl" = "Straightness.m_75", "Straightness 125 mM NaCl" = "Straightness.m_125", "Main Root Vector Length 0 mM NaCl" = "MRVL.m_0", "Main Root Vector Length 75 mM NaCl" = "MRVL.m_75", "Main Root Vector Length 125 mM NaCl" = "MRVL.m_125", "Depth 0 mM NaCl" = "Depth.m_0", "Depth 75 mM NaCl" = "Depth.m_75", "Depth 125 mM NaCl" = "Depth.m_125", "Main Root Vector Angle 0 mM NaCl" = "MRVA.m_0", "Main Root Vector Angle 75 mM NaCl" = "MRVA.m_75", "Main Root Vector Angle 125 mM NaCl" = "MRVA.m_125", "Number of Lateral Roots 0 mM NaCl" = "noLRpMR.m_0", "Number of Lateral Roots 75 mM NaCl" = "noLRpMR.m_75", "Number of Lateral Roots 125 mM NaCl" = "noLRpMR.m_125", "Lateral Root Length 0 mM NaCl" = "LRL.m_0", "Lateral Root Length 75 mM NaCl" = "LRL.m_75", "Lateral Root Length 125 mM NaCl" = "LRL.m_125", "average Lateral Root Length 0 mM NaCl" = "aLRL.m_0", "average Lateral Root Length 75 mM NaCl" = "aLRL.m_75", "average Lateral Root Length 125 mM NaCl" = "aLRL.m_125", "Lateral Root Density 0 mM NaCl" = "LRDpMR.m_0", "Lateral Root Density 75 mM NaCl" = "LRDpMR.m_75", "Lateral Root Density 125 mM NaCl" = "LRDpMR.m_125", "Lateral Root Density (per branched zone) 0 mM NaCl" = "LRDpBZ.m_0", "Lateral Root Density (per branched zone) 75 mM NaCl" = "LRDpBZ.m_75", "Lateral Root Density (per branched zone) 125 mM NaCl" = "LRDpBZ.m_125", "Branched Zone Length 0 mM NaCl" = "Branched.m_0", "Branched Zone Length 75 mM NaCl" = "Branched.m_75", "Branched Zone Length 125 mM NaCl" = "Branched.m_125", "Basal Zone Length 0 mM NaCl" = "Basal.m_0", "Basal Zone Length 75 mM NaCl" = "Basal.m_75", "Basal Zone Length 125 mM NaCl" = "Basal.m_125", "Apical Zone Length 0 mM NaCl" = "Apical.m_0", "Apical Zone Length 75 mM NaCl" = "Apical.m_75", "Apical Zone Length 125 mM NaCl" = "Apical.m_125", "RATIO MRL per TRS 0 mM NaCl" = "MRpTRS.m_0", "RATIO MRL per TRS 75 mM NaCl" = "MRpTRS.m_75", "RATIO MRL per TRS 125 mM NaCl" = "MRpTRS.m_125", "RATIO aLRL per MRL 0 mM NaCl" = "aLRLpMRL.m_0", "RATIO aLRL per MRL 75 mM NaCl" = "aLRLpMRL.m_75", "RATIO aLRL per MRL 125 mM NaCl" = "aLRLpMRL.m_125", "RATIO LRL per MRL 0 mM NaCl" = "LRLpMRL.m_0", "RATIO LRL per MRL 75 mM NaCl" = "LRLpMRL.m_75", "RATIO LRL per MRL 125 mM NaCl" = "LRLpMRL.m_125", "RATIO Basal per MRL 0 mM NaCl" = "BasalpMRL.m_0", "RATIO Basal per MRL 75 mM NaCl" = "BasalpMRL.m_75", "RATIO Basal per MRL 125 mM NaCl" = "BasalpMRL.m_125", "RATIO Branched per MRL 0 mM NaCl" = "BranchedpMRL.m_0", "RATIO Branched per MRL 75 mM NaCl" = "BranchedpMRL.m_75", "RATIO Branched per MRL 125 mM NaCl" = "BranchedpMRL.m_125", "RATIO Apical per MRL 0 mM NaCl" = "ApicalpMRL.m_0", "RATIO Apical per MRL 75 mM NaCl" = "ApicalpMRL.m_75", "RATIO Apical per MRL 125 mM NaCl" = "ApicalpMRL.m_125", "Principal Component 1 0 mM NaCl" = "PC1.m_0", "Principal Component 1 75 mM NaCl" = "PC1.m_75", "Principal Component 1 125 mM NaCl" = "PC1.m_125", "Principal Component 2 0 mM NaCl" = "PC2.m_0", "Principal Component 2 75 mM NaCl" = "PC2.m_75", "Principal Component 2 125 mM NaCl" = "PC2.m_125", "Principal Component 3 0 mM NaCl" = "PC3.m_0","Principal Component 3 75 mM NaCl" = "PC3.m_75", "Principal Component 3 125 mM NaCl" = "PC3.m_125"), selected="TRS.m_75")
#, downloadButton("downloadPlot3", label = "Download Plot")
)),
mainPanel(helpText("The Pearson Correlation coefficient (r) is ", textOutput("corr"),br(),"The p-value is ",textOutput("corpval")),
plotlyOutput("plot3", height = 600, width = 600))
# end tabPanel # 4
),
# start tabPanel # 5
tabPanel("Cluster Analysis", icon=icon("magic"),
sidebarPanel(
fluidRow(
h3("So you think you can cluster?"),
helpText("In our paper we clustered the accessions based on the ratios of: average Lateral Root Length per Main Root Length, Lateral Root Length per Main Root Length, and Main Root Length per Total Root Size in all conditions studied. However, we realize that such a cluster analysis can be performed for any set of chosen traits. Therefore, in this tab we integrated our dataset so that you can perform your own cluster analysis on the traits of your interest.", br(), br()),
navbarPage("Let's cluster",
tabPanel("Step 1",
helpText("Please select phenotypes that you would like to take into consideration for the cluster analysis.", br(),
"You will see the heat-map of the chosen phenotypes appear in the first tab. The value of the phenotypes is normalized with z-Fisher transformation, so the color scale is normalized for each phenotype"),
selectizeInput("Clust1", label="Traits used for clustering", 
               choices=list("Total Root Size 0 mM NaCl" = "TRS.m_0", "Total Root Size 75 mM NaCl" = "TRS.m_75", "Total Root Size 125 mM NaCl" = "TRS.m_125", "Main Root Length 0 mM NaCl" = "MRPL.m_0", "Main Root Length 75 mM NaCl" = "MRPL.m_75", "Main Root Length 125 mM NaCl" = "MRPL.m_125", "Straightness 0 mM NaCl" = "Straightness.m_0", "Straightness 75 mM NaCl" = "Straightness.m_75", "Straightness 125 mM NaCl" = "Straightness.m_125", "Main Root Vector Length 0 mM NaCl" = "MRVL.m_0", "Main Root Vector Length 75 mM NaCl" = "MRVL.m_75", "Main Root Vector Length 125 mM NaCl" = "MRVL.m_125", "Depth 0 mM NaCl" = "Depth.m_0", "Depth 75 mM NaCl" = "Depth.m_75", "Depth 125 mM NaCl" = "Depth.m_125", "Main Root Vector Angle 0 mM NaCl" = "MRVA.m_0", "Main Root Vector Angle 75 mM NaCl" = "MRVA.m_75", "Main Root Vector Angle 125 mM NaCl" = "MRVA.m_125", "Number of Lateral Roots 0 mM NaCl" = "noLRpMR.m_0", "Number of Lateral Roots 75 mM NaCl" = "noLRpMR.m_75", "Number of Lateral Roots 125 mM NaCl" = "noLRpMR.m_125", "Lateral Root Length 0 mM NaCl" = "LRL.m_0", "Lateral Root Length 75 mM NaCl" = "LRL.m_75", "Lateral Root Length 125 mM NaCl" = "LRL.m_125", "average Lateral Root Length 0 mM NaCl" = "aLRL.m_0", "average Lateral Root Length 75 mM NaCl" = "aLRL.m_75", "average Lateral Root Length 125 mM NaCl" = "aLRL.m_125", "Lateral Root Density 0 mM NaCl" = "LRDpMR.m_0", "Lateral Root Density 75 mM NaCl" = "LRDpMR.m_75", "Lateral Root Density 125 mM NaCl" = "LRDpMR.m_125", "Lateral Root Density (per branched zone) 0 mM NaCl" = "LRDpBZ.m_0", "Lateral Root Density (per branched zone) 75 mM NaCl" = "LRDpBZ.m_75", "Lateral Root Density (per branched zone) 125 mM NaCl" = "LRDpBZ.m_125", "Branched Zone Length 0 mM NaCl" = "Branched.m_0", "Branched Zone Length 75 mM NaCl" = "Branched.m_75", "Branched Zone Length 125 mM NaCl" = "Branched.m_125", "Basal Zone Length 0 mM NaCl" = "Basal.m_0", "Basal Zone Length 75 mM NaCl" = "Basal.m_75", "Basal Zone Length 125 mM NaCl" = "Basal.m_125", "Apical Zone Length 0 mM NaCl" = "Apical.m_0", "Apical Zone Length 75 mM NaCl" = "Apical.m_75", "Apical Zone Length 125 mM NaCl" = "Apical.m_125", "RATIO MRL per TRS 0 mM NaCl" = "MRpTRS.m_0", "RATIO MRL per TRS 75 mM NaCl" = "MRpTRS.m_75", "RATIO MRL per TRS 125 mM NaCl" = "MRpTRS.m_125", "RATIO aLRL per MRL 0 mM NaCl" = "aLRLpMRL.m_0", "RATIO aLRL per MRL 75 mM NaCl" = "aLRLpMRL.m_75", "RATIO aLRL per MRL 125 mM NaCl" = "aLRLpMRL.m_125", "RATIO LRL per MRL 0 mM NaCl" = "LRLpMRL.m_0", "RATIO LRL per MRL 75 mM NaCl" = "LRLpMRL.m_75", "RATIO LRL per MRL 125 mM NaCl" = "LRLpMRL.m_125", "RATIO Basal per MRL 0 mM NaCl" = "BasalpMRL.m_0", "RATIO Basal per MRL 75 mM NaCl" = "BasalpMRL.m_75", "RATIO Basal per MRL 125 mM NaCl" = "BasalpMRL.m_125", "RATIO Branched per MRL 0 mM NaCl" = "BranchedpMRL.m_0", "RATIO Branched per MRL 75 mM NaCl" = "BranchedpMRL.m_75", "RATIO Branched per MRL 125 mM NaCl" = "BranchedpMRL.m_125", "RATIO Apical per MRL 0 mM NaCl" = "ApicalpMRL.m_0", "RATIO Apical per MRL 75 mM NaCl" = "ApicalpMRL.m_75", "RATIO Apical per MRL 125 mM NaCl" = "ApicalpMRL.m_125", "Principal Component 1 0 mM NaCl" = "PC1.m_0", "Principal Component 1 75 mM NaCl" = "PC1.m_75", "Principal Component 1 125 mM NaCl" = "PC1.m_125", "Principal Component 2 0 mM NaCl" = "PC2.m_0", "Principal Component 2 75 mM NaCl" = "PC2.m_75", "Principal Component 2 125 mM NaCl" = "PC2.m_125", "Principal Component 3 0 mM NaCl" = "PC3.m_0","Principal Component 3 75 mM NaCl" = "PC3.m_75", "Principal Component 3 125 mM NaCl" = "PC3.m_125"),
               selected=c("MRPL.m_75","aLRL.m_75","noLRpMR.m_75"), multiple=T)),
tabPanel("Step 2",
helpText("Have a look at the dendrogram by clicking on the tab >> Accession Dendrogram << and determine the number of clusters that you would like to make by choosing a value on the x-axis representing the Ward linkage between the accessions", br(), br(),
strong("ALERT:"), "Please note that if you chose too many clusters this analysis will not be informative and the subsequent post-hoc analysis will not be possible. We advise for the optimal number of clusters between three to ten.", br(), br(),
"Below please enter the value at which you wish to cut the dendrogram - make sure to enter ONLY numerical values. IF you wish to enter values < 1, please use dot - as in 0.01."),
textInput("tree_cut", label="Cut tree at", value="4")),
tabPanel("Step 3",
helpText("Compare the clusters by clicking on the tab >> Cluster Validation << to examine significant differences between your clusters.", br(),br(),
strong("DISCLAIMER:"), "Note that the differences between the clusters may be due to the unequal distribution of the accessions between the samples. Therefore, the results presented in here should be interpreted with caution.", br(),br(),
"Below please select the trait for which you wish to validate your cluster analysis"),
selectInput("Clust_test", label="chose a trait to test", choices=list("Total Root Size 0 mM NaCl" = "TRS.m_0", "Total Root Size 75 mM NaCl" = "TRS.m_75", "Total Root Size 125 mM NaCl" = "TRS.m_125", "Main Root Length 0 mM NaCl" = "MRPL.m_0", "Main Root Length 75 mM NaCl" = "MRPL.m_75", "Main Root Length 125 mM NaCl" = "MRPL.m_125", "Straightness 0 mM NaCl" = "Straightness.m_0", "Straightness 75 mM NaCl" = "Straightness.m_75", "Straightness 125 mM NaCl" = "Straightness.m_125", "Main Root Vector Length 0 mM NaCl" = "MRVL.m_0", "Main Root Vector Length 75 mM NaCl" = "MRVL.m_75", "Main Root Vector Length 125 mM NaCl" = "MRVL.m_125", "Depth 0 mM NaCl" = "Depth.m_0", "Depth 75 mM NaCl" = "Depth.m_75", "Depth 125 mM NaCl" = "Depth.m_125", "Main Root Vector Angle 0 mM NaCl" = "MRVA.m_0", "Main Root Vector Angle 75 mM NaCl" = "MRVA.m_75", "Main Root Vector Angle 125 mM NaCl" = "MRVA.m_125", "Number of Lateral Roots 0 mM NaCl" = "noLRpMR.m_0", "Number of Lateral Roots 75 mM NaCl" = "noLRpMR.m_75", "Number of Lateral Roots 125 mM NaCl" = "noLRpMR.m_125", "Lateral Root Length 0 mM NaCl" = "LRL.m_0", "Lateral Root Length 75 mM NaCl" = "LRL.m_75", "Lateral Root Length 125 mM NaCl" = "LRL.m_125", "average Lateral Root Length 0 mM NaCl" = "aLRL.m_0", "average Lateral Root Length 75 mM NaCl" = "aLRL.m_75", "average Lateral Root Length 125 mM NaCl" = "aLRL.m_125", "Lateral Root Density 0 mM NaCl" = "LRDpMR.m_0", "Lateral Root Density 75 mM NaCl" = "LRDpMR.m_75", "Lateral Root Density 125 mM NaCl" = "LRDpMR.m_125", "Lateral Root Density (per branched zone) 0 mM NaCl" = "LRDpBZ.m_0", "Lateral Root Density (per branched zone) 75 mM NaCl" = "LRDpBZ.m_75", "Lateral Root Density (per branched zone) 125 mM NaCl" = "LRDpBZ.m_125", "Branched Zone Length 0 mM NaCl" = "Branched.m_0", "Branched Zone Length 75 mM NaCl" = "Branched.m_75", "Branched Zone Length 125 mM NaCl" = "Branched.m_125", "Basal Zone Length 0 mM NaCl" = "Basal.m_0", "Basal Zone Length 75 mM NaCl" = "Basal.m_75", "Basal Zone Length 125 mM NaCl" = "Basal.m_125", "Apical Zone Length 0 mM NaCl" = "Apical.m_0", "Apical Zone Length 75 mM NaCl" = "Apical.m_75", "Apical Zone Length 125 mM NaCl" = "Apical.m_125", "RATIO MRL per TRS 0 mM NaCl" = "MRpTRS.m_0", "RATIO MRL per TRS 75 mM NaCl" = "MRpTRS.m_75", "RATIO MRL per TRS 125 mM NaCl" = "MRpTRS.m_125", "RATIO aLRL per MRL 0 mM NaCl" = "aLRLpMRL.m_0", "RATIO aLRL per MRL 75 mM NaCl" = "aLRLpMRL.m_75", "RATIO aLRL per MRL 125 mM NaCl" = "aLRLpMRL.m_125", "RATIO LRL per MRL 0 mM NaCl" = "LRLpMRL.m_0", "RATIO LRL per MRL 75 mM NaCl" = "LRLpMRL.m_75", "RATIO LRL per MRL 125 mM NaCl" = "LRLpMRL.m_125", "RATIO Basal per MRL 0 mM NaCl" = "BasalpMRL.m_0", "RATIO Basal per MRL 75 mM NaCl" = "BasalpMRL.m_75", "RATIO Basal per MRL 125 mM NaCl" = "BasalpMRL.m_125", "RATIO Branched per MRL 0 mM NaCl" = "BranchedpMRL.m_0", "RATIO Branched per MRL 75 mM NaCl" = "BranchedpMRL.m_75", "RATIO Branched per MRL 125 mM NaCl" = "BranchedpMRL.m_125", "RATIO Apical per MRL 0 mM NaCl" = "ApicalpMRL.m_0", "RATIO Apical per MRL 75 mM NaCl" = "ApicalpMRL.m_75", "RATIO Apical per MRL 125 mM NaCl" = "ApicalpMRL.m_125", "Principal Component 1 0 mM NaCl" = "PC1.m_0", "Principal Component 1 75 mM NaCl" = "PC1.m_75", "Principal Component 1 125 mM NaCl" = "PC1.m_125", "Principal Component 2 0 mM NaCl" = "PC2.m_0", "Principal Component 2 75 mM NaCl" = "PC2.m_75", "Principal Component 2 125 mM NaCl" = "PC2.m_125", "Principal Component 3 0 mM NaCl" = "PC3.m_0","Principal Component 3 75 mM NaCl" = "PC3.m_75", "Principal Component 3 125 mM NaCl" = "PC3.m_125"), selected="noLRpMR.m_75")),
tabPanel("Step 4",
helpText("Download the data to examine which accessions belong to which cluster"),
downloadButton("dwnldClust", label = "Download Cluster data")
)))),
mainPanel(
navbarPage(title="",
tabPanel("Clustering Heat Map",
helpText("This graph represents the clustering of the accessions based on three selected traits. The colors represent the phenotype value which has been normalized per trait with Z-Fisher transformation. Please note that the data per accession is based on the average trait value collected from 4 replicas only. "),
plotOutput("HotHeatMap")),
tabPanel("Accession Dendrogram",
helpText("The below graph represents a dendrogram of the accessions and how they are clustered based on the selected traits in", strong("Step1"),". The accessions are clustered using Ward linkage method and the x-axis is represents the distance between the individual accessions."),
plotOutput("ClusterTree")),
tabPanel("Cluster Validation",
helpText("The boxplot represents the phenotype value chosen in ", strong("Step 3 "), " per cluster. The average values per accessions were pulled depending on the cluter cut-off value determined in ", strong("Step 2"),". The letters above the graph represent the significant groups as calculated using Tukey pair-wise comparison with p-value < 0.05."),
plotOutput("HotANOVA"))
)))
# end of tabPanel#5
))
