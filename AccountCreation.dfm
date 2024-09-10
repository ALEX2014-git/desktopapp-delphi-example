object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1072#1082#1082#1072#1091#1085#1090#1072
  ClientHeight = 533
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object LabelAccountName: TLabel
    Left = 32
    Top = 24
    Width = 170
    Height = 28
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelAccountPassword: TLabel
    Left = 121
    Top = 88
    Width = 69
    Height = 28
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 20
    Top = 149
    Width = 182
    Height = 28
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1072#1082#1082#1072#1091#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 7
    Top = 213
    Width = 195
    Height = 28
    Caption = #1059#1088#1086#1074#1077#1085#1100' '#1087#1088#1080#1074#1080#1083#1077#1075#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelFirstName: TLabel
    Left = 163
    Top = 280
    Width = 39
    Height = 28
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelSecondName: TLabel
    Left = 118
    Top = 336
    Width = 84
    Height = 28
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelThirdName: TLabel
    Left = 118
    Top = 393
    Width = 84
    Height = 28
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object EditAccountName: TEdit
    Left = 216
    Top = 27
    Width = 241
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 45
    ParentFont = False
    TabOrder = 0
  end
  object EditAccountPassword: TEdit
    Left = 216
    Top = 91
    Width = 241
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 100
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object ComboBoxAccountPowerLevel: TComboBox
    Left = 216
    Top = 216
    Width = 241
    Height = 29
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ComboBoxAccountStatus: TComboBox
    Left = 216
    Top = 152
    Width = 241
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
  object EditFirstname: TEdit
    Left = 216
    Top = 283
    Width = 241
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 100
    ParentFont = False
    TabOrder = 4
  end
  object EditSecondname: TEdit
    Left = 216
    Top = 339
    Width = 241
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 100
    ParentFont = False
    TabOrder = 5
  end
  object EditThirdname: TEdit
    Left = 216
    Top = 396
    Width = 241
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 100
    ParentFont = False
    TabOrder = 6
  end
  object ButtonSend: TButton
    Left = 163
    Top = 464
    Width = 177
    Height = 49
    Caption = #1057#1086#1079#1076#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = ButtonSendClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID="";Initial Catalog=delphi_app;Data Source=DESKT' +
      'OP-QSU8U80;Initial File Name="";Trust Server Certificate=True;Se' +
      'rver SPN="";Authentication="";Access Token=""'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 48
    Top = 480
  end
end
