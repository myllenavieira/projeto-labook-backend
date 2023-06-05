import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import { userRouter } from "./router/userRouter";
import { postRouter } from "./router/postRouter";
import { likeRouter } from "./router/likeRouter";

dotenv.config();

const app = express();

app.use(express.json());

app.use(cors());

app.listen(Number(process.env.PORT) || 3003, () => {
    console.log(`Server is running on port ${Number(process.env.PORT) || 3003}`);
});

app.use("/users", userRouter);
app.use("/posts", postRouter);
app.use("/likes", likeRouter);