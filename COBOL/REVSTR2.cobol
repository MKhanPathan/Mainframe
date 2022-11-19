      *----------------------------------------------------------------*
      *          PROGRAM TO DISPLAY REVERSE OF ANY INPUT STRING        *
      *----------------------------------------------------------------* 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRPGM2.
       AUTHOR. z/OS Mainframer.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-PROGRAM              PIC X(08)   VALUE 'STRPGM2'.
       01  WS-STRING-DATA.
           05  WS-STRING           PIC X(25)   VALUE 
                                    '     z/OS Mainframer    '.
           05  WS-REVSTRING        PIC X(25)   VALUE SPACES.
       01  WS-MISC.
           05  WS-LENGTH           PIC 9(2)    VALUE ZEROES.
           05  WS-START            PIC 9(2)    VALUE ZEROES.
           05  WS-END              PIC 9(2)    VALUE ZEROES.
           05  WS-SUB1             PIC 9(2)    VALUE ZEROES.
           05  WS-SUB2             PIC 9(2)    VALUE ZEROES.

       PROCEDURE DIVISION.
           DISPLAY 'PROGRAM: ' WS-PROGRAM.
           MOVE LENGTH OF WS-STRING          TO WS-LENGTH.
           PERFORM 100-GET-START-POS         THRU 100-EXIT.
           PERFORM 200-GET-END-POS           THRU 200-EXIT.
           PERFORM 300-GET-REV-STRING        THRU 300-EXIT.
           
           DISPLAY 'WS-STRING: '       WS-STRING.
           DISPLAY 'WS-REVSTRING: '    WS-REVSTRING.

           STOP RUN.

       100-GET-START-POS.
           PERFORM VARYING WS-SUB1 FROM 1 BY 1
                   UNTIL WS-STRING(WS-SUB1:1) NOT = SPACE
                   OR WS-SUB1 > WS-LENGTH
           END-PERFORM.
           MOVE WS-SUB1                       TO WS-START.
       100-EXIT.
           EXIT.

       200-GET-END-POS.
           PERFORM VARYING WS-SUB1 FROM WS-LENGTH BY -1
                   UNTIL WS-STRING(WS-SUB1:1) NOT = SPACE
                   OR WS-SUB1 = 0
           END-PERFORM.
           MOVE WS-SUB1                       TO WS-END.
       200-EXIT.
           EXIT.

       300-GET-REV-STRING.
           MOVE 1                            TO WS-SUB2.
           PERFORM VARYING WS-SUB1 FROM WS-END BY -1
                   UNTIL WS-SUB1 < WS-START
               MOVE WS-STRING(WS-SUB1:1)     TO WS-REVSTRING(WS-SUB2:1) 
               ADD 1                         TO WS-SUB2
           END-PERFORM.
       300-EXIT.
           EXIT.
