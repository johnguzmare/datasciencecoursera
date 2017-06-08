corr <- function(directory, threshold = 0) {
    
    f <- list.files(directory, full.names = TRUE)
    data <- lapply(f, read.csv, header = TRUE)
    valid_data <- lapply(data, function(x) x[complete.cases(x),])
    
    if (is.null(valid_data) == TRUE){
        numeric(0)
    } else {
        corrs <- numeric(0)
        for (i in seq_along(valid_data)){
            if (nrow(valid_data[[i]]) >= threshold){
                corrs <- c(corrs, cor(valid_data[[i]]$sulfate, valid_data[[i]]$nitrate))
            }
        }
        corrs
    }
    
}