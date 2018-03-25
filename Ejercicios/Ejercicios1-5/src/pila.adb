-- Cuerpo del paquete
package body Pila is
   type Nodo;
   type Enlace is access Nodo;
   type Nodo is
      record
         Contenido : Elemento;
         Siguiente : Enlace;
      end record;
   Primero, Ultimo : Enlace := null;
   function Vacia return Boolean is
   begin
      return Primero = null;
   end Vacia;
   
 --  procedure Nuevo (E: out Elemento) is
 --  begin
 --     E:=null;
 --  end Nuevo;
   
   procedure Poner(E: Elemento) is
      Nuevo : Enlace;
   begin
      Nuevo := new Nodo;
      Nuevo.Contenido:= E;
      Nuevo.Siguiente:= null;
      if Vacia then
         Ultimo:=Nuevo;
      else
         Nuevo.Siguiente:=Primero;
      end if;
      Primero:=Nuevo;
   end Poner;
   procedure Quitar(E: out Elemento) is
      Viejo: Enlace;
   begin
      Viejo:=Primero;
      E:=Viejo.Contenido;
      Primero:=Viejo.Siguiente;
      if Primero = null then
         Ultimo:=null;
      end if;
   end Quitar;
end pila;
