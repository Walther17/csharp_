using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeNotas.Model
{
    internal class Nota
    {

        public int id { get; set; }
        public decimal nota { get; set; }

        public Materia id_materia { get; set; }
        public Nota() { }

        public Nota(int id, decimal nota) {
            this.id = id;
            this.nota = nota;   
        }

        public Nota(int id, decimal nota, Materia id_materia)
        {
            this.id = id;
            this.nota = nota;
            this.id_materia = id_materia;
        }
    }
}
