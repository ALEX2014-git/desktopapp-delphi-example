unit DataEditorForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.StdCtrls, UserData;

type
  TForm5 = class(TForm)
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    EditDate: TEdit;
    LabelDate: TLabel;
    LabelRequesterName: TLabel;
    EditRequesterName: TEdit;
    LabelStatus: TLabel;
    ComboBoxStatus: TComboBox;
    ComboBoxType: TComboBox;
    LabelType: TLabel;
    MemoDescription: TMemo;
    LabelDescription: TLabel;
    ButtonDataChange: TButton;
    ButtonDataDelete: TButton;
    ADOQuery1description: TWideMemoField;
    ADOQuery1id: TAutoIncField;
    ADOQuery1request_date: TDateField;
    ADOQuery1requester_name: TWideStringField;
    ADOQuery1request_type: TIntegerField;
    ADOQuery1status: TWideStringField;
    ADOQuery1type_text: TStringField;
    ADOQuery1status_text: TStringField;
    ButtonCreate: TButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1descriptionGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ButtonDataChangeClick(Sender: TObject);
    procedure ButtonCreateClick(Sender: TObject);
    procedure ButtonDataDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  SelectedID: Integer;

implementation

{$R *.dfm}

procedure TForm5.ADOQuery1CalcFields(DataSet: TDataSet);
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

procedure TForm5.ADOQuery1descriptionGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.IsNull then
  begin
    Exit;
    end
  else
    Text := Copy(Sender.AsString, 1, 50);
end;

procedure TForm5.ButtonCreateClick(Sender: TObject);
var
   SQLQuery: string;
  CurrentDate: string;
  FormName, FormDescription: string;
  FormStatus, FormRequestType: Integer;
begin
if CurrentUser.IsAuthenticated = False then
begin
ShowMessage('���������� ���� ���������������� ��� ���������� ����� ��������.');
Exit;
end;
 if CurrentUser.Powerlevel = 0 then
begin
ShowMessage('��� �������� ������ ��������� � ������ �����.');
Exit;
end;

  FormName := EditRequesterName.Text;
  if ComboBoxStatus.ItemIndex <> -1 then
    begin
    FormStatus := Integer(ComboBoxStatus.Items.Objects[ComboBoxStatus.ItemIndex])
    end
  else
  begin
    ShowMessage('�� ������� �������� ������� ������!');
    Exit;
  end;

  if ComboBoxType.ItemIndex <> -1 then
    begin
    FormRequestType := Integer(ComboBoxType.Items.Objects[ComboBoxType.ItemIndex])
    end
  else
  begin
    ShowMessage('�� ������� �������� ���� ������!');
    Exit;
  end;

  FormDescription := MemoDescription.Text;
  CurrentDate := FormatDateTime('yyyy-mm-dd', Now);
  SQLQuery := 'INSERT INTO requests (requester_name, status, request_type, description, request_date) ' +
                'VALUES (:FormName, :FormStatus, :FormRequestType, :FormDescription, :CurrentDate)';
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := SQLQuery;
  ADOQuery1.Parameters.ParamByName('FormName').Value := FormName;
  ADOQuery1.Parameters.ParamByName('FormStatus').Value := FormStatus;
  ADOQuery1.Parameters.ParamByName('FormRequestType').Value := FormRequestType;
  ADOQuery1.Parameters.ParamByName('FormDescription').Value := FormDescription;
  ADOQuery1.Parameters.ParamByName('CurrentDate').Value := CurrentDate;

   try
    ADOQuery1.ExecSQL;
    ShowMessage('������ ������� �������.');
  except
    on E: Exception do
      ShowMessage('������ ��� ����������: ' + E.Message);
  end;
   try
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'SELECT * FROM requests';
    ADOQuery1.Open;
  except
    on E: Exception do
      ShowMessage('������ ��� ���������� ������ � DBGrid: ' + E.Message);
  end;
end;

procedure TForm5.ButtonDataChangeClick(Sender: TObject);
var
   SQLQuery: string;
  CurrentDate: string;
  FormName, FormDescription: string;
  FormStatus, FormRequestType: Integer;
begin
 if SelectedID = -10 then Exit;
 if CurrentUser.IsAuthenticated = False then
begin
ShowMessage('���������� ���� ���������������� ��� ���������� ����� ��������.');
Exit;
end;
 if CurrentUser.Powerlevel = 0 then
