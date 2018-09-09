# overall points don't include points lost to transfers
# gw rank is tied if gw points are equal

rm(list = ls())


library(rjson)
library(rpart)
library(plyr)
library(data.table)
library(ggplot2)


# total number of files / iBreakInto = files will be read at a time
iBreakInto = 100

# read raw logs to compile processed intermediates?
bStartFromRawFiles = F

# Data storage root folder 
cFolder = '/home/ask/Desktop/Managers'

vcLastTwoSeasons = c('2015/16','2016/17')

voDoubleGW = c(35, 37)

vcChipNames = c('chip_3xc','chip_bboost','chip_freehit','chip_wildcard1','chip_wildcard2')


# setting up folder structures
# ------------------------------------------------------------------------------
for ( 

   cChildFolder in c(
      '',
      '/Chips',
      '/FinalScores',
      '/History',
      '/Seasons',
      '/Summary'
   ) 

) {

   dir.create(
      paste0(
         cFolder,
         '/ManagerProcessed',
         cChildFolder         
      ),
      showWarnings = F
   )

}


vcFiles = list.files(
   paste0(cFolder, '/ManagersRaw'),
   full.names = T
)

# compile manager data
if ( bStartFromRawFiles ) {

   vcFileSequence = 1:length(vcFiles)

   # Looping over 2 to n or 1 to n - 1 is the same thing. 
   for ( iBreakIntoThis in 2:iBreakInto ) {

      print(iBreakIntoThis)

      lEntries = lapply(
         vcFiles[
            vcFileSequence > (
               ( iBreakIntoThis -1 ) * length(vcFiles) / iBreakInto
            ) & 
            vcFileSequence <= ( 
               ( iBreakIntoThis * length(vcFiles) / iBreakInto)
            )
         ],
         function ( x ) {

            # print(x)

            vcText = readLines(x)

            lText = list()

            tryCatch(
               {
                  lText = fromJSON(vcText)
                  lText$playerid = gsub(x, pattern = '.*/', replacement = '')
               },
               error = function(e) {
                  # print(x)
               }
            )

            if ( length(lText$history) < 38 ) {
               lText = list()
            } else if ( is.null(lText$history[[38]]$rank) ) {
               lText = list()
            } 

            lText

         }

      )





      dtSeasons = data.table()

      dtSeasons = rbind.fill(
         dtSeasons,
         rbindlist(
            lapply(
               lEntries,
               function(y) {

                  if ( is.null(y$season) ) {
                     return ( data.table())
                  }

                  dtSeasons = rbindlist(
                     lapply(
                        y$season,
                        function(x) {
                           data.table(t(x))
                        }
                     )
               )

                  if ( nrow(dtSeasons) > 0 ) {

                     dtSeasons = dtSeasons[,
                        list(
                           playerid = y$playerid,
                           season_name = as.character(unlist(season_name)),
                           total_points = as.integer(unlist(total_points)),
                           gw_rank = as.integer(unlist(rank))
                        )
                     ]  

                  }

                  dtSeasons

               }
            ),
            fill = T
         )
      )

      setDT(dtSeasons)

      save(
         list = 'dtSeasons',
         file = paste0(
            cFolder,
            '/ManagerProcessed/dtSeasons_',
            formatC(iBreakIntoThis, flag = '0', width = nchar(iBreakInto)),
            '.Rdata'
         )
      )

      rm(dtSeasons)

      print('Seasons done')




      # if ( file.exists('/media/ask/9b07b759-3e7b-49b4-b47d-3a60ba5b17fd/Personal/PersonalProjects/Fantasy League/201617/Data/ManagerProcessed/dtChips.Rdata') ) {
      #    load('/media/ask/9b07b759-3e7b-49b4-b47d-3a60ba5b17fd/Personal/PersonalProjects/Fantasy League/201617/Data/ManagerProcessed/dtChips.Rdata')
      # } else {
      #    dtChips = data.table()
      # }

      dtChips = data.table()

      dtChips = rbind.fill(
         dtChips,
         rbindlist(
            lapply(
               lEntries,
               function(y) {

                  if ( is.null(y$chips) ) {
                     return ( data.table())
                  }


                  dtChips = rbindlist(
                     lapply(
                        y$chips,
                        function(x) {
                           data.table(t(x))
                        }
                     )
               )

                  if ( nrow(dtChips) > 0 ) {
                     dtChips = dtChips[,
                        list(
                           playerid = y$playerid,
                           # played_time_formatted = as.character(unlist(played_time_formatted)),
                           # chip = as.character(unlist(chip)), # 1 to 1 mapping with name
                           chipname = paste0('chip_',as.character(unlist(name))),
                           event = as.integer(unlist(event)),
                           time = as.character(unlist(time))

                        )
                     ]

                  }

                  dtChips
               }
            ),
            fill = T
         )
      )

      setDT(dtChips)

      save(
         list = 'dtChips',
         file = paste0(
            cFolder,
            '/ManagerProcessed/dtChips_',
            formatC(iBreakIntoThis, flag = '0', width = nchar(iBreakInto)),
            '.Rdata'
         )
      )

      rm(dtChips)

      print('Chips done')







      # if ( file.exists('/media/ask/9b07b759-3e7b-49b4-b47d-3a60ba5b17fd/Personal/PersonalProjects/Fantasy League/201617/Data/ManagerProcessed/dtHistory.Rdata') ) {
      #    load('/media/ask/9b07b759-3e7b-49b4-b47d-3a60ba5b17fd/Personal/PersonalProjects/Fantasy League/201617/Data/ManagerProcessed/dtHistory.Rdata')
      # } else {
      #    dtHistory = data.table()
      # }

      dtHistory = data.table()

      dtHistory = rbind.fill(
         dtHistory,
         rbindlist(
            lapply(
               lEntries,
               function(y) {

                  if ( is.null(y$history) ) {
                     return ( data.table())
                  }

                  rbindlist(
                     lapply(
                        y$history,
                        function(x) {
                           data.table(t(x))
                        }
                     ),
                     fill = T
                  )[,

                     list(
                        playerid = y$playerid,
                        movement = substr(as.character(unlist(movement)), 1, 1),
                        points = as.integer(unlist(points)),
                        gw_rank = as.integer(unlist(rank)),
                        overall_rank = as.integer(unlist(overall_rank)),
                        event_transfers = as.integer(unlist(event_transfers)),
                        event_transfers_cost = as.integer(unlist(event_transfers_cost)),
                        value = as.integer(unlist(value)),
                        points_on_bench = as.integer(unlist(points_on_bench)),
                        bank = as.integer(unlist(bank)),
                        # entry = as.integer(unlist(entry)),
                        event = as.integer(unlist(event))
                     )
                  ]

               }
            ),
            fill = T
         )
      )

      setDT(dtHistory)

      save(
         list = 'dtHistory',
         file = paste0(
            cFolder,
            '/ManagerProcessed/dtHistory_',
            formatC(iBreakIntoThis, flag = '0', width = nchar(iBreakInto)),
            '.Rdata'
         )
      )

      rm(dtHistory)

      print('History done')



      rm(lEntries)   

      gc()


   }

}







# Name to correct objects which have been stored by an incorrect name
if ( F ) {

   vcFiles = list.files(
      cFolder,
      'ManagerProcessed/Parts',
      full.names = T
   )

   for ( cFileType in c('History','Seasons','Chips') ) {

      vcTypeFiles = grep(
         x = vcFiles,
         pattern = cFileType,
         value = T
      )

      assign(
         paste0('dt', cFileType),
         rbindlist(
            lapply(
               vcTypeFiles,
               function( cTypeFile ) {
                  print(cTypeFile)
                  load(cTypeFile)
                  get(paste0('dt', cFileType))
               }
            )
         )
      )

      save(
         list = paste0('dt', cFileType),
         file = paste0(cFolder, 'ManagerProcessed/Parts', cFileType, '.Rdata')
      )

      rm(list = paste0('dt', cFileType))

   }

}

