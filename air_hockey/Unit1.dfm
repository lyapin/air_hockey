object Form1: TForm1
  Left = 319
  Top = 159
  Width = 709
  Height = 538
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 568
    Top = 244
    Width = 33
    Height = 33
    Shape = stCircle
  end
  object Shape2: TShape
    Left = 1096
    Top = 128
    Width = 33
    Height = 249
    Brush.Color = clBlue
  end
  object Shape3: TShape
    Left = 64
    Top = 168
    Width = 33
    Height = 241
    Brush.Color = clRed
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 576
    Top = 176
  end
  object Timer2: TTimer
    Interval = 16
    OnTimer = Timer2Timer
    Left = 72
    Top = 80
  end
end
