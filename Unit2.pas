unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, UserData, AccountCreation, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    ComboBoxAdminMenuPowerLevel: TComboBox;
    ComboBoxAdminMenuStatus: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    ADOQuery1PowerLevelText: TStringField;
    ADOQuery1StatusText: TStringField;
    ADOQuery1ID: TAutoIncField;
    ADOQuery1Username: TWideStringField;
    ADOQuery1Name: TWideStringField;
    ADOQuery1Surname: TWideStringField;
    ADOQuery1Patronymic: TWideStringField;
    ADOQuery1PowerLevel: TIntegerField;
    ADOQuery1Status: TIntegerField;
    MemoBanreason: TMemo;
    ButtonAdminApply: TButton;
    ButtonAdminAccCreate: TButton;
    LabelAdminLoginStatus: TLabel;
    ButtonAdminDeleteUser: TButton;
    Panel1: TPanel;
    LabelAdminMenuCurrentSelected: TLabel;
    ADOQuery1BanReason: TWideStringField;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ButtonAdminAccCreateClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ButtonAdminApplyClick(Sender: TObject);
    procedure ButtonAdminDeleteUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  SelectedID: Integer;

implementation

{$R *.dfm}


procedure TForm2.ADOQuery1CalcFields(DataSet: TDataSet);
begin
  case ADOQuery1.FieldByName('PowerLevel').AsInteger of
    0: ADOQuery1.FieldByName('PowerLevelText').AsString := '�����';
    1: ADOQuery1.FieldByName('PowerLevelText').AsString := '�����������';
    2: ADOQuery1.FieldByName('PowerLevelText').AsString := '����������������';
  else
    ADOQuery1.FieldByName('PowerLevelText').AsString := '����������';
  end;

  case ADOQuery1.FieldByName('Status').AsInteger of
    0: ADOQuery1.FieldByName('StatusText').AsString := '���������';
    1: ADOQuery1.FieldByName('StatusText').AsString := '�������';
    2: ADOQuery1.FieldByName('StatusText').AsString := '������������';
  else
    ADOQuery1.FieldByName('StatusText').AsString := '����������';
  end;
end;


procedure TForm2.ButtonAdminAccCreateClick(Sender: TObject);
var
    AccountForm: TForm4;
begin
  AccountForm := TForm4.Create(Self);
  try
    AccountForm.ShowModal;
  finally
     AccountForm.Free;
  end;
end;

procedure TForm2.ButtonAdminApplyClick(Sender: TObject);
var
  SQLQuery: string;
  FormStatus, FormPowerLevel: Integer;
  FormBanReason: string;
begin
if SelectedID = -10 then Exit;

  if CurrentUser.IsAuthenticated <> true then
  begin
    ShowMessage('�� ������ ���� �������������� ��� ���������� ����� ��������.');
    Exit;
  end;

  if CurrentUser.PowerLevel <> 2 then
  begin
    ShowMessage('� ��� ������������ ���� ��� ���������� ����� ��������.');
    Exit;
  end;

    FormStatus := Integer(ComboBoxAdminMenuStatus.Items.Objects[ComboBoxAdminMenuStatus.ItemIndex]);
  FormPowerLevel := Integer(ComboBoxAdminMenuPowerLevel.Items.Objects[ComboBoxAdminMenuPowerLevel.ItemIndex]);


  if MemoBanreason.Enabled = true then
  begin
  FormBanReason := MemoBanreason.Text;
    SQLQuery := 'UPDATE user_data SET ' +
              'Status = :FormStatus, ' +
              'PowerLevel = :FormPowerLevel, ' +
              'BanReason = :FormBanReason ' +
              'WHERE ID = :SelectedID';
    ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := SQLQuery;
  ADOQuery1.Parameters.ParamByName('FormStatus').Value := FormStatus;
  ADOQuery1.Parameters.ParamByName('FormPowerLevel').Value := FormPowerLevel;
  ADOQuery1.Parameters.ParamByName('FormBanReason').Value := FormBanReason;
  ADOQuery1.Parameters.ParamByName('SelectedID').Value := SelectedID;

    try
    ADOQuery1.ExecSQL;
    ShowMessage('������ ������������ ������� ���������.');
  except
    on E: Exception do
      ShowMessage('������ ���������� ������: ' + E.Message);
  end
  end
  else
  begin
       SQLQuery := 'UPDATE user_data SET ' +
              'Status = :FormStatus, ' +
              'PowerLevel = :FormPowerLevel, ' +
              'WHERE ID = :SelectedID';
      ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := SQLQuery;
  ADOQuery1.Parameters.ParamByName('FormStatus').Value := FormStatus;
  ADOQuery1.Parameters.ParamByName('FormPowerLevel').Value := FormPowerLevel;
  ADOQuery1.Parameters.ParamByName('SelectedID').Value := SelectedID;
    try
    ADOQuery1.ExecSQL;
    ShowMessage('������ ������������ ������� ���������.');
  except
    on E: Exception do
      ShowMessage('������ ���������� ������: ' + E.Message);
  end
  end;

  ADOQuery1.SQL.Text := 'SELECT ID, Username, PowerLevel, Status, BanReason, Name, Surname, Patronymic FROM user_data';
  ADOQuery1.Open;


  end;

