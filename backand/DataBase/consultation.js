const db = require('./connect_DB')

const insert_consultation = async (id, params) => {
    const sql = `INSERT INTO consultations(patient_id, doctor_id, scheduled_at, status, consultation_notes) VALUES (?,?,?,?,?)`
    const response = await db.execute(sql, [id, params.doctor_id, params.scheduled_at, params.status, params.consultation_notes])

    return response[0]
}

const get_consultation = async (id) => {
    const sql = `SELECT c.doctor_id, c.scheduled_at, c.status, c.consultation_notes FROM consultations as c
        WHERE c.patient_id = ?`
    const response = await db.execute(sql, [id])

    return response[0]
}

module.exports = {
    insert_consultation,
    get_consultation
}