@echo off

:: -------------------------------------------------
:: 1000曲コピーバッチ
:: music.mp3を1000回コピーする
:: ⇒music0001.mp3～music1000.mp3
:: -------------------------------------------------
setlocal enabledelayedexpansion
  
:: カレントパスを取得する特殊変数(~d：ドライブ、~p：パス)
set currentpath=%~dp0

:: -------------------------------------------------
:: prefix	：ファイル名
:: extension：拡張子
:: pad		：桁数
:: -------------------------------------------------
set prefix=music
set extension=.mp3
set pad=4
  
for /l %%i in (1, 1, 1000) do (
    set num=0000%%i
    set file_path=%currentpath%%prefix%!num:~-%pad%!%extension%
    copy music.mp3 !file_path!
)
  
pause

