const db = require('./connect_DB')

const get_data = async() => {
    const sql = `SELECT p.first_name, p.last_name, cl.measurement_type, cl.measurement_value, cl.unit, cl.measured_at FROM pacienty as p
    JOIN clinical_data_all as cl ON cl.patient_id = p.id
    WHERE p.first_name = 'Иван' AND p.last_name = 'Иванов'`
    const [respons] = await db.query(sql)

    return respons

}

module.exports = get_data