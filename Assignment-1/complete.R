#complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
#}
setwd("/home/partha/working/ds/datasciencecoursera")
complete <- function(directory, id = 1:332) {
        new_df <- data.frame(id = numeric(), nobs = numeric())
        l <- 0
        for (j in id) {
                complete_row <- numeric(0)
                f_name <- sprintf("%s%s%03d%s", directory, "/", j, ".csv")
                tryCatch({pol_data <- read.csv(f_name); TRUE}, 
                         error = function(err) FALSE)
                n_col = ncol(pol_data)
                for (i in nrow(pol_data)) {
                        e <- eval(pol_data$sulfate != "NA" & pol_data$nitrate != "NA" & pol_data$ID != "NA" & pol_data$Date != "NA")
                        x <- subset(pol_data, e)
                        l <- nrow(x)
                }
                new_row <- c(j, l)
                new_df <- rbind(new_df, new_row)
        }
        colnames(new_df) <- c("id", "nobs")
        new_df
}