0. /usr/share/X11/xkb/symbols/us
1. Paste the real-prog-dvorak contents in the file.
3. Put the snippet in evdev.xml and base.xml below of the us layout. 
Search for the string  <!-- Keyboard indicator for English layouts --> & drop: 
<variant> <configItem> <name>real-prog-dvorak</name> <description>English (Real Programmers Dvorak)</description> </configItem> </variant>
4. Edit base.lst and evdev.lst. Jump to ! variant section & look for us language. Shove in somewhere in betweens this line: 
real-prog-dvorak us: English (Real Programmers Dvorak)
