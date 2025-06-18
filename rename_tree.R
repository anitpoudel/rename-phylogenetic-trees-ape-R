install.packages("ape")
install.packages("tidyverse")
library(ape)
library(tidyverse)
tree <- read.tree ("example.nwk")
rename <- read_csv("rename.csv")
tree$tip.label <- sapply(tree$tip.label, function(label) {
  match <- rename %>% filter(old_id == label)
  if (length(match)==0){
    return(label)
  }
else if (nrow(match) == 1) {
  return(match$new_id)
} else {
  return(label)
}
})
write.tree(tree, file = "renamed_tree.nwk")
