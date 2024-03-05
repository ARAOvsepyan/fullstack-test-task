import React from 'react'
import Topbar from './scenes/global/TopBar'
import SideBar from './scenes/global/SideBar'
import AppRouter from './components/AppRouter'

import { CssBaseline, ThemeProvider } from '@mui/material'
import { ColorModeContext, useMode } from './theme'

const App = () => {
  const [theme, colorMode] = useMode()

  return (
    <ColorModeContext.Provider value={colorMode}>
      <ThemeProvider theme={theme}>
        <CssBaseline />
        <div className='app'>
            <SideBar />
          <main className='content'>
            <Topbar />
            <AppRouter />
          </main>
        </div>
      </ThemeProvider>
    </ColorModeContext.Provider>
  )
}

export default App
