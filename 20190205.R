install.pakages("sqldf")	#sql쿼리문으로 데이터 핸들링가능
library(sqldf)
sqldf('select * from iris limit 3')
sqldf('select * from iris where "Sepal.Length" > 7')