import express from 'express';
import { iniciarSesion, registrarUsuario, cambiarclave } from '../controllers/auth.controllers.js';

const auth = express.Router();

auth.post('/login', iniciarSesion);
auth.post('/register', registrarUsuario)
auth.put('/cambiar-clave', cambiarclave);

export default auth;
