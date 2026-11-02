const get = require('../../DataBase/get_all')

const getData = async (req, res) => {
    try{
        const data = await get()

        res.json(data)
    }catch(err){
        res.json({
            code: 500, 
            info: 'db query failed',
            cathMassage: err
        }) 
    }

}

module.exports = getData