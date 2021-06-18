#include <stdio.h> 
#include <string.h>
#include <syscall.h>

int my_errno;
const char greeting[] = "hello world\n";

int my_write(int fd, const void *buf, size_t len)
{
  int ret;
  asm volatile ("int $0x80" : "=a" (ret)
                : "0" (SYS_write),
                  "b" (fd), "c" (buf), "d" (len)
                : "memory");
  if (ret < 0) {
    my_errno = -ret;
return -1; }
return ret; }

int main() { my_write (1, greeting, strlen(greeting)); }
