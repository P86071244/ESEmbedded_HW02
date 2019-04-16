HW02
===
This is the hw02 sample. Please follow the steps below.

# Build the Sample Program

1. Fork this repo to your own github account.

2. Clone the repo that you just forked.

3. Under the hw02 dir, use:

	* `make` to build.

	* `make clean` to clean the ouput files.

4. Extract `gnu-mcu-eclipse-qemu.zip` into hw02 dir. Under the path of hw02, start emulation with `make qemu`.

	See [Lecture 02 ─ Emulation with QEMU] for more details.

5. The sample is designed to help you to distinguish the main difference between the `b` and the `bl` instructions.  

	See [ESEmbedded_HW02_Example] for knowing how to do the observation and how to use markdown for taking notes.

# Build Your Own Program

1. Edit main.s.

2. Make and run like the steps above.

# HW02 Requirements

1. Please modify main.s to observe the `push` and the `pop` instructions:  

	Does the order of the registers in the `push` and the `pop` instructions affect the excution results?  

	For example, will `push {r0, r1, r2}` and `push {r2, r0, r1}` act in the same way?  

	Which register will be pushed into the stack first?

2. You have to state how you designed the observation (code), and how you performed it.  

	Just like how [ESEmbedded_HW02_Example] did.

3. If there are any official data that define the rules, you can also use them as references.

4. Push your repo to your github. (Use .gitignore to exclude the output files like object files or executable files and the qemu bin folder)

[Lecture 02 ─ Emulation with QEMU]: http://www.nc.es.ncku.edu.tw/course/embedded/02/#Emulation-with-QEMU
[ESEmbedded_HW02_Example]: https://github.com/vwxyzjimmy/ESEmbedded_HW02_Example

--------------------

- [x] **If you volunteer to give the presentation next week, check this.**

--------------------

HW02
===
## 1.實驗題目
Please modify main.s to observe the push and the pop instructions:

Does the order of the registers in the push and the pop instructions affect the excution results?

For example, will push {r0, r1, r2} and push {r2, r0, r1} act in the same way?

Which register will be pushed into the stack first?
## 2.實驗步驟
1.Extract gnu-mcu-eclipse-qemu.zip into hw02 dir. Under the path of hw02, start emulation with make qemu.

2.設計 main.s，我在12-15行分別為r0, r1, r2, r3加入了數值。
並在20行將PUSH打亂成`r3, r1, r0, r2`。在25行POP也打亂成`r6, r5, r7, r4`。

![avatar](https://github.com/P86071244/ESEmbedded_HW02/blob/master/main.s_screenshot.png)

3.將 main.s 編譯並以 qemu 模擬，`$ make clean`, `$ make`, `$ make qemu`
開啟另一 Terminal 連線 `$ arm-none-eabi-gdb` ，再輸入 `target remote localhost:1234` 連接，輸入兩次的 `ctrl + x` 再輸入 `2`, 開啟 Register 以及指令，並且輸入 `si` 單步執行觀察。
當執行到 `0x16`及`0x18`時，發現我原先打亂的順序被排序好，次序是從小到大。

![avater](https://github.com/P86071244/ESEmbedded_HW02/blob/master/qemu_screenshot.png)

## 3.結果討論
根據[ARM infomation center](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0283b/Babefbce.html)描述了PUSH, POP registers. 

*Registers are stored on the stack in numerical order, with the lowest numbered register at the lowest address.

```
Note
If the entry address of your image is in Thumb state, then the least significant bit of the address must be set to 1.
The linker does this automatically if you specify a symbol.
```
