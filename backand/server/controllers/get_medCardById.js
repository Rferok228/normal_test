const get_medCardById = require('../../DataBase/get_medCard')

const get_dataMedCard = async (req, res) => {
    const id = req.params.id

    if(!id){
        res.status(400).json({ 
            info: 'Вы не ввели айди или значение не коректно!',
        })
        
        return
    }

    try{
        const data = await get_medCardById(Number(id))

        res.json(data)
    }catch(err){
        res.status(500).json({
            info: 'db query failed',
            cathMassage: err
        })
    }
}

module.exports = get_dataMedCard