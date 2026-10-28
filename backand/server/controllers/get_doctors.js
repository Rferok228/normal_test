const get_allDoctors = require('../../DataBase/get_doctors')

const get_dataDoctors = async (req, res) => {
    const data = await get_allDoctors()

    res.json(data)
}

module.exports = get_dataDoctors