const db = require('./connect_DB.js')

const get_AllDoctors = async () => {
    const sql = `SELECT * FROM doctors`
    const responseDB = await db.query(sql)
    
    return responseDB[0]
}

module.exports = get_AllDoctors