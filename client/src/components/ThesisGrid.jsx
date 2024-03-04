import React, { useCallback, useMemo, useState, useRef } from 'react';

import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-quartz.css';
import 'ag-grid-enterprise';
import { AgGridReact } from 'ag-grid-react';

import { Box, IconButton, ButtonGroup, Typography} from '@mui/material';
import AddCircleOutlineIcon from '@mui/icons-material/AddCircleOutline';
import ChangeCircleOutlinedIcon from '@mui/icons-material/ChangeCircleOutlined';
import HighlightOffOutlinedIcon from '@mui/icons-material/HighlightOffOutlined';

import AddThesis from './modals/AddThesis';
import UpdateThesisTitle from './modals/UpdateThesisTitle'

import { createThesis, updateThesis } from '../api/thesisApi';

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
  title: '',
  professorId: ''
}

const ThesisGrid = () => {
  const gridRef = useRef();

  const [openAddThesisModal, setOpenAddThesisModal] = useState(false);
  const [openUpdateThesisModal, setOpenUpdateThesisModal] = useState(false);

  const [thesisFormData, setThesisFormData] = useState(initFormData)
  const [thesisTitle, setThesisTitle] = useState(initThesisTitle)

  const [rowData, setRowData] = useState();

  const [title, setTitle] = useState('')

  const onChangeThesis = (e) => {
    const { value, id } = e.target
    setThesisFormData({...thesisFormData, [id]:value})
  }

  const onChangeThesisTitle = (e) => {
    const { value, id } = e.target
    setThesisTitle({...thesisTitle, [id]:value})
  }

  const handleOpenAddThesisModal = () => setOpenAddThesisModal(true);
  const handleCloseAddThesisModal = () => setOpenAddThesisModal(false);

  const handleOpenUpdateThesisModal = () => setOpenUpdateThesisModal(true);
  const handleCloseUpdateThesisModal = () => setOpenUpdateThesisModal(false);

  const [columnDefs] = useState([
    // { field: 'id', hide: true},
    { field: 'id'},
    { field: 'full_name', 
      headerName: 'Руководитель', 
      filter: 'agTextColumnFilter', 
      cellRenderer: 'agGroupCellRenderer', 
      checkboxSelection: true,
    },
  ]);

  const getRowId = useMemo(() => {
    return (params) => {
      return params.data.id;
    };
  }, []);

  const defaultColDef = useMemo(() => {
    return {
      filter: true, 
      floatingFilter: true, 
      sortable: true,
      flex: 1,
    };
  }, []);


  const detailCellRendererParams = useMemo(() => {
    return {
      detailGridOptions: {
        rowSelection: 'singl',
        pagination: true,
        paginationAutoPageSize: true,
        enableCellChangeFlash: true,

        getRowId: (params) => {
          return params.data.id;
        },

        // onSelectionChanged: (params) => {          
        //   const selectedData = params.api.getSelectedRows();

        //   console.log(params.api.getRowNode(selectedData[0]?.id).parent.beans.context.contextParams.gridId);

        //   setThesisTitle({'id': selectedData[0]?.id, 'professorId': params.api.getRowNode(selectedData[0]?.id).parent.beans.context.contextParams.gridId});
        //   setTitle(selectedData[0]?.title);
        //   return params;
        // },
        
        columnDefs: [
          { field: 'id',
            headerName: '№',
            valueFormatter: "x.toLocaleString().split('-')[1] + x.toLocaleString().split('-')[2]",
            checkboxSelection: true,
          },
          { field: 'title', headerName: 'Тема'},
          { field: 'last_name', headerName: 'ФИО', cellRenderer: p => cellRenderer(p),},
        ],
        defaultColDef: {
          flex: 1,
        },
      },
      getDetailRowData: (params) => {
        params.successCallback(params.data.callRecords);
      },
    };
  }, []);


  const cellRenderer = (params) => {
    return [params.data.last_name, params.data.first_name, params.data.patronymic].join(' ')
  }

  const onGridReady = useCallback((params) => {
    fetch('http://localhost:8000/api/thesis')
      .then((resp) => resp.json())
      .then((data) => {
        setRowData(data);
      });
  }, []);

  const onFirstDataRendered = useCallback((params) => {
    setTimeout(() => {
      params.api.getDisplayedRowAtIndex(2).setExpanded(true);
    }, 0);
  }, []);

  const addRow = () => {
    const selectedRows = gridRef.current.api.getSelectedNodes();

    if (selectedRows.length === 0) {
      alert('Выберите руководителя');
      return;
    }
    
    thesisFormData.professorId = selectedRows[0].data.id;

    createThesis(thesisFormData)
      .then(res => {
        let oldData = selectedRows[0].data.callRecords;
        let copyData = oldData.slice(0);

        thesisFormData.id = res.studentId;

        copyData.push(thesisFormData);

        let newData = {
          id: thesisFormData.professorId,
          full_name: selectedRows[0].data.full_name,
          callRecords: copyData,
        }

        let transaction = gridRef.current.api.applyTransaction({update: [newData]})
        console.log(transaction);
      })
      .then(setThesisFormData(initFormData))
      .then(handleCloseAddThesisModal())
      .catch(e => alert(e.response.data.message))
  };

  const updateRow = () => {
    console.log(thesisTitle);

    if (!thesisTitle.id) {
      alert('Выберите дипломную работу');
      return;
    }

    let tr = gridRef.current.api.applyTransaction({
      update: [{
        id: thesisTitle.professorId,
        callRecords: {
          id: thesisTitle.id,
          title: thesisTitle.title
        }
    }]})

    console.log(tr);

    // updateThesis(thesisTitle)
    //   .then(res => {
    //     let oldData = selectedRows[0].data.callRecords;
    //     let copyData = oldData.slice(0);

    //     thesisFormData.id = res.studentId;
    //     thesisFormData.professorId = selectedRows[0].data.id;

    //     copyData.push(thesisFormData);

    //     let newData = {
    //       id: thesisFormData.professorId,
    //       full_name: selectedRows[0].data.full_name,
    //       callRecords: copyData,
    //     }

    //     gridRef.current.api.applyTransaction({update: [newData]})
    //   })
    //   .then(setThesisFormData(initFormData))
    //   .then(handleCloseAddThesisModal())
    //   .catch(e => alert(e.response.data.message))
  }
  
  const onSelectionChanged = useCallback((event) => {
    return event;
  }, [])

  return (
    <Box
      className='ag-theme-quartz'
      height='700px'
      width='90%'
    >
      <Box display='flex' flexDirection='row' justifyContent='space-between' marginBottom={2}>
        <Typography variant='h2'>Дипломники</Typography>
          <ButtonGroup
            color='primary'
            size="large"
            variant="text"
          >        
          <IconButton onClick={handleOpenAddThesisModal}>
            <AddCircleOutlineIcon />
          </IconButton>
          <IconButton onClick={handleOpenUpdateThesisModal}>
            <ChangeCircleOutlinedIcon />
          </IconButton>
          <IconButton>
            <HighlightOffOutlinedIcon />
          </IconButton>
        </ButtonGroup>
      </Box>
      <AgGridReact
        ref={gridRef}
        rowData={rowData}
        getRowId={getRowId}
        // groupSelectsChildren={true}
        // onSelectionChanged={onSelectionChanged}
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
  );
};

export default ThesisGrid;