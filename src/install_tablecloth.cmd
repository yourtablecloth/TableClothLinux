@echo off
pushd "%~dp0"

:: curl.exe 존재 여부 확인
where curl.exe >nul 2>&1
if errorlevel 1 (
    echo curl.exe 파일이 없습니다. 배치 파일을 종료합니다.
    goto exit
)

:: wsl.exe 존재 여부 확인
where wsl.exe >nul 2>&1
if errorlevel 1 (
    echo wsl.exe 파일이 없습니다. 배치 파일을 종료합니다.
    goto exit
)

if not exist "%localappdata%\tableclothlinux" (
    mkdir "%localappdata%\tableclothlinux"
)

curl.exe -L https://cloud-images.ubuntu.com/wsl/jammy/current/ubuntu-jammy-wsl-amd64-ubuntu22.04lts.rootfs.tar.gz -o "%localappdata%\tableclothlinux\ubuntu-jammy-wsl-amd64.tar.gz"

if not exist "%systemdrive%\Distro\tablecloth" (
    mkdir %systemdrive%\Distro\tablecloth
)

if not exist "%userprofile%\.cloud-init" (
    mkdir "%userprofile%\.cloud-init"
)

copy /y .\wsl2-cloudinit\*.user-data "%userprofile%\.cloud-init"

wsl.exe --unregister tablecloth-wooribank
wsl.exe --import tablecloth-wooribank C:\Distro\tablecloth-wooribank "%localappdata%\tableclothlinux\ubuntu-jammy-wsl-amd64.tar.gz" --version 2
wsl.exe -d tablecloth-wooribank -- cloud-init status --wait --long
wsl.exe -t tablecloth-wooribank
wsl.exe -d tablecloth-wooribank

:exit
popd
@echo on
