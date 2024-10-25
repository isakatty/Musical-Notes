# Lomuq v 1.2.0


## 프로젝트 소개
**`LO`g your practiced/lessoned `MU`si`Q`**: 악기 레슨 혹은 연습 기록을 곡과 함께 기록


## 개발 환경
```
- 개발 인원 : 1명
- 개발 기간 : 2024.09.19 - 2024.10.04
- Swift 5.10
- Xcode 15.3
- iOS 16.0+
- 세로모드/라이트 모드 지원
```

## 기술스택
- SwiftUI, MVVM, MusicKit, Realm Repository
- Remote push notification
- Localization

## 핵심 기능
| 달력| 기록 | Feed | 곡과 연결된 기록 |
| --- | --- | --- | --- |
|<img width="100%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcDGtRv%2FbtsJVJAmWSr%2FFUP6XoY0N73ypsBNbD0KZK%2Fimg.png">|<img width="100%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F2j1g6%2FbtsJVhxDhvk%2FoB9NntMhUoCGGqW0NEyxFK%2Fimg.png">|<img width="90%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FMR15w%2FbtsJU8ADu6Q%2FrBkqh9MpKCIaoy2WydygR0%2Fimg.png">|<img width="100%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbPI4gA%2FbtsJV8TT5fZ%2Fpy115xPamSKjv5CirJeKN0%2Fimg.png">|

- 연습 일지 작성
    - 메모 작성, 삭제
    - 달력에서 바로보는 연습 일지 기록
    - 앨범으로 보는 연습 일지 기록
- 검색
    - Apple Music API를 활용한 음악 검색


## 주요 기술
- **Realm 기반 Local DB 설계**
    - **일대다 관계**를 LinkingObjects를 통해 데이터 모델간 연결된 DB 구성
- **데이터 기반이 아닌 기술 기반의 MusicKit 사용**
    - 클라이언트(앱)에서 apple music을 통해 직접 검색하지만, API 호출 형식이 아닌 `기술 기반의 응답`값으로 결과 받음
    - `async`/`await`을 사용한 비동기 데이터 로딩
    - 데이터 소스를 UI계층과 분리하기 위해 Repository Pattern을 활용해 `의존성 분리`
        - 필요한 곳에서 해당 repository를 주입하여 사용
## 트러블슈팅
### 1. MusicKit 검색 기록이 영어로 나오는 이슈
- 원인
    - 기존 MusicKit의 `MusicCatalogSearchRequest`을 통해 검색을 하게 될 경우, 서버에서 정해준 형태로 응답값을 받게됨.
    - MusicCatalogSearchRequest에는 따로 지역 설정을 할 수 있는 변수 X
- 해결
    - 사용자의 로컬 설정을 할 수 없는 `MusicCatalogSearchRequest`가 아닌 **URLRequest를 통해 지역 설정이 가능** `MusicDataRequest(urlRequest: URLRequest)`을 통해 요청
    - URLRequest의 url에 지역(locale)을 포함시켜 요청
        ```
        URL(string: "https://api.music.apple.com/v1/catalog/kr/search?term=\(txt)&limit=25&offset=\(offset)&types=songs") 
        ```
    - 앱 최초 로드시, 지역을 선택하는 뷰를 통해 유저가 원하는 언어로 결과 표출
        - 해당 정보는 UserDefaults에 저장하여 검색시 위치 정보를 url에 담아 통신

### 2. onChange 버전 분기처리
- 원인
    - SwiftUI에서 제공하는 .onChange modifier는 iOS 17.0을 기준으로 변화 존재.
    - 기존에 사용하던 **onChange(of: perform:)** 이 곧 deprecated될 예정
        - 77%가 iOS 17을 점유하고 있는 상황에서 곧 deprecated될 onChange를 쓰기엔 리스크가 있다고 판단.
        - 지원 버전이 16.0+이기 때문에 버전 처리를 해주는 custom Modifier 추가해야겠다고 판단.

    <img width="712" alt="onChange" src="https://github.com/user-attachments/assets/0202e482-9091-456c-8fb4-8f6987f74eb7">

- 해결
    - 
    - iOS 버전에 따라 다른 형태의 onChange를 분기처리한 후 같은 동작을 수행할 수 있는 하나의 modifier 생성
        - count 값의 변화를 감지하여, 값이 줄어들면 currentIndex를 감소시키는 형태
    
    <img width="731" alt="customOnChange" src="https://github.com/user-attachments/assets/aae67112-88e5-4870-920c-acdaf4b9448f">