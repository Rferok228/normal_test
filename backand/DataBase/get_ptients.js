const db = require('./connect_DB.js')

const get_pacientsWithParam = async (parametrs) => {
    const where = []
    const array_values = []
    let strok = ''

    if(parametrs.first_name !== null){
        array_values.push(parametrs.first_name)
        where.push('first_name = ?')
    }
    if(parametrs.last_name !== null){
        array_values.push(parametrs.last_name)
        where.push('last_name = ?')
    }
    if(parametrs.phone !== null){
        array_values.push(parametrs.phone)
        where.push('phone = ?')
    }
    if(parametrs.passport !== null){
        array_values.push(parametrs.passport)
        where.push('passport = ?')
    }
    if(parametrs.snils !== null){
        array_values.push(parametrs.snils)
        where.push('snils = ?')
    }

    if(where.length > 0) {
        strok = 'WHERE '
        strok += where.join(' AND ')
    }
    

    const sql = `SELECT * FROM pacienty ${strok}`

    console.log(sql)
    console.log(array_values)

    try {
        const responseDB = await db.execute(sql, array_values)
        
        return responseDB[0]
    }catch(err){
        return {
            code: 501, 
            info: 'db query failed',
            cathMassage: err
        }
    }
}

module.exports = get_pacientsWithParam