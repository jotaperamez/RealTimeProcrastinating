with Ada.Text_IO,Data_Types,Ada.Integer_Text_IO;
use Ada.Text_IO,Data_Types,Ada.Integer_Text_IO;

--Cuerpo del paquete de entrada y salida de
--datos por pantalla
package body io is
   --Funcion que escribe por pantalla el
   --estado de la temperatura del deposito1
   function TempDeposito1 (TR:Temperatura) return Temperatura is
   begin
      return TR;
   end TempDeposito1;
   --Funcion que escribe por pantalla el
   --nivel del dep�sito 1
   function NivelDeposito1 (NV1 : Nivel) return Nivel is
      auxNv1 : Nivel := 10;
   begin
      return auxNv1;
   end NivelDeposito1;
   --Funcion que escribe por pantalla el
   --nivel del dep�sito 2
   function NivelDeposito2 (NV2: Nivel) return Nivel is
     auxNv2 : Nivel := 20;
   begin
      return auxNv2;
   end NivelDeposito2;
   --Funcion que escribe por pantalla el
   --estado del motor
   procedure EstadoMotor (MS : Bomba_Setting) is
   begin
      Put_Line("Reajustes en el estado del motor");
   end EstadoMotor;
   --Funcion que escribe por pantalla el
   --estado de la v�lvula 1
   procedure EstadoValvula1 (VS : Valvula_Setting) is
   begin
      Put_Line("Reajustes en el estado de la valvula 1");
   end EstadoValvula1;
   --Funcion que escribe por pantalla el
   --estado de la v�lvula 2
   procedure EstadoValvula2 (VS : Valvula_Setting) is
   begin
      Put_Line("Reajustes en el estado de la valvula 2");
   end EstadoValvula2;
   --Funcion que escribe por pantalla el
   --estado de la entrada de aire
   procedure EstadoEntradaAire (VS : Entrada_Aire_Setting) is
   begin
      Put_Line("Reajustes en el estado de la entrada de aire");
   end EstadoEntradaAire;
   --Funcion que escribe por pantalla el
   --estado de la temperatura del deposito 1
   procedure WriteTemperaturaRDeposito1 (TR : Temperatura) is
   begin
      Put_Line("La temperatura del deposito 1 es de " & Temperatura'Image(TR) & " grados");
   end WriteTemperaturaRDeposito1;
   --Funcion que escribe por pantalla el
   --estado del nivel del deposito 1
   procedure WriteNivelDeposito1 (NV1: Nivel) is
   begin
      Put_Line("El nivel del deposito 1 es de 100 Litros ");
   end WriteNivelDeposito1;
   --Funcion que escribe por pantalla el
   --estado del nivel del deposito 2
   procedure WriteNivelDeposito2 (NV2: Nivel) is
      begin
      Put_Line("El nivel del deposito 2 es de 150 Litros ");
   end WriteNivelDeposito2;

end io;
