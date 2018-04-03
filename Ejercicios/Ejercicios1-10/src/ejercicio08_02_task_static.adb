with Ada.Text_IO;
use Ada.Text_IO;

procedure ejercicio08_02_task_static is
   --Declara las tareas
   task A;
   task B;
   task C;
   
   -- Declara el comportamiento de las tareas
   task body A is
   begin
      for i in 1..3 loop
         Put_Line("Tarea A: "&i'Img);
      end loop;
   end A;
   
   task body B is
   begin
      for i in 1..3 loop
         Put_Line("Tarea B: "&i'Img);
      end loop;
   end B;
   
   task body C is
   begin
      for i in 1..3 loop
         Put_Line("Tarea C: "&i'Img);
      end loop;
   end C;

begin
   -- Begin es null porque las tareas estáticas se lanzan automaticamente
   null;
end ejercicio08_02_task_static;
