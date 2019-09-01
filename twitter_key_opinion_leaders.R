library(igraph) # load network analysis and visualisation package
library(twitteR) # Load R based Twitter Client package
library(sna) # load social network analysis package
library(xlsx) # load excel writing package
citation("xlsx")

# Set Twitter API Keys
api_key <- "4RD19483sv9a0YVm91zMzzBm0"
api_secret <- "stwOGsqkaplDxcLwkQOYUSCQHwfdYKftE1LXYznNyKro4CYecW"
access_token <- "837335988821196800-E6P547xyTuc56pqWBlAyKAVHfaZlhea"
access_token_secret <- "4I687r9zJppVwbuZk6TdE9wRgkvuagjDSkE1Q1aHlHM0Q"
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

# Grab latest tweets

tweets_galway <- searchTwitter('#galway', n=100) #hashtag is changed for counites of galway, mayo, laois, waterford and donegal as determined by heatmap

# make into df
df <- do.call("rbind", lapply(tweets_galway, as.data.frame))

# extract users from galway hashtag tweets

galway_users = df$screenName

connectiondf=data.frame() # initialise connection dataframe

for( i in 1:100) # loop through all 100 galway users
{
  info<-getUser(galway_users[i]) # get the users inforomation
  following<-info$getFriends() # get who the users following
  following <- twListToDF(following) # make into twitter dataframe
  connect1=cbind(follower=galway_users[i],following=following$screenName) # create first half of connections the user is following others
  follower<-info$getFollowers() # get the users followers
  follower <- twListToDF(follower) # make into twitter dataframe
  connect2=cbind(follower=follower$screenName,following=galway_users[i]) # create second half of connections others are following the user
  
  connection<-rbind(connect1,connect2) # combine the rows of both lists of connections
  connectiondf=rbind(connectiondf,connection) # combine this list of connections with all other previous lists of connections made by other iterations
  print(i) # count iterations
  
}


df.g <- graph.data.frame(d = connectiondf, directed = TRUE) # create network of connections
df.g=simplify(df.g) # simplify it
plot.igraph(df.g,label=NA, main="Network of Mayo Twitter users") # create a visualisation of the network

# calculations of centrality measures: degree, betweenness, closeness and eigen centrality
degreeCentrality=degree(df.g,v=V(df.g)) # calculate degree centrality
deg=c(names(head(sort(degreeCentrality,decreasing = TRUE),n=10))) # sort inorder of degree centrality and get top 10

betweenCent=betweenness(df.g,v=V(df.g)) # calculate betweenness centrality
bet=c(names(head(sort(betweenCent,decreasing = TRUE),n=10))) # sort inorder of betweenness centrality and get top 10

closeCent=closeness(df.g,v=V(df.g)) # calculate closeness centrality
clo=c(names(head(sort(closeCent,decreasing = TRUE),n=10))) # sort inorder of closeness centrality and get top 10

eigCent=eigen_centrality(df.g) # calculate eigen centrality
eig=c(names(head(sort(eigCent$vector,decreasing = TRUE),n=10))) # sort inorder of eigen centrality and get top 10

galway_influencers=data.frame(deg,bet,clo,eig) # create data frame of each top ten influential users

write.csv(galway_influencers,file="galway_influencers.csv") # write to csv file for ease of sharing
