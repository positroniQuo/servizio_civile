# i need a simple graphic to showcase the nesting period for different species of birds for
# a civil service project, so let's get to it


library(reshape2)  # graphic functions
library(ggplot2)   # graphic functions
library(extrafont) # just for times new roman

font_import() 
loadfonts(device="win")
fonts()  

# importing and loading all fonts from windows. 
# fonts() is just for checking

specie <- c("P. italiae","C. brachydactyla","M. striata",
            "F. coelebs","P. ochruros","C.carduelis","U. epops","T. troglodytes",
            "P. major","S. atricapilla","C. caeruleus","P. ater","J. torquilla",
            "P. palustris","T. alba","S. europaea","A. caudatus","L. megarhynchos","D. minor")

# list of the species names

dfr <- data.frame(
  nomi        = factor(specie,levels =specie),
  inizio  = c(3,4,5,4,4,4,4,4,3,5,2,3,4,4,3,4,3,5,4),
  fine  = c(8,7,7,7,6,8,6,5,7,6,6,7,7,7,9,5,6,6,5))

# this dataframe contains the month in which nesting start and end months, in the same order used for the species names to make them match

sdfr <- melt(dfr, measure.vars = c("inizio", "fine"))

# unifies ("melts") the data contain in the dfr object together

labels <- c("Gennaio", "Febbraio", "Marzo","Aprile","Maggio","Giugno","Luglio","Agosto","Settembre","Ottobre","Novembre","Dicembre")

# nobody uses numbers in place of months, so here are the names for later use as labels

png("plot_nidificazione.png", width = 600, height = 500)     

# let's save it as a png, specifying desired dimensions 

ggplot(sdfr, aes(value, nomi)) +                                                                  # i want to plot sdfr, using the species names
  ggtitle("Periodi di nidificazione")+                                                            # title
  geom_line(size = 3, colour="black",lineend = "square") +                                        # 1st line as outline
  geom_line(size = 1.5, colour="darkgreen",lineend = "square") +                                  # 2nd line, green filling
  xlab(NULL) + 
  ylab(NULL) +
  theme(plot.title = element_text(size=18, face="bold",hjust = 0.5),                              # title size, style and position
        text=element_text(family="Times New Roman", size=16),                                     # font and size for everything else
        axis.text.x = element_text(color = "darkgreen"),                                          # i want x lables to be green
        axis.text.y = element_text(face="italic")) +                                              # i also want y lables to be italic
  coord_cartesian(xlim = c(1, 12))+                                                               # let's set the x axis limits to be january and december to show the whole year
  scale_x_continuous(label = labels, breaks=seq(1, 12, 1), guide = guide_axis(n.dodge=3))         # now i set the 12 breaks for the continuous x values in which to place the month names

dev.off()

# close and save, goodbye!
 
