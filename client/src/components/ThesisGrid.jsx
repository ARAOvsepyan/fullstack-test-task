import { useCallback, useMemo, useState, useRef } from 'react'

import 'ag-grid-community/styles/ag-grid.css'
import 'ag-grid-community/styles/ag-theme-quartz.css'
import 'ag-grid-enterprise'
import { AgGridReact } from 'ag-grid-react'

import { Box, IconButton, ButtonGroup, Typography } from '@mui/material'
import AddCircleOutlineIcon from '@mui/icons-material/AddCircleOutline'
import ChangeCircleOutlinedIcon from '@mui/icons-material/ChangeCircleOutlined'
import HighlightOffOutlinedIcon from '@mui/icons-material/HighlightOffOutlined'

import AddThesis from './modals/AddThesis'
import UpdateThesisTitle from './modals/UpdateThesisTitle'

import { createThesis, updateThesis, deleteThesis } from '../api/thesisApi'

const initFormData = {
  id: '',
  title: '',
  last_name: '',
  first_name: '',
  patronymic: '',
  professorId: ''
}

const initThesisTitle = {
  id: '',
  full_name: '',
  thesisId: '',
  title: '',
  callRecords: []
}

const ThesisGrid = () => {
  const gridRef = useRef()

  const [openAddThesisModal, setOpenAddThesisModal] = useState(false)
  const [openUpdateThesisModal, setOpenUpdateThesisModal] = useState(false)

  const [thesisFormData, setThesisFormData] = useState(initFormData)
  const [thesisTitle, setThesisTitle] = useState(initThesisTitle)

  const [rowData, setRowData] = useState()

  const [title, setTitle] = useState('')

  const onChangeThesis = (e) => {
    const { value, id } = e.target
    setThesisFormData({ ...thesisFormData, [id]: value })
  }

  const onChangeThesisTitle = (e) => {
    const { value, id } = e.target
    setThesisTitle({ ...thesisTitle, [id]: value })
  }

  const handleOpenAddThesisModal = () => setOpenAddThesisModal(true)
  const handleCloseAddThesisModal = () => setOpenAddThesisModal(false)

  const handleOpenUpdateThesisModal = () => setOpenUpdateThesisModal(true)
  const handleCloseUpdateThesisModal = () => setOpenUpdateThesisModal(false)

  const [columnDefs] = useState([
    { field: 'id', hide: true },
    {
      field: 'full_name',
      headerName: 'Руководитель',
      filter: 'agTextColumnFilter',
      cellRenderer: 'agGroupCellRenderer',
      checkboxSelection: true
    }
  ])

  const getRowId = useMemo(() => {
    return (params) => {
      return params.data.id
    }
  }, [])

  const defaultColDef = useMemo(() => {
    return {
      filter: true,
      floatingFilter: true,
      sortable: true,
      flex: 1
    }
  }, [])

  const detailCellRendererParams = useMemo(() => {
    return (params) => {
      const res = {}
      res.detailGridOptions = {
        rowSelection: 'singl',
        pagination: true,
        paginationAutoPageSize: true,
        enableCellChangeFlash: true,

        refreshStrategy: 'rows',

        getRowId: (params) => {
          return params.data.id
        },

        onSelectionChanged: (params) => {
          const selectedData = params.api.getSelectedRows()

          setThesisTitle({
            ...params.context.masterGrid.data,
            thesisId: selectedData[0]?.id
          })

          setTitle(selectedData[0]?.title)
          return params
        },

        context: {
          masterGrid: {
            node: params.node.parent,
            data: params.data
          }
        },

        columnDefs: [
          {
            field: 'id',
            headerName: '№',
            valueFormatter: "x.toLocaleString().split('-')[1] + x.toLocaleString().split('-')[2]",
            checkboxSelection: true
          },
          { field: 'title', headerName: 'Тема', enableCellChangeFlash: true },
          {
            field: 'last_name',
            headerName: 'ФИО',
            cellRenderer: (p) => cellRenderer(p)
          }
        ],

        defaultColDef: {
          flex: 1
        }
      }

      res.getDetailRowData = (params) => {
        params.successCallback(params.data.callRecords)
      }

      return res
    }
  }, [])

  const cellRenderer = (params) => {
    return [params.data.last_name, params.data.first_name, params.data.patronymic].join(' ')
  }

  const onGridReady = useCallback((params) => {
    fetch('http://localhost:8000/api/thesis')
      .then((resp) => resp.json())
      .then((data) => {
        setRowData(data)
      })
  }, [])

  const onFirstDataRendered = useCallback((params) => {
    setTimeout(() => {
      params.api.getDisplayedRowAtIndex(2).setExpanded(true)
    }, 0)
  }, [])

  const addRow = () => {
    const selectedRows = gridRef.current.api.getSelectedNodes()

    if (selectedRows.length === 0) {
      alert('Выберите руководителя')
      return
    }

    thesisFormData.professorId = selectedRows[0].data.id

    createThesis(thesisFormData)
      .then((res) => {
        const oldData = selectedRows[0].data.callRecords
        const copyData = oldData.slice(0)

        thesisFormData.id = res.studentId

        copyData.push(thesisFormData)

        const newData = {
          id: thesisFormData.professorId,
          full_name: selectedRows[0].data.full_name,
          callRecords: copyData
        }

        gridRef.current.api.applyTransaction({
          update: [newData]
        })
      })
      .then(setThesisFormData(initFormData))
      .then(handleCloseAddThesisModal())
      .catch((e) => alert(e.response.data.message))
  }

  const updateRow = () => {
    if (!thesisTitle.thesisId) {
      alert('Выберите дипломную работу')
      return
    }

    thesisTitle.callRecords.forEach((val) => {
      if (val.id === thesisTitle.thesisId) val.title = thesisTitle.title
    })

    updateThesis({ id: thesisTitle.thesisId, title: thesisTitle.title })
      .then((res) => {
        const updatedData = {
          id: thesisTitle.id,
          full_name: thesisTitle.full_name,
          callRecords: thesisTitle.callRecords
        }

        gridRef.current.api.applyTransaction({ update: [updatedData] })
        gridRef.current.api.redrawRows()
      })
      .then(setThesisTitle(initThesisTitle))
      .then(handleCloseUpdateThesisModal())
      .catch((e) => alert(e.response.data.message))
  }

  const deleteRow = () => {
    const newData = thesisTitle.callRecords.filter((obj) => {
      return obj.id !== thesisTitle.thesisId
    })

    deleteThesis(thesisTitle.thesisId)
      .then((res) => {
        const updatedData = {
          id: thesisTitle.id,
          full_name: thesisTitle.full_name,
          callRecords: newData
        }

        gridRef.current.api.applyTransaction({ update: [updatedData] })
        gridRef.current.api.redrawRows()
      })
      .then(setThesisTitle(initThesisTitle))
      .catch((e) => alert(e.response.data.message))
  }

  return (
    <Box className="ag-theme-quartz" height="550px" width="90%">
      <Box display="flex" flexDirection="row" justifyContent="space-between" marginBottom={2}>
        <Typography variant="h2">Дипломники</Typography>
        <ButtonGroup color="primary" size="large" variant="text">
          <IconButton onClick={handleOpenAddThesisModal}>
            <AddCircleOutlineIcon />
          </IconButton>
          <IconButton onClick={handleOpenUpdateThesisModal}>
            <ChangeCircleOutlinedIcon />
          </IconButton>
          <IconButton onClick={deleteRow}>
            <HighlightOffOutlinedIcon />
          </IconButton>
        </ButtonGroup>
      </Box>
      <AgGridReact
        ref={gridRef}
        rowData={rowData}
        getRowId={getRowId}
        enableCellChangeFlash={true}
        suppressModelUpdateAfterUpdateTransaction={true}
        suppressRowClickSelection={true}
        columnDefs={columnDefs}
        defaultColDef={defaultColDef}
        masterDetail={true}
        detailCellRendererParams={detailCellRendererParams}
        onGridReady={onGridReady}
        onFirstDataRendered={onFirstDataRendered}
      />
      <AddThesis
        open={openAddThesisModal}
        handleClose={handleCloseAddThesisModal}
        data={thesisFormData}
        onChange={onChangeThesis}
        addRow={addRow}
      />
      <UpdateThesisTitle
        open={openUpdateThesisModal}
        handleClose={handleCloseUpdateThesisModal}
        data={thesisTitle}
        onChange={onChangeThesisTitle}
        updateRow={updateRow}
        current={title}
      />
    </Box>
  )
}

export default ThesisGrid
