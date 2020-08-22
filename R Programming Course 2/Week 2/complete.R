complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## id is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1 117
  ## 2 1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the 
  ## number of complete case
  
  ##Obtain files and store them in pollutant_data
  pollutant_data <- list.files(path = "./specdata/", full.name = "TRUE")[id]
  
  refined_row <- c() # initialize empty vector
  count <- 1 # initialize count variable 
  
  for (i in pollutant_data) {
    
    ## read each CSV, remove incomplete case from them and store in refined_pollutant_data
    refined_pollutant_data <- na.omit(read.csv(i))
    
    ## nrow returns the number of rows that is not NA (because the value is 1)
    ## store this counter value in refined_row data data frame
    refined_row[count] <- nrow(refined_pollutant_data)
    
    #increase counter by 1 to go to the next file
    count <- count + 1
  }
  
  # Generate and print the data frame result
  refined_list <- data.frame("id" = id, "nobs" = refined_row)
  print(refined_list)
}