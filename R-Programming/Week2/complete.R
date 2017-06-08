complete <- function(directory, id = 1:332) {
    
    files <- list.files(directory, full.names = TRUE)
    
    full_data <- lapply(files[id], function(x) read.csv(x, header = TRUE))
    
    nobs <- sapply(full_data, function(x) sum(complete.cases(x)))
    
    data.frame('id' = id, 'nobs' = nobs)
    
    
}