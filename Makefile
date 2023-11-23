TARGET=m1p2

all:
	arm-linux-gnueabi-gcc -o $(TARGET) main.c $(TARGET).s
