import express from 'express';
import { iniciarSesion, registrarUsuario, cambiarclave, validarToken } from '../controllers/auth.controllers.js';
import { ROLES } from '../helpers/constants.js';

const auth = express.Router();

auth.post('/login', iniciarSesion);
auth.post('/register', registrarUsuario)
auth.put('/cambiar-clave', validarToken(ROLES.user), cambiarclave);

export default auth;
