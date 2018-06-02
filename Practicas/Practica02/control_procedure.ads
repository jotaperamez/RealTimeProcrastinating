with Data_Types; use Data_Types;
package Control_Procedure is
   
   --El procedimiento de control de nivel deposito 1 que establece el control
   --de nivel del deposito 1
   procedure ControlNivelDeposito1(NV1: Nivel);
   --El procedimiento de control de nivel deposito 2 que establece el control
   --de nivel del deposito 2
   procedure ControlNivelDeposito2(NV2: Nivel);
   --El procedimiento de control de temperatura que establece el control
   --de nivel de temperatura
   procedure ControlDeTemperatura(TR1: Temperatura ; RS: Resistencia);
    --El procedimiento de control de seguridad que establece el control
   --de seguridad
   procedure ControlDeSeguridad(TR1: Temperatura);
     
end Control_Procedure;
