#include <assert.h>
#include "./mips/processor.h"

int main() {
  processor_t *p;
  uint32_t x;

  printf("--- # Tests\n");
  /* Testing sign extention */
  x = sign_ext_imm(0x2000);
  printf("0x00002000 =? %lx\n", x);
  assert(x == 0x2000);

  x = sign_ext_imm(0x8000);
  printf("0xFFFF8000 =? %lx\n", x);
  assert(x == 0xFFFF8000);

  /* Testing function parameter extraction */
  p = new_processor(NULL, NULL);

  printf("add $9, $2, $0\n");
  p->instruction = 0x00404820;
  decode(p);
  assert(p->opcode == 0x0);
  assert(p->rd == 0x9);
  assert(p->rs == 0x2);
  assert(p->rt == 0x0);
  assert(p->funct == 0x20);

  printf("addiu $2, $0, 0xa\n");
  p->instruction = 0x2402000a;
  decode(p);
  assert(p->rs == 0x0);
  assert(p->rt == 0x2);
  assert(p->opcode == 0x9);
  assert(sign_ext_imm(p->imm) == 0xa);

  printf("lw $8, 0x0(8)\n");
  p->instruction = 0x8d080000;
  decode(p);
  assert(p->rs == 0x8);
  assert(p->rt == 0x8);
  assert(p->opcode == 0x23);
  assert(sign_ext_imm(p->imm) == 0x0);

  printf("ori $4, $1, 0x24\n");
  p->instruction = 0x34240024;
  decode(p);
  assert(p->rs == 0x1);
  assert(p->rt == 0x4);
  assert(p->opcode == 0xd);
  assert(p->imm == 0x24);

  free_processor(p);

  printf("... # All tests passed!\n");
  return 0;
}
