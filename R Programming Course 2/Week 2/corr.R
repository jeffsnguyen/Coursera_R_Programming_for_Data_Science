corr <- function(directory, threshold = 0) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id is an integer vector indicating the monitor ID numbers'threshold' is a 
## numeric vector of length 1 indicating the number of completely observed
## observations (on all variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
## NOTE: do not round the result

##Obtain files and store them in pollutant_data
pollutant_data <- list.files(path = "./specdata/", full.name = "TRUE")

## Initializing empty numeric vector to store correlation result
correlation_result <- vector(mode = "numeric", length = 0)

for(i in 1:332) 
{
  ## read each CSV, remove incomplete case from them and store in 
  ## refined_pollutant_data
  refined_pollutant_data <- na.omit(read.csv(pollutant_data[i]))
  
  if( nrow(refined_pollutant_data) > threshold ) {
    
    ## calculating the correlation and add to the result empty vector
    corvector <- cor(refined_pollutant_data$sulfate, refined_pollutant_data$nitrate)
    correlation_result <- append(correlation_result,corvector)
  }
}
## return the result
correlation_result
}