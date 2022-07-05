# DI 관련 어노테이션



###  @Auttowired : 빈 자동 주입

- @Autowired
- INameService nameService;



### @Qualifier : 특정 빈의 이름을 지정

- @Autowired
- @Qualifier("anotherNameService")
- INameService nameService;



### @Resource : @Autowired + @Qualifier

- @Resource(name="anotherNameService")
- INameService nameService;
- javax.annotation 라이브러리 추가