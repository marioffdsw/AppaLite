using System;
using System.Collections.Generic;
//using System.Data;
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
    public class MovimientosController : ApiController
    {
        private AppaLiteModelContainer db = new AppaLiteModelContainer();

        // GET: api/Movimientos
        public IQueryable<Movimiento> GetMovimientos()
        {
            return db.Movimientos;
        }

        // GET: api/Movimientos/5
        [ResponseType(typeof(Movimiento))]
        public IHttpActionResult GetMovimiento(int id)
        {
            Movimiento movimiento = db.Movimientos.Find(id);
            if (movimiento == null)
            {
                return NotFound();
            }

            return Ok(movimiento);
        }

        // PUT: api/Movimientos/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMovimiento(int id, Movimiento movimiento)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != movimiento.Id)
            {
                return BadRequest();
            }

            db.Entry(movimiento).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MovimientoExists(id))
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

        // POST: api/Movimientos
        [ResponseType(typeof(Movimiento))]
        public IHttpActionResult PostMovimiento(Movimiento movimiento)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Movimientos.Add(movimiento);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = movimiento.Id }, movimiento);
        }

        // DELETE: api/Movimientos/5
        [ResponseType(typeof(Movimiento))]
        public IHttpActionResult DeleteMovimiento(int id)
        {
            Movimiento movimiento = db.Movimientos.Find(id);
            if (movimiento == null)
            {
                return NotFound();
            }

            db.Movimientos.Remove(movimiento);
            db.SaveChanges();

            return Ok(movimiento);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MovimientoExists(int id)
        {
            return db.Movimientos.Count(e => e.Id == id) > 0;
        }
    }
}