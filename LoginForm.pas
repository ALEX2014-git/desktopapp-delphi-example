unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ADODB, Data.DB, System.Hash;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EditLogin: TEdit;
    EditPassword: TEdit;
    ButtonLogin: TButton;
    ADOConnection1: TADOConnection;
    procedure ButtonLoginClick(Sender: TObject);
  private
      FLoggedUser: string;
      FUserPowerLevel: Integer;
  public
    property LoggedUser: string read FLoggedUser write FLoggedUser;
    property UserPowerLevel: Integer read FUserPowerLevel write FUserPowerLevel;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.ButtonLoginClick(Sender: TObject);
var
  ADOQuery: TADOQuery;
  SQLText: string;
  Username, BanReason: string;
  Status, PowerLevel: Integer;
  Password: string;
  HashedPassword: string;
begin
   Password := EditPassword.Text;
   HashedPassword := THashSHA2.GetHashString(Password);

  SQLText := 'SELECT Username, Status, BanReason, PowerLevel ' +
             'FROM user_data WHERE Username = :Username AND Password = :Password';
ADOQuery := TADOQuery.Create(nil);
   try
    ADOQuery.Connection := ADOConnection1;
    ADOQuery.SQL.Text := SQLText;
    ADOQuery.Parameters.ParamByName('Username').Value := EditLogin.Text;
    ADOQuery.Parameters.ParamByName('Password').Value := HashedPassword;

    ADOQuery.Open;


    if not ADOQuery.IsEmpty then
    begin
      Username := ADOQuery.FieldByName('Username').AsString;
      Status := ADOQuery.FieldByName('Status').AsInteger;
      PowerLevel := ADOQuery.FieldByName('PowerLevel').AsInteger;
      BanReason := ADOQuery.FieldByName('BanReason').AsString;
        case Status of
        0:
          begin
            ShowMessage('��� ������� �� ��� �����������. ����������, ���������� � ���������� ��������������.');
            ModalResult := mrCancel;
          end;
        2:
          begin
            ShowMessage('��� ������� ������������. ������� ����������: ' + BanReason);
            ModalResult := mrCancel;
          end;
        1:
          begin
            ShowMessage('�������� ���� ��� ������ ' + Username);
            FLoggedUser := Username;
            FUserPowerLevel := PowerLevel;
            ModalResult := mrOk;
          end;
      end;
   end

    else
    begin
      ShowMessage('�������� ����� ��� ������!');
      ModalResult := mrCancel;
    end;
  finally
    ADOQuery.Free;
   end;
end;

end.
