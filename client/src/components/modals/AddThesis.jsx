import { Dialog, DialogContentText, useTheme, DialogActions, TextField, Button, DialogContent, Typography } from '@mui/material'
import { tokens } from '../../theme'

const AddThesis = ({ open, handleClose, data, onChange, addRow }) => {
  const { title, lastName, firstName, patronymic } = data

  const theme = useTheme()
  const colors = tokens(theme.palette.mode)

  return (
    <Dialog
      open={open}
      onClose={handleClose}
    >
      <DialogContent
        sx={{
          backgroundColor: colors.blueAccent[500]
        }}
      >
        <DialogContentText>
          <Typography variant='p' color='white' fontWeight='bold'>Добавить нового студента</Typography>
        </DialogContentText>
        <TextField
          autoFocus
          required
          margin='normal'
          id='lastName'
          value={lastName}
          onChange={e => onChange(e)}
          label='Фамилия'
          type='text'
          fullWidth
        />
        <TextField
          required
          margin='normal'
          id='firstName'
          value={firstName}
          onChange={e => onChange(e)}
          label='Имя'
          type='text'
          fullWidth
        />
        <TextField
          required
          margin='normal'
          id='patronymic'
          value={patronymic}
          onChange={e => onChange(e)}
          label='Отчество'
          type='text'
          fullWidth
        />
        <TextField
          required
          margin='normal'
          id='title'
          value={title}
          onChange={e => onChange(e)}
          label='Название научной работы'
          type='text'
          fullWidth
        />
        <DialogActions>
          <Button type='submit' onClick={() => addRow()}>
            <Typography variant='h5' color='white' fontWeight='bold'>
              ДОБАВИТЬ
            </Typography>
          </Button>
        </DialogActions>
      </DialogContent>
    </Dialog>
  )
}

export default AddThesis
