import { useState, useMemo } from 'react'
import { Box, Typography } from '@mui/material'

import { AgGridReact } from 'ag-grid-react'
import 'ag-grid-community/styles/ag-grid.css'
import 'ag-grid-community/styles/ag-theme-quartz.css'
import 'ag-grid-enterprise'

const ProfessorsGrid = () => {
  const [professorColData] = useState([
    { field: 'last_name', headerName: 'Имя', filter: 'agTextColumnFilter', minWidth: 140 },
    { field: 'first_name', headerName: 'Фамилия', filter: 'agTextColumnFilter' },
    { field: 'patronymic', headerName: 'Отчество', filter: 'agTextColumnFilter' },
    { field: 'email', headerName: 'Почта', filter: 'agTextColumnFilter', minWidth: 230 },
    { field: 'phone', headerName: 'Телефон', filter: 'agNumberColumnFilter' }
  ])

  const datasource = {
    getRows (params) {
      const { startRow, endRow, filterModel, sortModel } = params
      let url = 'http://localhost:8000/api/professors?'
      if (sortModel.length) {
        const { colId, sort } = sortModel[0]
        url += `sort=${colId}&validate=${sort}&`
      }
      const filterKeys = Object.keys(filterModel)
      filterKeys.forEach((filter) => {
        url += `${filter}=${filterModel[filter].filter}&`
      })
      url += `page=${startRow}&per_page=${endRow}`
      fetch(url)
        .then((httpResponse) => httpResponse.json())
        .then((response) => {
          params.successCallback(response.rows, response.count)
        })
        .catch((error) => {
          console.error(error)
          params.failCallback()
        })
    }
  }

  const onGridReady = (params) => {
    params.api.setDatasource(datasource)
  }

  const components = {
    loading: (params) => {
      if (params.value !== undefined) {
        return params.value
      } else {
        return "<img src='https://www.ag-grid.com/example-assets/loading.gif'/>"
      }
    }
  }

  const autoSizeStrategy = useMemo(() => {
    return {
      type: 'fitCellContents'
    }
  }, [])

  return (
    <Box className="ag-theme-quartz" height="550px" width="100%">
      <Typography variant="h2" marginBottom={2.3}>
        Профессора
      </Typography>
      <AgGridReact
        columnDefs={professorColData}
        onGridReady={onGridReady}
        rowModelType={'infinite'}
        components={components}
        defaultColDef={{ filter: true, floatingFilter: true, sortable: true }}
        autoSizeStrategy={autoSizeStrategy}
      />
    </Box>
  )
}

export default ProfessorsGrid
