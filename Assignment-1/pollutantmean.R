#pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
#}
setwd("/home/partha/working/ds/datasciencecoursera")
pollutantmean <- function(directory, pollutant, id = 1:332) {
        cleaned_data <- numeric(0)
        for (j in id) {
                f_name <- sprintf("%s%s%03d%s", directory, "/", j, ".csv")
                tryCatch({pol_data <- read.csv(f_name); TRUE}, 
                error = function(err) FALSE)
                tryCatch({pollutant_data <- pol_data[pollutant]; TRUE}, 
                error = function(err) FALSE)
                na_data <- is.na(pollutant_data)
                cleaned_data <- append(cleaned_data, pollutant_data[!na_data])
        }
        mean_pol_data <- mean(cleaned_data)
        mean_data <- sprintf("%1.3f", mean_pol_data)
        mean_data
}