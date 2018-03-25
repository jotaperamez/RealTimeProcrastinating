with Numeros_Complejos; use Numeros_Complejos;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure ejercicio05 is
 x,y,z: Complejo;

begin
   Put_Line("EJERCICIO DE NUMEROS COMPLEJOS");
   x:=Init(2.0,4.0);
   y:=Init(3.0,8.0);

   New_Line;
   Put_Line("X = " & To_String(x));
   Put_Line("Y = " & To_String(y));
   
   Put_Line("SUMA:");
   Put("Z = X + Y = ");
   z:=x+y;
   Put_Line(To_String(z));

   Put_Line("RESTA:");
   Put("Z = X - Y = ");
   z:=x-y;
   Put_Line(To_String(z));

   Put_Line("MULTIPLICACION:");
   Put("Z = X * Y = ");
   z:=x*y;
   Put_Line(To_String(z));

   Put_Line("DIVISION:");
   Put("Z = X / Y = ");
   z:=x/y;
   Put_Line(To_String(z));

   Put_Line("CONJUGADO:");
   Put("Z = Conj(X) =");
   z:=Conj(x);
   Put_Line(To_String(z));
   null;
   
end ejercicio05;
