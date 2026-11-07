const db = require('./connect_DB')

const insert_prescription = async (params) => {
    const sql = `INSERT INTO prescriptions(treatment_plan_id, medication_name, dosage, frequency, start_date, end_date, status, instructions) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`
    const response = await db.execute(sql, [Number(params.treatment_plan_id), params.medication_name, params.dosage, params.frequency, params.start_date, params.end_date ?? null, params.status,  params.instructions ?? null])

    return response[0]
}

const update_prescription = async (params) => {
    const set = []
    const data = []

    if(params.medication_name !== undefined){
        set.push('medication_name=?')
        data.push(params.medication_name)
    }
    if(params.dosage !== undefined){
        set.push('dosage=?')
        data.push(params.dosage)
    }
    if(params.frequency !== undefined){
        set.push('frequency=?')
        data.push(params.frequency)
    }
    if(params.start_date !== undefined){
        set.push('start_date=?')
        data.push(params.start_date)
    }
    if(params.end_date !== undefined){
        set.push('end_date=?')
        data.push(params.end_date)
    }
    if(params.status !== undefined){
        set.push('status=?')
        data.push(params.status)
    }
    if(params.instructions !== undefined){
        set.push('instructions=?')
        data.push(params.instructions)
    }

    const set_txt = set.join(', ')
    data.push(Number(params.id))

    const sql = `UPDATE prescriptions SET ${set_txt} WHERE id = ?`
    const response = await db.execute(sql, data)

    return response[0]
}

module.exports = {
    insert_prescription,
    update_prescription
}