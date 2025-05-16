@echo off
pushd "%~dp0"
chcp 65001

set ZipSavePath=%~dp0项目日志
set ZipSaveFile=%~dp0项目日志.zip
echo %ZipSavePath%
if exist %ZipSavePath% (
    echo --------------------------删除已存在的上报目录：%ZipSavePath%--------------------------
    rmdir %ZipSavePath% /s /q
    echo --------------------------删除上报目录结束--------------------------
)
mkdir %ZipSavePath%

if exist %ZipSaveFile% (
    echo --------------------------删除已存在的上报文件：%ZipSaveFile%--------------------------
    del %ZipSaveFile%
    echo --------------------------删除上报文件结束--------------------------
)

:: 项目目录
set GameSavedPath=%~dp0Saved
if exist %GameSavedPath% (
	echo --------------------------开始复制目录：%GameSavedPath%--------------------------
	xcopy "%GameSavedPath%" "%~dp0项目日志\GameSaved" /E /I
	echo --------------------------复制目录：%GameSavedPath% 结束--------------------------
) else (
	echo 目录未找到：%GameSavedPath%
)

:: 用户目录
set EditorSavedPath=%SystemDrive%\ProgramData\LightGameBox\Editor\Dev\Saved
if exist %EditorSavedPath% (
	echo --------------------------开始复制目录：%EditorSavedPath%--------------------------
	xcopy "%EditorSavedPath%" "%~dp0项目日志\EditorDevSaved" /E /I
	echo --------------------------复制目录：%EditorSavedPath% 结束--------------------------
) else (
	echo 目录未找到：%EditorSavedPath%
)

set EditorSavedPath=%SystemDrive%\ProgramData\LightGameBox\Editor\Pre\Saved
if exist %EditorSavedPath% (
	echo --------------------------开始复制目录：%EditorSavedPath%--------------------------
	xcopy "%EditorSavedPath%" "%~dp0项目日志\EditorDevSaved" /E /I
	echo --------------------------复制目录：%EditorSavedPath% 结束--------------------------
) else (
	echo 目录未找到：%EditorSavedPath%
)

set EditorSavedPath=%SystemDrive%\ProgramData\LightGameBox\Editor\EA\Saved
if exist %EditorSavedPath% (
	echo --------------------------开始复制目录：%EditorSavedPath%--------------------------
	xcopy "%EditorSavedPath%" "%~dp0项目日志\EditorDevSaved" /E /I
	echo --------------------------复制目录：%EditorSavedPath% 结束--------------------------
) else (
	echo 目录未找到：%EditorSavedPath%
)

set EditorSavedPath=%SystemDrive%\ProgramData\LightGameBox\Editor\Release\Saved
if exist %EditorSavedPath% (
	echo --------------------------开始复制目录：%EditorSavedPath%--------------------------
	xcopy "%EditorSavedPath%" "%~dp0项目日志\EditorDevSaved" /E /I
	echo --------------------------复制目录：%EditorSavedPath% 结束--------------------------
) else (
	echo 目录未找到：%EditorSavedPath%
)

:: 启动器目录
set EditorLaunchPath=%SystemDrive%\ProgramData\LightGameBox\LaunchInnerEditor
if exist %EditorLaunchPath% (
    echo --------------------------开始复制目录：%EditorLaunchPath%--------------------------
    xcopy "%EditorLaunchPath%" "%~dp0项目日志\LaunchInner" /E /I
    echo --------------------------复制目录：%EditorLaunchPath% 结束--------------------------
) else (
    echo 目录未找到：%EditorLaunchPath%
)

set EditorLaunchPath=%SystemDrive%\ProgramData\LightGameBox\LaunchPreEditor
if exist %EditorLaunchPath% (
    echo --------------------------开始复制目录：%EditorLaunchPath%--------------------------
    xcopy "%EditorLaunchPath%" "%~dp0项目日志\LaunchInner" /E /I
    echo --------------------------复制目录：%EditorLaunchPath% 结束--------------------------
) else (
    echo 目录未找到：%EditorLaunchPath%
)

set EditorLaunchPath=%SystemDrive%\ProgramData\LightGameBox\LaunchEAEditor
if exist %EditorLaunchPath% (
    echo --------------------------开始复制目录：%EditorLaunchPath%--------------------------
    xcopy "%EditorLaunchPath%" "%~dp0项目日志\LaunchInner" /E /I
    echo --------------------------复制目录：%EditorLaunchPath% 结束--------------------------
) else (
    echo 目录未找到：%EditorLaunchPath%
)

set EditorLaunchPath=%SystemDrive%\ProgramData\LightGameBox\LaunchEditor
if exist %EditorLaunchPath% (
    echo --------------------------开始复制目录：%EditorLaunchPath%--------------------------
    xcopy "%EditorLaunchPath%" "%~dp0项目日志\LaunchInner" /E /I
    echo --------------------------复制目录：%EditorLaunchPath% 结束--------------------------
) else (
    echo 目录未找到：%EditorLaunchPath%
)

:: 最终压缩包
if exist %ZipSavePath% (
    echo --------------------------开始压缩目录：%ZipSavePath%--------------------------
    powershell Compress-Archive -Path '%ZipSavePath%\*' -Force -DestinationPath '%~dp0项目日志.zip'
    echo --------------------------压缩目录：%ZipSavePath% 成功--------------------------
    
    rmdir %ZipSavePath% /s /q
)

popd
pause