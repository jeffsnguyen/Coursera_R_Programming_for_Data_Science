pollutantmean <- function(directory, pollutant, id = 1:332) {
  ##'directory' is a character vector of length 1 indicating
  ##thelocation of the CSV file
  
  ##'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either sulfate or "nitrade"
  
  ##'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ##Return the mean of the pollutant across all monitors lists
  ##in the 'id' vector (ignoring NA values)
  ##Note: do not round the result
  
  #################
  
  ##Obtain files and store them in pollutant_data.
  pollutant_data <- list.files(path = "./specdata/", full.name = "TRUE")[id]
  
  ##Reading all files
  read_data <- lapply(pollutant_data, read.csv)
  
  ##Bind all data in read_data together by row
  combine_data <- do.call(rbind, read_data)
  
  ##Calculate means of the combine_data list using the specified pollutant value only
  mean(combine_data[,pollutant], na.rm = TRUE)
  
  ##Code comment
}
