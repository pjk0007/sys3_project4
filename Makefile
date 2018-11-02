# Makefile

start: main.o library.o resource.o book.o member.o undergraduate.o
	g++ -W -o start main.o library.o resource.o book.o member.o undergraduate.o
main.o: main.cpp
	g++ -W -c main.cpp
library.o: library.cpp
	g++ -W -c library.cpp
resource.o: resource.cpp
	g++ -W -c resource.cpp
book.o: book.cpp
	g++ -W -c book.cpp
member.o: member.cpp
	g++ -W -c member.cpp
undergraduate.o: undergraduate.cpp
	g++ -W -c undergraduate.cpp
clean:
	rm *.o start
