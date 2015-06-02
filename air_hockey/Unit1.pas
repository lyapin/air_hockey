unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Shape1: TShape;
    Timer1: TTimer;
    Shape2: TShape;
    Shape3: TShape;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer2Timer(Sender: TObject);

  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  PosX, PosY, VelX, VelY: single;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
randomize;
 PosX:= 30;  // ������           �������
  PosY:= 50;  //        ��������� 
  VelX:= 1;   // ������           ��������
  VelY:= 2;   //        ���������

end;

  procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Shape2.Top:= Mouse.CursorPos.Y - Form1.ClientOrigin.Y;
end;

procedure TForm1.Timer1Timer(Sender: TObject);

var
Overlay: TRect;
	begin
	  PosX:= PosX + VelX;   // ��������
	  PosY:= PosY + VelY;   //  �������

	  if PosX > ClientWidth - Shape1.Width then
	    VelX:= -VelX;

	  if PosY > ClientHeight - Shape1.Height then
	    VelY:= -VelY;

	  if PosX < 0 then
	    VelX:= -VelX;

	  if PosY < 0 then
	    VelY:= -VelY;


 Shape1.Left:= Round(PosX);  // ���������
 Shape1.Top:=  Round(PosY);  // ��������� ������

      if InterSectRect(Overlay, Shape3.BoundsRect, Shape1.BoundsRect) then 
	begin
	  VelX:= +VelX - Random(5);
	  VelY:= +VelY - Random(5);
	end;

 if InterSectRect(Overlay, Shape2.BoundsRect, Shape1.BoundsRect) then
  begin
	    VelX:= -VelX;   //���� ���� ����������� ����� ���������������
	    VelY:= -VelY;   //� ������� �� ������ ���������� �������
  end;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if Shape3.Top > ClientHeight - Shape3.Height - 40 then  //�� ������� ����� 
    Shape3.Top:= Shape3.Top                               //�� ������ ���� �����
	else
    begin
	  if Shape1.Top > Shape3.Top then // ���� ����� ���� ����������
	    Shape3.Top:= Shape1.Top + Shape3.Width; //�� ��������� ���
	end;
	
  if Shape1.Top < Shape3.Top then   // ��������� ���� ����� ����
    Shape3.Top:= Shape1.Top - Shape3.Width;

end;


End.




