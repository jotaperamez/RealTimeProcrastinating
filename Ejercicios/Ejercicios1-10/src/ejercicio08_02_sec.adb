with Ada.Text_IO;
use Ada.Text_IO;

procedure ejercicio08_02 is
   
   --Declara las procedures y su comportamiento
   procedure A is 
   begin 
      for i in 1..3 loop
         Put_Line("Tarea A:"&i'Img);
      end loop;
   end A;
   
   procedure B is 
   begin 
      for i in 1..3 loop
         Put_Line("Tarea B:"&i'Img);
      end loop;
   end B;
   
   procedure C is 
   begin 
      for i in 1..3 loop
         Put_Line("Tarea C:"&i'Img);
      end loop;
   end C;
begin
   --Hace las call a las procedures secuencialmente
   A;
   B;
   C;
end ejercicio08_02;
