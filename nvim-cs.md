

# Neovim Cheatsheet

## Basics
- :w – Save  
- :q – Quit  
- :wq or ZZ – Save and quit  
- :q! – Quit without saving  
- :e <file> – Open file  
- :Ex – File explorer  
- :set nu / :set nonu – Enable/disable line numbers  
- :set rnu – Relative line numbers  
- :noh – Clear search highlights  

## Movement
- h j k l – Left, down, up, right  
- w / W – Next word (punct. vs whitespace delimited)  
- b / B – Previous word  
- e / E – End of word  
- 0 – Beginning of line  
- ^ – First non-blank char of line  
- $ – End of line  
- gg – Go to top  
- G – Go to bottom  
- :n – Go to line n  
- H – Top of screen  
- M – Middle of screen  
- L – Bottom of screen  
- Ctrl + d – Half-page down  
- Ctrl + u – Half-page up  
- Ctrl + f – Full page down  
- Ctrl + b – Full page up  
- % – Jump to matching bracket/paren  
- '' – Jump to previous cursor position  
- `` `` `` – Jump to exact last position  
- zz - centers the line 
- f{char} - go to that char in line
- ; - next char after the one matched by f
- , - older char

## Editing
- {command}t{char} - do command till char
- i / I – Insert before / at line start  
- a / A – Append after / at line end  
- o / O – Open new line below / above  
- x – Delete character  
- s – Substitute (delete + insert) character  
- S – Substitute entire line  
- r<char> – Replace single character  
- J – Join current and next line  
- dd – Delete line  
- D – Delete to end of line  
- cc – Change (replace) line  
- C – Change to end of line  
- yy – Yank (copy) line  
- Y – Yank to end of line  
- p / P – Paste after / before  
- u – Undo  
- Ctrl + r – Redo  
- . – Repeat last command  

## Visual Mode
- v – Start character-wise selection  
- V – Start line-wise selection  
- Ctrl + v – Start block-wise selection  
- gv – Reselect last visual selection  
- d – Delete selection  
- y – Yank selection  
- > / < – Indent / unindent  
- = – Auto-indent  

## Search & Replace
- /pattern – Search forward  
- ?pattern – Search backward  
- n / N – Next / previous match  
- * – Search word under cursor forward  
- # – Search word under cursor backward  
- :%s/old/new/g – Replace all  
- :%s/old/new/gc – Replace all with confirm  
- :s/old/new/g – Replace in current line  

## Buffers & Windows
- :sp <file> – Horizontal split  
- :vsp <file> – Vertical split  
- Ctrl + w q – Close window  
- Ctrl + w = – Equalize window sizes  
- Ctrl + w _ – Maximize height  
- Ctrl + w | – Maximize width  

## Macros
- q<reg> – Start recording to register (e.g. qa)  
- <commands> – Run your commands  
- q – Stop recording  
- @<reg> – Play macro (e.g. @a)  
- @@ – Replay last macro  
- :<range>@<reg> – Run macro over range (e.g. :1,5@a)  

## Marks
- ma – Set mark a  
- 'a – Jump to line of mark a  
- `` a ` – Jump to exact position of mark a  
- :marks – List all marks  

## Custom
* <A> j/h – Move line up or down
* <C> h/j/k/l – Move panes
* telescope {C-v}: open file in new buffer

## Surround
- ys - basic call
- ys{motion}{char} -> adds
- ex: ysaw) -> add () around this specific word
- ds{char} -> deletes
- cs{char} -> changes
- yss{char} -> whole line
- visual mode + S{char} -> add in visual mode

## Comments
- gcc -> comment/uncomment current line
- gbc -> comment/uncomment current line block comment
- Ngcc/gbc -> comment/uncomment N lines after the one (2gcc)
- gc/gb{motion} -> comment lines using motion (gc} -> comments inside brackets) 
- ex: (gc$ -> comments line starting from cursor position (block comment))
- gc/gb{count}{motion} -> comments using count and motion 
- ex: (gc8k -> comments 8 lines before)
- ex: (gc8j -> comments 8 lines after)
- ex: (gca} -> toggles inside bracket)

## Folding
- zf{motion/numbers}{char} -> fold
- zo -> unfold
