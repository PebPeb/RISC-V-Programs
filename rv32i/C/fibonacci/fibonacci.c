

int main() {
  int *results = 0x000000FC;

  register int x = 18;

  register int current = 0;
  register int next = 1;
  register int temp = 0;

  while (x > 0) {
    temp = current + next;
    current = next;
    next = temp;
    x--;
  }

  *results = current;
}
