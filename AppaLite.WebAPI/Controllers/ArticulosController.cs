using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using AppaLiteModel;

namespace AppaLite.WebAPI.Controllers
{
    public class ArticulosController : ApiController
    {
        private AppaLiteModelContainer db = new AppaLiteModelContainer();

        // GET: api/Articulos
        public IQueryable<Articulo> GetArticulos()
        {
            return db.Articulos;
        }

        // GET: api/Articulos/5
        [ResponseType(typeof(Articulo))]
        public IHttpActionResult GetArticulo(int id)
        {
            Articulo articulo = db.Articulos.Find(id);
            if (articulo == null)
            {
                return NotFound();
            }

            return Ok(articulo);
        }

        // PUT: api/Articulos/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutArticulo(int id, Articulo articulo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != articulo.Id)
            {
                return BadRequest();
            }

            db.Entry(articulo).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ArticuloExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Articulos
        [ResponseType(typeof(Articulo))]
        public IHttpActionResult PostArticulo(Articulo articulo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Articulos.Add(articulo);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = articulo.Id }, articulo);
        }

        // DELETE: api/Articulos/5
        [ResponseType(typeof(Articulo))]
        public IHttpActionResult DeleteArticulo(int id)
        {
            Articulo articulo = db.Articulos.Find(id);
            if (articulo == null)
            {
                return NotFound();
            }

            db.Articulos.Remove(articulo);
            db.SaveChanges();

            return Ok(articulo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ArticuloExists(int id)
        {
            return db.Articulos.Count(e => e.Id == id) > 0;
        }
    }
}