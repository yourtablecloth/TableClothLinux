# TableClothLinux (식탁보 리눅스)

TableClothLinux는 리눅스에서 한국 인터넷 뱅킹 서비스를 사용할 수 있도록 샌드박스 환경을 자동으로 구축하는 것을 목표로 하는 오픈 소스 소프트웨어 프로젝트입니다.

## 프로젝트 소개

한국의 인터넷 뱅킹 및 전자 정부 서비스는 ActiveX 기반 보안 프로그램을 사용하여 리눅스 사용자들이 접근하기 어려웠습니다. TableClothLinux는 이러한 문제를 해결하기 위해 리눅스 환경에서 필요한 보안 프로그램들을 설치하고 설정하여, 한국 공공 및 금융 서비스를 리눅스 환경에서 사용할 수 있게 합니다.

## 프로젝트 현황

이 프로젝트는 `cloud-init`을 활용하여 WSL 2에서 자동으로 환경을 설정하는 방식으로 구현되어 있습니다. 추후 개발 과정에 따라 WSL 2 뿐 아니라 `cloud-init`을 지원하는 다른 가상 PC 환경까지 지원 범위를 확대할 수 있습니다.

현재는 국내 시중은행 및 주요 기관 위주로만 지원하고 있으나, 추후 개발 경과에 따라 더 많은 웹 사이트를 지원할 수 있게 될 것입니다.

## 주요 기능

- 인터넷 뱅킹 지원
- 다음 보안 모듈 자동 설치 및 구성:
  - IPInside-LWS
  - Veraport-G3
  - AnySign4PC
  - AhnLab Safe Transaction (ASTX)
- 한글 폰트 및 필수 패키지 자동 설치
- 공동인증서(구 공인인증서) 연동 준비

## 설치 방법

1. 이 저장소를 클론합니다.

   ```bash
   git clone https://github.com/your-username/TableClothLinux.git
   ```

2. `src` 디렉토리의 `install_tablecloth.cmd` 스크립트를 관리자 권한으로 실행합니다.
    - 이 스크립트는 Ubuntu 22.04 LTS 이미지를 다운로드하고 WSL2 환경을 설정합니다.
    - 필요한 보안 프로그램들을 자동으로 설치합니다.

3. 설치가 완료되면 `tablecloth-wooribank` WSL 배포판이 생성됩니다.

## 사용 방법

다음은 우리은행 인터넷 뱅킹의 예를 든 것입니다.

1. Windows 터미널이나 명령 프롬프트에서 다음 명령으로 TableCloth 환경을 실행합니다:

   ```powershell
   wsl -d tablecloth-wooribank
   ```

2. Google Chrome 브라우저를 실행하여 우리은행 웹사이트에 접속합니다:

   ```bash
   google-chrome-stable &
   ```

3. 공동인증서를 사용하려면 Windows의 공동인증서 디렉토리 (`%localappdata%\..\LocalLow\NPKI`)를 TableCloth 환경에 마운트해야 합니다.

## 제한사항 및 알려진 이슈

- 모든 은행 서비스가 완벽하게 작동하지 않을 수 있습니다.
- 일부 보안 프로그램은 추가 설정이 필요할 수 있습니다.
- WSL2의 특성상 성능 이슈가 발생할 수 있습니다.

## 기여하기

이 프로젝트에 기여하고 싶으시다면 이슈를 제출하거나 풀 리퀘스트를 보내주세요.

## 라이선스

이 프로젝트는 GNU Affero General Public License에 따라 라이선스가 부여됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.
