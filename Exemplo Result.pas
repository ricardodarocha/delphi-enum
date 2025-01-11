uses
  Result, SysUtils;

function SafeDivide(A, B: Integer): Result<Double, Exception>;
begin
  if B = 0 then
    Exit(Result<Double, Exception>.Err(Exception.Create('Division by zero')));
  Result := Result<Double, Exception>.Ok(A / B);
end;

procedure TestResult;
var
  Res: Result<Double, Exception>;
begin
  // Teste com divisão válida
  Res := SafeDivide(10, 2);
  if Res.IsOk then
    Writeln('Result: ', Res.Value)
  else
    Writeln('Error: ', Res.Error.Message);

  // Teste com divisão por zero
  Res := SafeDivide(10, 0);
  if Res.IsOk then
    Writeln('Result: ', Res.Value)
  else
    Writeln('Error: ', Res.Error.Message);
end;

begin
  try
    TestResult;
  except
    on E: Exception do
      Writeln('Unhandled exception: ', E.Message);
  end;
end.
