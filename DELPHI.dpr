program lab4;

uses
  SysUtils;

const
  n = 10;

type
  TMAS = array [0 .. n - 1] of char;

var
  S: TMAS;

procedure GenerateRandomChars(var s: TMAS);
var
  i: Integer;
  randomChar: Char;
begin
  Randomize; // Инициализируем генератор случайных чисел
  for i := Low(s) to High(s) do
  begin
    // Генерируем случайное число от 32 до 126 (диапазон ASCII печатных символов)
    randomChar := Chr(Random(95) + 32);
    write(randomChar);
    s[i] := randomChar;
  end;
  writeln;
end;

procedure EnterChars(var s: TMAS);
var
  i: Integer;
  inputChar: Char;
begin
  for i := Low(s) to High(s) do
  begin
    write('Введите символ №', i + 1, ': ');
    readln(inputChar);
    s[i] := inputChar;
  end;
end;

function HasSymbol(const s: TMAS): Boolean;
var
  i, j, k: Integer;
  nextAppear: Integer;
  resultForSymbol, resultForArr: Boolean;
begin
  resultForArr := False;
  for i := 0 to Length(s) - 2 do
  begin
    nextAppear := i;
    resultForSymbol := False;
    for j := i + 1 to Length(s) - 1 do
    begin
      if (s[i] = s[j]) and (j - nextAppear > 1) then
      begin
        for k := nextAppear + 1 to j - 1 do
        begin
          if (s[k] = 'A') or (s[k] = 'B') then
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
  // GenerateRandomChars(s);
  EnterChars(s);
  
  if HasSymbol(s) then
    writeln('Данная последовательность СОДЕРЖИТ специальный символ')
  else
    writeln('Данная последовательность НЕ СОДЕРЖИТ специальный символ');

  ReadLn;
end.