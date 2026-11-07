const jwt = require('jsonwebtoken')
const sicret_key = 'dshfahsjfhajkhfkjsahf@HH(#@*&FJKSHADFKJ!@$#&!(*&KJDFKJH@&*&$!*&!!@#!1231321hjkhdjksfh7342784727sdhfjhsjkafhUY&@Y#&*YIHDIJSHF*G*VHDIJHDLKSJFH*#Y'

const createJWTToken = (id, role) => {
    const payload = {
        id: String(id), 
        role: String(role)
    }
    const options = {
        algorithm: "HS256",
        expiresIn: 3600
    }

    const token = jwt.sign(payload, sicret_key, options)

    return token
}

module.exports = createJWTToken