# twitter-influencers

## The Client
The Hepatitis C Resistance Project (HCVR Project), School of Biochemistry and Immunology is a Trinity College based study aiming to uncover the molecular mechanisms underpinning the immune response in health and disease, with a view to identifying new therapeutic targets. An important research approach is to use the disease resistance to help define these molecular mechanisms.

## Project Background
In the years 1977 to 1979, approximately 3,000 pregnant Irish women were exposed to the hepatitis C virus (HCV) contaminated anti-D – a medication to prevent rhesus disease. Until recently, researchers believed that receiving HCV-contaminated blood transfusions would inevitably lead to infection. However, half of the women who were exposed to the virus showed no signs of infection. These women may likely possess a ‘super’ immune system that protected them from HCV that may also be protecting them from other viral infections. The HCVR Project aims to compare the genetic and biological profiles of these naturally resistant women with those who were unable to resist infection, in order to identify the molecular mechanism behind the natural viral resistance.

To facilitate this study, HCVR Project has been recruiting suitable volunteers; those who were exposed to HCV-contaminated anti-D during the period 1977 to 1979. However, due to the sensitive nature of this national scandal, the women who came in contact with the HCV- contaminated anti-D cannot be contacted directly. They must come forward on their own accord. The project has exhausted traditional avenues of media such as television, radio and newspaper. It is therefore necessary to use alternative methods, such as social media, to increase the reach of the project.

## Leveraging of influencers

A key element of this social media campaign was to engage Key Opinion Leaders (KOL) to promote the Facebook and Twitter pages. In order to approach this stage of the social media campaign systematically, many meetings were held regarding the selection of KOLs in both the world of science and also those who would have a large following from our target audience. Two approaches were used in the selection of influencers

(i) Prior Knowledge
(ii) Centrality measure using R

Centrality measure faciltated an organised and scientific approach in the identification of influencers. In this approach, the information gathered from the heatmap can be utilised to target low response rate geographic areas.

Firstly, an application for a Twitter API was submitted. This generated the API Key, API Secret, Access Token and Access Token Secret, which are all necessary components to scrape Twitter for relevant information.

From the heatmap generated the following counties were targeted: Galway, Mayo, Laois, Waterford and Donegal. For each of these, using the ‘twitteR’ package, Twitter was searched for tweets that containing a hashtag of its county e.g. #galway. It should be noted that, while this may pull tweets that have been put up by tourists, it should be a good representative of those discussing current news in their county. For each county, 100 tweets were pulled, from which, 100 usernames were extracted. For each user a list of who they follow and who follows them was constructed. These lists were then combined into a dataframe.

From this list of relationships the package igraph was used in order to construct a sample network of users for that county. Using the package ‘sna’ (Social Network Analysis), the centrality measure was calculated from the igraph. A centrality measure is a popular metric in SNA to identify influencers. It is a measure of how important a node is to a network. The four most popular measures of centrality are degree, betweenness, closeness and eigenvector. All four centrality measures were calculated and the top ten most influential Twitter users from each measure were compared. Users that ranked highly in three out of the four measures were then selected as KOL.
