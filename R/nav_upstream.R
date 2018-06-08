flow.df <- data.table::fread("C:/Users/Owner/Desktop/ICPRB/nhdplus/flowline_vaa.csv",
                             colClasses=list(character=c("NHDPlusID", "FromNode", "ToNode"))) 

selected <- as.character(10000500011675)

node.df <- flow.df[, c("NHDPlusID", "FromNode", "ToNode")]

node.list <- list()
new.node.list <- list(node.df[node.df$NHDPlusID %in% selected, ]$FromNode)
while(any(new.node.list[[1]] %in% "stop") {
  from.node <- node.df[node.df$ToNode %in% new.node.list[[1]], ]$FromNode
  node.list[[length(node.list) + 1]] <- from.node
  
  if (length(node.df[node.df$ToNode %in% from.node, ]$FromNode) == 0) {
    new.node.list[[1]] <- "stop"
  } else {
    new.node.list[[1]] <- node.df[node.df$ToNode %in% from.node, ]$FromNode
  }
}

from.node.vec <- unlist(node.list)

flow.sub <- flow.df[flow.df$FromNode %in% from.node.vec, ]
