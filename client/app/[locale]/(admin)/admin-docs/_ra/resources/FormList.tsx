import { Ban, Pin, TimerReset, Trash2 } from 'lucide-react'
import {
  List,
  Datagrid,
  TextField,
  FunctionField,
  FilterLiveSearch,
  TopToolbar,
  FilterList,
  FilterListItem,
  BulkDeleteButton,
  BulkExportButton,
  SimpleList,
  useListController,
  useTranslate,
  Pagination,
} from 'react-admin'
import { useMediaQuery, Theme } from '@mui/material'

export const FormList = () => {
  const t = useTranslate()
  const isMobile = useMediaQuery<Theme>((theme) => theme.breakpoints.down('md'))
  const { filterValues } = useListController()

  return (
    <List
      pagination={<Pagination rowsPerPageOptions={[10, 25, 50, 100]} />}
      actions={<FilterSidebar />}
      filterDefaultValues={{ status: 'PENDING' }}
      title={t('myRoot.TitleList')}
    >
      {isMobile ? (
        <SimpleList
          primaryText={(record) => `${record.firstName} ${record.lastName}`}
          secondaryText={(record) => <span>{`${record.inn}`}</span>}
          tertiaryText={(record) => (
            <div>
              <p>{record.createdAt.split('T')[0]}</p>
              <p>{record.status}</p>
            </div>
          )}
          linkType='edit'
          rowSx={(record) => ({
            borderBottom: '1px black solid',
          })}
        ></SimpleList>
      ) : (
        <Datagrid
          rowClick='edit'
          bulkActionButtons={
            <>
              <BulkDeleteButton
                confirmTitle='myRoot.bulk_delete_title'
                confirmContent='myRoot.bulk_delete_content'
                mutationMode='pessimistic'
                disabled={filterValues.status !== 'DELETED'}
              />
              <BulkExportButton />
            </>
          }
        >
          <TextField source='id' />
          <TextField source='inn' label={t('myRoot.field.inn')} />
          <TextField source='firstName' label={t('myRoot.field.firstName')} />
          <TextField source='lastName' label={t('myRoot.field.lastName')} />
          <TextField
            source='phoneNumber'
            label={t('myRoot.field.phoneNumber')}
          />
          <FunctionField
            label={t('myRoot.field.createdAt')}
            source='createdAt'
            render={(record) => `${record.createdAt.split('T')[0]}`}
          />
          {/* <TextField source='formSchema' label={t('myRoot.field.formSchema')} /> */}
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
        </Datagrid>
      )}
    </List>
  )
}

const FilterSidebar = () => {
  const isMobile = useMediaQuery<Theme>((theme) => theme.breakpoints.down('sm'))
  const isTablet = useMediaQuery<Theme>((theme) => theme.breakpoints.down('md'))
  const t = useTranslate()
  return (
    <TopToolbar
      sx={{
        flexDirection: isTablet ? 'column' : 'row',
        alignSelf: 'flex-start',
        justifyContent: 'center',
        alignItems: 'normal',
        width: '100%',
        marginInline: '20px',
        '& form': {
          width: '100%',
        },
      }}
    >
      <FilterLiveSearch source='q' fullWidth />
      <FilterList
        label=''
        icon={<span />}
        className='flex '
        sx={{
          width: 'fit-content',
          '& .MuiList-root': {
            display: 'flex',
            '& .MuiListItemButton-root': {
              paddingLeft: isMobile ? '0.5em' : '2em',
            },
          },
        }}
      >
        <FilterListItem
          label={isMobile ? '' : t('myRoot.status.pending')}
          icon={<TimerReset size={24} />}
          value={{ status: 'PENDING' }}
        />
        <FilterListItem
          label={isMobile ? '' : t('myRoot.status.accepted')}
          icon={<Pin size={24} />}
          value={{ status: 'ACCEPTED' }}
        />
        <FilterListItem
          label={isMobile ? '' : t('myRoot.status.declined')}
          icon={<Ban size={24} />}
          value={{ status: 'DECLINED' }}
        />
        <FilterListItem
          label={isMobile ? '' : t('myRoot.status.deleted')}
          icon={<Trash2 size={24} />}
          value={{ status: 'DELETED' }}
        />
      </FilterList>
    </TopToolbar>
  )
}
