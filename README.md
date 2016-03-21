# MCD_Analysis_Public
Analysis of CDC Multiple Cause of Death Data in R. "dataConvert.R" is useful for converting the data into a more manageable dataframe. "mcdA.R" can be used to conduct frequent itemset analysis. For a cool tool that we developed for this data set, visit, http://datatherapeutics.org/.

##How to Use:
1.  Download MCD data from the CDC's website here: http://www.cdc.gov/nchs/data_access/VitalStatsOnline.htm#Mortality_Multiple/
2.  Go to section for "Multiple Mortality Cause Files" and download year of interest.
3.  Run "dataConvert.R" to process the file into an R compatible data frame.
4.  Run "mcdA.R" to carry out frequent itemset analysis for the year of interest. 

##What's Next?
I have also made some scripts in Python that upload the MCD data to an SQL database and visualizes it. I'll share that when I'm finished compiling my thesis.
