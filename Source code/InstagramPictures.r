###########################################################################
# 'InstagramPictures' v1.0 node for IBM SPSS Modeler 		  			  #
# Artur Kucia IBM 2017										  		      #
# Description: Download photos from Instagram account via Instagram API  #
###########################################################################

packages <- function(x){
  x <- as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}
# Required packages:
packages(RJSONIO)  
packages(RCurl)
get_recent_media <- function(access_token, userID, num_photos){
    user_url <- paste("https://api.instagram.com/v1/users/",userID,'/media/recent/?access_token=',access_token,'&count=',num_photos,sep="")
	error_result <- tryCatch({
		                     user_media <- RJSONIO::fromJSON( getURL(user_url))	
	                         },
	                         error = function(err){
								print(err)
	                         })
		
	if(user_media$meta['code']=="200"){
		media_urls <- c()
		media_ids <- c()
		my_data <-user_media$data
	
		for(i in 1:length(my_data)){
    		    media_urls <- c(media_urls, my_data[[i]]$images$standard_resolution$url)
    		    media_ids <- c(media_ids, my_data[[i]]$id)
    		}
		return (data.frame(media_ids,media_urls))
	
	}
	else {
		error_message <- paste("\nerror type: ", user_media$meta, "\nerror code: ", user_media$meta$code , "\nerror message: ", user_media$meta$error_message, sep=" ")
		stop(error_message)
	}
}
# Input variables
user <- "%%user%%"
instagram_key <-"%%instagram_token%%"
number_of_photos <-"%%number_of_photos%%"
# Main part
error_result <- tryCatch({
	id_urls <-  get_recent_media(instagram_key,user,number_of_photos)	
	},
	error = function(err){
	        print(err)
	})
# Returning data to modeler
var1 <- c(fieldName="ID", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var2 <- c(fieldName="URL", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
modelerData <- id_urls
modelerDataModel <- data.frame(var1,var2)