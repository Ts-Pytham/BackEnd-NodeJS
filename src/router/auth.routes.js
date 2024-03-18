import express from 'express';
import iniciarSesion from '../controllers/auth.controllers.js';

const auth = express.Router();

auth.post('/login', iniciarSesion);

export default auth;
