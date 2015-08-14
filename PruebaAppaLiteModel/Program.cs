using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppaLiteModel;
using System.Data.Entity.Validation;
using System.Diagnostics;

class PruebaAppaLiteModel
{
    static void Main(string[] args)
    {
        AppaLiteModelContainer context = new AppaLiteModelContainer();


        Marca mrc1 = new Marca
        {
            Nombre = "Adidas",
            Icono = "Adidas.jpg"
        };

        context.Marcas.Add(mrc1);
        //context.SaveChanges();

        Articulo art1 = new Articulo
        {
            Referencia = "A12345",
            Descripcion = "Maraton 6",
            Talla = "6",
            Marca = mrc1
           // Prestamo =
         };

        context.Articulos.Add(art1);
        //context.SaveChanges();
        
        Local lcl1 = new Local
        {
            Nombre = "Cca 126",
            Icono = "126.jpg",
            Telefono = "3021234"

        };

        context.Locales.Add(lcl1);
        //context.SaveChanges();


        Local lcl2 = new Local
        {
            Nombre = "Cca 124",
            Icono = "124.jpg",
            Telefono = "3011235"
        };


        context.Locales.Add(lcl2);
        //context.SaveChanges();

        Empleado emp1 = new Empleado
        {
            Nombre = "Elbert Toledo",
            Cedula = "1234",
            Telefono = "3001236",
            Foto = "emp1.jpg",           
        };


        context.Empleados.Add(emp1);
        //context.SaveChanges();

        Movimiento mvt1 = new Movimiento
        {
            Estado = "Prestado",
            Fecha = "10/08/2015",
            Hora = "2:30 Pm",
            Destino = lcl1,
            //Prestamo =ptm1 ,            
        };

        emp1.Movimiento.Add(mvt1);

        context.Movimientos.Add(mvt1);
        //context.SaveChanges();

        
        Prestamo ptm1 = new Prestamo
        {
            Articulo = art1,
            Origen = lcl1,
          //  Movimientos 
        
        };

       // mvt1.Prestamo = ptm1;
        ptm1.Articulo = art1;
        context.Prestamos.Add(ptm1);
        //context.SaveChanges();


        try
        {
            // doing here my logic
            context.SaveChanges();
        }
        catch (DbEntityValidationException dbEx)
        {
            
            foreach (var validationErrors in dbEx.EntityValidationErrors)
            {
                
                foreach (var validationError in validationErrors.ValidationErrors)
                {
                    Console.WriteLine("Property: {0} Error: {1}", validationError.
      PropertyName, validationError.ErrorMessage);
                }
            }
        }

        //context.SaveChanges();

    }
}

