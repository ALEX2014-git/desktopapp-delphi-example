unit AccountCreation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ADODB, Data.DB, UserData, System.Hash;

type
  TForm4 = class(TForm)
    LabelAccountName: TLabel;
    EditAccountName: TEdit;
    EditAccountPassword: TEdit;
    LabelAccountPassword: TLabel;
    ComboBoxAccountPowerLevel: TComboBox;
    ComboBoxAccountStatus: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    EditFirstname: TEdit;
    EditSecondname: TEdit;
    EditThirdname: TEdit;
    LabelFirstName: TLabel;
    LabelSecondName: TLabel;
    LabelThirdName: TLabel;
    ButtonSend: TButton;
    ADOConnection1: TADOConnection;
    procedure FormCreate(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);
    procedure CreateNewUser;
  private
     { Private declarations }
  function GetComboBoxValue(ComboBox: TComboBox): Integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

function TForm4.GetComboBoxValue(ComboBox: TComboBox): Integer;
begin
  Result := NativeInt(ComboBox.Items.Objects[ComboBox.ItemIndex]);
end;



procedure TForm4.ButtonSendClick(Sender: TObject);
begin
if (EditAccountName.Text = '') or (EditAccountPassword.Text = '') or (EditFirstname.Text = '')
or (EditSecondname.Text = '') or (EditThirdname.Text = '') or (ComboBoxAccountStatus.ItemIndex = -1)
or (ComboBoxAccountPowerLevel.ItemIndex = -1)
then
begin
  ShowMessage('��� ���� ������ ���� ���������!');
  Exit;
end;
if CurrentUser.PowerLevel <> 2 then
begin
  ShowMessage('���������� �������� ������� �������������� ��� ���������� ����� ��������.');
  Exit;
end;
CreateNewUser;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  ComboBoxAccountStatus.Items.AddObject('���������', TObject(0));
  ComboBoxAccountStatus.Items.AddObject('�������', TObject(1));

  ComboBoxAccountPowerLevel.Items.AddObject('�����', TObject(0));
  ComboBoxAccountPowerLevel.Items.AddObject('�����������', TObject(1));
  ComboBoxAccountPowerLevel.Items.AddObject('�������������', TObject(2));
end;

procedure TForm4.CreateNewUser;
var
  Query: TADOQuery;
  PowerLevel, Status: Integer;
  Password: string;
  HashedPassword: string;
begin
  PowerLevel := GetComboBoxValue(ComboBoxAccountPowerLevel);
  Status := GetComboBoxValue(ComboBoxAccountStatus);
  Password := EditAccountPassword.Text;
  HashedPassword := THashSHA2.GetHashString(Password);

  Query := TADOQuery.Create(nil);
  try
    Query.Connection := ADOConnection1;
    Query.SQL.Text := 'INSERT INTO user_data (Username, Password, Name, Surname, Patronymic, Status, PowerLevel) ' +
                      'VALUES (:Username, :Password, :FirstName, :LastName, :Patronymic, :Status, :PowerLevel)';
    Query.Parameters.ParamByName('Username').Value := EditAccountName.Text;
    Query.Parameters.ParamByName('Password').Value := HashedPassword;
    Query.Parameters.ParamByName('FirstName').Value := EditFirstname.Text;
    Query.Parameters.ParamByName('LastName').Value := EditSecondname.Text;
    Query.Parameters.ParamByName('Patronymic').Value := EditThirdname.Text;
    Query.Parameters.ParamByName('Status').Value := Status;
    Query.Parameters.ParamByName('PowerLevel').Value := PowerLevel;
    Query.ExecSQL;
    ShowMessage('������� ������ �������');
  finally
    Query.Free;
  end;

end;



end.
