const get_medCardById = require('../../DataBase/get_medCard')

const get_dataMedCard = async (req, res) => {
    const { id } = req.query

    if(!id){
        res.json({
            code: 400, 
            info: 'Вы не ввели айди или значение не коректно!',
        })
    }

    try{
        const data = await get_medCardById(Number(id))

        res.json(data)
    }catch(err){
        res.json({
            code: 500, 
            info: 'db query failed',
            cathMassage: err
        }) 
    }
}

module.exports = get_dataMedCard