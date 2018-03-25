with Ada.Text_IO; use Ada.Text_IO;

procedure Ejercicio01_07 is
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
   type Nodo;
   type Enlace is access Nodo;
   type Nodo is record
      Dato:Datos_Personales;
      Next_E:Enlace;
   end record;
   New_Node:Enlace;
begin
   New_Node:= new Nodo;
   New_Node.Dato:= Mis_Datos;
   New_Node.Next_E:= null;
   
   Put_Line("Nombre: " & New_Node.Dato.Nombre);
   Put_Line("Apellidos: " & New_Node.Dato.Apellidos);
   Put_Line("Fecha Nacimiento (dd/mm/yyyy): " & New_Node.Dato.Fecha_Nacimiento.D'Img & "/" & New_Node.Dato.Fecha_Nacimiento.M'Img & "/" & New_Node.Dato.Fecha_Nacimiento.A'Img);

end ejercicio01_07;
