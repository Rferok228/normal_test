const get = require('../../DataBase/get_all')

const getData = async (req, res) => {
    const data = await get()

    console.log(1)

    res.json(data)
}

module.exports = getData