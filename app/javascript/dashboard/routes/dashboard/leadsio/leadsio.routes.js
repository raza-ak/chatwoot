/* eslint arrow-body-style: 0 */
import { frontendURL } from '../../../helper/URLHelper';
const LeadsioIndex = () => import('./pages/Index.vue');

export const routes = [
  {
    path: frontendURL('accounts/:accountId/leadsio'),
    name: 'leadsio_dashboard',
    meta: {
      permissions: ['administrator', 'agent'],
    },
    component: LeadsioIndex,
  },
];
