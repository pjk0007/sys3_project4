# Makefile

start: main.o library.o resource.o member.o
	g++ -W -o start main.o library.o resource.o member.o
main.o: main.cpp
	g++ -W -c main.cpp
library.o: library.cpp
	g++ -W -c library.cpp
resource.o: resource.cpp
	g++ -W -c resource.cpp
member.o: member.cpp
	g++ -W -c member.cpp
clean:
	rm *.o start
