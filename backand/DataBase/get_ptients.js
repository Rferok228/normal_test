const db = require('./connect_DB.js')

const get_AllDoctors = async (parametrs) => {
    const sql = `SELECT * FROM patients `



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

module.exports = get_AllDoctor