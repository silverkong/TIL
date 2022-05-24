# 타입변환과 다형성





### Polymorphism : 다형성

> 같은 타입이지만 실행 결과가 다양한 객체를 이용(대입)할 수 있는 성질



- 부모 타입에는 모든 자식 객체가 대입 가능
- 코드 측면에서 보면 하나의 타입에 여러 객체를 대입함으로써 다양한 기능을 이용할 수 있게 됨
- 자식 클래스에서 다양하게 메소드 오버라이딩 구현



### Promotion : 자동 타입 변환

> 프로그램 실행 중에 자동 타입 변환이 일어나는 것



- 상속 계층의 상위면 자동 타입 변환 가능
- 자동 타입 변환 후에는 부모 클래스 멤버만 접근 가능

- 예외 : 오버라이딩
  - 메소드가 자식 클래스에 오버라이딩 되었다면 자식클래스 메소드가 대신 호출됨

- ```java
  Parent parent = new Child();	//자동 타입 변환
  ```



### Casting : 강제 타입 변환

> 부모 타입을 자식 타입으로 변환하는 것



- 모든 부모 타입을 자식 타입으로 변환할 수 있는 것은 아님
  - 자식 타입이 부모 타입으로 자동 변환된 후 다시 자식 타입으로 변환할 때만 가능 (원위치)
- 자식 타입에 선언된 필드와 메소드를 다시 사용해야 할 경우

- ```java
Child child = (Child)parent;	//강제 타입 변환





### instanceof 연산자

> 객체 타입을 확인하는 연산자



- 참조 변수가 참조하고 있는 인스턴스 실제 타입 확인
- 부모 타입으로 변환되어 있는 상태에서만 강제 타입 변환이 가능
  - 아니면 ClassCastException 예외 발생

- `boolean result = 참조변수 instanceof 타입(클래스명)`

- ```java
  public static void method1(Parent parent) {
    //강제 타입 변환하기 전에 instanceof 연산자로 먼저 확인
    if(parent instanceof Child) {
      //Child c = (Child)parent;
      System.out.println("method1 - Child 로 변환 성공");
    }else {
      System.out.println("method1 - Child 로 변환 실패");
    }
  }
  ```
