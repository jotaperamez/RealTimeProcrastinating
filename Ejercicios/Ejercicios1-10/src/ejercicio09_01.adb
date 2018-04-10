with Putter; use Putter;
with Semaphores; use Semaphores;
procedure Ejercicio09_01 is
 -- Declara las tareas
   task type A;
   task type B;
   task type C;
   
   -- Declara las referencias de accesos a tareas
   type Ref_A is access A;
   type Ref_B is access B;
   type Ref_C is access C;
   
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

   -- Asigna las referencias de acceso
   taskA : Ref_A;
   taskB : Ref_B;
   taskC : Ref_C;
   
begin
   -- Hace las calls a las tareas
   taskA := new A;
   taskB := new B;
   taskC := new C;
end ejercicio09_01;
