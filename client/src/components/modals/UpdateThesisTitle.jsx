import { Dialog, DialogContentText, useTheme, DialogActions, TextField, Button, DialogContent, Typography } from '@mui/material'
import { tokens } from '../../theme'

const UpdateThesisTitle = ({ open, handleClose, data, onChange, updateRow, current }) => {
  const { title } = data

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
          <Typography variant='p' color='white' fontWeight='bold'>Изменить тему дипломной работы</Typography>
        </DialogContentText>
        <TextField
          autoFocus
          margin='normal'
          id='title'
          value={title}
          onChange={e => onChange(e)}
          label={current}
          type='text'
          fullWidth
        />
        <DialogActions>
          <Button type='submit' onClick={() => updateRow()}>
            <Typography variant='h5' color='white' fontWeight='bold'>
              ИЗМЕНИТЬ
            </Typography>
          </Button>
        </DialogActions>
      </DialogContent>
    </Dialog>
  )
}

export default UpdateThesisTitle
