﻿using GDifare.Utilitario.Comun;
using GDifare.Utilitario.Comun.Exceptions;
using safeprojectname.Utils;
using System.Text.Json.Serialization;

namespace MicroserviciosGD1.Entidades.Buses_SA.Consultas.ConsultasUsuario
{
    public class ListarUsuarioQuery : PagedViewRequest
    {


        [JsonPropertyName("campoConsulta")]
        public string CampoConsulta { get; set; }

        public override void IsValid()
        {
            if (string.IsNullOrWhiteSpace(CampoConsulta))
            {
                throw new RequestException(MensajesEjemplos.CODE_ERROR_VAL_01, MensajesEjemplos.ERROR_VAL_01);
            }

            base.IsValid();
        }

    }
}
