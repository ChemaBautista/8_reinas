Global solutions
 
Procedure showBoard(Array queenCol(1));mostramos tablero dependiendo de la cantidad de reinas a colocar
  Protected row, column, n = ArraySize(queenCol())
 
  PrintN(" Soluciones " + Str(solutions))
  For row = 1 To n
    For column = 1 To n
      If queenCol(row) = column
        Print("|R")
      Else
        Print("| ")
      EndIf
    Next
    PrintN("|")
  Next
EndProcedure
 
Macro advanceIfPossible()
  x + 1
  While x <= n And columns(x): x + 1: Wend
  If x > n
    ProcedureReturn #False ;utilizado backtracking
  EndIf 
EndMacro
 
Procedure placeQueens(Array queenCol(1), Array columns(1), row = 0) ;ubucacion de las reinas dentro de nuestro tablero 
  Protected n = ArraySize(queenCol())
 
  If row = 8
    solutions + 1
    showBoard(queenCol())
    ProcedureReturn #False ;aplicando backtracking
  EndIf
 
  Protected x, queen, passed
  While columns(x): x + 1: Wend
 
 ; lugar de la nueva reina en una comlumna disponible
  Repeat 
    passed = #True
    For queen = 0 To row - 1
      If ((queenCol(queen) - x) = (queen - row)) Or ((queenCol(queen) - x) = -(queen - row))
        advanceIfPossible()
        passed = #False
        Break ;para el siguiente salto
      EndIf
    Next
 
    If passed
      queenCol(row) = x: columns(x) = 1
      If Not placeQueens(queenCol(), columns(), row + 1)
        columns(x) = 0
        advanceIfPossible()
      EndIf 
    EndIf 
    ForEver
EndProcedure
 
Procedure queens(n)
  If n > 0
    Dim queenCol(n - 1)
    Dim columns(n - 1)
    placeQueens(queenCol(), columns()) 
  EndIf 
EndProcedure
 
If OpenConsole()
  Define i
  For i = 8 To 8
  solutions = 0
 
    queens(i)
    PrintN(#CRLF$ + Str(solutions) + " Soluciones posibles para  " + Str(i) + "-reinas.")
    Input()
  Next 
 
  Print(#CRLF$ + "Presione ENTER para salir")
  Input()
  CloseConsole()
EndIf
; IDE Options = PureBasic 5.22 LTS (Windows - x64)
; CursorPosition = 30
; FirstLine = 28
; Folding = -
; EnableUnicode
; EnableXP