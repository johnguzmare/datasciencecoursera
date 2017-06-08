pollutantmean <- function(directory, pollutant, id=1:332) {
    
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    
    mvector <- c()
    
    selected_files <- as.character( list.files(directory) )
    
    file_paths <- paste(directory, selected_files, sep="")
    
    for(i in id) {
        cf <- read.csv(file_paths[i], header=T, sep=",")
        narm <- cf[!is.na(cf[, pollutant]), pollutant]
        mvector <- c(mvector, narm)
    }
    
    mean(mvector)
    
    
}