import { Router } from 'express';
import { buscarusuarios, listarusuarios, eliminarUsuario, actualizarUsuario, cambiarEstadoUsuario } from '../controllers/usuario.controllers.js';
import { validarToken } from '../controllers/auth.controllers.js';
import validateUsuario from '../validation/usuario.validation.js';
import { ROLES } from '../helpers/constants.js';

const usuarioRouter = Router();

usuarioRouter.get('/buscar/:identificacion', validarToken(ROLES.admin), buscarusuarios);
usuarioRouter.get('/listar', validarToken(ROLES.admin), listarusuarios);
usuarioRouter.put('/actualizar/:id', validarToken(ROLES.admin), validateUsuario, actualizarUsuario);
usuarioRouter.delete('/eliminar/:id', validarToken(ROLES.admin), eliminarUsuario);
usuarioRouter.put('/cambiarestado/:identificacion', validarToken(ROLES.admin), cambiarEstadoUsuario);

export default usuarioRouter;
