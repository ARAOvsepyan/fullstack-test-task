import React from 'react'

import Auth from './scenes/auth'
import Dashboard from './scenes/dashboard'
import Tables from './scenes/tables'

export const authRoutes = [
  {
    path: '/',
    Element: <Dashboard/>
  },
  {
    path: '/auth',
    element: <Auth />
  },
  {
    path: '/tables',
    element: <Tables />
  }
]
