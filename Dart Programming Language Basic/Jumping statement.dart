
void main() {
  // 1. BREAK statement
  print("Example 1: break");

  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      break; // Stops the loop completely
    }
    print(i);
  }

  // 2. CONTINUE statement
  print("\nExample 2: continue");

  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      continue; // Skips the current iteration
    }
    print(i);
  }

  // 3. RETURN statement
  print("\nExample 3: return");

  showNumbers();
}

void showNumbers() {
  for (int i = 1; i <= 5; i++) {
    if (i == 4) {
      return; // Exits the function
    }
    print(i);
  }

  print("This line will not execute");
}
