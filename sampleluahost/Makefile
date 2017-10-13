LUAHOME=$(HOME)/opt/lua-5.3.0/src

all: sampleluahost

sampleluahost: sampleluahost.cpp
	g++ -g -Wall sampleluahost.cpp -llua -L$(LUAHOME) -I$(LUAHOME) -o sampleluahost -ldl
