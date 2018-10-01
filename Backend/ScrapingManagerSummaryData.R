rm(list = ls())

# I use this to query managers between 0 to 1000000, 1000001 to 2000000, etc.
# in vi
iCounter = 3
cPath = '/media/ask/Data/Personal/FPL/Managers'

vcAlreadyScraped = list.files(cPath)
vi = (1 + ((iCounter-1) * 1000000)):(iCounter * 1000000)
vi = setdiff(vi, vcAlreadyScraped)
vi = sample(vi, length(vi))

i = 1
repeat { 

   print(vi[i])

   tryCatch(
      {
         vcText = readLines(paste0('https://fantasy.premierleague.com/drf/entry/',vi[i],'/history'))
         writeLines(
            vcText,
            paste0(cPath, '/', vi[i])
         )
         rm(vcText)
      },
      error = function(e) {
         print(paste0(e, vi[i]))
      }
   )
   i = i + 1

   if ( i > length(vi))
      break

}