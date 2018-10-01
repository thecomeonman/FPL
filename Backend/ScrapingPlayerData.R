# script to scrape player data from FPL databases

rm(list = ls())
setwd('/media/ask/Data/Personal/Projects/Personal/FPLData')

library(data.table)
library(RCurl)
library(rjson)
library(XML)

dir.create(
   'Players',
   showWarnings = F
)

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