

const express = require('express')
require('./db/mongoose')
const userRouter = require('./routes/userRoutes')
const chatRouter = require('./routes/chatRoutes')
const requestRouter = require('./routes/requestRoutes')

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())
app.use(userRouter)
app.use(chatRouter)
app.use(requestRouter)

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`)
})