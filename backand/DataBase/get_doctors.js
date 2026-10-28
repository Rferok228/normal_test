const db = require('./connect_DB.js')

const get_AllDoctors = async () => {
    const sql = `SELECT * FROM doctors`

    try {
        const responseDB = await db.query(sql)
        
        return responseDB[0]
    }catch(err){
        return {
            code: 501, 
            info: 'db query failed',
            cathMassage: err
        }
    }
}

module.exports = get_AllDoctors