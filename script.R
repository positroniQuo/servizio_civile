library(reshape2)
library(ggplot2)
library(extrafont)

font_import()
loadfonts(device="win")
fonts()  

specie <- c("P. italiae","C. brachydactyla","C. cornix","M. striata","C. monedula",
           "F. coelebs","P. ochruros","C.carduelis","U. epops","T. troglodytes",
           "P. major","S. atricapilla","C. caeruleus","P. ater","J. torquilla",
           "P. palustris","T. alba","S. europaea","A. caudatus","H. rustica",
           "D. urbicum","L. megarhynchos","D. minor","G. glandaria")

dfr <- data.frame(
 nomi        = factor(specie,levels =specie),
 inizio  = c(3,4,3,5,4,4,4,4,4,4,3,5,2,3,4,4,3,4,3,3,3,5,4,4),
   fine  = c(8,7,6,7,6,7,6,8,6,5,7,6,6,7,7,7,9,5,6,9,9,6,5,6))


sdfr <- melt(dfr, measure.vars = c("inizio", "fine"))

labels <- c("Gennaio", "Febbraio", "Marzo","Aprile","Maggio","Giugno","Luglio","Agosto","Settembre","Ottobre","Novembre","Dicembre")


ggplot(sdfr, aes(value, nomi)) + 
  ggtitle("Periodi di nidificazione", )+
  geom_line(size = 3, colour="black",lineend = "square") +
  geom_line(size = 1.5, colour="darkgreen",lineend = "square") +
  xlab(NULL) + 
  ylab(NULL) +
  theme(plot.title = element_text(size=14, face="bold",hjust = 0.3), 
        text=element_text(family="Times New Roman", size=12), 
        axis.text.x = element_text(color = "darkgreen", face="italic")) + 
  coord_cartesian(xlim = c(1, 12))+
  scale_x_continuous(label = labels, breaks=seq(1, 12, 1), guide = guide_axis(n.dodge=3))

png("plot_nidificazione.png", width = 600, height = 500)     

ggplot(sdfr, aes(value, nomi)) + 
  ggtitle("Periodi di nidificazione", )+
  geom_line(size = 3, colour="black",lineend = "square") +
  geom_line(size = 1.5, colour="darkgreen",lineend = "square") +
  xlab(NULL) + 
  ylab(NULL) +
  theme(plot.title = element_text(size=18, face="bold",hjust = 0.3), 
        text=element_text(family="Times New Roman", size=16), 
        axis.text.x = element_text(color = "darkgreen", face="italic")) + 
  coord_cartesian(xlim = c(1, 12))+
  scale_x_continuous(label = labels, breaks=seq(1, 12, 1), guide = guide_axis(n.dodge=3))

dev.off()
 