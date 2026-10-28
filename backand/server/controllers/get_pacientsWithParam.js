const get_pacientsWithParam = require('../../DataBase/get_ptients')

const get_dataDoctors = async (req, res) => {
    const parametrs = {
        first_name: null,
        last_name: null,
        phone: null,
        passport: null,
        snils: null
    }

    parametrs.first_name = req.query.first_name
    parametrs.last_name = req.query.last_name
    parametrs.phone = req.query.phone
    parametrs.passport = req.query.passport
    parametrs.snils = req.query.snils

    const data = await get_pacientsWithParam(parametrs)

    res.json(data)
}

module.exports = get_dataDoctors