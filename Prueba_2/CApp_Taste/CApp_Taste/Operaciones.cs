using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CApp_Taste
{
    class Operaciones
    {
        public void insertar()
        {
            Console.WriteLine("Ingresa el id:");
            int id = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Ingresa el login: ");
            String login = Console.ReadLine();
            Console.WriteLine("Ingresa el nombre: ");
            String nombre = Console.ReadLine();
            Console.WriteLine("Ingresa el apellido paterno: ");
            String paterno = Console.ReadLine();
            Console.WriteLine("Ingresa el apellido materno: ");
            String materno = Console.ReadLine();
            Console.WriteLine("Ingres el sueldo: ");
            double sueldo = Convert.ToDouble(Console.ReadLine());

            string query = "INSERT INTO usuarios (userId,Login,Nombre,Paterno,Materno) VALUES(@id, @login, @nombre, @paterno, @materno) insert into empleados(Sueldo, FechaIngreso, LoginEmp) values(@sueldo, @fecha, @login)";
            SqlCommand command = new SqlCommand(query, Conexion.conexion);
            try
            {
                Conexion.abrirConexion();
                command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;
                command.Parameters.Add("@login", System.Data.SqlDbType.VarChar).Value = login;
                command.Parameters.Add("@nombre", System.Data.SqlDbType.VarChar).Value = nombre;
                command.Parameters.Add("@paterno", System.Data.SqlDbType.VarChar).Value = paterno;
                command.Parameters.Add("@materno", System.Data.SqlDbType.VarChar).Value = materno;
                command.Parameters.Add("@sueldo", System.Data.SqlDbType.Float).Value = sueldo;
                command.Parameters.Add("@fecha", System.Data.SqlDbType.Date).Value = new DateTime();

                command.ExecuteNonQuery();
                Console.WriteLine("Usuario insertado");
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error: " + e.ToString());
            }
            finally
            {
                Conexion.cerrarConexion();
            }
        }

        public void listar()
        {
            string query = "SELECT TOP 10 * FROM usuarios";
            SqlCommand command = new SqlCommand(query, Conexion.conexion);
            try
            {
                Conexion.abrirConexion();
                SqlDataReader registros = command.ExecuteReader();
                while (registros.Read())
                {
                    Console.Write(registros["userId"].ToString() + " - ");
                    Console.Write(registros["Login"] + " - ");
                    Console.Write(registros["Nombre"] + " - ");
                    Console.Write(registros["Paterno"] + " - ");
                    Console.Write(registros["Materno"]);
                    Console.WriteLine("");
                }
                Console.WriteLine("Usuarios listados");
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error: " + e.ToString());
            }
            finally
            {
                Conexion.cerrarConexion();
            }
        }

        public void actualizar()
        {
            Console.WriteLine("Ingresa el login:");
            String login = Console.ReadLine();
            Console.WriteLine("Ingresa el sueldo: ");
            double sueldo = Convert.ToDouble(Console.ReadLine());

            string query = "UPDATE empleados SET Sueldo = @sueldo WHERE LoginEmp = @login";
            SqlCommand command = new SqlCommand(query, Conexion.conexion);
            try
            {
                Conexion.abrirConexion();
                command.Parameters.Add("@login", System.Data.SqlDbType.VarChar).Value = login;
                command.Parameters.Add("@sueldo", System.Data.SqlDbType.Float).Value = sueldo;

                command.ExecuteNonQuery();
                Console.WriteLine("Usuario actualizado");
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error: " + e.ToString());
            }
            finally
            {
                Conexion.cerrarConexion();
            }
        }
    }
}
