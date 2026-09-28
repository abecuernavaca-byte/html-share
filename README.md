# HTML 문서 공유

이 저장소는 정적 HTML 문서를 GitHub Pages에 자동 배포합니다.

## 빠른 사용법

1. 공유할 HTML 파일을 `public/` 아래에 둡니다.
   - 홈페이지: `public/index.html`
   - 독립 문서: `public/문서이름/index.html`
2. 변경 내용을 `main` 브랜치에 푸시합니다.
3. GitHub Actions가 자동으로 GitHub Pages에 배포합니다.

터미널에서는 다음처럼 쓸 수 있습니다.

```bash
cd ~/Projects/html-share
./scripts/publish-html.sh /절대/경로/문서.html desired-url-slug
```

배포 주소 형식은 다음과 같습니다.

```text
https://abecuernavaca-byte.github.io/html-share/
https://abecuernavaca-byte.github.io/html-share/desired-url-slug/
```

> 공개 저장소이므로 개인정보, 상담 기록, 비밀번호, API 키, 비공개 교회 자료를 넣지 마십시오.
