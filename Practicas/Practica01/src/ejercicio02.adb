with Ada.Text_IO; use Ada.Text_IO;
                          
procedure ejercicio02 is
  type Matrix is array (1..11,1..3) of Float digits 4;
   TABLA : constant Matrix := ((50.0,0.7138,109.93),
                               (55.0,0.7779,130.23),
                               (60.0,0.8512,151.13),
                               (65.0,0.8535,172.06),
                               (70.0,0.9649,192.98),
                               (75.0,1.0255,213.93),
                               (80.0,1.0353,234.91),
                               (85.0,1.1443,255.9),
                               (90.0,1.1725,276.92),
                               (95.0,1.26,297.96),
                               (100.0,1.3069,419.04));
   
   function Temp_Salida (Te:Float) return Float is
      A:Float;
      B:Float;
      Amayus: Float;
      Aminus: Float;
      Bmayus: Float;
      Bminus: Float;
      Tminus: Float;
      Tmayus: Float;
   begin
      if Te > 100.0 or Te < 50.0 then
         return 0.0;
      else
         if Te - Float(Integer(Te)) = 0.0 and Integer(Te) rem 5 = 0 then
            for I in 1..11 loop
               if Te = TABLA(I,1) then
                  A := TABLA(I,2);
                  B := TABLA(I,3);
                  exit;
               end if;
            end loop;
         else
            for I in 1..10 loop
               if Te > TABLA(I,1) and Te < TABLA(I+1,1) then
                  Aminus := TABLA(I,2);
                  Amayus := TABLA(I+1,2);
                  Bminus := TABLA(I,3);
                  Bmayus := TABLA(I+1,3);
                  Tminus := TABLA(I,1);
                  Tmayus := TABLA(I+1,1);
                  
                  A := Aminus + (Amayus - Aminus)* ((Te - Tminus)/(Tmayus - Tminus));
                  B := Bminus + (Bmayus - Bminus)* ((Te - Tminus)/(Tmayus - Tminus));
                  exit;
               end if;
            end loop;
         end if;  
         
         return Te*A + B;
      end if;
   
   end Temp_Salida;
   Ts : Float;
begin
   Ts:= Temp_Salida(60.0);
   Put_Line(Ts'Img);
   Ts:= Temp_Salida(60.5);
   Put_Line(Ts'Img);
end ejercicio02;
