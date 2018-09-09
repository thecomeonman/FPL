# script to scrape player data from FPL databases

rm(list = ls())
setwd('/media/ask/9b07b759-3e7b-49b4-b47d-3a60ba5b17fd/Personal/PersonalProjects/Fantasy League/Data/2017-18')

library(data.table)
library(RCurl)
library(rjson)
library(XML)


# looping through as many players until error
lAllPlayers <- list()
iPlayerCounter=1
repeat {

  vcPlayerJSON <- readLines(paste0('https://fantasy.premierleague.com/drf/element-summary/',iPlayerCounter))

  # This errors out when the URL doesn't have player data
  # Bad logic. More robust logic to break the loop.
  lAllPlayers[[iPlayerCounter]] <- fromJSON(paste(vcPlayerJSON, collapse=""))

  cat(iPlayerCounter,'\n')
  iPlayerCounter = iPlayerCounter + 1

}

# the player identity, status, etc. is stored separately
vcJSONStatic <- readLines('https://fantasy.premierleague.com/drf/bootstrap-static')
lAllPlayersStatic = fromJSON(paste(vcJSONStatic, collapse=""))

iGameWeek = 1 + max(which(sapply(lAllPlayersStatic$events, function(x) x$finished)))
iGameWeek = ifelse(
  is.infinite(iGameWeek),
  0,
  iGameWeek
)

# saving the data
tryCatch(
   {
      save(
        list = c('lAllPlayers','lAllPlayersStatic'),
        file = paste0('data_before_',formatC(iGameWeek, width = 2, flag = '0'),'.Rdata')
     )
   },
   error = function (e) {
      
      save(
        list = c('lAllPlayers','lAllPlayersStatic'),
        file = paste0('~/data_before_',formatC(iGameWeek, width = 2, flag = '0'),'.Rdata')
      )

   }
)
 

iPlayerCounter
iGameWeek