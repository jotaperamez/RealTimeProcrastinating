with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with Ada.Numerics;
use Ada.Numerics;

procedure Ejercicio01 is
   type entero is new Integer range -10..15;
   i: Integer := 0;
      
   tCap : Float := 0.00;
   u : Float := 10.00;
   m : Float := 2.00;
   t : Integer := 2;
   lambda : Integer := 1;
   n : Integer := 1;
   
begin
   
   Put_Line("START");
   Put_Line("");
   
   -- Obtener todos los valores del rango de la variable 'entero'
   Put_Line("APARTADO 01");
   
   for i in entero'First..entero'Last loop
      Put_Line(i'Img);
   end loop;
   
   -- Obtener los limies para una variable Float en mi equipo.
   Put_Line("APARTADO 02");
   
   Put_Line(Float'First'Img);
   Put_Line(Float'Last'Img);
   
   -- Diferencia entre coma flotante y coma fija en ADA
   Put_Line("Apartado b: Describir la diferencia entre como fija y coma flotante en ADA");
   Put_Line("En Ada, los numeros reales representados mediante como flotante, no son valores exactos, si no que tienen una aproximacion de n digitos.");
   Put_Line("Mientras que los numeros reales representados con coma fija, son valores exactos dentro de un intervalo, con una precision absoluta delta determinada.");
   Put_Line("");

   -- Escribir la ecuacion enunciada
   Put_Line("APARTADO 03");
   tCap := (m*e**(lambda*t)-u)**n;
   Put_Line("El resultado de T = "&tCap'Img);
   
   Put_Line("");
   Put_Line("STOP");
   
end Ejercicio01;
