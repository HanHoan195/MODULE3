package com.example.calculator;

public class Calculator {
    public static float calculate(float firstOperand, float secondOperand, char operation ) {
        switch (operation) {
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if(secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new RuntimeException("Lỗi chia 0");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
