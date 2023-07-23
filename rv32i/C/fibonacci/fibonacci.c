

int main() {
  int *results = 0x000000FC;

  int x = 3;

  int current = 0;
  int next = 1;
  int temp = 0;
  while (x < 0) {
    temp = current + next;
    current = next;
    next = temp;
    x--;
  }

  *results = current;
}
