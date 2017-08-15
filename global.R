library(shiny)
library(ggplot2)
library(car)
library(multcomp)
library(RColorBrewer)
library(doBy)
library(plotrix)
library(car)
library(gplots)
library(ggrepel)
library(colorRamps)
library(plotly)

rsa <- read.csv("raw.csv")
rsa$Genotype <- as.character(rsa$Genotype)

RSAsum <- summaryBy(MRPL + MRVA + MRVL + noLRpMR + Basal + Branched + Apical + Straightness + TRS + LRDpMR + LRDpBZ  + Depth + LRL + MRpTRS + aLRL + aLRLpMRL + LRLpMRL + BasalpMRL + BranchedpMRL + ApicalpMRL + PC1 + PC2 + PC3 ~ Genotype + Media, data = rsa, FUN = function(x) { c(m = mean(x), s = sd(x), se = std.error(x)) })

RSAavg <- RSAsum[,c(1:3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69)]
RSAavg_0 <- subset(RSAavg, RSAavg$Media == 0)

RSAavg_75 <- subset(RSAavg, RSAavg$Media == 75)
RSAavg_125 <- subset(RSAavg, RSAavg$Media == 125)

for(i in 3:ncol(RSAavg_0)){
	names(RSAavg_0)[i] <- paste(names(RSAavg_0[i]),"0", sep="_")}
	
RSAavg_0 <- RSAavg_0[,c(1,3:ncol(RSAavg_0))]

for(i in 3:ncol(RSAavg_75)){
	names(RSAavg_75)[i] <- paste(names(RSAavg_75[i]),"75", sep="_")}
	
RSAavg_75 <- RSAavg_75[,c(1,3:ncol(RSAavg_75))]
	
for(i in 3:ncol(RSAavg_125)){
	names(RSAavg_125)[i] <- paste(names(RSAavg_125[i]),"125", sep="_")}
	
RSAavg_125 <- RSAavg_125[,c(1,3:ncol(RSAavg_125))]

RSAavg_all <- merge(RSAavg_0, RSAavg_75, by = "Genotype", all = T)
RSAavg_all <- merge(RSAavg_all, RSAavg_125, by = "Genotype", all = T)

