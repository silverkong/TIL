# 스프링 DB 연동

> MyBatis 연동



1. MVC 프로젝트 생성
   - Spring Legacy Project

2. pom.xml 기본 설정

   - Java Version : 11
   - Spring Framework Version : 5.2.22.RELEASE
   - Maven Plugins Source/Target : 1.8

3. 프로젝트 설정

   - Project Facets

     - Java Version 11
     - Tomcat Check

   - Java Compiler

   - Java Build Path

   - web.xml 한글 인코딩

     ```xml
       <!-- 한글설정 -->
       	<filter>
       		<filter-name>encodingFilter</filter-name>
       		<filter-class>
             		org.springframework.web.filter.CharacterEncodingFilter
       		</filter-class>
       
       		<init-param>
       			<param-name>encoding</param-name>
       			<param-value>UTF-8</param-value>
       		</init-param>
       
       		<init-param>
       			<param-name>forceEncoding</param-name>
       			<param-value>true</param-value>
       		</init-param>
       	</filter>
       
       	<filter-mapping>
       		<filter-name>encodingFilter</filter-name>
       		<url-pattern>/*</url-pattern>
       	</filter-mapping>
       
       	<!-- 한글설정 END -->
     ```

       **해당 부분까지 완료 후 실행시켜서 오류 있는 지 확인**

       

4. pom.xml에 데이터베이스 의존성 설정

   > 라이브러리 추가 : <dependency> 추가

   - Spring JDBC 의존성 : spring-jdbc
     - org.springframework
     - 5.2.22.RELEASE
   - Connection Pool 의존성 : commons-dbcp
     - 1.4 [jar]
   - mysql 의존성
     - mysql-connector-java
     - 8.0.29
   - mybatis / mybatis-spring 의존성
     - org.mybatis

5. 데이터베이스 연결 정보 설정

   - jdbc.properties 파일 생성

     - jdbc.dirverClassName=com.mysql.cj.jdbc.Driver
     - jdbc.url=jdbc:mysql://localhost:3306/schemaName?serverTimezone-UTC
     - jdbc.username=root
     - jdbc.password=1234

   - 스프링 설정 파일 생성 : application-config.xml

     - src/main/resource 폴 내 spring 폴더 생성

     - application-config.xml 생성

       - [Namespaces]에서 beans / context / mybatis-spring 체크

     - DataSource / Mapper 지정

       ```xml
         <context:property-placeholder location="classpath:database/jdbc.properties"/>
         <context:component-scan base-package="com.spring_mvc.mybatis"/>
         	
         <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">
           <property name="driverClassName" value="${jdbc.driverClassName}"/>
           <property name="url" value="${jdbc.url}"/>
           <property name="username" value="${jdbc.username}"/>
           <property name="password" value="${jdbc.password}"/>
         </bean>
         	
         <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
         		<property name="dataSource" ref="dataSource"/>
         		<property name="mapperLocations" 	
                       value="classpath:com/spring_mvc/mybatis/**/*.xml"/>
         </bean>
       ```
     
   - web.xml에 변경된 내용 설정

     - application-config.xml 사용한다고 설정

       ```xml
        <context-param>
           <param-name>contextConfigLocation</param-name>
           <param-value>classpath:/spring/application-config.xml</param-value>
         </context-param>
       ```

         **해당 부분까지 완료 후 실행시켜서 오류 있는 지 확인!**

         

