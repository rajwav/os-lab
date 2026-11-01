OS LAB · Interactive Shell Script Mastery & Lab Reference
============================================================

An interactive, offline-ready web suite and verified shell script collection covering 23 core Operating Systems lab experiments.

Files:
------
• os-lab.html  -> Double-click to open in any web browser. 100% self-contained and works completely offline.
• scripts/     -> 23 tested, standalone executable shell scripts with header comments and usage instructions.

Key Enhancements & Features:
----------------------------
1. ⚡ Interactive Playground / Simulator:
   - Test every single script directly inside the web browser with custom inputs (no terminal required).
   - Real-time step breakdown for Prime, Palindrome, Min/Max, grep, file counters, C compilation, sed, and duplicate cleaning.

2. 📊 Dynamic CPU Scheduling & Deadlock Visualizers:
   - Interactive Gantt chart for FCFS, SJF, SRTN, Priority, and Round Robin (with/without context switch).
   - Add/Remove processes dynamically, edit Arrival/Burst/Priority, and switch between exam presets (Convoy Effect, Starvation, Equal Bursts).
   - Step-by-step playback with performance metrics (Average TAT, Average WT, CPU Utilization %, formulas).
   - Banker's Algorithm & Deadlock Detection: Automatic live Need Matrix calculation ($Need = Max - Allocation$) and step-by-step safety sequence animation.
   - Animated visualizers for Dekker's Algorithm, Dining Philosophers (deadlock-free circular wait breaking), and Producer-Consumer (bounded buffer with counting semaphores).

3. 🎓 Exam Viva Voce Q&A:
   - High-yield oral exam viva questions and verified technical explanations for all 23 lab questions.
   - Self-test mode to quiz yourself before revealing the answers.

4. 💻 Syntax Highlighting & Code Tools:
   - Full Bash syntax token coloring (keywords, variables, strings, comments, numbers, operators).
   - "Explain Mode": Hover or tap any token to see its definition from the embedded dictionary.
   - Toggle between Concise Model Answer and Documented Version.
   - One-click "Copy Script" and "Download .sh".

5. 📝 Practice Mode & Mistakes Notebook:
   - Write scripts from memory with automated syntax linting and line-by-line diffing against the tested model answer.
   - Persistent mistakes notebook tracks your weakest questions and frequent errors.

6. 📖 Quick Reference Bash Cheat Sheet:
   - Built-in searchable cheat sheet for parameter expansion, arrays, conditionals, arithmetic, and CLI utilities (sed, awk, grep, find, xargs).

7. 🌗 Modern UI & Keyboard Shortcuts:
   - Dark / Light theme toggle with persistence in localStorage.
   - Category filtering pills (Basics, CPU Scheduling, Deadlock, Synchronization, Mastered).
   - Keyboard shortcuts:
     [ / ] or k / j : Previous / Next question
     c              : Copy current script
     d              : Download current .sh
     m              : Toggle "Mastered" status
     t              : Toggle Dark / Light theme
     p              : Switch to Practice mode
     /              : Focus search bar
     ?              : Open Cheat Sheet
     Esc            : Close dialogs / modals

Running Standalone Scripts (Linux, macOS, or WSL):
--------------------------------------------------
    cd scripts
    ./01_prime_or_not.sh
    # or:
    bash 01_prime_or_not.sh

Scripts taking arguments:
    ./05_count_files_directories_executables.sh <folder>
    ./07_compile_and_create_an_executable.sh hello.c
    ./08_remove_even_lines_file_name_as_argument.sh nums.txt
