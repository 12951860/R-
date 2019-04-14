#The probability that key cards are in my hand at x turn
#wants=Number of key cards, twocards=Not regend card
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
      for(j in 1:50000){
        c <- sample(deck,3+coin+M+i)
        k=1
        d=1
        for(k in 1:wants){
          d=d*length(which(c==k))
        }
        if(d >= 1) n=n+1
        j = j+1
      }
      y[i]<-n/50000
      i = i+1
    }
    
    return(y)
}

#ex) Chance to do coin-kele-shadow-kele on first turn of second player
wmcp(2,1,4,T)
#(4 cards mulligan); 14.63%
#----------아래 예시는 계산이 잘못 됐을 수 있음-----------------
#ex2) 하수인 법사 선턴일 때 3턴 신비한 지능,4턴 산거,5턴 카드가,창조술사
wmcp(1,1,3)
wmcp(2,1,3)
#0.51598*0.5671*0.1771; 5.18%
#후공 4턴 산거, 5턴 카드가,창조술사 
wmcp(1,1,4)
wmcp(2,1,4)
#0.56002*0.6475*0.21066+0.607*0.21066 = 20.43%
#선공 5턴 산거,6턴 카드가 창조술사
wmcp(1,1,3)
wmcp(2,1,3)
#0.60458*0.21342+0.5607*0.64628*0.21342 = 20.64%
