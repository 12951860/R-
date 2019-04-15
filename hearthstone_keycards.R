#The probability that key cards are in my hand at x turn
#wants=Number of key cards, twocards=Not regendary card
#M=Number of mulligan cards, coin=First is F
wmcp <- function(wants=1,twocards=0,M=0,coin=F){
  y = rep(0,15)
  i = 1
  z <- 1:wants
  if(twocards>=1){a = 1:twocards}else{a=0}
  deck<-c(z,a,rep(0,30-wants-twocards))
  for(i in 1:15){
    j = 1
    n=0
    for(j in 1:100000){
      c <- sample(deck,3+coin+M+i)
      k=1
      d=1
      repeat{
        d=d*length(which(c==k))
        k = k+1
        if(k>wants) break;
      }
      if(d >= 1) n=n+1
      j = j+1
    }
    y[i]<-n/100000
    i = i+1
  }
  
  return(y)
}

#ex) Chance to do coin-kele-shadow-kele on first turn of second player
wmcp(2,1,4,T)
#(4 cards mulligan); 14.49%

#ex2) 하수인 법사 선턴일 때 3턴 신비한 지능,4턴 산거,5턴 카드가,창조술사
wmcp(1,1,3)
wmcp(2,1,3)
#0.5157*0.6044*0.1777; 5.54%

#후공 4턴 산거, 5턴 카드가,창조술사(신비한지능있는 덱) 
wmcp(1,1,4)
wmcp(2,1,4)
#0.5647*0.6466*0.2492+0.6073*0.213 = 22.03%

#선공 5턴 산거,6턴 카드가 창조술사(신지 쓰는 덱)
wmcp(1,1,3)
wmcp(2,1,3)
#0.6494*0.5158*0.2466+0.6078*0.2115 = 21.12%

#선공 거인법사 4턴 정찰대원, 5턴 죽기
wmcp(1,2,3)
wmcp(1,1,3)
#0.5632*(0.6072-0.5641) = 2.43%