6. 클래스 구성
   - package 생성
      - model
        - vo.java
   	  
      - service
      
        - iService.java
        - service.java
         - interface iService
         - Qualifier import 시 beans.factory.annotation.Qualifier로 임포트
      
     - dao
       - dao.java
         - MyBatis에서는 DAO 인터페이스 필수
         
       - mapper.xml
         
         - mapper 상단에 mybatis 추가
         
            ```xml
           <!DOCTYPE mapper
             PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
           ```
         
         - Mapper에 mapper와 resultMap 추가
         
           ```xml
           <mapper namespace="com.spring_mvc.mybatis.dao.IProductDAO">
             <resultMap id="prdResult" type="com.spring_mvc.mybatis.model.ProductVO" >
                 <result property="prdNo" column="prdNo"/>
                 <result property="prdName" column="prdName"/>
                 <result property="prdPrice" column="prdPrice"/>
                 <result property="prdCompany" column="prdCompany"/>
                 <result property="prdStock" column="prdStock"/>
             </resultMap>
           </mapper>
           ```
         
         - application-config.xml에 dao 패키지 추가
         
           ```xml
            <mybatis-spring:scan base-package="com.spring_mvc.mybatis.dao"/>
       
     - controller
       - controller.java
     
   - views 폴더에 index.jsp 생성

   - controller에 index 페이지 열기 요청

   - HomeController / home.jsp 삭제

      **해당 부분 까지 완료 후 실행시켜서 index 페이지 열리는 지 확인**

      

7. CRUD 기능 구현

   1. 전체 상품 조회 (SELECT)

      - ProductController에서 요청 받아서 ProductService 클래스의 listAllProduct() 메소드 호출

        ```java
        // DI 설정
        @Autowired
        ProductService prdService;
        
        // 전체 상품 조회 요청 처리
        @RequestMapping("/product/productAllList")
        public String viewProductAllList(Model model) {
          // 서비스 클래스이 메소드 호출해서 결과 받아옴
          ArrayList<ProductVO> prdList = prdService.listAllProduct();
        
          // 모델 설정
          model.addAttribute("prdList", prdList);
        
          return "product/productAllListView";
        }
        ```

      - IProductDAO의 listAllProduct() 메소드 호출

        - ProductMapper에서 SQL 처리하고 결과 반환

          ```xml
          <!-- 전체 상품 조회  -->
          <!-- 주의! id는 IProductDAO의 각 메소드 이름과 동일해야 함  -->
          <select id="listAllProduct" resultMap="prdResult">
            SELECT * FROM product ORDER BY prdNo
          </select>
          ```

      - ProductService에서 받아서 ProductController에게 반환

        ```java
        // MyBatis 사용하는 경우
        @Autowired
        @Qualifier("IProductDAO")
        IProductDAO dao;	
        
        @Override
        public ArrayList<ProductVO> listAllProduct() {
          return dao.listAllProduct();
        }
        ```

      - ProductController에서 View 페이지로 전달

      - 화면에 결과 출력

        - views 폴더에 product 폴더 생성

        - productAllListView.jsp 생성 : `<c:forEach>` 사용해서 테이블 형태로 출력

          

   2. 상품 등록 (INSERT)

      - product 폴더에 상품 등록 폼 생성 : productNewForm.jsp

      - ProductController

        - 상품 등록 폼 열기 요청 처리

          ```java
          // 상품 등록 폼 열기 요청 처리
          @RequestMapping("/product/productNewForm")
          public String viewProductNewForm() {		
            return "product/productNewForm";
          }
          ```

        - 입력된 내용 insert 처리

          ```java
          // 상품 등록 : 상품 정보 DB 저장
          @RequestMapping("/product/insertProduct")
          public String insertProduct(ProductVO prd) {		
            prdService.insertProduct(prd);
          
            // DB에 데이터 저장한 후 전체 상품 조회 화면으로 포워딩
            return "redirect:./productAllList";
            // return "product/productAllListView"; 뷰페이지 이름 반환 (데이터 없는 빈 페이지)
          }
          ```

      - ProductMapper

        ```xml
        <!-- 상품 등록  -->
        <insert id="insertProduct" 
                parameterType="com.spring_mvc.mybatis.model.ProductVO">
          INSERT INTO product (prdNo, prdName, prdPrice, prdCompany, prdStock)
          VALUES(#{prdNo}, #{prdName}, #{prdPrice}, #{prdCompany}, #{prdStock})
        </insert>
        ```

      - ProductService

        ```java
        @Override
        public void insertProduct(ProductVO prd) {
          dao.insertProduct(prd);
        }
        ```

        

   3. 상품 상세 정보 조회 (SELECT)

      - product 폴더에 상품 상세 페이지 생성 : productDetailView.jsp

      - 상품 번호 클릭하면 상품 상세 정보 조회 화면으로 이동

        - 상품 번호에 링크 설정

          ```html
          <a href="<c:url value='/product/productDetailView/${prd.prdNo}'/>">
            ${prd.prdNo}
          </a>
          ```

      - ProductController에서 @PathVariable로 전달 받음

        ```java
        // 상품 상세 정보 조회 : 1개 상품 조회
        @RequestMapping("/product/productDetailView/{prdNo}")
        public String detailViewProduct(@PathVariable String prdNo, Model model) {
          ProductVO prd = prdService.detailViewProduct(prdNo);
          model.addAttribute("prd", prd);
        
          return "product/productDetailView";
        }
        ```

      - ProductMapper

        ```xml
        <!--  상품 상세 정보 조회 -->
        <select id="detailViewProduct" parameterType="String" 
                resultType="com.spring_mvc.mybatis.model.ProductVO">
          SELECT * FROM product WHERE prdNo=#{prdNo}
        </select>
        ```

      - ProductService

        ```java
        @Override
        public ProductVO detailViewProduct(String prdNo) {
          return dao.detailViewProduct(prdNo);
        }
        ```

      

   4. 상품 정보 수정 (UPDATE)

      - product 폴더에 상품 수정 폼 생성 : productUpdateForm.jsp

      - 상품 상세 정보 조회에서 상품 정보 수정 요청

        - 수정 버튼 추가

      - ProductController

        - 상품 정보 수정 폼 열기 요청 처리

          ```java
          // 상품 정보 수정 폼 열기 요청 처리
          @RequestMapping("/product/productUpdateForm/{prdNo}")
          public String updateProductForm(@PathVariable String prdNo, Model model) {
            // 수정할 상품 번호 받아서, detailViewProduct() 메소드 호출하면서 전달하고
            // 해당 상품 정보 1개 받아서 모델 설정
            ProductVO prd = prdService.detailViewProduct(prdNo);
            model.addAttribute("prd", prd);
          
            return "product/productUpdateForm";
          }
          ```

        - 수정 내용 DB 저장

          ```java
          // 수정 내용 DB 저장
          @RequestMapping("/product/updateProduct")
          public String updateProduct(ProductVO prd) {
            prdService.updateProduct(prd);
          
            // DB에 데이터 저장한 후 전체 상품 조회 화면으로 포워딩
            return "redirect:./productAllList";
          }
          ```

      - ProductMapper

        ```xml
        <!--상품 정보 수정-->
        <update id="updateProduct" 
                parameterType="com.spring_mvc.mybatis.model.ProductVO">
          UPDATE product
          SET prdName=#{prdName}, prdPrice=#{prdPrice}, 
          prdCompany=#{prdCompany}, prdStock=#{prdStock}
          WHERE prdNo=#{prdNo}
        </update>
        ```

      - ProductService

        ```java
        @Override
        public void updateProduct(ProductVO prd) {
          dao.updateProduct(prd);
        }
        ```

        

   5. 상품 정보 삭제 (DELETE)

      - 상품 상세 정보 조회에서 상품 정보 삭제

        - 삭제 버튼 추가

        - 삭제 버튼 클릭 시 컨펌 기능

          ```javascript
          function deleteCheck(){
            var answer = confirm("삭제하시겠습니까?");
            if(answer == true){
              // 자바스크립트 : 컨트롤러에게 요청
              location.href = "/mybatis/product/deleteProduct/${prd.prdNo}";
            }
          }
          ```

      - ProductController

        ```java
        // 상품 정보 삭제
        @RequestMapping("/product/deleteProduct/{prdNo}")
        public String deleteProduct(@PathVariable String prdNo) {
          prdService.deleteProduct(prdNo);
        
          //삭제한 후 전체 상품 조회 화면으로 포워딩
          return "redirect:/product/productAllList";
        }
        ```

      - ProductMapper

        ```xml
        <!--상품 정보 삭제-->
        <delete id="deleteProduct" parameterType="String">
          DELETE FROM product WHERE prdNo=#{prdNo}
        </delete>
        ```

      - ProductService

        ```java
        @Override
        public void deleteProduct(String prdNo) {
          dao.deleteProduct(prdNo);
        }
        ```

        

      