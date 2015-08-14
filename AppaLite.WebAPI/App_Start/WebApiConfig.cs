using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace AppaLite.WebAPI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Json Formatters Configuration
            config.Formatters.Remove( config.Formatters.XmlFormatter );

            GlobalConfiguration.Configuration.Formatters.JsonFormatter
                .SerializerSettings.ReferenceLoopHandling =
                Newtonsoft.Json.ReferenceLoopHandling.Ignore;

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
