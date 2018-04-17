with Putter;use Putter;
package body PutterServer is
   task body Controller is
   begin
      loop
         accept Put(c:Character; i:Integer) do
            --Intrucciones
            Putter.Put_Line("Task "&c'Img&": "&i'Img);
         end Put;
      end loop;
   end Controller;

begin
   null;
end;
