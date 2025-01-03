@echo off

echo Assembling...
tools\asm6f.exe puyopuyo.asm -m -l %* bin\puyopuyo.nes > bin\assembler.log
if %ERRORLEVEL% neq 0 goto buildfail
move /y puyopuyo.lst bin > nul
echo Done.
echo.

echo Your hash number:
certutil -hashfile bin\puyopuyo.nes SHA256 | findstr /V ":"


goto end

:buildfail
echo The build seems to have failed.
goto end

:buildsame
echo Your built ROM and the original are the same.
goto end

:builddifferent
echo Your built ROM and the original differ.
echo If this is intentional, you're all set.
goto end


:end
echo on
