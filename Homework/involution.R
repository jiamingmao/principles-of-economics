# Labor Market Matching

rm(list = ls())
library(ineq)
set.seed(133)
n = 10000

# ---------------------------- t = 1 -------------------------------------------

# generate n workers with skill level ~ Beta(2,5)
labor = rbeta(n,2,5)
hist(labor)

# generate n jobs with skill requirements ~ U(0,1)
job = runif(n)
hist(job)

# Assume that workers and jobs match assortatively: 
# the lowest skill worker is matched with the job with the lowest skill 
# requirement, the highest skill worker is matched with the job with the 
# highest skill requirement, etc. 
labor = sort(labor)
job = sort(job)

# Assume wage = job skill requirement (productivity) * labor skill level
wage = labor*job
hist(wage)

# Compute inequality
# Main measures: Gini Coefficient
ineq(wage,type="Gini")

# ---------------------------- t = 2 -------------------------------------------

# now generate n workers with skill level ~ Beta(5,2)
labor2 = rbeta(n,5,2)
hist(labor2)

# sort labor to match with jobs
labor2 = sort(labor2)

# Plot labor-job matching
plot(labor,job,'l',
     xlab="labor skill level", 
     ylab="job skill requirement")
lines(labor2,job,col='red')
legend("topleft",legend=c("t = 1", "t = 2"),
       lty=1,col=c("black", "red"))

# compute wages
wage2 = labor2*job
hist(wage2)

# inequality
ineq(wage2,type="Gini")

# Lorenz Curve
plot(Lc(wage))
lines(Lc(wage2),col="red")
legend("topleft",legend=c("t = 1", "t = 2"),
       lty=1,col=c("black", "red"))
