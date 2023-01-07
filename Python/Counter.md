#### Counter

- 파이썬 collections 라이브러리의 Counter는 등장 횟수를 세는 기능을 제공한다.

- 리스트와 같은 반복 가능한(iterable) 객체가 주어졌을 때 내부의 원소가 몇 번씩 등장하는지를 알려준다.

  ```python
  from collections import Counter

  counter = Counter(['red', 'blue', 'red', 'green', 'blue', 'blue'])

  print(counter['blue'])	# 블루가 등장한 횟수 출력
  print(counter['green'])	# 그린이 등장한 횟수 출력
  print(dict(counter))	# 사전 자료형으로 반환

  # 출력값 : 3
  #		  1
  #		  {'red': 2, 'blue': 3, 'green': 1}
  ```
