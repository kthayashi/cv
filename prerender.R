# Quarto pre-render script

# Update date in footer by modifying custom style sheet

file_scss <- "custom.scss"

content_scss <- readLines(file_scss)

date_id <- intersect(
  grep("\\/\\* date \\*\\/", content_scss),
  grep("content:*", content_scss)
)

content_scss[date_id] <- gsub(
  "(?<=content: )([^;]+)", 
  paste0('"', format(Sys.Date(), "%m/%d/%Y"), '"'), 
  content_scss[date_id], 
  perl = TRUE
)

writeLines(content_scss, file_scss)
