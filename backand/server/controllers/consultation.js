const { insert_consultation, get_consultation } = require('../../DataBase/consultation')

const insert_consultationData = async (req, res) => {
    const id = req.params.id
    const body = req.body

    if(!id || !body || !body.doctor_id || !body.scheduled_at || !body.status || !body.consultation_notes){
        res.status(400).json({
            info: "Вы не ввели какие-то данные, перепроверьте!"
        })

        return
    }

    try {
        const responseDB = await insert_consultation(id, body)

        if(responseDB.affectedRows > 0){
            res.json({
                info: 'Данные успешно добавились в бд!'
            })
        }else{
            res.status(500).json({
                info: 'Данные не добавились'
            })
        }
    }catch(err){
        res.status(500).json({
            info: 'db query failed',
            cathMassage: err
        }) 
    }
}

const get_consultationData = async (req, res) => {
    const id = req.params.id

    if(!id){
        res.status(400).json({ 
            info: 'Вы не ввели айди или значение не коректно!',
        })
        
        return
    }

    try{
        const data = await get_consultation(Number(id))

        res.json(data)
    }catch(err){
        res.status(500).json({
            info: 'db query failed',
            cathMassage: err
        }) 
    }


}

module.exports = {
    insert_consultationData,
    get_consultationData
}