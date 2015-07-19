# form a list of files in the given dir
#       create a new data frame to store the correlation data        
#       read each file in a data frame
#       if the location meets the threshold requirement
#               find correlation between sulfate and nitrate
#       else 
#               store 0 in the correlation data frame
#       return the correlation data frame  

#directory : character vector of length 1
#threshold : numeric vector of length 1 indicating the 
#       number of completely  observed observation
#return : a numeric vector of correlation


setwd("/home/partha/working/ds/datasciencecoursera")
corr <- function(directory, threshold = 0) {
        # find out the list of complete table
        complete_table <- complete(directory, 1:332)
        # data frame which consists nobs more then threshold
        n <- subset(complete_table, complete_table["nobs"] > threshold)
        # initialize the numeric vector to be send back
        corr_list <- rep(0, nrow(n))
        for (i in seq_len(nrow(n))) {
                f_name <- sprintf("%s/%03d.csv", directory, n[i, "id"])
                f_data <- read.csv(f_name)
                corr_list[i] <- cor(f_data$nitrate, f_data$sulfate, use = "na.or.complete")
        }
        corr_list
}
