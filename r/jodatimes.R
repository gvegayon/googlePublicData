# Example vector
x <- c(1998, '2010-01', '2010-01-01')


# Id daily dates
grep('[0-9]{4}[-][0-9]{2}[-][0-9]{2}$',x)

joda.times <- matrix(c(
    # Days
    '[0-9]{4}[-][0-9]{2}[-][0-9]{2}$', 'yyyy-MM-dd', '1988-03-02',
    '[0-9]{4}[ ][0-9]{2}[ ][0-9]{2}$', 'yyyy MM dd', '1988 03 02',
    '[0-9]{2}[-][0-9]{2}[-][0-9]{4}$', 'dd-MM-yyyy', '02-03-1988',
    '[0-9]{2}[ ][0-9]{2}[ ][0-9]{4}$', 'dd MM yyyy', '02 03 1988',
    '[0-9]{4}[/][0-9]{2}[/][0-9]{2}$', 'yyyy/MM/dd', '1988/02/03',
    '[0-9]{2}[/][0-9]{2}[/][0-9]{4}$', 'dd/MM/yyyy', '02/03/1988',
    # Months
    '[0-9]{4}[-][0-9]{2}$', 'yyyy-MM', '1988-03',
    '[0-9]{4}[ ][0-9]{2}$', 'yyyy MM', '1988 03',
    '[0-9]{4}[-][A-Za-z]{3}$', 'yyyy-MMM', '1988-Mar',
    '[0-9]{4}[ ][A-Za-z]{3}$', 'yyyy MMM', '1988 Mar',
    '[0-9]{2}[-][0-9]{4}$', 'MM-yyyy', '03-1988',
    # Years
    '[0-9]{4}$', 'yyyy', '2001'
  ), ncol=3, byrow=T
)

joda.times <- as.data.frame(joda.times, stringsAsFactors = F)
colnames(joda.times) <- c('rexp','format','example')

test <- c('02-03-2001', '1992', 'Ene-2008')

lapply(joda.times[,1], function(X,Y) {grep(pattern=X,x=Y,invert=T)}, Y=test)

