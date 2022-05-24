# 객체 배열

> 객체를 가리키기 위한 레퍼런스 배열



### 하나의 배열로 객체 관리

```java
public class Car{
  //필드
  Tire tire1 = new Tire("앞왼쪽");
  Tire tire2 = new Tire("앞오른쪽");
  Tire tire3 = new Tire("뒤왼쪽");
  Tire tire4 = new Tire("뒤오른쪽");
  
  //객체 배열
  Tire tires = {
    new Tire("앞왼쪽"),
    new Tire("앞오른쪽"),
    new Tire("뒤왼쪽"),
    new Tire("뒤오른쪽")
  };
}
```

객체를 가리키는 레퍼런스를 원소로 갖는 배열

```java
// 객체를 배열로 만들면 for문도 사용 가능
for(int i=0; i<tires.length; i++){
  if(tires[i].roll() == false){
    stop();
    return(i+1);
  }
}
```



### 객체 배열

```java
Person[] p = new Person[5];	//레퍼런스 5개 생성 / p는 레퍼런스 배열을 가리키는 참조 변수
p[i] = new Person();				//객체 생성				/ p[i]는 객체를 가리키는 참조 변수
```

