const db = require('./connect_DB')

const insert_ClinicalData = async (id, params) => {
    const sql = `INSERT INTO clinical_data_all(patient_id, measurement_type, measurement_value, unit, source, notes) VALUES (?, ?, ?, ?, ?, ?)`
    const response = await db.execute(sql, [id, params.measurement_type, params.measurement_value, params.unit, params.source, params.notes])

    return response[0]
}

module.exports = insert_ClinicalData