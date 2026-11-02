# AI USAGE

Tool/model and date:
- Google Gemini / AI Overviews, 10/30/2026 & 10/31/2026

Purpose: 
- Exclusively used for help in writing code files

# Usage 1

Reading Files in C (1):
- Prompt: "how to read a file in c"
- Response: <img width="436" height="576" alt="image" src="https://github.com/user-attachments/assets/7d6ae24f-6861-40d9-bd49-31b02f5f0b40" /> <img width="437" height="486" alt="image" src="https://github.com/user-attachments/assets/96cfb4aa-ec47-4f21-94f4-34ad9c093bb2" /> <img width="434" height="499" alt="image" src="https://github.com/user-attachments/assets/0e6a1156-873c-4dd9-9669-95e9efb676c1" />

What I used (1):
- I used the example code as a base for my parse_log and win function within legacy_log_parser.c file.

What I changed (1):
- I changed the way error handling was done in my code to make it more concise, as well as using exit(0) instead of return as return was causing the code to work improperly. 

How I tested it (1):
- I tested my code by running it within GDB, and then interpretting the errors I received and fixing it.

One error, limitation, or rejected suggestion (1):
- One limitation was that using return, specifically within win() during our buffer overflow attack, the return calls would execute without a valid address left on the stack and would crash the program. To fix this I changed teh returns to exit().

# Usage 2

Reading a File into a Heap Buffer in C:
- Prompt: "how can I read the file into a heap buffer"
- Response: <img width="429" height="560" alt="image" src="https://github.com/user-attachments/assets/c505afd0-6035-42fd-8829-634ac4b11d57" /><img width="430" height="607" alt="image" src="https://github.com/user-attachments/assets/137e2d09-d1f3-464e-be56-fb12c6ea8fac" /><img width="436" height="273" alt="image" src="https://github.com/user-attachments/assets/119b11d0-0ebb-432e-b1f5-cad89ae16e1d" />

What I used (2):
- I used the example code as a base for my parse_log function, as it required reading the file into a heap buffer.

What I changed (2):
- The code example given used fseek to determine the size of the file, which was not necessary for out implemntation since we already had a MAX_COPY size set.

How I tested it (2):
- I tested my code by running it within GDB, and then interpretting the errors I received and fixing it.

One error, limitation, or rejected suggestion (2):
- I rejected the suggestion to use fseek, as we already had MAX_COPY set so we did not to determine the file's size.
