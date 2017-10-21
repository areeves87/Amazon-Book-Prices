library(tidyverse)
library(httr)
library(stringr)
library(lubridate)
library(rvest)
library(data.table)

################### SCRAPE TOP BOOKS ###################
#### source: amazon

URL <- paste("https://www.amazon.com/best-sellers-books-Amazon/zgbs/books/ref=zg_bs_unv_b_1_4_1")

pp<- read_html(URL)
links<-html_attr(html_nodes(pp, "a"), "href")
best_seller_cats<-links[114:150]
length(best_seller_cats)

####
all_the_books<- data.frame()

#build a dataframe containing category,rank,title,price info 
#for top 100 books per category

for(i in 1:length(best_seller_cats)){
        cat_pgs<-strsplit(best_seller_cats[i],"_nav")[[1]][1]
        test<-strsplit(best_seller_cats[i],"[-/]")      
        cat_name<-paste(test[[1]][7:(which(test[[1]]=="zgbs")-1)],sep=" ",collapse=" ")
        for(j in 1:5){
                next_pg<-paste0(cat_pgs,"_pg_",j,"?_encoding=UTF8&pg=",j,"&ajax=1")
                pp3<- read_html(next_pg)
                category<-rep(cat_name,20)
                rank<-(j-1)*20+1:20
                prices<-html_text(html_nodes(pp3,"div .zg_itemWrapper span.a-size-base.a-color-price"))
                titles<-html_attr(html_nodes(pp3, "div .zg_itemWrapper img"),"alt")
                ##media<-html_text(html_nodes(pp3, "div .zg_itemWrapper span.a-size-small.a-color-secondary"))
                page<-cbind.data.frame(category,rank,titles,prices)
                all_the_books<-rbind.data.frame(all_the_books,page)
                Sys.sleep(2)
        }
}

write.csv(all_the_books, "Top100 Book Prices per Category Amazon.csv", row.names=FALSE)