#question 10
num = 36
mu = 220
sig2 = 84
sig = sqrt(sig2)
ste = sig/sqrt(num)
t = 2.03
alpha = 0.05
crit_val = qt(1-alpha/2, df=n-1)
crit_val

halfwidth = se * crit_val
lo = xbar - halfwidth
hi = xbar + halfwidth

sumry = data.frame(n,xbar,se,crit_val,halfwidth,lo,hi)
sumry

#question 12
x = c(4.8,4.3,4.9,3.9,3.7)

n = length(x)

mu0 = 23

xbar = mean(x)
s2 = var(x)
s= sqrt(s2)
se = s/sqrt(n)

t = (xbar-mu0)/se

#  If null hypothesis is H0: mu > mu0 and alternative is HA: mu < mu0, set alpha = 0.05
#  and reject H0 at the alpha=0.05 level if t < crit_val

#  If null hypothesis is H0: mu < mu0 and alternative is HA: mu > mu0, set alpha = 0.95
#  and reject H0 at the alpha=0.05 level if t > crit_val

alpha = 0.95


crit_val = qt(alpha,df=n-1)

sumry = data.frame(n,xbar,se,alpha,t,crit_val)
sumry


#question 13
feed = c(1,2,3,4) 
ni = c(9,11,13,11) 
sumx = c(1462,2354,3202,3629) 
sumx2 = c(250468,530792,826764,1223345)
xbar = c(162.4444,214,246.3077,329.9091)
s2 = c(1621.778,2703.600,3173.897,2610.491)
df = data.frame(feed, ni, sumx,sumx2,xbar,s2) 
df

out = aov(xbar ~ feed, data=df)
summary(out)


#question 14
trees

trees["X"] <- NA
trees$X <- trees$Height*(trees$Girth)^2
trees

x = trees$X
y = trees$Volume

plot(x,y, xlab = "X", ylab = "Volume")

sumy = sum(y)
sumx = sum(x)
sumy2 = sum(y*y)
sumx2 = sum(x*x)
sumxy = sum(x*y)
n = length(y)

regress = data.frame(y,x)
regress
simpreg <- lm(y ~ x, data=regress)


print(simpreg)
anova(simpreg)
simpreg_sum <- summary(simpreg)
simpreg_sum

# EXTRACT AND PRINT THE COEFFICIENTS (B0 AND B1)
beta <- simpreg_sum$coef
beta
# Find and print sums of squares
ssct = sumy2 - (sumy*sumy/n)
ssr = beta[2] * (sumxy-(sumx*sumy/n))
sse = ssct-ssr
mse = sse/(n-2)
rsq = ssr/ssct
sum_squares = data.frame(ssct,ssr,sse,mse,rsq) 
sum_squares


plot(x,y,ylab="volume",xlab="X")
abline(simpreg)