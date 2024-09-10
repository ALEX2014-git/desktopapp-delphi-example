object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form5'
  ClientHeight = 665
  ClientWidth = 1286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object LabelDate: TLabel
    Left = 946
    Top = 24
    Width = 104
    Height = 21
    Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelRequesterName: TLabel
    Left = 1019
    Top = 88
    Width = 31
    Height = 21
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelStatus: TLabel
    Left = 1003
    Top = 152
    Width = 47
    Height = 21
    Caption = #1057#1090#1072#1090#1091#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelType: TLabel
    Left = 972
    Top = 216
    Width = 78
    Height = 21
    Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelDescription: TLabel
    Left = 946
    Top = 269
    Width = 71
    Height = 21
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 8
    Width = 921
    Height = 657
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'request_date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'requester_name'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type_text'
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status_text'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description'
        Width = 285
        Visible = True
      end>
  end
  object EditDate: TEdit
    Left = 1072
    Top = 21
    Width = 204
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = #1044#1072#1090#1072
  end
  object EditRequesterName: TEdit
    Left = 1072
    Top = 85
    Width = 204
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ComboBoxStatus: TComboBox
    Left = 1072
    Top = 149
    Width = 204
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ComboBoxType: TComboBox
    Left = 1072
    Top = 213
    Width = 204
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object MemoDescription: TMemo
    Left = 946
    Top = 296
    Width = 330
    Height = 193
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object ButtonDataChange: TButton
    Left = 1019
    Top = 560
    Width = 185
    Height = 49
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = ButtonDataChangeClick
  end
  object ButtonDataDelete: TButton
    Left = 1019
    Top = 624
    Width = 185
    Height = 33
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = ButtonDataDeleteClick
  end
  object ButtonCreate: TButton
    Left = 1019
    Top = 495
    Width = 185
    Height = 49
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = ButtonCreateClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=delphi_app;Data Source=DES' +
      'KTOP-QSU8U80;Initial File Name="";Trust Server Certificate=True;' +
      'Server SPN="";Authentication="";Access Token=""'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 496
    Top = 584
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM requests')
    Left = 464
    Top = 584
    object ADOQuery1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQuery1request_date: TDateField
      FieldName = 'request_date'
    end
    object ADOQuery1requester_name: TWideStringField
      FieldName = 'requester_name'
      Size = 100
    end
    object ADOQuery1request_type: TIntegerField
      FieldName = 'request_type'
    end
    object ADOQuery1type_text: TStringField
      FieldKind = fkCalculated
      FieldName = 'type_text'
      Size = 50
      Calculated = True
    end
    object ADOQuery1status: TWideStringField
      FieldName = 'status'
      Size = 50
    end
    object ADOQuery1status_text: TStringField
      FieldKind = fkCalculated
      FieldName = 'status_text'
      Size = 50
      Calculated = True
    end
    object ADOQuery1description: TWideMemoField
      FieldName = 'description'
      OnGetText = ADOQuery1descriptionGetText
      BlobType = ftWideMemo
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ADOQuery1
    Left = 432
    Top = 584
  end
end
