corr <- function(directory, threshold = 0) {
  #lists all files in directory
  files<-list.files(directory)
  idlist<-numeric()
  hello<-numeric()
  test<-data.frame(id=character(0),max1=numeric(0))
  for (i in 1:length(files)){
    a<-read.csv(file=paste("specdata", files[i], sep="/"))
    b<-sum(complete.cases(a))
    newrow<-c(i,b)
    test<-rbind(test,newrow)
  }
  names(test)<-c("id","nobs") 
  test.sub<-subset(test,nobs>threshold)
  test.sub
  for (i in test.sub["id"]){
    idabovethresh<-i
  }
  
  for (i in idabovethresh){
    a2<-read.csv(file=paste("specdata", files[i], sep="/"), header=T)
    clean<-a2[complete.cases(a2),]
    hello<-c(hello,(cor(clean['sulfate'],clean['nitrate'],use="everything")))
  
  }
  
  hello
}