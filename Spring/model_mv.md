# View 페이지로 데이터 전달 방법

1. Model 사용
2. ModelAndView 사용



### Model 사용

- Model 인터페이스
- Model Attribute 추가하기 위해 고안
- key/value 형태로 값을 임시 저장
- Controller에서 Model에 데이터를 저장하고 View 이름을 return 하면 View 페이지로 Model이 전달되고 View 페이지에서 key를 사용해서 Model에 저장된 Data 사



### Model 사용 형식

- 요청 처리 메소드에서 Model 객체를 파라미터로 받아서
- public String home(Locale locale, Model model)
- addAttribute() 메소드로 key / value 설정
- model.addAttribute("serverTime",formattedDate);
- (return 되는 뷰페이지로 전달 : data 추출)${serverTime}



### ModelAndView 사용

- ModelAndView 클래스 사용데이터와 뷰 둘 다 설정
- 반환값으로 ModelAndVeiw 객체 반환
- ModelAndView mv = new ModelAndView();
- 파라미터로 받으면 더 간단
- mv.addObject(“name”, “홍길동”); // 데이터 설정mv.setViewName(“showInfo2”); // 뷰 이름 설정return mv; //ModelAndView 객체 반환