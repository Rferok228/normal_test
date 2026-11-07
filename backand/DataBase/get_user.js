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

module.exports = get_user