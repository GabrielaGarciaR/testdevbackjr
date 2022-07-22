using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace CApp_Taste
{
    static class Conexion
    {
        public static SqlConnection conexion = new SqlConnection("server=PROBOOK-GABRIELA ; database=test_empleados ; integrated security = true");

        public static SqlConnection abrirConexion()
        {
            if (conexion.State == ConnectionState.Closed)
            {
                conexion.Open();
            }
            return conexion;
        }

        public static SqlConnection cerrarConexion()
        {
            if (conexion.State == ConnectionState.Open)
                conexion.Close();
            return conexion;
        }
    }
}
