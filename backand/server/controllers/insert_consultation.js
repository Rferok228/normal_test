const insert_consultation = require('../../DataBase/insert_consultation')

const insert_Data = async (req, res) => {
    const { id } = req.query
    const body = req.body

    if(!id || !body.doctor_id || !body.scheduled_at || !body.status || !body.consultation_notes){
        res.json({
            code: 400,
            info: "Вы не ввели какие-то данные, перепроверьте!"
        })
    }

    try {
        const responseDB = await insert_consultation(id, body)

        if(responseDB.affectedRows > 0){
            res.json({
                info: 'Данные успешно добавились в бд!'
            })
        }else{
            res.json({
                code: 500,
                info: 'Данные не добавились'
            })
        }
    }catch(err){
        res.json({
            code: 500, 
            info: 'db query failed',
            cathMassage: err
        }) 
    }
}

module.exports = insert_Data