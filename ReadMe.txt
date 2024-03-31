for create obj file -> nasm -f win32 HelloWorld.asm -o HelloWorld.obj
for compilate obj file by Linker -> golink /entry:Start /console kernel32.dll user32.dll HelloWorld.obj
