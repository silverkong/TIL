# 예외처리 매커니즘



#### 예외 처리 메커니즘

자바에서 예외 처리는 다음과 같은 순서로 진행됩니다.

 

1. try 블록에 도달한 프로그램의 제어는 try 블록 내의 코드를 실행합니다.

  이때 만약 예외가 발생(throw)하지 않고, finally 블록이 존재하면 프로그램의 제어는 바로 finally 블록으로 이동합니다.

2. try 블록에서 예외가 발생하면 catch 핸들러는 다음과 같은 순서로 적절한 catch 블록을 찾게 됩니다.

​	  2-1. 스택에서 try 블록과 가장 가까운 catch 블록부터 차례대로 검사합니다.

​	  2-2. 만약 적절한 catch 블록을 찾지 못하면, 바로 다음 바깥쪽 try 블록 다음에 위치한 catch 블록을 차례대로 검사합니다.

​	  2-3. 이러한 과정을 가장 바깥쪽 try 블록까지 계속 검사하게 됩니다.

​	  2-4. 그래도 적절한 catch 블록을 찾지 못하면, 예외는 처리되지 못합니다.

3. 만약 적절한 catch 블록을 찾게 되면, throw 문의 피연산자는 예외 객체의 형식 매개변수로 전달됩니다.

4. 모든 예외 처리가 끝나면 프로그램의 제어는 finally 블록으로 이동합니다.
5. finally 블록이 모두 처리되면, 프로그램의 제어는 예외 처리문 바로 다음으로 이동합니다.

 

다음 그림은 위에서 설명한 예외 처리 메커니즘을 그림으로 표현한 것입니다.

 

![img](http://tcpschool.com/lectures/img_java_exception_intro.png)

 

만약 ①번 try 블록에서 예외가 발생하지 않고, 바깥쪽 try 블록에서도 예외가 발생하지 않으면, ⑥번 finally 블록이 바로 실행될 것입니다.

하지만 ①번 try 블록에서 예외가 발생하면, ②번과 ③번 catch 블록에서 해당 예외를 처리할 수 있는지 검사하게 됩니다.

만약 적절한 catch 블록을 찾지 못하면, 바깥쪽 try 블록의 ④번과 ⑤번 catch 블록도 차례대로 검사하게 됩니다.

이때 해당 예외를 처리할 수 있는 catch 블록을 찾게 되면, 해당 catch 블록을 실행한 후 ⑥번 finally 블록을 실행합니다.

하지만 모든 catch 블록이 해당 예외를 처리할 수 없으면, 예외는 처리되지 못한 채 해당 프로그램은 강제 종료될 것입니다.