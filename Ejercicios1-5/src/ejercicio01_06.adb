with Ada.Text_IO; use Ada.Text_IO;

procedure Ejercicio01_06 is
   type Dia is range 1..31;
   type Mes is range 1..12;
   type Fecha is record
      D:Dia;
      M:Mes;
      A:Integer;
   end record;   
   type Datos_Personales is record
      Nombre:String(1..16);
      Apellidos:String(1..13);
      Fecha_Nacimiento:Fecha;
   end record;
   
   mis_datos:Datos_Personales:=(Nombre =>"Francisco Javier",Apellidos=>"Valero Moreno",Fecha_nacimiento =>(15,2,1995));
begin
   Put_Line("Nombre: " & Mis_Datos.Nombre);
   Put_Line("Apellidos: " & Mis_Datos.Apellidos);
   Put_Line("Fecha Nacimiento (dd/mm/yyyy): " & Mis_Datos.Fecha_Nacimiento.D'Img & "/" & Mis_Datos.Fecha_Nacimiento.M'Img & "/" & mis_datos.Fecha_Nacimiento.A'Img);
   
end ejercicio01_06;
