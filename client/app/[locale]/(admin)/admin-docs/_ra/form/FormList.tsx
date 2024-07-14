import { Ban, Filter, MailIcon, Pin, TimerReset, Trash2 } from 'lucide-react'
import {
  List,
  Datagrid,
  TextField,
  FunctionField,
  SearchInput,
  FilterLiveSearch,
  DeleteButton,
  TopToolbar,
  FilterList,
  FilterListItem,
  ListButton,
  BulkDeleteButton,
  BulkExportButton,
  ExportButton,
  SimpleList,
  Labeled,
  useListController,
} from 'react-admin'
import { Card, CardContent, useMediaQuery, Theme } from '@mui/material'

export const FormList = () => {
  //   const postFilters = [
  //     <SearchInput source='q' alwaysOn />,

  //     //   <TextInput label='Title' source='title' defaultValue='Hello, World!' />,
  //   ]

  const isMobile = useMediaQuery<Theme>((theme) => theme.breakpoints.down('sm'))
  const { filterValues } = useListController()

  return (
    <List
      actions={<FilterSidebar media={isMobile} />}
      filterDefaultValues={{ status: 'PENDING' }}
      title={'title list kashkaldak'}
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
                mutationMode='pessimistic'
                disabled={filterValues.status !== 'DELETED'}
              />
              <BulkExportButton />
            </>
          }
        >
          <TextField source='id' />
          <TextField source='inn' />
          <TextField source='firstName' />
          <TextField source='lastName' />
          <TextField source='phoneNumber' />
          <FunctionField
            source='createdAt'
            render={(record) => `${record.createdAt.split('T')[0]}`}
          />
          <TextField source='formSchema' />
          <TextField source='status' />
        </Datagrid>
      )}
    </List>
  )
}

const FilterSidebar = ({ media }: { media: boolean }) => (
  <Card sx={{ order: 1, width: '100%' }}>
    <div className='flex'>
      <CardContent className={`flex-1`}>
        <FilterLiveSearch source='q' className='w-full' />
        <FilterList
          label=''
          // icon={<Filter />}
          icon={<span />}
          className='flex '
          sx={{
            '& .MuiList-root': {
              display: 'flex',
              // flexWrap: media ? 'wrap' : 'nowrap',
              '& .MuiListItemButton-root': {
                paddingLeft: media ? '0.5em' : '2em',
              },
            },
          }}
        >
          <FilterListItem
            label={media ? '' : 'PENDING'}
            icon={!media ? <></> : <TimerReset size={24} />}
            value={{ status: 'PENDING' }}
          />
          <FilterListItem
            label={media ? '' : 'ACCEPTED'}
            icon={!media ? <></> : <Pin size={24} />}
            value={{ status: 'ACCEPTED' }}
          />
          <FilterListItem
            label={media ? '' : 'DECLINED'}
            icon={!media ? <></> : <Ban size={24} />}
            value={{ status: 'DECLINED' }}
          />
          <FilterListItem
            label={media ? '' : 'TRASH'}
            icon={!media ? <></> : <Trash2 size={24} />}
            value={{ status: 'DELETED' }}
          />
        </FilterList>
      </CardContent>
      {media ? null : <ExportButton />}
    </div>
    {/* <FilterList label='Date' icon={<Filter />}>
        <FilterListItem label='All Time' value={{ createdAt: '' }} />
        <FilterListItem label='today' value={{ createdAt: new Date() }} />
        <FilterListItem
          label='this week'
          value={{
            createdAt: new Date(
              new Date().setUTCDate(
                new Date().getUTCDate() -
                  new Date().getUTCDay() +
                  (new Date().getUTCDay() === 0 ? -6 : 1)
              )
            ),
          }}
        />
        <FilterListItem
          label='last week'
          value={{
            createdAt: new Date(
              new Date().setUTCDate(
                new Date().getUTCDate() - new Date().getUTCDay() - 6
              )
            ),
          }}
        />
        <FilterListItem label='this month' value={{ createdAt: 'DELETED' }} />
        <FilterListItem label='last month' value={{ createdAt: 'DELETED' }} />
      </FilterList> */}
  </Card>
)
