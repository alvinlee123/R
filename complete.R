complete<- function(directory, id=1:332){
  #lists all files in directory
  files<-list.files(directory)
  #allows you to select particular files in directory
  sfiles<-files[id]
  #stitches all files together, function(sfile) is in place to create path to directory otherwise lapply will not be able
  # to find files


  test<-data.frame(id=character(0),max1=numeric(0))

  for (i in id){
    a<-read.csv(file=paste("specdata", files[i], sep="/"))
    b<-sum(complete.cases(a))
    newrow<-c(i,b)
    test<-rbind(test,newrow)


  }
  names(test)<-c("id","nobs")  
#  ha<-lapply(sfiles,function(sfile)
#    {
#    a<-read.csv(file=paste("specdata", sfile, sep="/"))
#    b<-sum(complete.cases(a))
#    #df<-c(id,b)
#    df[,1]<-sfiles
#    df[,2]<-b
#  })
#  ha

  test
}
