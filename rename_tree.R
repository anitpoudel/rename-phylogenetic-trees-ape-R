install.packages("ape")
install.packages("tidyverse")
library(ape)
library(tidyverse)
tree <- read.tree ("example.nwk")
rename <- read_csv("rename.csv")
tree$tip.label <- sapply(tree$tip.label, function(label) {
  match <- rename %>% filter(NAC == label)
  if (length(match)==0){
    return(label)
  }
else if (nrow(match) == 1) {
  return(match$Transcript)
} else {
  return(label)
}
})
write.tree(tree, file = "renamed_tree.nwk")
