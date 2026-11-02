const get_allDoctors = require('../../DataBase/get_doctors')

const get_dataDoctors = async (req, res) => {
    try{
        const data = await get_allDoctors()

        res.json(data)
    }catch(err){
        res.json({
            code: 500, 
            info: 'db query failed',
            cathMassage: err
        }) 
    }
}

module.exports = get_dataDoctors