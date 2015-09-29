## This is the example of webscraping data from official website of
## Botanical garden of Medicinal Plants - "Akademik Dr. Jovan Tucakov"

library(XML)
url <- "http://www.bastalekbiljava.rs/pages/garden-map.php"
html <- htmlTreeParse(url, useInternalNodes = T)
raw <- xpathSApply(html, "//td", xmlValue)
names <- xpathSApply(html, "//th", xmlValue)
lngt <- length(raw)
table <- data.frame(raw[seq(1, lngt, 5)], raw[seq(2, lngt, 5)], raw[seq(3, lngt, 5)], raw[seq(4, lngt, 5)], raw[seq(5, lngt, 5)])
colnames(table) <- names
write.table(table, file = "botanical_garden.txt", sep = ",", col.names = colnames(table))