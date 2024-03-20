import { Router } from 'express';
import { cargarImagen, registrarMaquina, buscarMaquina, listarMaquinas, actualizarMaquina, darDeBajaMaquina } from '../controllers/maquina.controllers.js';
import { validarToken } from '../controllers/auth.controllers.js';
import { validatorMaqui } from '../validation/validatorMaquina.js';
import { ROLES } from '../helpers/constants.js';

const maquinaRouter = Router();

maquinaRouter.post('/registrar', validarToken(ROLES.tec),  cargarImagen, validatorMaqui, registrarMaquina);
maquinaRouter.get('/buscar/:id', validarToken(ROLES.user),buscarMaquina);
maquinaRouter.get('/listar', validarToken(ROLES.user),listarMaquinas);
maquinaRouter.put('/debaja/:id', validarToken(ROLES.tec), darDeBajaMaquina);
maquinaRouter.put('/actualizar/:id', validarToken(ROLES.tec), cargarImagen, validatorMaqui, actualizarMaquina);

export default maquinaRouter;
