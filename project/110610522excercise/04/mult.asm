// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

 @2
    M=0     // R2 = 0
    @i      // 計算已經加了多少次
    M=0     // i=0
(LOOP)
    @i       //被乘數
    D=M     // D=i
    @0      //乘數
    D=D-M   // D=i-R0
    @END    //查看剩餘計算次數
    D;JGE    // if i-R0 >= 0 goto END

    @1       
    D=M     // D=R1
    @2      //目前結果
    M=D+M   // R2=R2+R1
    @i      //加一算一次計算過程
    M=M+1   // i=i+1
    @LOOP   //繼續加
    0;JMP   // Repeat
(END)
    @END    //結束迴圈
    0;JMP
