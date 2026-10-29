const get_pacientsWithParam = require('../../DataBase/get_ptients')

const get_dataPatienstWithParam = async (req, res) => {
    const parametrs = {
        first_name: null,
        last_name: null,
        phone: null,
        passport: null,
        snils: null
    }

    console.log(req.query)

    parametrs.first_name = req.query.first_name !== undefined ? req.query.first_name : null
    parametrs.last_name = req.query.last_name !== undefined ? req.query.last_name : null
    parametrs.phone = req.query.phone !== undefined ? req.query.phone : null
    parametrs.passport = req.query.passport !== undefined ? req.query.passport : null
    parametrs.snils = req.query.snils !== undefined ? req.query.snils : null
 
    console.log(parametrs)

    const data = await get_pacientsWithParam(parametrs)

    res.json(data)
}

module.exports = get_dataPatienstWithParam