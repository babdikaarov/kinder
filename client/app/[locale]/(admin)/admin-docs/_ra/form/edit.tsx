import Link from 'next/link'
import { redirect, RedirectType } from 'next/navigation'
import { useState } from 'react'
import {
  Edit,
  SimpleForm,
  TextInput,
  DateInput,
  ReferenceManyField,
  Datagrid,
  TextField,
  DateField,
  EditButton,
  required,
  ArrayInput,
  SimpleFormIterator,
  DeleteButton,
  FunctionField,
  UrlField,
  TopToolbar,
  PrevNextButtons,
  ListButton,
  Toolbar,
  DeleteWithConfirmButton,
  UpdateButton,
  ExportButton,
  useRecordContext,
  Labeled,
  Button,
  useNotify,
  useRefresh,
  Confirm,
} from 'react-admin'
import { Box, useMediaQuery, Theme } from '@mui/material'
import { Ban, DeleteIcon, Divide, Pin } from 'lucide-react'

export const FormEdit = () => {
  const [open, setOpen] = useState(false)
  const isMobile = useMediaQuery<Theme>((theme) => theme.breakpoints.down('sm'))
  const notify = useNotify()
  const refresh = useRefresh()
  const handleConfirm = async (id: any) => {
    try {
      const response = await fetch(
        `${process.env.BACKEND_URL}/api/docs/${id}`,
        {
          method: 'DELETE',
          headers: {
            Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
          },
        }
      )

      if (!response.ok) {
        throw new Error(
          'Failed to delete document please refresh the page and try again'
        )
      }
      refresh()
      setOpen(false)
    } catch (error: any) {
      console.error('Error fetching data:', error.message)
      notify(error.message)
    }
  }

  return (
    <Edit
      title={<Title />}
      mutationMode='pessimistic'
      actions={
        <TopToolbar>
          <PrevNextButtons />
          <ListButton resource='form' />
        </TopToolbar>
      }
    >
      <SimpleForm toolbar={<MyToolbar />}>
        <p className='text-fs-base'>Identity</p>

        <Box display={{ xs: 'block', sm: 'flex', width: '100%' }}>
          <Box flex={1} mr={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <TextField
                  source='status'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
          <Box flex={1} ml={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <TextField
                  source='inn'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
        </Box>
        <Box display={{ xs: 'block', sm: 'flex', width: '100%' }}>
          <Box flex={1} mr={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <TextField
                  source='firstName'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
          <Box flex={1} ml={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <TextField
                  source='lastName'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
        </Box>
        <Box display={{ xs: 'block', sm: 'flex', width: '100%' }}>
          <Box flex={1} mr={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <TextField
                  source='phoneNumber'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
          <Box flex={1} ml={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <TextField
                  source='email'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
        </Box>
        <Box display={{ xs: 'block', sm: 'flex', width: '100%' }}>
          <Box flex={1} mr={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <FunctionField
                  source='createdAt'
                  render={(record) => `${record.createdAt.split('T')[0]}`}
                />
              </Labeled>
            </div>
          </Box>
          <Box flex={1} ml={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <TextField
                  source='formSchema'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
        </Box>

        <div className='mt-4 flex w-full justify-between'>
          <p className='mb-1 text-fs-base'>Documents</p>
          <FunctionField
            render={(render) => (
              <Button
                className='text-blue-400 active:text-red-300'
                onClick={async () => {
                  const response = await fetch(
                    `${process.env.BACKEND_URL}/api/docs/downloadAll/${render.id}`,
                    {
                      headers: {
                        'Content-Type': 'application/zip',
                        Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
                      },
                    }
                  )
                  const arrayBuffer = await response.arrayBuffer()
                  const blob = new Blob([arrayBuffer], {
                    type: 'application/zip',
                  })
                  const url = URL.createObjectURL(blob)
                  window.open(url, '_blank')
                  window.URL.revokeObjectURL(url)
                }}
              >
                <span className='mt-[3px] text-fs-base'>Download all docs</span>
              </Button>
            )}
          />
        </div>
        <ArrayInput source='docs' label=''>
          <SimpleFormIterator
            disableAdd
            disableRemove
            disableClear
            disableReordering
            getItemLabel={(index) => `#${index + 1}`}
            // removeButton={<Button>Remove</Button>}
          >
            <FunctionField
              render={(render) => (
                <div className='flex justify-between'>
                  <Button
                    className='text-blue-400 active:text-red-300'
                    onClick={async () => {
                      const response = await fetch(
                        `${process.env.BACKEND_URL}${render.url}`,
                        {
                          headers: {
                            Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
                          },
                        }
                      )
                      const blob = await response.blob()
                      const url = URL.createObjectURL(blob)
                      window.open(url, '_blank')
                    }}
                  >
                    <span className='mt-[3px] text-fs-base'>
                      {render.documentTypes}
                      {isMobile ? '' : ` - ${render.name}`}
                    </span>
                  </Button>
                  <Button
                    className='text-blue-400 active:text-red-300'
                    onClick={() => setOpen(true)}
                  >
                    <>
                      <DeleteIcon className='stroke-red-300' />
                      <Confirm
                        isOpen={open}
                        // loading={isPending}
                        title={`Delete document #${render && render.name}`}
                        content='Are you sure you want to delete this item?'
                        onConfirm={() => handleConfirm(render.id)}
                        onClose={() => setOpen(false)}
                      />
                    </>
                  </Button>
                </div>
              )}
            />
          </SimpleFormIterator>
        </ArrayInput>
      </SimpleForm>
    </Edit>
  )
}

const MyToolbar = () => {
  const record = useRecordContext()
  // console.log({record!.status === 'DELETED'} );

  return (
    <Toolbar>
      <UpdateButton
        label='ACCEPTED'
        data={{ status: 'ACCEPTED', isAdmin: true }}
        icon={<Pin size={18} />}
        disabled={record!.status === 'ACCEPTED'}
      />
      <UpdateButton
        label='DECLINED'
        data={{ status: 'DECLINED', isAdmin: true }}
        icon={<Ban size={18} />}
        disabled={record!.status === 'DECLINED'}
      />
      <DeleteWithConfirmButton disabled={record!.status !== 'DELETED'} />
    </Toolbar>
  )
}

const Title = () => {
  const record = useRecordContext()
  return (
    <span>
      Documents of{' '}
      {record
        ? `"${record.firstName} ${record.lastName}"`
        : '"record not found"'}
    </span>
  )
}