begin
ShowMessage('��� �������� ������ ��������� � ������ �����.');
Exit;
end;

  FormName := EditRequesterName.Text;
  if ComboBoxStatus.ItemIndex <> -1 then
    begin
    FormStatus := Integer(ComboBoxStatus.Items.Objects[ComboBoxStatus.ItemIndex])
    end
  else
  begin
    ShowMessage('�� ������� �������� ������� ������!');
    Exit;
  end;

  if ComboBoxType.ItemIndex <> -1 then
    begin
    FormRequestType := Integer(ComboBoxType.Items.Objects[ComboBoxType.ItemIndex])
    end
  else
  begin
    ShowMessage('�� ������� �������� ���� ������!');
    Exit;
  end;

  FormDescription := MemoDescription.Text;
  CurrentDate := FormatDateTime('yyyy-mm-dd', Now);
  SQLQuery := 'UPDATE requests SET ' +
                'requester_name = :FormName, ' +
                'status = :FormStatus, ' +
                'request_type = :FormRequestType, ' +
                'description = :FormDescription ' +
                'WHERE ID = :SelectedID';
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := SQLQuery;
  ADOQuery1.Parameters.ParamByName('FormName').Value := FormName;
  ADOQuery1.Parameters.ParamByName('FormStatus').Value := FormStatus;
  ADOQuery1.Parameters.ParamByName('FormRequestType').Value := FormRequestType;
  ADOQuery1.Parameters.ParamByName('FormDescription').Value := FormDescription;
  ADOQuery1.Parameters.ParamByName('SelectedID').Value := SelectedID;

   try
    ADOQuery1.ExecSQL;
    ShowMessage('������ ������� ��������.');
  except
    on E: Exception do
      ShowMessage('������ ��� ����������: ' + E.Message);
  end;
   try
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'SELECT * FROM requests';
    ADOQuery1.Open;
  except
    on E: Exception do
      ShowMessage('������ ��� ���������� ������ � DBGrid: ' + E.Message);
  end;


end;

procedure TForm5.ButtonDataDeleteClick(Sender: TObject);
var
  SQLQuery: string;
begin
  if SelectedID = -10 then Exit;
  if CurrentUser.IsAuthenticated = False then
begin
ShowMessage('���������� ���� ���������������� ��� ���������� ����� ��������.');
Exit;
end;
 if CurrentUser.Powerlevel = 0 then
begin
ShowMessage('��� �������� ������ ��������� � ������ �����.');
Exit;
end;

   if MessageDlg('�� �������, ��� ������ ������� ��� ������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      SQLQuery := 'DELETE FROM requests WHERE ID = :SelectedID';

      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Text := SQLQuery;
      ADOQuery1.Parameters.ParamByName('SelectedID').Value := SelectedID;
      ADOQuery1.ExecSQL;


      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Text := 'SELECT * FROM requests';
      ADOQuery1.Open;

      ShowMessage('������ ������� �������.');
    except
      on E: Exception do
        ShowMessage('������ ��� �������� ������: ' + E.Message);
    end;
  end;

end;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
var
  DBStatus, DBRequestType: Integer;
begin
  if ADOQuery1.FieldByName('id').IsNull then
  begin
    Exit;
  end;

  SelectedID := ADOQuery1.FieldByName('id').AsInteger;
  EditDate.Text := ADOQuery1.FieldByName('request_date').AsString;
  EditRequesterName.Text := ADOQuery1.FieldByName('requester_name').AsString;

  DBStatus := ADOQuery1.FieldByName('status').AsInteger;
  DBRequestType := ADOQuery1.FieldByName('request_type').AsInteger;

  ComboBoxStatus.ItemIndex := ComboBoxStatus.Items.IndexOfObject(TObject(DBStatus));
  ComboBoxType.ItemIndex := ComboBoxType.Items.IndexOfObject(TObject(DBRequestType));

  MemoDescription.Text := ADOQuery1.FieldByName('description').AsString;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  SelectedID := -10;
  ComboBoxStatus.Items.AddObject('�� ���������', TObject(0));
  ComboBoxStatus.Items.AddObject('� ��������', TObject(1));
  ComboBoxStatus.Items.AddObject('������', TObject(2));

  ComboBoxType.Items.AddObject('����������� ������', TObject(0));
  ComboBoxType.Items.AddObject('���������������� ������', TObject(1));
  ComboBoxType.Items.AddObject('����� ������', TObject(2));

end;

end.
