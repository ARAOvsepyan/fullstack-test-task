import { observer } from 'mobx-react-lite'

import Header from '../../components/Header'
import { Box, useTheme } from '@mui/material'
import { tokens } from '../../theme'

import 'ag-grid-community/styles/ag-grid.css'
import 'ag-grid-community/styles/ag-theme-quartz.css'
import 'ag-grid-enterprise'

import ProfessorsGrid from '../../components/ProfessorsGrid'
import ThesisGrid from '../../components/ThesisGrid'

const Dashboard = observer(() => {
  const theme = useTheme()
  const colors = tokens(theme.palette.mode)
  const fonts = theme.typography

  return (
    <Box m='20px'>
      <Box display='flex' justifyContent='space-between' alignItems='center'>
        <Header title='DASHBOARD' />
      </Box>
      <Box
        display='flex'
        justifyContent='space-around'
        gap='50px'

        sx={{
          '& .ag-theme-quartz': {
            '--ag-foreground-color': 'rgb(126, 46, )',
            '--ag-background-color': `${colors.primary[400]}`,
            '--ag-header-background-color': `${colors.blueAccent[500]}`,
            '--ag-odd-row-background-color': 'rgb(0, 0, 0, 0.09)',
            '--ag-header-column-resize-handle-color': `${colors.grey[100]}`,
            '--ag-menu-background-color': `${colors.primary[400]}`,

            '--ag-font-size': `${fonts.body1.fontSize}`,
            '--ag-font-family': `${fonts.body1.fontFamily}`
          },
          '& .ag-theme-quartz .ag-header': {
            'font-family': `${fonts.h1.fontFamily}`
          },
          '& .ag-theme-quartz .ag-tabs .ag-menu': {
            'border-color': `${colors.blueAccent[500]}`
          }
        }}
      >
        <ProfessorsGrid />
        <ThesisGrid />
      </Box>
    </Box>

  )
})

export default Dashboard
