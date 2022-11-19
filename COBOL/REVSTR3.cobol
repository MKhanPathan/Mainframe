      *----------------------------------------------------------------*
      *          PROGRAM TO DISPLAY REVERSE OF ANY INPUT STRING        *
      *----------------------------------------------------------------* 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRPGM4.
       AUTHOR. z/OS Mainframer.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-PROGRAM              PIC X(08)   VALUE 'STRPGM4'.
       01  WS-STRING               PIC X(20)   VALUE 
                                               ' z/OS Mainframer    '.

       PROCEDURE DIVISION.
           DISPLAY 'PROGRAM: ' WS-PROGRAM.
           DISPLAY 'WS-STRING: ' WS-STRING.
           DISPLAY 'REVERSE STRING: ' 
                    FUNCTION REVERSE ( FUNCTION TRIM ( WS-STRING ) ).
           STOP RUN.