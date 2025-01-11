unit Result;

interface

type
  // Definição de Result<T, E>
  Result<T, E: Exception> = record
  private
    FIsOk: Boolean;
    FValue: T;
    FError: E;
    function GetValue: T;
    function GetError: E;
  public
    // Construtores
    class function Ok(AValue: T): Result<T, E>; static;
    class function Err(AError: E): Result<T, E>; static;

    // Propriedades
    property IsOk: Boolean read FIsOk;
    property IsErr: Boolean read (not FIsOk);
    property Value: T read GetValue;
    property Error: E read GetError;
  end;

implementation

{ Result<T, E> }

function Result<T, E>.GetValue: T;
begin
  if not FIsOk then
    raise Exception.Create('Attempted to access Value in Err variant');
  Result := FValue;
end;

function Result<T, E>.GetError: E;
begin
  if FIsOk then
    raise Exception.Create('Attempted to access Error in Ok variant');
  Result := FError;
end;

class function Result<T, E>.Ok(AValue: T): Result<T, E>;
begin
  Result.FIsOk := True;
  Result.FValue := AValue;
end;

class function Result<T, E>.Err(AError: E): Result<T, E>;
begin
  Result.FIsOk := False;
  Result.FError := AError;
end;

end.
