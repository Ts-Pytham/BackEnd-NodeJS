import { Router } from 'express';
import { actualizarMantenimiento, buscarMantenimiento, eliminarMantenimiento, listarMantenimientos, registrarMantenimiento } from '../controllers/mantenimiento.controllers.js';
import { validarToken } from '../controllers/auth.controllers.js';
import { validatorMante } from '../validation/validatorMantenimiento.js';
import { ROLES } from '../helpers/constants.js';

const mantenimientoRouter = Router();

mantenimientoRouter.post('/registrar', validarToken(ROLES.tec), validatorMante, registrarMantenimiento);
mantenimientoRouter.get('/listar', validarToken(ROLES.tec), listarMantenimientos);
mantenimientoRouter.put('/actualizar/:id', validarToken(ROLES.tec), validatorMante, actualizarMantenimiento);
mantenimientoRouter.delete('/eliminar/:id', validarToken(ROLES.tec), eliminarMantenimiento);
mantenimientoRouter.get('/buscar/:id', validarToken(ROLES.tec), buscarMantenimiento)

export default mantenimientoRouter;
