with Putter; use Putter;
with Semaphores; use Semaphores;
procedure Ejercicio09_02 is
 -- Declara las tareas
   task type A;
   task type B;
   task type C;
   
   --Declaramos el semaforo
   Mutex: Semaphore;
   
   -- Declara las referencias de accesos a tareas
   type Ref_A is access A;
   type Ref_B is access B;
   type Ref_C is access C;
   
   -- Declara el comportamiento de las tareas
   task body A is
   begin
      for I in 1..3 loop
         Wait(Mutex);
         Put_Line("Tarea A: "&I'Img);
         Signal(Mutex);
      end loop;
   end A;
   
   task body B is
   begin
      for I in 1..3 loop
         Wait(Mutex);
         Put_Line("Tarea B: "&I'Img);
         Signal(Mutex);
      end loop;
   end B;
   
   task body C is
   begin
      for I in 1..3 loop
         Wait(Mutex);
         Put_Line("Tarea C: "&I'Img);
         Signal(Mutex);
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
end ejercicio09_02;
