import express from 'express';
import { iniciarSesion, registrarUsuario } from '../controllers/auth.controllers.js';

const auth = express.Router();

auth.post('/login', iniciarSesion);
auth.post('/register', registrarUsuario)

export default auth;
