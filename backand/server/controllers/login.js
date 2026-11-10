const { get_user } = require('../../DataBase/users')
const create_token = require('../services/JWTTocen')

const login = async (req, res) => {
    const login = req.body?.login ?? null
    const password = req.body?.password ?? null

    if(login === null || password === null){
        res.status(400).json({
            info: "Параметры должны быть заполнены!"
        })

        return
    } 

    try{
        const arrayUsers = await get_user(login, password)
        const user = arrayUsers.filter(e => e.length !== 0)[0]?.[0]

        if(!user){
            res.status(400).json({
                info: "Пользователь не найден!"
            })

            return
        }

        const token = create_token(user.id, user.role)
        
        res.json({
            JWT_tocen: token
        })
    }catch(err){
        res.status(500).json({
            info: "db query failed",
            cathMassage: err
        })
    }
    
}

module.exports = login