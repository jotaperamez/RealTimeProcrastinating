with Pila; use Pila;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Ejercicio04_Extra is
   el:Integer;
begin
   Poner(0);Poner(1);Poner(2);Poner(3);Poner(4);Poner(5);Poner(6);Poner(7);Poner(8);Poner(9);
   for I in 1..10 loop
      Quitar(Elemento(el));
      Put_Line(el'Img);
   end loop;
end ejercicio04_extra;
