with PutterServer; use PutterServer;
procedure PutterClient is
begin
   for i in 1..3 loop
      PutterServer.Controller.Put('A',i); 
      PutterServer.Controller.Put('B',i);
      PutterServer.Controller.Put('C',i);
   end loop;
end PutterClient;