procedure TForm2.ButtonAdminDeleteUserClick(Sender: TObject);
var
SQLQuery: string;
begin
if SelectedID = -10 then Exit;
if CurrentUser.PowerLevel <> 2 then
begin
  ShowMessage('���������� �������� ������� �������������� ��� ���������� ����� ��������!');
  Exit;
end;

      if MessageDlg('�� �������, ��� ������ ������� ��� ������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        SQLQuery := 'DELETE FROM user_data WHERE ID = :ID';

        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := SQLQuery;
        ADOQuery1.Parameters.ParamByName('ID').Value := SelectedID;
        ADOQuery1.ExecSQL;
        ADOQuery1.Close;
           ADOQuery1.SQL.Text := 'SELECT ID, Username, PowerLevel, Status, BanReason, Name, Surname, Patronymic FROM user_data';
        ADOQuery1.Open;

        ShowMessage('������ ������� �������.');
      except
        on E: Exception do
          ShowMessage('������ ��� �������� ������: ' + E.Message);
      end;
    end;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
var
  DBUsername: string;
  DBStatus, DBPowerLevel: Integer;
  DBBanReason: string;
  ComboBoxCounter: Integer;
  const
  MaxWidth = 10;
begin
  SelectedID := ADOQuery1.FieldByName('ID').AsInteger;
  DBUsername := ADOQuery1.FieldByName('Username').AsString;
  DBStatus := ADOQuery1.FieldByName('Status').AsInteger;
  DBPowerLevel := ADOQuery1.FieldByName('PowerLevel').AsInteger;
  DBBanReason := ADOQuery1.FieldByName('BanReason').AsString;

  LabelAdminMenuCurrentSelected.Caption := DBUsername;

  if DBBanReason <> '' then
  begin
    MemoBanreason.Enabled := True;
    MemoBanreason.Text := DBBanReason;
  end
  else
  begin
    MemoBanreason.Clear;
    MemoBanreason.Enabled := False;
  end;

   for ComboBoxCounter := 0 to ComboBoxAdminMenuStatus.Items.Count - 1 do
  begin
    if Integer(ComboBoxAdminMenuStatus.Items.Objects[ComboBoxCounter]) = DBStatus then
    begin
      ComboBoxAdminMenuStatus.ItemIndex := ComboBoxCounter;
      Break;
    end;
end;


   for ComboBoxCounter := 0 to ComboBoxAdminMenuPowerLevel.Items.Count - 1 do
  begin
    if Integer(ComboBoxAdminMenuPowerLevel.Items.Objects[ComboBoxCounter]) = DBPowerLevel then
    begin
      ComboBoxAdminMenuPowerLevel.ItemIndex := ComboBoxCounter;
      Break;
    end;
end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  SelectedID := -10;
  LabelAdminLoginStatus.Caption := '������������: ' + CurrentUser.Username;
  ComboBoxAdminMenuStatus.Items.AddObject('���������', TObject(0));
  ComboBoxAdminMenuStatus.Items.AddObject('�������', TObject(1));
  ComboBoxAdminMenuStatus.Items.AddObject('������������', TObject(2));

  ComboBoxAdminMenuPowerLevel.Items.AddObject('�����', TObject(0));
  ComboBoxAdminMenuPowerLevel.Items.AddObject('�����������', TObject(1));
  ComboBoxAdminMenuPowerLevel.Items.AddObject('�������������', TObject(2));
end;

end.
