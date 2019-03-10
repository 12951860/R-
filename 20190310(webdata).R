#CSV데이터
#공공데이터포털(data.go.kr)의 건강검진정보(2015년) 데이터(NHIS_OPEN_GJ_2015)
# File > Import Dataset > From Text (readr) > 파일선택(폴더는 영어, 패키지설치)
install.packages('readr')
#한글이 깨져서 보일경우 하단에 있는 Locale항목의 Configure를 클릭하고 Encoding은 제일 하단의 Other를 선택
#encoding방식으로는 euc-kr을 입력후 OK누르고 Import로 데이터를 가져옴
#데이터를 가져올 때엔 데이터가 변형되거나 누락된 부분이 있는지 확인할 것

