######################################################################
#Pre-Cleaning#
######################################################################

#download data into df
df<-read.csv("/Volumes/GoogleDrive/My Drive/ECON 494 – Intro to Business Analytics/economic_freedom_index2019_data.csv")

#view data within df
View(df)

#converts variable into numeric format 
df$Property.Rights<-as.numeric(df$Property.Rights)

#converts variable into numeric format
df$World.Rank<-as.numeric(df$World.Rank)


######################################################################
#Data Visualization 1: Where Should YOU Take Your Next Business Venture?#
######################################################################

#ggplot2 package needs to open to create our boxplot 
library(ggplot2)

#Input un-rendered data into a new variable, while structuring the plot
intl<-ggplot(df, aes(x=Government.Integrity,y=World.Rank,fill=Region))

#Data is rendered and text format of plot is changed 
intl + geom_boxplot() + ggtitle("Where Should YOU Take Your \nNext Business Venture?") + xlab("Government Integrity(Close to 100 is Best)") + ylab("World Rank(Close to 1 is Best)") +theme(plot.title = element_text(hjust = 0.5))

######################################################################
#Data Visualization 2: Entrepreneurial Spirit#
######################################################################

##RENDERING THE DATA USING THE POINT GEOM
inv<-ggplot(df, aes(Property.Rights, Region)) +geom_violin(fill='cornsilk2')

#change text format and insert vertical line
print(inv + labs(title= "Entrepreneurial \nSpirit", x="Property Rights(Close to 100 is Best)", y="Region")) + theme(plot.title = element_text(hjust = 0.5))+geom_vline(xintercept = 90)


######################################################################
#Data Visualization 3: European Market Attractiveness#
######################################################################

#filter data associated with the European region into a new variable 
Europe<- filter(df, Region == "Europe")

#view data within Europe
View(Europe)

#filter data within the European region ranked less than 11
Europe2<-filter(Europe, Region.Rank < 11)

#open following packages to create a scatter plot
library(ggplot2)
library(plotly) 

#Create a new variable according to Europe2 data
GDP.per.Capita.PPP.<-Europe2$GDP.per.Capita..PPP.

#Create a new variable according to Europe2 data
Inflation.Rates<-Europe2$Inflation....

#Create new variable: Plot has the 3 required elements, text format is changed, and vertical lines are created 
p <- ggplot(Europe2, aes(Inflation.Rates, GDP.per.Capita.PPP., text = c(Country.Name))) + geom_point() + labs(x = "Inflation Rates(%)", y = "GDP Per Capita ($PPP)", title = "European Market Attractivenss") + theme(plot.title = element_text(hjust = 0.5)) +geom_vline(xintercept = 2)+geom_vline(xintercept = 1)  

#print plot 
ggplotly(p)


######################################################################
#Data Visualization 4: Tariff Rates Under 2% Across the World#
######################################################################

#create new variable with Tariff Rates below 2%
Best.Tariff.Rate<- filter(df, Tariff.Rate.... <2)

#view data
View(Best.Tariff.Rate)

#Input un-rendered data into a new variable, while structuring the plot
tr<-ggplot(Best.Tariff.Rate, aes(x=Tariff.Rate....,fill=Region))

#Data is rendered and text format of plot is changed 
tr + geom_histogram() + ggtitle("Tariff Rates Under 2% \nAcross the World") +theme(plot.title = element_text(hjust = 0.5))+ xlab("Tariff Rate(%)")+geom_vline(xintercept = 1)


#Done 


