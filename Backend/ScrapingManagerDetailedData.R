# script to scrape player data from FPL databases

rm(list = ls())

setwd('/media/ask/Data/Personal/Projects/Personal/FPLData')

library(data.table)
library(RCurl)
library(rjson)
library(XML)

dir.create(
   'Leagues',
   showWarnings = F
)

dir.create(
   'Managers',
   showWarnings = F
)

# viOverallStandingPagesToScrap = c(1:2)
viOverallStandingPagesToScrap = c(1:10, 100:110, 1000:1010, 10000:10010)
lStandingsJSON = list()

for ( iOverallStandingPagesToScrap in viOverallStandingPagesToScrap ) {

   print(iOverallStandingPagesToScrap)

   vcStandingsJSON <- readLines(
      paste0(
         'https://fantasy.premierleague.com/drf/leagues-classic-standings/313?phase=1&le-page=1&ls-page=',
         iOverallStandingPagesToScrap
      )
   )

   lStandingsJSON[[ length(lStandingsJSON) + 1 ]] <- fromJSON(
      paste(
         vcStandingsJSON, 
         collapse = ""
      )
   )

}

viManagersToScrape = c()
for ( lStandingsJSONElement in lStandingsJSON ) {

   viManagersToScrape = c(
      viManagersToScrape,
      sapply(
         lStandingsJSONElement$standings$results, 
         function(x) {

            x$entry

         }
      )
   )

}

for ( iManagerToScrape in viManagersToScrape ) {

   dir.create(
      paste0(
         'Managers/',
         iManagerToScrape
      ),
      showWarnings = F
   )

   iGW = 1

   repeat {

      cFileName = paste0(
         './Managers/', 
         iManagerToScrape,
         '/',
         iGW,
         '.json'
      )

      print(cFileName)

      if ( 
         !file.exists( 
            cFileName
         ) 
      ) {

         tryCatch(
            {

               vcStandingsJSON <- readLines(
                  paste0(
                     'https://fantasy.premierleague.com/drf/entry/',
                     iManagerToScrape,
                     '/event/',
                     iGW,
                     '/picks'
                  )
               )

               writeLines(
                  vcStandingsJSON,               
                  cFileName
               )

            }, 
            error = function ( err ) {

            }
         )

         print(AllGWsDone)

         if ( !file.exists(cFileName) ) {

            rm(cFileName)
            break
            
         }

      }

      iGW = iGW + 1

   }
   
}

# iGW carries over
save(
   list = 'lStandingsJSON',
   file = paste0(
      './Leagues/',
      formatC(
         iGW,
         width = 2,
         flag = '0'
      ),
      '.Rdata
   )
)