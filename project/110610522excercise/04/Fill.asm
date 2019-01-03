// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


//我複製貼上老師的ouoˇ  我覺得依我的腦袋打不出這些QAQ  我有好好理解他的  老師QAQ

// --------------------------
// 類似 Ｃ語言的高階寫法
// forever
//   arr = SCREEN
//   n = 8192
//   i = 0
//   while (i < n) {
//     if (*KBD != 0)
//       arr[i] = -1
//     else
//       arr[i] = 0
//     i = i + 1
//   }
// goto forever;
// --------------------------
// 類似 Ｃ語言的低階寫法
// arr = SCREEN
// n=8192
// FOREVER:
// loop:
//   if (i==n) goto ENDLOOP
//   if (*KBD != 0)
//     RAM[arr+i] = -1
//   else 
//     RAM[arr+i] = 0
//   i++
// goto loop
// ENDLOOP:
// goto FOREVER
// --------------------------

(FOREVER)
// arr = SCREEN
	@SCREEN     //16384
	D=A
	@arr
	M=D

// n=8192
	@8192
	D=A
	@n
	M=D

	@i
	M=0
(LOOP)
  // if (i==n) goto ENDLOOP
	@i
	D=M
	@n
	D=D-M
	@ENDLOOP    //如果D = 0 就是全白的意思
	D; JEQ
	
  // if (*KBD != 0)     //鍵盤有按下
	@KBD                //24576
	D=M     // D = *KBD
	@ELSE
	D; JEQ  // if (*KDB==0) goto ELSE
	
	//   RAM[arr+i] = -1        //-1 會變黑
	@arr
	D=M
	@i
	A=D+M
	M=-1
	
	@ENDIF
	0; JMP
(ELSE)	
  // else 
  //   RAM[arr+i] = 0
	@arr
	D=M
	@i
	A=D+M
	M=0
	
(ENDIF)
	
	// i++
	@i
	M=M+1
	
	@LOOP
	0; JMP

(ENDLOOP)
	@FOREVER
	0; JMP
	
