import { Router } from 'express';
import { actualizarAmbiente, buscarAmbientePorId, listarAmbientes, registrarAmbiente } from '../controllers/ambiente.controllers.js';
import { validarToken } from '../controllers/auth.controllers.js';
import validationAmbiente from '../validation/validationAmbiente.js';
import { ROLES } from '../helpers/constants.js';

const ambienteRouter = Router();

ambienteRouter.get('/listar', listarAmbientes);
ambienteRouter.post('/registrar', validarToken(ROLES.admin), validationAmbiente, registrarAmbiente);
ambienteRouter.get('/buscar/:id', validarToken(ROLES.admin), buscarAmbientePorId);
ambienteRouter.put('/actualizar/:id', validarToken(ROLES.admin), validationAmbiente, actualizarAmbiente);

export default ambienteRouter;