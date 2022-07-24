# File Upload Controller

컨트롤러에 업로드 코드 작성




```java
// 파일 업로드
@RequestMapping("/fileUpload")
public String viewFileUpload(@RequestParam("uploadFile") MultipartFile file, Model model) throws IOException {
  // 1. 파일 저장 경로 설정 : 실제 서비스 되는 위치 (프로젝트 외부에 저장)
  String uploadPath = "저장할 경로";
  // 마지막에 / 있어야 함

  // 2. 원본 파일 이름 알아오기
  String originalFileName = file.getOriginalFilename();

  // 3. 파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
  // UUID 클래스 사용 : 랜덤으로 생성
  UUID uuid = UUID.randomUUID();
  String savedFileName = uuid.toString() + "_" + originalFileName;

  // 4. 파일 생성
  File newFile = new File(uploadPath + savedFileName);

  // 5. 서버로 전송
  file.transferTo(newFile);

  // Model 설정 : 뷰 페이지에서 원본 파일 이름 출력
  model.addAttribute("originalFileName", originalFileName);

  return "upload/fileUploadResult";
}
```

