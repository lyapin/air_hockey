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
 PosX:= 30;  // Задаем           позицию
  PosY:= 50;  //        начальную 
  VelX:= 1;   // Задаем           скорость
  VelY:= 2;   //        начальную

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
	  PosX:= PosX + VelX;   // Изменяем
	  PosY:= PosY + VelY;   //  позицию

	  if PosX > ClientWidth - Shape1.Width then
	    VelX:= -VelX;

	  if PosY > ClientHeight - Shape1.Height then
	    VelY:= -VelY;

	  if PosX < 0 then
	    VelX:= -VelX;

	  if PosY < 0 then
	    VelY:= -VelY;


 Shape1.Left:= Round(PosX);  // Обновляем
 Shape1.Top:=  Round(PosY);  // положение шарика

      if InterSectRect(Overlay, Shape3.BoundsRect, Shape1.BoundsRect) then 
	begin
	  VelX:= +VelX - Random(5);
	  VelY:= +VelY - Random(5);
	end;

 if InterSectRect(Overlay, Shape2.BoundsRect, Shape1.BoundsRect) then
  begin
	    VelX:= -VelX;   //если есть пересечение между прямоугольником
	    VelY:= -VelY;   //и кружком то кружок отправляем обратно
  end;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if Shape3.Top > ClientHeight - Shape3.Height - 40 then  //Не пускаем врага 
    Shape3.Top:= Shape3.Top                               //за нижний край формы
	else
    begin
	  if Shape1.Top > Shape3.Top then // если шарик ниже противника
	    Shape3.Top:= Shape1.Top + Shape3.Width; //то отпускаем его
	end;
	
  if Shape1.Top < Shape3.Top then   // поднимаем если шарик выше
    Shape3.Top:= Shape1.Top - Shape3.Width;

end;


End.




