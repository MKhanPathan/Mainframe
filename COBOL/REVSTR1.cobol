      *----------------------------------------------------------------*
      *          PROGRAM TO DISPLAY REVERSE OF ANY INPUT STRING        *
      *----------------------------------------------------------------* 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRPGM1.
       AUTHOR. z/OS Mainframer.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-PROGRAM              PIC X(08)   VALUE 'STRPGM1'.
       01  WS-STRING-DATA.
           05  WS-STRING           PIC X(20)   VALUE 'z/OS Mainframer'.
           05  WS-REVSTRING        PIC X(20)   VALUE SPACES.
       01  WS-MISC.
           05  WS-LENGTH           PIC 9(2)    VALUE ZEROES.
           05  WS-SUB1             PIC 9(2)    VALUE ZEROES.
           05  WS-SUB2             PIC 9(2)    VALUE ZEROES.

       PROCEDURE DIVISION.
           DISPLAY 'PROGRAM: ' WS-PROGRAM.
           DISPLAY 'Using FUNCTION REVERSE: '.
           DISPLAY 'WS-STRING: ' WS-STRING.
           DISPLAY 'REVERSE: ' FUNCTION REVERSE ( WS-STRING ).

           DISPLAY 'USING PERFORM LOOP: '.
           DISPLAY 'WS-STRING: ' WS-STRING.
           MOVE LENGTH OF WS-STRING          TO WS-LENGTH.
           MOVE 1                            TO WS-SUB2.
           PERFORM VARYING WS-SUB1 FROM WS-LENGTH BY -1
                   UNTIL WS-SUB1 = 0
               MOVE WS-STRING(WS-SUB1:1)     TO WS-REVSTRING(WS-SUB2:1) 
               ADD 1                         TO WS-SUB2
           END-PERFORM.
           DISPLAY 'WS-REVSTRING: ' WS-REVSTRING.

           STOP RUN. 