# 과제

알고리즘의 핵심아이디어는 10만개의 데이터 중 특정지점 t까지의 알파펫의 확률을 학습하고 그 지점까지는 고정된 코드를 부여하고 
학습한 데이터에 따른 허프만코딩을 통해 나머지 데이터들에 허프만 코드를 부여해 전체 평균비트길이가 가장 작아지는 지점 t를 구하는 것입니다.




# 코드를 통한 확인

총 비트길이는 learning_code_length를 읽으면 되고 혹시 몰라서 1000:1000:80000 에서 80개의 학습세트들의 비트를 다 구해서 min함수를 이용해 최솟값을 한 번 더 M으로 구해봤더니 그 값이 같았다.




# 고정비트 변환에 따른 t값 변화 관찰하기

고정비트 길이를 i로 두고   i= 4 : 7 ; 까지 돌려보았다. 결과는 똑같이 나왔다
그 이유는 허프만 코드가 가장 이상적인 코드이기 때문에 학습하는 데이터 횟수가 적어지면 허프만 코딩으로 코딩되는 알파벳 수가 많아지므로 
전체 평균 비트수가 작아지게 된다.
