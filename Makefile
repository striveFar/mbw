CC = arm-linux-gnueabi-gcc
CFLAGS=-O2 -Wall -g

NAME=mbw
TARFILE=${NAME}.tar.gz

OBJS = mbw.o
TARGET = mbw

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

${TARFILE}: clean
	tar cCzf .. ${NAME}.tar.gz --exclude-vcs ${NAME} || true

rpm: ${TARFILE}
	rpmbuild -ta ${NAME}.tar.gz

.PHONY: clean
clean:
	rm -f mbw
	rm -f ${NAME}.tar.gz

