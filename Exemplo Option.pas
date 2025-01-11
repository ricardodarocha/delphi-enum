uses
  Option, SysUtils;

var
  OptionalValue: Option<Integer>;
begin
  try
    // Criar um valor com Some
    OptionalValue := Option<Integer>.Some(42);
    if OptionalValue.IsSome then
      Writeln('The value is: ', OptionalValue.Value);

    // Criar um valor com None
    OptionalValue := Option<Integer>.None;
    if OptionalValue.IsNone then
      Writeln('The value is None');
    
    // Tentativa de acessar None (irá gerar uma exceção)
    Writeln('Accessing None: ', OptionalValue.Value);
  except
    on E: Exception do
      Writeln('Error: ', E.Message);
  end;
end.
