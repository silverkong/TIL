# 중첩 클래스



### Nested Class : 중첩 클래스

- 클래스 내부에 선언한 클래스
- 여러 클래스와 관계를 맺는 경우에는 클래스를 선언하는 것이 좋으나, 특정 클래스와 관계 맺는 경우에는 내부에 선언하는 것이 좋음
- 중첩 클래스도 클래스이기 때문에 컴파일 시 바이트코드 파일 생성





### 중첩 클래스 종류

1. 인스턴스 멤버 클래스
2. 정적 멤버 클래스
3. 로컬 클래스





### 인스턴스 멤버 클래스

- static 키워드 필요 없음

- 인스턴스 필드와 메소드만 선언

- static 필드와 메소드는 선언 불가

- 바깥 클래스의 객체를 생성해야만 사용 가능

  - ```java
    class A{
      //인스턴스 멤버 클래스
      class B{
        B(){ }						//생성자
        int field;				//인스턴스 필드
        void method(){ }	//인스턴스 메소드
      }
    }
    ```

  - ```java
    public AMain{
      
      public static void main(String[] args){
        A a = new A();		//바깥 클래스인 A 객체 생성
        A.B b = a.new B();//인스턴스 멤버 클래스 B 객체 생성
        
      }
    }
    ```
    
    



### 정적 멤버 클래스

- static 키워드로 선언된 클래스

- 모든 종류의 필드, 메소드 선언 가능

- 바깥 클래스 객체 생성하지 않아도 됨

	-	```java
	  class A{
	    //정적 멤버 클래스
	    static class C{
	      C(){ }										//생성자
	      int field;								//인스턴스 필드
	      static int field2;				//정적 필드
	      void method(){ }					//인스턴스 메소드
        static void method2(){ }	//정적 메소드
      }
    }
    ```
    
  - ```java
    public AMain{
      
      public static void main(String[] args){
        A.C c = new A.C();//정적 멤버 클래스 C 객체 생성
        
      }
    }
    ```





### 로컬 클래스

- 메소드 내에서 선언된 클래스

- 메소드 내에서만 사용하기 때문에 접근 제한 필요 없음

- 인스턴스만 선언 가능

  - ```java
    void localMethod(){
      // 로컬 클래스
      class D{
        D(){ }						//생성자
        int field;				//인스턴스 필드
        void method(){ }	//인스턴스 메소드
      }
      
      D d = new D();
    }
    ```

    