const insert_wellbeingDiary = require('../../DataBase/insert_wellbeingDiary')

const insert_Data = async (req, res) => {
    const id = req.params.id
    const body = req.body

    if(!id || !body || !body.date || (!body.wellbeing && !body.symptoms && !body.comment)){
        res.status(400).json({
            info: "Вам необходимо ввести хоть какие-то данные!"
        })

        return
    }

    try {
        const responseDB = await insert_wellbeingDiary(id, body)

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

module.exports = insert_Data