#damage만큼의 피해를 줄 때 target번째의 캐릭터가 죽을 확률
#charactorHP는 캐릭터의 체력을 순서대로 적어씀

clean <- function(damage=1,charactorHP=c(30,1),target=1){
  l <- length(charactorHP)
  n = 0
  i=1
  for (i in 1:100000){
    x <- target
    j=1
    ll <- l
    C <- charactorHP

    while(j <= damage){
      a <- ceiling(runif(1,0,ll))
      C[a] <- C[a]-1
k=1
      if(C[x] == 0) {
        n = n+1
        k=ll+1
        j=damage+1
      }
      while(k <= ll){
        if(C[k]==0){
          if(k < x) x = x-1
          C <- C[-k]
          ll <- ll-1
        }
        k = k+1
      }
      j = j+1
    }
    i = i+1
  }
  p = n/100000
  return(p)
}

clean(5,c(30,2,1,1,2,5),target=4)
