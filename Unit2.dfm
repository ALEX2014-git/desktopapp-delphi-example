object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1072#1085#1077#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 610
  ClientWidth = 1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 680
    Top = 72
    Width = 115
    Height = 21
    Caption = #1057#1090#1072#1090#1091#1089' '#1072#1082#1082#1072#1091#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 679
    Top = 112
    Width = 155
    Height = 21
    Caption = #1059#1088#1086#1074#1077#1085#1100' '#1087#1086#1083#1085#1086#1084#1086#1095#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 680
    Top = 151
    Width = 154
    Height = 21
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelAdminLoginStatus: TLabel
    Left = 8
    Top = 8
    Width = 324
    Height = 28
    Caption = #1040#1074#1090#1086#1088#1080#1079#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 42
    Width = 658
    Height = 561
    DataSource = DataSource1
    ReadOnly = True
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
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Username'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PowerLevelText'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StatusText'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BanReason'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Surname'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Patronymic'
        Visible = True
      end>
  end
  object ComboBoxAdminMenuPowerLevel: TComboBox
    Left = 880
    Top = 114
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 1
  end
  object ComboBoxAdminMenuStatus: TComboBox
    Left = 880
    Top = 74
    Width = 145
    Height = 23
    Style = csDropDownList
    TabOrder = 2
  end
  object MemoBanreason: TMemo
    Left = 680
    Top = 178
    Width = 393
    Height = 193
    Enabled = False
    MaxLength = 450
    TabOrder = 3
  end
  object ButtonAdminApply: TButton
    Left = 816
    Top = 383
    Width = 105
    Height = 41
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = ButtonAdminApplyClick
  end
  object ButtonAdminAccCreate: TButton
    Left = 696
    Top = 553
    Width = 345
    Height = 49
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1084#1077#1085#1102' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1072#1082#1082#1072#1091#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = ButtonAdminAccCreateClick
  end
  object ButtonAdminDeleteUser: TButton
    Left = 760
    Top = 448
    Width = 217
    Height = 73
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#13#10#1080#1079' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    WordWrap = True
    OnClick = ButtonAdminDeleteUserClick
  end
  object Panel1: TPanel
    Left = 680
    Top = 16
    Width = 393
    Height = 41
    TabOrder = 7
    object LabelAdminMenuCurrentSelected: TLabel
      Left = 8
      Top = 6
      Width = 377
      Height = 28
      AutoSize = False
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1079#1072#1087#1080#1089#1100
      EllipsisPosition = epEndEllipsis
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ADOQuery1
    Left = 680
    Top = 576
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'SELECT ID, Username, PowerLevel, Status, BanReason, Name, Surnam' +
        'e, Patronymic FROM user_data')
    Left = 744
    Top = 576
    object ADOQuery1ID: TAutoIncField
      DisplayWidth = 4
      FieldName = 'ID'
      ReadOnly = True
    end
    object ADOQuery1Username: TWideStringField
      DisplayWidth = 15
      FieldName = 'Username'
      Size = 45
    end
    object ADOQuery1PowerLevelText: TStringField
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'PowerLevelText'
      Size = 30
      Calculated = True
    end
    object ADOQuery1StatusText: TStringField
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'StatusText'
      Size = 30
      Calculated = True
    end
    object ADOQuery1Name: TWideStringField
      DisplayWidth = 13
      FieldName = 'Name'
      Size = 45
    end
    object ADOQuery1Surname: TWideStringField
      DisplayWidth = 11
      FieldName = 'Surname'
      Size = 45
    end
    object ADOQuery1Patronymic: TWideStringField
      DisplayWidth = 15
      FieldName = 'Patronymic'
      Size = 45
    end
    object ADOQuery1PowerLevel: TIntegerField
      FieldName = 'PowerLevel'
    end
    object ADOQuery1Status: TIntegerField
      FieldName = 'Status'
    end
    object ADOQuery1BanReason: TWideStringField
      FieldName = 'BanReason'
      Size = 500
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=exp;Initial Catalog=delphi_app;Data Source=DESK' +
      'TOP-QSU8U80;Use Procedure for Prepare=1;Auto Translate=True;Pack' +
      'et Size=4096;Workstation ID=DESKTOP-QSU8U80;Use Encryption for D' +
      'ata=False;Tag with column collation when possible=False'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'SQLOLEDB.1'
    Left = 808
    Top = 576
  end
end
