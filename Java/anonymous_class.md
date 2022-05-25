# 익명 구현 객체

> 구현 클래스를 만들어서 사용하는 것이 일반적이고 클래스 재사용이 가능하여 편리하지만 일회성으로 필요한 경우에 사용하는 객체



### Anonymous Class : 익명 구현 객체

- 말 그대로 이름 없는 객체
- 일반적으로 인터페이스를 사용하기 위해서는 인터페이스를 구현한 클래스를 만들어야 함
- 일회성의 구현 클래스가 다수 만들어질 경우 관리 대상이 많아짐
- 이렇게 일회성이고 재사용 필요 없는 객체를 만들 때 익명 구현 객체를 사용함



### 익명 구현 객체 형식

```java
인터페이스명 변수 = new 인터페이스명(){
  // 인터페이스에 선언된 추상 메소드 재정의
  // 해당 인터페이스에 선언된 모든 추상 메소드를 구현해야 함 (없을 시 컴파일 에러)
  // new 연산자 뒤에 클래스 이름이 없음
  // 마지막에 세미콜론 붙여야 함 (하나의 실행문)
};
```



#### 예제

```java
interface AnonyInterface{
  public void method();
}

public class AnonymousClass{
  
  public static void main(String[] args){
    
    AnonyInterface if = new AnonyInterface(){
      @Override
      public void method(){
        system.out.println("method");
      }
    };
    
    if.method();
  }
  
}
```

