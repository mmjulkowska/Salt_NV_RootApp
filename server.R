function(input,output){
	
output$dataAll <- downloadHandler(
filename = "Julkowska et al., 2017 RSA data.csv",
content <- function(file){
file.copy("raw.csv", file)
	},
contentType = "txt/csv")	

MyPlot1 <-function(){
	temp <- subset(rsa, rsa$Genotype == input$genotype)
	pheno <- temp[,c("Media",input$Trait)]
	pheno[,1] <- as.factor(pheno[,1])
		colnames(pheno)[2] <- "PoI"
	ggplot(data = pheno, aes(x = Media, y = PoI, fill = Media)) + geom_boxplot() + labs(title = paste("The ", input$Trait, " of ", input$genotype), xlab="NaCl (mM)", ylab=input$Trait)
	# TO DO POINT # TO DO POINT # TO DO POINT # TO DO POINT # TO DO POINT 
# still need to beautify the plot - title and the axis are horrible!
# TO DO POINT # TO DO POINT # TO DO POINT # TO DO POINT # TO DO POINT 
}

output$plot1 <- renderPlot({
MyPlot1()
})

MD1 <- function(){
	temp <- subset(rsa, rsa$Genotype == input$genotype)
	MD1_a <- temp[,c("Genotype","Media",input$Trait)]
	MD1_a
}

output$dwnldSub1 <- downloadHandler(
filename=function(){
	paste(input$Trait, " of ",input$genotype,".csv", sep="")},
content <- function(file){
	write.csv(MD1(), file)}
	)

myPlotHisto <- function(){
	histo <- rsa[,c("Media",input$Trait)]
	histo[,1] <- as.factor(histo[,1])
	colnames(histo)[2] <- "Le_trait"
	a = min(histo$Le_trait, na.rm=TRUE)
	b = max(histo$Le_trait, na.rm=TRUE)
	var = input$Trait
plot <- ggplot(histo, aes(Le_trait, fill = Media)) + geom_density(alpha=0.2) + xlim(a,b) + ggtitle(paste(input$Trait, " of HapMap population")) + xlab(input$Trait) + ylab("% of the accessions")
plot
}
output$histo1 <- renderPlot({
	myPlotHisto()
	})

MA1 <- function(){
	temp1 <- subset(rsa, rsa$Genotype == input$gen1)
	temp2 <- subset(rsa, rsa$Genotype == input$gen2)
	temp3 <- subset(rsa, rsa$Genotype == input$gen3)
	temp4 <- subset(rsa, rsa$Genotype == input$gen4)
	temp5 <- subset(rsa, rsa$Genotype == input$gen5)
	temp6 <- subset(rsa, rsa$Genotype == input$gen6)
	temp7 <- subset(rsa, rsa$Genotype == input$gen7)
	temp8 <- subset(rsa, rsa$Genotype == input$gen8)
	temp14 <- rbind(temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8)
	MyAcc1 <- temp14[,c("Genotype","Media", input$tr2)]
	MyAcc1
}

output$dataAcc <- downloadHandler(
filename=function(){
	paste(input$Trait, " of ",input$gen1,", ", input$gen2,", ", input$gen3,", ", input$gen4,", ", input$gen5,", ", input$gen6,", ", input$gen7,", ", input$gen8,".csv", sep="")},
content <- function(file){
	write.csv(MA1(), file)}
	)

output$plot2a <- renderPlot({
	temp1 <- subset(rsa, rsa$Genotype == input$gen1)
	temp2 <- subset(rsa, rsa$Genotype == input$gen2)
	temp3 <- subset(rsa, rsa$Genotype == input$gen3)
	temp4 <- subset(rsa, rsa$Genotype == input$gen4)
	temp5 <- subset(rsa, rsa$Genotype == input$gen5)
	temp6 <- subset(rsa, rsa$Genotype == input$gen6)
	temp7 <- subset(rsa, rsa$Genotype == input$gen7)
	temp8 <- subset(rsa, rsa$Genotype == input$gen8)
	temp14 <- rbind(temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8)
	pheno2 <- temp14[,c("Genotype","Media", input$tr2)]
	pheno2[,1] <- as.factor(pheno2[,1])
	pheno2[,2] <- as.factor(pheno2[,2])
	names(pheno2)[3] <- "pheno"
	pheno_0 <- subset(pheno2, pheno2$Media == 0)
  
  # Doing ANOVA and Post-Hoc analysis at 0mM NaCl
 # ok let's try something more simple like boxplot 
#boxplot(pheno_0[,3] ~ pheno_0[,1], main="0 mM NaCl", xlab="", col=c("blue"))
amod <- aov(pheno ~ Genotype, data = pheno_0)
 tuk <- glht(amod, linfct = mcp(Genotype = "Tukey"))
 tuk.cld <- cld(tuk)   
 old.par <- par( mai=c(1,1,1.25,1))
 plot(tuk.cld, las=1, col="indianred1", ylab=input$tr2)

})

output$plot2b <- renderPlot({
	temp1 <- subset(rsa, rsa$Genotype == input$gen1)
	temp2 <- subset(rsa, rsa$Genotype == input$gen2)
	temp3 <- subset(rsa, rsa$Genotype == input$gen3)
	temp4 <- subset(rsa, rsa$Genotype == input$gen4)
	temp5 <- subset(rsa, rsa$Genotype == input$gen5)
	temp6 <- subset(rsa, rsa$Genotype == input$gen6)
	temp7 <- subset(rsa, rsa$Genotype == input$gen7)
	temp8 <- subset(rsa, rsa$Genotype == input$gen8)
	temp14 <- rbind(temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8)
	pheno2 <- temp14[,c("Genotype","Media", input$tr2)]
	pheno2[,1] <- as.factor(pheno2[,1])
	pheno2[,2] <- as.factor(pheno2[,2])		
	names(pheno2)[3] <- "pheno"
	pheno_75 <- subset(pheno2, pheno2$Media == 75)

 amod <- aov(pheno ~ Genotype, data = pheno_75)
 tuk <- glht(amod, linfct = mcp(Genotype = "Tukey"))
 tuk.cld <- cld(tuk)   
 old.par <- par( mai=c(1,1,1.25,1))
 plot(tuk.cld, las=1, col="limegreen", ylab=input$tr2)
})

output$plot2c <- renderPlot({
	temp1 <- subset(rsa, rsa$Genotype == input$gen1)
	temp2 <- subset(rsa, rsa$Genotype == input$gen2)
	temp3 <- subset(rsa, rsa$Genotype == input$gen3)
	temp4 <- subset(rsa, rsa$Genotype == input$gen4)
	temp5 <- subset(rsa, rsa$Genotype == input$gen5)
	temp6 <- subset(rsa, rsa$Genotype == input$gen6)
	temp7 <- subset(rsa, rsa$Genotype == input$gen7)
	temp8 <- subset(rsa, rsa$Genotype == input$gen8)
	temp14 <- rbind(temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8)
	pheno2 <- temp14[,c("Genotype","Media", input$tr2)]	
	pheno2[,1] <- as.factor(pheno2[,1])
	pheno2[,2] <- as.factor(pheno2[,2])		
	names(pheno2)[3] <- "pheno"
	pheno_125 <- subset(pheno2, pheno2$Media == 125)
	
amod <- aov(pheno ~ Genotype, data = pheno_125)
 tuk <- glht(amod, linfct = mcp(Genotype = "Tukey"))
 tuk.cld <- cld(tuk)   
 old.par <- par( mai=c(1,1,1.25,1))
 plot(tuk.cld, las=1, col="steelblue2", ylab=input$tr2)
})


output$plot3 <- renderPlotly({

pheno3 <- RSAavg_all[,c("Genotype",input$Trait3, input$Trait4)]
pheno3 <- na.omit(pheno3)

p <- plot_ly(pheno3, x= ~pheno3[,2], y=~pheno3[,3], type = 'scatter', mode = 'markers', text = ~pheno3[,1]) %>% 
layout(xaxis = list(title = paste(input$Trait3)), yaxis = list(title = paste(input$Trait4)))
#layout(title = "awesome correlation", xaxis = list(title = input$Trait3, zeroline = T), yaxis=list(title = input$Trait4, zeroline = T))
})

output$corr <- renderText({
pheno3 <- RSAavg_all[,c("Genotype",input$Trait3, input$Trait4)]
pheno3 <- na.omit(pheno3)
correl <- cor(pheno3[,2], pheno3[,3])
correl
})

output$corpval <- renderText({
pheno3 <- RSAavg_all[,c("Genotype",input$Trait3, input$Trait4)]
pheno3 <- na.omit(pheno3)
pval <- cor.test(pheno3[,2], pheno3[,3])$p.val
pval[1]
})

# Cluster tree of ALL accessions based on three selected traits
output$ClusterTree <- renderPlot({
	# make a temporary subset based on Clust1, Clust2 and Clust3 (les traits)
  clust_lista <-input$Clust1
  clust_temp <- RSAavg_all[,c("Genotype", clust_lista)]
  clust_temp <- na.omit(clust_temp)
  RSA_matrix <- clust_temp[,2:ncol(clust_temp)]
	row.names(RSA_matrix) <- clust_temp$Genotype
	RSA_matrix = as.matrix(RSA_matrix)
	RSA_t_matrix = t(RSA_matrix)
	RSA_t_cor = cor(RSA_t_matrix,method=c("pearson"))
	RSA_t_dist = dist(RSA_t_cor)
	RSA_t_clust = hclust(RSA_t_dist, method="ward.D2")
	Clufa <- plot(as.dendrogram(RSA_t_clust), horiz=T)
	Clufa
})
# 

output$HotHeatMap <- renderPlot({
  clust_lista <-input$Clust1
	clust_temp <- RSAavg_all[,c("Genotype", clust_lista)]
	clust_temp <- na.omit(clust_temp)
	RSA_matrix <- clust_temp[,2:ncol(clust_temp)]
	row.names(RSA_matrix) <- clust_temp$Genotype
	RSA_matrix = as.matrix(RSA_matrix)
	RSA_t_matrix = t(RSA_matrix)
	RSA_t_cor = cor(RSA_t_matrix,method=c("pearson"))
	RSA_t_dist = dist(RSA_t_cor)
	RSA_t_clust = hclust(RSA_t_dist, method="ward.D2")
	heatmap.2(RSA_t_matrix, Colv=as.dendrogram(RSA_t_clust), col=blue2red(100),scale=c("row"),density.info="none",trace="none", cexRow=0.7)
})

output$HotANOVA <- renderPlot({
  clust_lista <-input$Clust1
  clust_temp <- RSAavg_all[,c("Genotype", clust_lista)]	
  clust_temp <- na.omit(clust_temp)
  RSA_matrix <- clust_temp[,2:ncol(clust_temp)]
	row.names(RSA_matrix) <- clust_temp$Genotype
	RSA_matrix = as.matrix(RSA_matrix)
	RSA_t_matrix = t(RSA_matrix)
	RSA_t_cor = cor(RSA_t_matrix,method=c("pearson"))
	RSA_t_dist = dist(RSA_t_cor)
	RSA_t_clust = hclust(RSA_t_dist, method="ward.D2")
# cut_tree at $tree_cut value (but first make it numeric)
cluster <- as.data.frame(cutree(RSA_t_clust,h=as.numeric(input$tree_cut)))
names(cluster)[1] <- "cluster"
# To fuse the cluster with the initial data - since we have a chance of non-equal number of columns, we have to transform the entire data set into a matrix as well:
RSA_matrix_all <- RSAavg_all[,2:70]
row.names(RSA_matrix_all) <- RSAavg_all[,"Genotype"]
# and mering two matrixes by row.names - this is the only working solution I found
new <- merge(cluster, RSA_matrix_all, by="row.names")
names(new)[1] <- "Genotype"

# then make subset of the file based on the trait chosen in here:
to_test <- new[,c("Genotype","cluster",input$Clust_test)]
names(to_test)[3] <- "phenotype"
to_test[,2] <- as.factor(to_test[,2])
# then paste here ANOVA script with cluster as testing variable
amod <- aov(phenotype ~ cluster, data = to_test)
 tuk <- glht(amod, linfct = mcp(cluster = "Tukey"))
 tuk.cld <- cld(tuk)   
 old.par <- par( mai=c(1,1,1.25,1))
 plot(tuk.cld, las=1, col="#dd1c77", ylab=input$Clust_test)
})

CLU1 <- function(){
  clust_lista <-input$Clust1
  clust_temp <- RSAavg_all[,c("Genotype", clust_lista)]	
  clust_temp <- na.omit(clust_temp)
  RSA_matrix <- clust_temp[,2:ncol(clust_temp)]	
  row.names(RSA_matrix) <- clust_temp$Genotype
	RSA_matrix = as.matrix(RSA_matrix)
	RSA_t_matrix = t(RSA_matrix)
	RSA_t_cor = cor(RSA_t_matrix,method=c("pearson"))
	RSA_t_dist = dist(RSA_t_cor)
	RSA_t_clust = hclust(RSA_t_dist, method="ward.D2")
# cut_tree at $tree_cut value (but first make it numeric)
cluster <- as.data.frame(cutree(RSA_t_clust,h=as.numeric(input$tree_cut)))
names(cluster)[1] <- "cluster"
# To fuse the cluster with the initial data - since we have a chance of non-equal number of columns, we have to transform the entire data set into a matrix as well:
RSA_matrix_all <- RSAavg_all[,2:70]
row.names(RSA_matrix_all) <- RSAavg_all[,"Genotype"]
# and mering two matrixes by row.names - this is the only working solution I found
new <- merge(cluster, RSA_matrix_all, by="row.names")
names(new)[1] <- "Genotype"
new
}


output$dwnldClust <- downloadHandler(
filename=function(){
	paste("Accession clustering.csv", sep="")},
content <- function(file){
	write.csv(CLU1(), file)}
	)
# end of script here
}
