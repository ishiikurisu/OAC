#include <assert.h>
#include "./mips/processor.h"

void main() {
  uint32_t x;

  // Testing sign extention
  x = sign_ext_imm(0x2000);
  printf("0x00002000 =? %lx\n", x);
  assert(x == 0x2000);

  x = sign_ext_imm(0x8000);
  printf("0xFFFF8000 =? %lx\n", x);
  assert(x == 0xFFFF8000);
}
