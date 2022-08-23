unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, StrUtils;{добавить модуль}

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end;
const digit:string[16]='0123456789ABCDEF';
      osn:array[0..3]of byte=(2,8,10,16);
var
  Form1: TForm1;
  os,ns:byte;
implementation

{$R *.lfm}

{ TForm1 }
//ввод дорустимых символов
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if (pos(key,copy(digit,1,os))=0)and(key<>#8) then key:=#0;
end;

//запомним основания
procedure TForm1.Button1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=-1 then
showmessage('Вы не выбрали основние СС исходнлгл чисда')
else os:=osn[RadioGroup1.ItemIndex];
if RadioGroup2.ItemIndex=-1 then
showmessage('Вы не выбрали основние СС для перевода')
else
  begin
   ns:=osn[RadioGroup2.ItemIndex];
   if ns=os then
    begin
     showmessage('Выберите другую СС для перевода');
     RadioGroup2.ItemIndex:=-1;
     exit;
    end;
  end;
end;

//переведем
procedure TForm1.Button2Click(Sender: TObject);
var n:longint;
begin
if Edit1.Text='' then
 begin
  showmessage('Вы не ввели число');
  exit;
 end;
n:=Numb2Dec(Edit1.Text,os);
if ns=10 then Edit2.Text:=inttostr(n)
else Edit2.Text:=Dec2Numb(n,1,ns);
end;

end.

