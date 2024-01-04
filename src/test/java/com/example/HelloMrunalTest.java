package com.example;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class HelloMrunalTest {
    @Test
    public void testHelloMrunal() {
        assertEquals("Hello Mrunal!", new HelloMrunal().getMessage());
    }
}
