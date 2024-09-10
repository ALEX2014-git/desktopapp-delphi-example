unit UserData;

interface

    type
  TUser = record
    Username: string;
    PowerLevel: Integer;
    IsAuthenticated: Boolean;
  end;

  var
    CurrentUser: TUser;

implementation

end.
