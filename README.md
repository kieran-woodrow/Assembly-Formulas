
# 🏷️ Project Name

Implementation of some assembly algorithms

---
## 🗂️ Table Of Contents

- [Project Overview](#-project-overview)
- [Technology Stack](#-technology-stack)
- [Installation](#-installation)
- [Usage](#-usage)
- [Running the Project](#-running-the-project)
- [Screenshots](#-screenshots)
---

## 📚 Project Overview

-create a function which will count the number of words in a string,
-create a function that will shift the characters of a string left by a certain degree and return the shifted string,
-create a function that takes in a string of letters and two integers that point to letters that need to be swapped and returns the string with the swap being executed on the string,
-create a function that takesin a string of words, two element values (integers) and the size of the words and should return the string with a swap having been completed,
-create a function that in a string consisting of words, the total number of words and the length of a word and should return the string sorted in alphabetical order.

---

## 🛠️ Technology Stack 

### Project code language used

 ![AGPL License](https://img.shields.io/badge/C%2B%2B-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white)

 ![AGPL License]( https://img.shields.io/badge/WebAssembly-654FF0?style=for-the-badge&logo=WebAssembly&logoColor=white)

## 💻 IDE

 ![VSCode](https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)

## 📝 Installation

1. Clone the repository
2. Navigate to the main directory.
3. Install GDB and c++ using GCC and YASM
4. Use GDB to import asm file and run it

---

## 🎮 Usage

Can be run in vs code or terminal.

---

## 🏃🏻‍♂️ Running The Project

1. Run the command yasm -f elf32 "program name here".asm -o "program name here".o in terminal to create object files
2. Run the command gcc -m32 "program name here".o -o "program name here" to link the object file to GCC
3. Run the command gdb program in terminal
4. Set a breakpoint at the start of your function break _"your functio name"
5. Run the commands as desired such as info registers, run, next, continue, quit to go through the function and see the values in the regisrers
6. Run print $eax (or any other register) to see the value.

---

## 📷 Screenshots

![threads](https://github.com/kieran-woodrow/Assembly-Algorithms/blob/main/Assets/Screenshot%202024-06-06%20at%2021.40.31.png)

![threads](https://github.com/kieran-woodrow/Assembly-Algorithms/blob/main/Assets/Screenshot%202024-06-06%20at%2021.42.03.png)


