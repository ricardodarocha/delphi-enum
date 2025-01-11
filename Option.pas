unit Option;

interface

type
  EOptionError = class(Exception);

  // Definição do tipo genérico Option<T>
  Option<T> = record
  private
    FHasValue: Boolean;
    FValue: T;
    function GetValue: T;
  public
    // Construtores
    class function Some(AValue: T): Option<T>; static;
    class function None: Option<T>; static;

    // Propriedades
    property Value: T read GetValue;
    property HasValue: Boolean read FHasValue;

    // Métodos
    function IsSome: Boolean;
    function IsNone: Boolean;
  end;

implementation

{ Option<T> }

function Option<T>.GetValue: T;
begin
  if not FHasValue then
    raise EOptionError.Create('Tried to access value of None');
  Result := FValue;
end;

class function Option<T>.Some(AValue: T): Option<T>;
begin
  Result.FHasValue := True;
  Result.FValue := AValue;
end;

class function Option<T>.None: Option<T>;
begin
  Result.FHasValue := False;
end;

function Option<T>.IsSome: Boolean;
begin
  Result := FHasValue;
end;

function Option<T>.IsNone: Boolean;
begin
  Result := not FHasValue;
end;

end.
