import { useEffect, useState } from 'react'
import {
  Edit,
  SimpleForm,
  TextField,
  ArrayInput,
  SimpleFormIterator,
  FunctionField,
  TopToolbar,
  PrevNextButtons,
  ListButton,
  Toolbar,
  DeleteWithConfirmButton,
  UpdateButton,
  useRecordContext,
  Labeled,
  Button,
  useNotify,
  useRefresh,
  Confirm,
  useTranslate,
  Loading,
} from 'react-admin'
import { Box, useMediaQuery, Theme, Dialog, Stack } from '@mui/material'
import {
  Ban,
  DeleteIcon,
  FolderDown,
  LoaderCircle,
  Pin,
  TimerReset,
  Trash2,
} from 'lucide-react'

export const FormEdit = () => {
  const [openSpinner, setOpenSpinner] = useState(false)
  const [open, setOpen] = useState(false)
  const isMobile = useMediaQuery<Theme>((theme) => theme.breakpoints.down('sm'))
  const notify = useNotify()
  const t = useTranslate()
  const refresh = useRefresh()

  const handleConfirm = async (id: any) => {
    try {
      const response = await fetch(
        `${process.env.BACKEND_URL_PUBLIC}/api/docs/${id}`,
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

  const Title = () => {
    const record = useRecordContext()
    return (
      <span>
        {t('myRoot.TitleEdit', {
          name: record
            ? `"${record.firstName} ${record.lastName}"`
            : '"record not found"',
        })}
      </span>
    )
  }

  return (
    <Edit
      title={<Title />}
      mutationMode='pessimistic'
      actions={
        <TopToolbar>
          <ListButton resource='form' />
          <PrevNextButtons />
        </TopToolbar>
      }
    >
      <SimpleForm toolbar={<MyToolbar />}>
        <p className='text-fs-base'>{t('myRoot.field.identity')}</p>

        <Box display={{ xs: 'block', sm: 'flex', width: '100%' }}>
          <Box flex={1} mr={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled label={t('myRoot.field.inn')}>
                <TextField
                  source='inn'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
          <Box flex={1} ml={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled label={t('myRoot.field.firstName')}>
                <TextField
                  source='firstName'
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
                  source='email'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
          <Box flex={1} ml={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled label={t('myRoot.field.lastName')}>
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
              <Labeled label={t('myRoot.field.phoneNumber')}>
                <TextField
                  source='phoneNumber'
                  sx={{ backgroundColor: 'transparent' }}
                />
              </Labeled>
            </div>
          </Box>
          <Box flex={1} ml={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled label={t('myRoot.field.createdAt')}>
                <FunctionField
                  source='createdAt'
                  render={(record) => `${record.createdAt.split('T')[0]}`}
                />
              </Labeled>
            </div>
          </Box>
        </Box>
        <Box display={{ xs: 'block', sm: 'flex', width: '100%' }}>
          <Box flex={1} mr={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled label={t('myRoot.field.formSchema')}>
                <FunctionField
                  label={t('myRoot.field.formSchema')}
                  source='formSchema'
                  render={(record) => {
                    const formSchema: {
                      [key: string]: string
                    } = {
                      BOTH_PARENTS: t('myRoot.formSchema.BOTH_PARENTS'),
                      WIDOW: t('myRoot.formSchema.WIDOW'),
                      DIVORCED: t('myRoot.formSchema.DIVORCED'),
                      GUARDIAN: t('myRoot.formSchema.GUARDIAN'),
                    }
                    return formSchema[record.formSchema]
                  }}
                />
              </Labeled>
            </div>
          </Box>
          <Box flex={1} ml={{ xs: 0, sm: '0.5em' }}>
            <div className=' mb-1 border-b-[1px] border-black p-1'>
              <Labeled>
                <FunctionField
                  label={t('myRoot.field.status')}
                  source='status'
                  render={(record) => {
                    const status: {
                      [key: string]: string
                    } = {
                      PENDING: t('myRoot.status.pending'),
                      ACCEPTED: t('myRoot.status.accepted'),
                      DECLINED: t('myRoot.status.declined'),
                      DELETED: t('myRoot.status.deleted'),
                    }
                    return status[record.status]
                  }}
                />
              </Labeled>
            </div>
          </Box>
        </Box>

        <div className='mt-4 '>
          <p className='mb-1 text-fs-base'>{t('myRoot.field.listDocs')}</p>
          <Dialog
            open={openSpinner}
            sx={{
              '& .MuiDialog-paper': {
                backgroundImage: 'none',
                backgroundColor: 'transparent',
                boxShadow: 'none',
              },
            }}
          >
            <Loading
              className='*:bg-transparent *:text-fs-3 *:text-white'
              sx={{
                background: 'transparent',
                color: 'white',
                '& h5': {
                  color: 'white',
                },
              }}
            />
          </Dialog>
        </div>
        <FunctionField
          className='w-full'
          render={(field) => (
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
                  className='w-full'
                  render={(render) => (
                    <div className='flex justify-between'>
                      <Button
                        variant='text'
                        className='text-blue-400 active:text-red-300'
                        onClick={async () => {
                          setOpenSpinner(true)
                          try {
                            const response = await fetch(
                              `${process.env.BACKEND_URL_PUBLIC}${render.url}`,
                              {
                                headers: {
                                  Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
                                },
                              }
                            )

                            if (!response.ok) {
                              throw new Error('Failed to open document')
                            }

                            const blob = await response.blob()
                            const fileName = `${field!.firstName}_${field!.lastName}_${render.name}`

                            const downloadLink = document.createElement('a')
                            downloadLink.href = URL.createObjectURL(blob)
                            downloadLink.download = fileName
                            downloadLink.style.display = 'none'
                            downloadLink.target = '_blank'
                            document.body.appendChild(downloadLink)
                            downloadLink.click()

                            setTimeout(
                              () => URL.revokeObjectURL(downloadLink.href),
                              1000
                            )

                            setOpenSpinner(false)
                          } catch (error) {
                            setOpenSpinner(false)
                            notify(`Can't open document: ${error}`)
                          }
                          // try {
                          //   const response = await fetch(
                          //     `${process.env.BACKEND_URL_PUBLIC}${render.url}`,
                          //     {
                          //       headers: {
                          //         Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
                          //       },
                          //     }
                          //   )
                          //   if (!response.ok) {
                          //     throw new Error('Failed to open document')
                          //   }
                          //   const blob = await response.blob()
                          //   const url = URL.createObjectURL(blob)
                          //   window.open(url, '_blank')
                          //   if (url) {
                          //     setOpenSpinner(false)
                          //   }
                          // } catch (error) {
                          //   setOpenSpinner(false)
                          //   notify(`cant open document ${error}}`)
                          // }
                        }}
                      >
                        <span className='mt-[3px] text-fs-base'>
                          {render.documentTypes}
                          {isMobile ? '' : ` - ${render.name}`}
                        </span>
                      </Button>

                      <Button
                        className='text-red-500'
                        onClick={() => setOpen(true)}
                        label={t('ra.action.delete')}
                      >
                        <>
                          <DeleteIcon className='stroke-red-300' />
                          <Confirm
                            isOpen={open}
                            title={t('myRoot.document.delete_title', {
                              name: `${render.name}`,
                            })}
                            content={t('myRoot.document.delete_content')}
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
          )}
        />
      </SimpleForm>
    </Edit>
  )
}

const MyToolbar: (notify: any) => JSX.Element = () => {
  const [openSpinner, setOpenSpinner] = useState(false)
  const notify = useNotify()
  const record = useRecordContext()
  const t = useTranslate()
  // console.log({record!.status === 'DELETED'} );
  // const isMobile = useMediaQuery<Theme>((theme) => theme.breakpoints.down('sm'))
  return (
    <Toolbar>
      <Labeled label='Status' fullWidth>
        <Stack
          spacing={3}
          direction={'row'}
          useFlexGap
          sx={{ justifyContent: 'space-between' }}
        >
          <span className='flex gap-2'>
            <Button
              type='button'
              label='myRoot.status.pending'
              disabled
              className={
                record!.status === 'PENDING'
                  ? 'outline-double outline-4 outline-offset-1 outline-[#1976d2]'
                  : ''
              }
            >
              <TimerReset size={18} />
            </Button>
            <UpdateButton
              label='myRoot.action.accept'
              data={{ status: 'ACCEPTED', admin: 'true' }}
              icon={<Pin size={18} />}
              disabled={record!.status === 'ACCEPTED'}
              className={
                record!.status === 'ACCEPTED'
                  ? 'outline outline-2 outline-[#1976d2]'
                  : ''
              }
            />
            <UpdateButton
              label='myRoot.action.decline'
              data={{ status: 'DECLINED', admin: 'true' }}
              icon={<Ban size={18} />}
              disabled={record!.status === 'DECLINED'}
              className={
                record!.status === 'DECLINED'
                  ? 'outline-double outline-4 outline-offset-1 outline-[#1976d2]'
                  : ''
              }
            />
            <UpdateButton
              label={'myRoot.action.to_delete'}
              data={{ status: 'DELETED', admin: 'true' }}
              icon={<Trash2 size={18} />}
              disabled={record!.status === 'DELETED'}
              className={
                record!.status === 'DELETED'
                  ? 'outline-double outline-4 outline-offset-1 outline-[#1976d2]'
                  : ''
              }
            />
            {/* <DeleteWithConfirmButton
              confirmContent={t('myRoot.delete_content')}
              confirmTitle={t('myRoot.delete_title', { inn: record!.inn })}
              disabled={record!.status !== 'DELETED'}
            /> */}
          </span>
          <Button
            type='button'
            className=' text-blue-400 active:text-red-300'
            onClick={async () => {
              try {
                setOpenSpinner(true)
                const response = await fetch(
                  `${process.env.BACKEND_URL_PUBLIC}/api/docs/downloadAll/${record!.id}`,
                  {
                    headers: {
                      'Content-Type': 'application/zip',
                      Authorization: `Bearer ${JSON.parse(localStorage.getItem('auth')!).token}`,
                    },
                  }
                )
                if (!response.ok) {
                  throw new Error('Failed to open document')
                }
                const arrayBuffer = await response.arrayBuffer()
                const blob = new Blob([arrayBuffer], {
                  type: 'application/zip',
                })
                const url = URL.createObjectURL(blob)
                const fileName = `${record!.firstName}_${record!.lastName}_all_documents`
                const downloadLink = document.createElement('a')
                downloadLink.href = URL.createObjectURL(blob)
                downloadLink.download = fileName
                downloadLink.style.display = 'none'
                downloadLink.target = '_blank'
                document.body.appendChild(downloadLink)
                downloadLink.click()

                if (url) {
                  setOpenSpinner(false)
                } else {
                  setOpenSpinner(false)
                  notify(`cant open document `)
                }
                setTimeout(() => URL.revokeObjectURL(downloadLink.href), 1000)
              } catch (error) {
                setOpenSpinner(false)
                notify(`cant open document ${error}}`)
              }
            }}
            label={t('myRoot.field.downloadAll')}
            variant='text'
          >
            <FolderDown />
          </Button>
        </Stack>
      </Labeled>
      <Dialog
        open={openSpinner}
        sx={{
          '& .MuiDialog-paper': {
            backgroundColor: 'transparent',
            boxShadow: 'none',
          },
        }}
      >
        <LoaderCircle className='size-28 animate-spin bg-transparent stroke-white' />
      </Dialog>
    </Toolbar>
  )
}
