@echo off

:: -------------------------------------------------
:: 1000�ȃR�s�[�o�b�`
:: music.mp3��1000��R�s�[����
:: ��music0001.mp3�`music1000.mp3
:: -------------------------------------------------
setlocal enabledelayedexpansion
  
:: �J�����g�p�X���擾�������ϐ�(~d�F�h���C�u�A~p�F�p�X)
set currentpath=%~dp0

:: -------------------------------------------------
:: prefix	�F�t�@�C����
:: extension�F�g���q
:: pad		�F����
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

