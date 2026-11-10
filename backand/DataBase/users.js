const db = require('./connect_DB')

const get_user = async (login, password) => {
    const sql_pac = `SELECT id, login, password_hash, 'pacient' AS role FROM pacienty
        WHERE login = ? AND password_hash = ? 
    `
    const sql_doc = `SELECT id, login, password_hash, 'doctor' AS role FROM doctors
        WHERE login = ? AND password_hash = ? 
    `
    const pac_user = await db.execute(sql_pac, [login, password])
    const doc_user = await db.query(sql_doc, [login, password])
    
    return [pac_user[0], doc_user[0]]
}

const insert_patient = async (params) => {
    const sql = "INSERT INTO pacienty(first_name, last_name, login, password_hash, phone, passport, snils, weight_kg, height_cm, birth_date, blood_group, rhesus_factor) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)"

    const response = await db.execute(sql, params)
}

const insert_doctor = async (params) => {
    
}

module.exports = get_user