with io_concc,Data_Types,Practica2_ImprimirPantalla,Ada.Real_Time,ada.strings.unbounded,tarjeta_compartida,espera_selectiva,Ada.Integer_Text_IO;
use io_concc,Data_Types,Practica2_ImprimirPantalla,Ada.Real_Time,ada.strings.unbounded,tarjeta_compartida,espera_selectiva,Ada.Integer_Text_IO;



procedure main_concurrente_practica2 is
   --tarea de nivel deposito 1
   task ControlNivelDeposito1;
   --tarea de nivel deposito 2
   task ControlNivelDeposito2;
   --tarea de temperatura
   task ControlDeTemperatura;
   --Tarea control de seguiridad
   task ControlDeSeguridad;
   
   --Tarea de nivel de deposito1
   task body ControlNivelDeposito1 is
      T:Time;
      --periodo de activación
      --y tiempo de computo
      Tperio: Time_Span := Milliseconds(500);
      TComp : Time_Span := Milliseconds(100);
      Tanque1: Nivel := 30;
      vs : Valvula_Setting;
      Salida: Unbounded_String ;
      Tanque:Nivel;
      contador : Integer := 0;
     
   begin
     
      loop
      --Se obtiene el tiempo
      T := Clock;
      T := T + Tperio;      
      delay until(T);
      --Se utiliza el recurso compartido, para el leer el niel deposito1
      --Lectura de datos lectura_selectiva, este metodo no imprime son metodos simulado de lectura
      espera_selectiva.lecturaDatos.LeeNivelDep1(Tanque1);
      
      tanque := NivelDeposito1(Tanque1);
      if tanque>100 then
        vs := Off;
         Salida := To_Unbounded_String ("Valor del tanque superior al limite la valvula E1 es cerrada");
      else
      vs:= On;
      Salida :=To_Unbounded_String("Valor del tanque es bajo la valvula E1 se abre");
      end if;
      EstadoValvula1(vs);
         
      --Recurso de tarjeta compartida para escritura
      --este metodo no imprime son metodos simulado de escritura 
      tarjeta_compartida.tarjeta_escritura.Escribir(To_Unbounded_String("Control de nivel deposito 1 "),Salida);
      
     --Escritura con tarjeta_Escritura recurso;
      Practica2_ImprimirPantalla.ImprimirPantalla.Imprimir(To_Unbounded_String("Control de nivel deposito 1 --> "),Salida);     
      
      T:= Clock;
      T:= T + TComp;
      -- Esperamos el tiempo Periodo de
      -- activacion mas el tiempo de computo
      delay until(T);
      contador:= contador+1;         
         exit when contador = 3;           
    end loop;
      
   end ControlNivelDeposito1;
   
   task body ControlNivelDeposito2 is     
      T:Time;
      --periodo de activación
      --y tiempo de computo
      Tperio: Time_Span := Milliseconds(500);
      TComp : Time_Span := Milliseconds(100);
      Tanque2: Nivel := 80;
      Vs2 : Valvula_Setting;
      Salida: Unbounded_String ;
      Tanque:Nivel;
      contador : Integer := 0;
   begin
     loop
      T := Clock;
      T := T + Tperio;
      
      delay until(T);
      --Utilizamos el recurso compartido para leer el nivel deposito
      --Lectura de datos lectura_selectiva nombreClase.Nombredelaccept
      espera_selectiva.lecturaDatos.LeeNivelDep2(Tanque2);
      --se realiza la accion
      tanque := NivelDeposito2(Tanque2);      
      if tanque>100 then
        Vs2 := Off;
        Salida := To_Unbounded_String ("Valor del tanque superior al limite la valvula E2 es cerrada");
      else
         Vs2:= On;
         Salida :=To_Unbounded_String("Valor del tanque es bajo la valvula E2 se abre");
      end if;
         EstadoValvula2(Vs2);
      
      --Recurso de tarjeta compartida
      tarjeta_compartida.tarjeta_escritura.Escribir(To_Unbounded_String("Control de nivel deposito 2 "),Salida);
      
      --Escritura con tarjeta_Escritura;
      --tarjeta servidora para mostrar por pantalla
      Practica2_ImprimirPantalla.ImprimirPantalla.Imprimir(To_Unbounded_String("Control de nivel deposito 2 --> "),Salida);
     
      T:= Clock;
      T:= T + TComp;
      delay until(T);
      contador:= contador+1;         
      exit when contador = 3; 
     end loop;
   end ControlNivelDeposito2;
   
   --Si la temperatura es distinta de 66 grados se tiene que regularr la temperatura del agua
   task body ControlDeTemperatura is 
      T:Time;
      --periodo de activación
      --y tiempo de computo
      Tperio: Time_Span := Milliseconds(750);
      TComp : Time_Span := Milliseconds(100);
      Salida:   Unbounded_String ;
      TempDeposito1:Temperatura:=70;
       contador : Integer := 0;
   begin
    loop
      T := Clock;
      T := T + Tperio;      
      delay until(T);
      --Lectura de datos lectura_selectiva nombreClase.Nombredelaccept    
       espera_selectiva.lecturaDatos.LeetemperaturaDep1(TempDeposito1);
     
      if TempDeposito1 /=66 then         
         Salida := To_Unbounded_String ("Se esta regulando la temperatura con la resistencia electrica del calentador. ");
      else
         Salida := To_Unbounded_String("La temperatura del deposito 1 es la adecuada. ");         
      end if;  
      
      --Recurso de tarjeta compartida
      tarjeta_compartida.tarjeta_escritura.Escribir(To_Unbounded_String("Control de temperatura "),Salida);
      --tarjeta servidora para mostrar por pantalla
      Practica2_ImprimirPantalla.ImprimirPantalla.Imprimir(To_Unbounded_String("Control de Temperatura --> "),Salida);
      
      T := Clock;
      T:= T + TComp;
      delay until(T);
      contador:= contador+1;         
      exit when contador = 3;           
    end loop;
   end ControlDeTemperatura;
   
   --El control de seguridad comprueba el sensor de temperatura del deposito 1
   --si supera el limite de 80 grados se cierra valvula E1 y E2
   --ademas se activa la entrada de aire y la bomba hasta que la temperatura baje
   task body ControlDeSeguridad is
      T:Time;
      Tperio: Time_Span := Milliseconds(250);
      TComp : Time_Span := Milliseconds(50);
      Salida: Unbounded_String ;
      TemperaturaDeposito1aux:Temperatura:=70;
      Vs1 : Valvula_Setting;
      Vs2 : Valvula_Setting;
      Entrada_Aire: Entrada_Aire_Setting;
      BombaM: Bomba_Setting;
      contador : Integer := 0;
      
   begin
     loop
      T := Clock;
      T := T + Tperio;      
      delay until(T);
      --Lectura de datos lectura_selectiva nombreClase.Nombredelaccept   
      espera_selectiva.lecturaDatos.LecturaControlSeguridad(TemperaturaDeposito1aux);
        
      if TemperaturaDeposito1aux>80 then
         Vs1:=Off;
         Vs2:=Off;
         Entrada_Aire:=On;
         BombaM:=On;
         Salida := To_Unbounded_String ("La temperatura del tanque es mayor de 80, se cierra la valvula de salida y la de entrada se activa para circular el agua.");
      else
         Vs1:=On;
         Vs2:=On;
         Entrada_Aire:=Off;
         BombaM:=Off;
         Salida :=To_Unbounded_String("La temperatura del deposito 1, no existe peligro");        
      end if;
      
       --Recurso de tarjeta compartida
      tarjeta_compartida.tarjeta_escritura.Escribir(To_Unbounded_String("Control de seguridad "),Salida);
       --Escritura con tarjeta_Escritura servidora;
      Practica2_ImprimirPantalla.ImprimirPantalla.Imprimir(To_Unbounded_String("Control de Seguridad --> "),Salida);

      T := Clock;   
      T:= T + TComp;
      delay until(T);
      contador:= contador+1;         
      exit when contador = 3;  
     end loop;
   end ControlDeSeguridad;
begin
   null;
     
end main_concurrente_practica2;



