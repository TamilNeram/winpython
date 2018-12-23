rem Copyright Â© 2018 WinPython team
rem Licensed under the terms of the MIT License
rem (see winpython/__init__.py for details)

rem This is to do a 7-zip installer

rem ================================================================
rem These lines are automatically replaced when creating installer:
rem (see winpython/make.py)
set SEVENZIP_EXE=C:\Program Files (x86)\7-Zip\7z
set DISTDIR=C:\WinP\bd36\buPs2\winp64-3.6.x.0
set ARCH=64
set VERSION=3.6.7.0Ps2

rem  2018-04-04 need to minimize path length of installation further: remove flavor in install path

set VERSION_INSTALL=3670

set RELEASELEVEL=beta3
set PORTABLE_DIR=C:\WinPython-64bit-3.4.3.7Qt5\winpython_github20181029\portable

rem ================================================================
rem these lines are static definitions
set ID=Winpython
set ID_INSTALL=WPy
set FILE_DESCRIPTION=%ID% Installer
set COMPANY=%ID%
set BRANDING=%ID%, the portable Python Distribution for Scientists
set COPYRIGHT=Copyright © 2018+ WinPython Team
set MyAppPublisher=WinPython team
set MyAppURL=https://winpython.github.io/

rem  OutputBaseFilename "{#ID}{#ARCH}-{#VERSION}{#RELEASELEVEL}"

rem ================================================================ [Setup]
rem OutFile "${DISTDIR}\..\${ID}${ARCH}-${VERSION}${RELEASELEVEL}.exe"
set MyBinaryOutputDir=%DISTDIR%\..
set OutputBaseFilename=%ID%%ARCH%-%VERSION%%RELEASELEVEL%

rem 7-zip uncompress the directory compressed %DISTDIR% (no option to change it in gui)


echo %time%

rem compression + include auto_extract in GUI mode
"%SEVENZIP_EXE%" -mx5 a "%MyBinaryOutputDir%\%OutputBaseFilename%.exe" %DISTDIR% -sfx7z.sfx



echo  autoextract using command line options 
echo "%MyBinaryOutputDir%\%OutputBaseFilename%.exe" -y -o%MyBinaryOutputDir%\zz > NUL

rem -mx1 = speed fastest
rem -mx3 = speed fast
rem -mx5 = speed normal
rem -mx7 = compress maximum
rem -mx9 = compress ultra