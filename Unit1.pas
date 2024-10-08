unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Unit2, UserData, LoginForm, DataEditorForm;



type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button_AdminMenu: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    LabelLogin: TLabel;
    LabelLoginStatus: TLabel;
    LabelLogout: TLabel;
    ButtonOpenEditMenu: TButton;
    ADOQuery1id: TAutoIncField;
    ADOQuery1request_date: TWideStringField;
    ADOQuery1requester_name: TWideStringField;
    ADOQuery1request_type: TIntegerField;
    ADOQuery1status: TWideStringField;
    ADOQuery1description: TWideMemoField;
    ADOQuery1status_text: TStringField;
    ADOQuery1type_text: TStringField;
    procedure Button_AdminMenuClick(Sender: TObject);
    procedure LabelLoginClick(Sender: TObject);
    procedure LabelLogoutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure LoadDataToGrid;
    procedure UnloadDataFromGrid;
    procedure CheckUserStatus;
    procedure ButtonOpenEditMenuClick(Sender: TObject);
    procedure ADOQuery1descriptionGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;




var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.ADOQuery1CalcFields(DataSet: TDataSet);
begin
   case ADOQuery1.FieldByName('request_type').AsInteger of
    0: ADOQuery1type_text.AsString := '����������� ������';
    1: ADOQuery1type_text.AsString := '���������������� ������';
    2: ADOQuery1type_text.AsString := '����� ������';
    else
      ADOQuery1type_text.AsString := '����������� ���';
  end;

  case ADOQuery1.FieldByName('status').AsInteger of
    0: ADOQuery1status_text.AsString := '�� ���������';
    1: ADOQuery1status_text.AsString := '� ��������';
    2: ADOQuery1status_text.AsString := '��������';
    else
      ADOQuery1status_text.AsString := '����������� ������';
  end;

end;

procedure TForm1.ADOQuery1descriptionGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.IsNull then
  begin
    Exit;
    end
  else
    Text := Copy(Sender.AsString, 1, 50);
end;

procedure TForm1.ButtonOpenEditMenuClick(Sender: TObject);
var
EditMenuForm: TForm5;
begin
  if CurrentUser.PowerLevel = 0 then
  begin
    ShowMessage('���������� ������� ���� �������������� ������ � ������ �����.');
    Exit;
  end;
   EditMenuForm := TForm5.Create(Self);
   try
     EditMenuForm.ShowModal;
   finally
    EditMenuForm.Free;
   end;



end;

procedure TForm1.Button_AdminMenuClick(Sender: TObject);
var
  NewForm: TForm2;
begin
if not CurrentUser.IsAuthenticated then
begin
  ShowMessage('�� ������ ���� ��������������� ��� ������� � ���� �������!');
  Exit;
end;
if CurrentUser.PowerLevel <> 2 then
begin
  ShowMessage('� ��� ��� ���� ������� � ���� �������.');
  Exit;
end;

  NewForm := TForm2.Create(Self);
  try
    NewForm.ShowModal;
    finally
    NewForm.Free;
  end;

end;

procedure TForm1.CheckUserStatus;
begin
  if (CurrentUser.IsAuthenticated) and (CurrentUser.PowerLevel > -1) then
  begin
    LoadDataToGrid;
    ButtonOpenEditMenu.Enabled := True;
    end
    else
    begin
    ShowMessage('�������� ������ �� ���� �������. � ��� ������������ ���� ��� ��������� ���� ����������.');
  end;
end;


procedure TForm1.LoadDataToGrid;
begin
  DBGrid1.Columns.Clear;
  ADOQuery1.Open;
  DataSource1.Enabled := true;


  with DBGrid1.Columns.Add do
  begin
    FieldName := 'id';
    Title.Caption := 'ID';
    Visible := True;
    Width := 50;
  end;

  with DBGrid1.Columns.Add do
  begin
    FieldName := 'request_date';
    Title.Caption := '����';
    Width := 100;
  end;

  with DBGrid1.Columns.Add do
  begin
    FieldName := 'requester_name';
    Title.Caption := '��� ���������';
    Visible := True;
    Width := 200;
  end;

  with DBGrid1.Columns.Add do
  begin
    FieldName := 'request_type';
    Visible := False;
  end;

    with DBGrid1.Columns.Add do
  begin
    FieldName := 'type_text';
    Title.Caption := '��� ������';
    Visible := True;
    Width := 250;
  end;

  with DBGrid1.Columns.Add do
  begin
    FieldName := 'status';
    Visible := False;
  end;

    with DBGrid1.Columns.Add do
  begin
    FieldName := 'status_text';
    Title.Caption := '������ ������';
    Width := 150;
  end;

  with DBGrid1.Columns.Add do
  begin
    FieldName := 'description';
    Title.Caption := '��������';
    Width := 400;
  end;

  end;

  procedure TForm1.UnloadDataFromGrid;
begin
  ADOQuery1.Close;
  DataSource1.Enabled := False;
  DBGrid1.Columns.Clear;
  end;


procedure TForm1.FormCreate(Sender: TObject);
begin
    CurrentUser.IsAuthenticated := false;
    CurrentUser.Username := '';
    CurrentUser.PowerLevel := -1;
end;

procedure TForm1.LabelLoginClick(Sender: TObject);
var
    LoginForm: TForm3;
begin
  LoginForm := TForm3.Create(Self);
  try
    if LoginForm.ShowModal = mrOk then
    begin
      CurrentUser.Username := LoginForm.LoggedUser;
      CurrentUser.PowerLevel := LoginForm.UserPowerLevel;
      CurrentUser.IsAuthenticated := True;
      LabelLoginStatus.Caption := '������������: ' + LoginForm.LoggedUser;
      LabelLoginStatus.Visible := True;
      LabelLogin.Visible := false;
      LabelLogin.Enabled := false;
      LabelLogout.Enabled := true;
      LabelLogout.Visible := true;
      if CurrentUser.PowerLevel = 2 then
      begin
        Button_AdminMenu.Visible := True;
        Button_AdminMenu.Enabled := True;
        CheckUserStatus;
      end;
    end;
  finally
    LoginForm.Free;
  end;
end;

procedure TForm1.LabelLogoutClick(Sender: TObject);
begin
    UnloadDataFromGrid;
    CurrentUser.IsAuthenticated := False;
    CurrentUser.Username := '';
    CurrentUser.PowerLevel := -1;
    LabelLogout.Enabled := False;
    LabelLogout.Visible := False;
    LabelLoginStatus.Caption := '���� �� ��������';
    LabelLogin.Visible := true;
    LabelLogin.Enabled := true;
    Button_AdminMenu.Visible := False;
    Button_AdminMenu.Enabled := False;
    ButtonOpenEditMenu.Enabled := False;
end;

end.
