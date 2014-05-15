pollutantmean<- function(directory, pollutants,id=1:332){
  #lists all files in directory
  files<-list.files(directory)
  #allows you to select particular files in directory
  sfiles<-files[id]
  #stitches all files together, function(sfile) is in place to create path to directory otherwise lapply will not be able
  # to find files
  all.the.data<-lapply(sfiles, function(sfile) {read.csv(file=paste("specdata", sfile, sep="/"), header=T)})
  #do.call is a function call that binds all the data together into a dataframe
  dataFrame<-do.call("rbind",all.the.data)
  clean<-na.omit(dataFrame[pollutants])
  mean(clean[[pollutants]])
  #dataFrame.sub<-subset(dataFrame$pollutants, !is.na(dataFrame$pollutants))
}

