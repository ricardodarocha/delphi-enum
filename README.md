# delphi-enum
modern Enum and Safe Code Helpers for Delphi

---

## `TResult<T, E>`

O tipo genérico `TResult<T, E>` representa o resultado de uma operação que pode ter sucesso ou falhar. Ele é inspirado no conceito de `Result` de linguagens como Rust, Haskel.

### Estrutura Interna
- **FIsOk**: Indica se o resultado é bem-sucedido (`True`) ou se houve erro (`False`).
- **FValue**: Contém o valor de sucesso do tipo `T`, quando `IsOk` for verdadeiro.
- **FError**: Contém o erro do tipo `E`, quando `IsOk` for falso.

### Construtores

#### `Ok(AValue: T): TResult<T, E>`
Cria um objeto `TResult` representando um sucesso, armazenando o valor `AValue` no campo `FValue`.

**Exemplo de Uso:**
```delphi
var
  resultado: TResult<Integer, Exception>;
begin
  resultado := TResult<Integer, Exception>.Ok(42);
end;
```

#### `Err(AError: E): Result<T, E>`
Cria um objeto `Result` representando uma falha, armazenando o erro `AError` no campo `FError`.

**Exemplo de Uso:**
```delphi
var
  Resultado: TResult<Integer, Exception>;
begin
  Resultado := TResult<Integer, Exception>.Err(Exception.Create('Erro genérico'));
end;
```

### Propriedades

- **IsOk (Boolean)**: Retorna `True` se o resultado for sucesso.
- **IsErr (Boolean)**: Retorna `True` se o resultado for um erro.
- **Value (T)**: Retorna o valor armazenado quando `IsOk` for verdadeiro. Levanta uma exceção se acessado quando `IsErr` for verdadeiro.
- **Error (E)**: Retorna o erro armazenado quando `IsErr` for verdadeiro. Levanta uma exceção se acessado quando `IsOk` for verdadeiro.

---

## `Option<T>`

O tipo genérico `Option<T>` representa um valor opcional que pode ou não estar presente. Ele é inspirado no conceito de `Option` de linguagens como Rust.

### Estrutura Interna
- **FHasValue**: Indica se o valor está presente (`True`) ou não (`False`).
- **FValue**: Contém o valor do tipo `T`, caso esteja presente.

### Construtores

#### `Some(AValue: T): Option<T>`
Cria um objeto `Option` contendo o valor `AValue`.

**Exemplo de Uso:**
```delphi
var
  Opcao: Option<String>;
begin
  Opcao := Option<String>.Some('Valor opcional');
end;
```

#### `None: Option<T>`
Cria um objeto `Option` vazio, indicando a ausência de um valor.

**Exemplo de Uso:**
```delphi
var
  Opcao: Option<String>;
begin
  Opcao := Option<String>.None;
end;
```

### Propriedades

- **Value (T)**: Retorna o valor armazenado. Levanta uma exceção se o valor não estiver presente.
- **HasValue (Boolean)**: Retorna `True` se o valor estiver presente, ou `False` caso contrário.

### Métodos

#### `IsSome: Boolean`
Retorna `True` se o objeto contiver um valor.

#### `IsNone: Boolean`
Retorna `True` se o objeto estiver vazio.

---

## Exemplos de Uso

### Utilizando `TResult<T, E>`
```delphi
function Dividir(A, B: Integer): TResult<Integer, Exception>;
begin
  if B = 0 then
    Exit(Result<Integer, Exception>.Err(Exception.Create('Divisão por zero')));
  
  result := TResult<Integer, Exception>.Ok(A div B);
end;
```

### Utilizando `Option<T>`
```delphi
function ObterNomeUsuario(ID: Integer): Option<String>;
begin
  if ID = 1 then
    Exit(Option<String>.Some('João'));
  
  result := Option<String>.None;
end;
```

Com estas estruturas, você pode criar fluxos de controle mais seguros e explícitos, tratando sucessos e falhas de forma consistente.
```
