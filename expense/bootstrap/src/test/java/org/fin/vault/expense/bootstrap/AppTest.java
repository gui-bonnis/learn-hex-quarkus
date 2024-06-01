package org.fin.vault.expense.bootstrap;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AppTest {

  private App cut;

  @BeforeEach
  void setUp() {
    this.cut = new App();
  }

  @Test
  void firstTest() {
    String input = "duke";

    String result = cut.format(input);

    assertEquals("DUKE", result);
  }
}
