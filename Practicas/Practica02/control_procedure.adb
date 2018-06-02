with Ada.Text_IO,IO,Data_Types,Ada.Integer_Text_IO;
use Ada.Text_IO,IO,Data_Types,Ada.Integer_Text_IO;


package body control_procedure is
   --El procedimiento de control unicamente consiste en la ejecución
   --secuencial que decidirá en que estado se encuentra
   --el nivel del deposito 1
   procedure ControlNivelDeposito1(NV1: Nivel) is
      Vs : Valvula_Setting := On;
   begin
      EstadoValvula1(Vs);
   end ControlNivelDeposito1;
   
   --Procedimiento de control decidirá en que estado se encuentra
   --el nivel del deposito 2
   procedure ControlNivelDeposito2(NV2: Nivel) is
      Vs : Valvula_Setting := On;
   begin
      EstadoValvula2(Vs);
   end ControlNivelDeposito2;
   
   --Procedimiento de control de temperatura en que estado se encuentra
   --el contraolador de temperatura
   procedure ControlDeTemperatura(TR1: Temperatura ; RS: Resistencia) is
   begin
      Put_Line("Regulando temperatura con la resistencia electrica del calentador");
   end ControlDeTemperatura;
           
   --Procedimiento de control de seguridad muestra el estado de la temperatura
   --del deposito 1
   procedure ControlDeSeguridad(TR1: Temperatura) is
      Vs1 : Valvula_Setting := On;
      Vs2 : Valvula_Setting := On;
      Entrada_Aire : Entrada_Aire_Setting := On;
      BombaM: Bomba_Setting  := On;
   begin
      if(TR1 > 80) then
      EstadoValvula1(Vs1);
      EstadoValvula2(Vs2);
      EstadoEntradaAire(Entrada_Aire);
      EstadoMotor(BombaM);
      else
      Put_Line("La temperatura del deposito 1 es de " & Temperatura'Image(TR1) & " grados. No existe peligro");
      end if;
   end ControlDeSeguridad;
   
    
end control_procedure;
