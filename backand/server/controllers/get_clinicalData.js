const get = require('../../DataBase/get_clinicalDataAll')

const getData = async (req, res) => {
    try{
        const data = await get()

        res.json(data)
    }catch(err){
        res.status(500).json({ 
            info: 'db query failed',
            cathMassage: err
        }) 
    }

}

module.exports = getData