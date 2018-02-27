with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Ejercicio01_01 is
   --Declare types and variables
   type A is range -120..120;
   type B is range 0..50;
   type C is mod 255;
   varA: A;
   varB: B;
   varC: C;
   sumaAB: Integer;
   SumaAC: Integer;
   SumaBC: Integer;
begin
   --Init variables
   varA:=5;
   varB:=40;
   varC:=7;

   --Sum variables as exercise said
   SumaBC:=Integer(varB)+Integer(varC);
   SumaAC:=Integer(varA)+Integer(varC);
   sumaAB:=Integer(varA)+Integer(varB);

   --Put on console
   Put(sumaAB'Img);
   Put(SumaAC'Img);
   Put(SumaBC'Img);

end Ejercicio01_01;
