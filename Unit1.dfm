object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1103#1084#1080
  ClientHeight = 633
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object LabelLogin: TLabel
    Left = 26
    Top = 34
    Width = 55
    Height = 28
    Cursor = crHandPoint
    Caption = #1042#1086#1081#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = LabelLoginClick
  end
  object LabelLoginStatus: TLabel
    Left = 24
    Top = 4
    Width = 169
    Height = 28
    Caption = #1042#1093#1086#1076' '#1085#1077' '#1074#1099#1087#1086#1083#1085#1077#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = LabelLoginClick
  end
  object LabelLogout: TLabel
    Left = 24
    Top = 34
    Width = 57
    Height = 28
    Caption = #1042#1099#1081#1090#1080
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Visible = False
    OnClick = LabelLogoutClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 72
    Width = 1105
    Height = 561
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'request_date'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'requester_name'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type_text'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status_text'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description'
        Width = 374
        Visible = True
      end>
  end
  object Button_AdminMenu: TButton
    Left = 704
    Top = 8
    Width = 177
    Height = 58
    Hint = #1055#1077#1088#1077#1081#1090#1080' '#1074' '#1084#1077#1085#1102' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103
    Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1077
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnClick = Button_AdminMenuClick
  end
  object ButtonOpenEditMenu: TButton
    Left = 904
    Top = 8
    Width = 201
    Height = 58
    Caption = #1052#1077#1085#1102' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    WordWrap = True
    OnClick = ButtonOpenEditMenuClick
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ADOQuery1
    Left = 784
    Top = 584
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=delphi_app;Data Source=DESKTOP-QSU8U80'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 848
    Top = 584
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM requests')
    Left = 816
    Top = 584
    object ADOQuery1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQuery1request_date: TWideStringField
      FieldName = 'request_date'
      Size = 10
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
end
