using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CApp_Taste
{
    class Program
    {
        
        static void Main(string[] args)
        {
            Operaciones operaciones = new Operaciones();

            Console.WriteLine("\nMENU");
            Console.WriteLine("\n¿Que te gustaría hacer?");
            Console.WriteLine("\nPresiona 0 para cerrar la aplicación");
            Console.WriteLine("Presiona 1 para listar 10 primeros usuarios");
            Console.WriteLine("Presiona 2 para generar un archivo csv");
            Console.WriteLine("Presiona 3 para actualizar un usuario");
            Console.WriteLine("Presiona 4 para agregar un usuario");

            string commandInput = Console.ReadLine();

            if (string.IsNullOrEmpty(commandInput))
            {
                Console.WriteLine("\nComando invalido. Por favor escoja una opción\n");
            }

            int command = Convert.ToInt32(commandInput);

            switch (command)
            {
                case 0:
                    Environment.Exit(0);
                    break;
                case 1:
                    Console.WriteLine("Listar");
                    operaciones.listar();
                    break;
                case 2:
                    Console.WriteLine("Generar");
                    break;
                case 3:
                    Console.WriteLine("Actualizar");
                    operaciones.actualizar();
                    break;
                case 4:
                    Console.WriteLine("Agregar");
                    operaciones.insertar();
                    break;
                default:
                    Console.WriteLine("\nComando invalido. Por favor presiona un numero de 0 al 4.\n");
                    break;
            }

            Console.ReadLine();
        }
    }
}
