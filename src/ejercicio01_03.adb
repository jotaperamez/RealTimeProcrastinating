with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure ejercicio01_03 is
   type A is delta 0.01 range -50.0..50.0;
   type B is digits 3 range -200.0..200.0;
   
   varA: A;
   varB: B;
   suma: Float;
begin
   varA:= 5.01;
   varB:= 5.600;
   
   suma:=Float(varA)+Float(varB);
   
   Put(suma'Img);
   
end ejercicio01_03;
