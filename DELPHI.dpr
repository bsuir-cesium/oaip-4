program lab4;

uses
  SysUtils;

const
  n = 7;

// 12AA3BA

type
  TMAS = array [0 .. n - 1] of char;

var
  S: TMAS;
  symbolResult: Boolean;

procedure GenerateRandomChars(var S: TMAS);
var
  i: Integer;
  randomChar: char;
begin
  Randomize;
  write('Сгенерированная последовательность: ');
  for i := 0 to n - 1 do
  begin
    // Генерируем случайную букву латинского алфавита в верхнем регистре
    randomChar := Chr(Random(26) + 65);
    write(randomChar);
    S[i] := randomChar;
  end;
  writeln;
end;

procedure EnterChars(var S: TMAS);
var
  i: Integer;
  inputChar: char;
begin
  for i := 0 to n - 1 do
  begin
    write('Введите символ №', i + 1, ': ');
    readln(inputChar);
    S[i] := inputChar;
  end;
end;

function HasSymbol(const S: TMAS): Boolean;
var
  i, j, k: Integer;
  nextAppear: Integer;
  resultForSymbol, resultForArr: Boolean;
begin
  resultForArr := False;
  for i := 0 to n - 2 do
  begin
    nextAppear := i;
    resultForSymbol := False;
    for j := i + 1 to n - 1 do
    begin
      if (S[i] = S[j]) and (j - nextAppear > 1) then
      begin
        for k := nextAppear + 1 to j - 1 do
        begin
          if (S[k] = 'A') or (S[k] = 'B') then
          begin
            resultForSymbol := True;
            Break;
          end
          else
            resultForSymbol := False;
        end;
        nextAppear := j;
      end;
    end;
    if resultForSymbol then
    begin
      resultForArr := True;
      Break;
    end;
  end;
  if resultForArr then
    HasSymbol := True
  else
    HasSymbol := False;
end;

begin
  // GenerateRandomChars(S);
  EnterChars(s);

  symbolResult := HasSymbol(S);
  if symbolResult then
    writeln('Данная последовательность СОДЕРЖИТ специальный символ')
  else
    writeln('Данная последовательность НЕ СОДЕРЖИТ специальный символ');

  readln;

end.