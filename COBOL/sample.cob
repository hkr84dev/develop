000000* SAMPLE *
000100* MOVE THE ANCIENT PRACTICE COBOL CODE HERE.         *
000110*  COBOL IS A PROGRAMING LANGUAGE DEVELOPED BY       * 
000120*  THE CONFERENCE ON DATA SYSTEMS LANGUAGE(CODASYL)  *
000130*  IN THE UNITED STATES IN THE 1960S.                *
000140* *
000900* *
001000 IDENTIFICATION   DIVISION.
001100   PROGRAM-ID.      IDNAME.
001200*AUTHOR.          NAME.     *
001300*DATE-WRITTEN.    YYYYMMDD. *
001400/
002000 ENVIRONMENT      DIVISION.
002100   INPUT-OUTPUT     SECTION.
002200   FILE-CONTROL.
002300     SELECT INPUTFILE1 ASSIGN TO "FILEPATH\FILENAME.DAT".
002400/
003000 DATA             DIVISION.
003100   FILE             SECTION.
003110   FD INPUTFILE1.
003120   01 RECORD1.
003130     05 CODE1     PIC 9(6).
003140     05 USERNAME  PIC X(30).
003190/
003200   WORKING-STORAGE  SECTION.
003210   01 STATE.
003220     88 SUCCESS   VALUE "0".
003230     88 FAILURE   VALUE "99".
003240     88 
003300   01 FLAG1       PIC   X(2).
003900/
004000 PROCEDURE        DIVISION.
004100   MAIN           SECTION.
004200     PERFORM PRE-PROCSS.
004300     PERFORM MAIN-PROCESS.
004400       UNTIL FLAG1 = SUCCESS.
004500     PERFORM POST-PROCESS.
004600     STOP RUN.
004900/
005000   PRE-PROCESS    SECTION.
005100     OPEN INPUT    INPUTFILE1
005200     MOVE SPACE TO FLAG1.
006900/   
007000   MAIN-PROCESS   SECTION.
007100     READ INPUTFILE1.
008000       AT END MOVE SUCCESS TO FLAG1.
008100      END-READ.
008900/
009000   POST-PROCESS   SECTION.
009100     CLOSE INPUTFILE1.
009900/