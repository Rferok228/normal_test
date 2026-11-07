const db = require('./connect_DB')

const insert_wellbeing_diary = async (id, params) => {
    const sql = `INSERT INTO wellbeing_diary(patient_id, date, wellbeing, symptoms, comment) VALUES (?, ?, ?, ?, ?)`
    const response = await db.execute(sql, [id, params.date ?? null, params.wellbeing  ?? null, params.symptoms  ?? null, params.comment ?? null])

    return response[0]
}

module.exports = insert_wellbeing_diary