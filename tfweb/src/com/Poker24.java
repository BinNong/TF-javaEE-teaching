package com;

import java.util.Scanner;

public class Poker24 {
    private static int COUNT = 4; //抽取的扑克牌数量
    private  double[] number = new double[COUNT]; //扑克牌的数组 number=[1,5,5,5]
    private  String[] expression = new String[COUNT]; //表达式数组

    public String finalExp;

    public int getCOUNT() {
        return COUNT;
    }
    public Poker24(String numbers) {
        String[] temp = numbers.split("\\s+");
        int i = 0;
        for(String n: temp){
            number[i] = Double.parseDouble(n);
            expression[i] = n;
            i++;

        }
    }
    public boolean checkCondition(int n){ //n=4
        //当递归到只有一个数时，判断是否满足条件
        if(n == 1){
            if(number[0] == 24){
                this.finalExp = expression[0].substring(1, expression[0].length()-1);
                return true;
            }
            else
                return false;
        }
        for (int i = 0; i < n - 1; i++) {
            for(int j = i + 1; j < n; j++){
                double tempA = number[i];
                double tempB = number[j];
                String expreA = expression[i];
                String expreB = expression[j];
                number[j] = number[n-1];
                expression[j] = expression[n-1];
                //开始做加法
                expression[i] = "("+expreA+"+"+expreB+")";
                number[i] = tempA+tempB;
                if(checkCondition(n-1))
                    return true;
                //减法，两种情况，tempA-tempB和tempB-tempA
                expression[i] = "("+expreA+"-"+expreB+")";
                number[i] = tempA-tempB;
                if(checkCondition(n-1))
                    return true;
                expression[i] = "("+expreB+"-"+expreA+")";
                number[i] = tempB-tempA;
                if(checkCondition(n-1))
                    return true;
                //乘法
                expression[i] = "("+expreA+"*"+expreB+")";
                number[i] = tempA*tempB;
                if(checkCondition(n-1))
                    return true;
                //除法，两种情况，tempA/tempB和tempB/tempA,并且保证分母不为0
                if(tempB != 0){
                    expression[i] = "("+expreA+"/"+expreB+")";
                    number[i] = tempA/tempB;
                    if(checkCondition(n-1))
                        return true;
                }
                if(tempA != 0){
                    expression[i] = "("+expreB+"/"+expreA+")";
                    number[i] = tempB/tempA;
                    if(checkCondition(n-1))
                        return true;
                }
                number[i] = tempA;
                number[j] = tempB;
                expression[i] = expreA;
                expression[j] = expreB;
            }
        }
        return false;
    }
}
