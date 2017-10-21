# Amazon-Book-Prices
An analysis of the top selling book prices by category

A joint project: Josh Lawman and Alex Reeves.

1. Scraping data:<br>
- Current: Utilizing Reeves script to scrape top 100 books per category.

2. Clean data notes:
- Prices: Currently cleaned prices are stored numerically with the follow values assigned for non-numeric prices {-1: 1 Credit, -2: '$0.00 with Trial'}
- Added feature: Title Length
- All column names are capitalized and singular

3. Analysis Avaiable:
- Inital look prices with parallel boxplots (divided by category)

4. Possible areas to develop:
- Detailed look at relationship between various features
- Rank prediciton algorithm to be trained on current data and tested on future rankings
- Summary write-ups on significant observations
- Scrape top 1000 books
- Engineer further features in database
- Join certain categories (or examine books which appear in more than one category)