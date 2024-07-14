import {
  Show,
  SimpleShowLayout,
  TextField,
  useRecordContext,
  DateField,
  FunctionField,
  List,
  Datagrid,
  DeleteButton,
} from 'react-admin'

interface ShowProps {}

export const FormShow: React.FC<ShowProps> = ({}) => {
  return (
    // <List >
    //   <Datagrid>
    //     <TextField source='id' />
    //     <TextField source='documentTypes' />
    //     <TextField source='name' />
    //     <TextField source='path' />
    //     <TextField source='url' />
    //   </Datagrid>
    // </List>
    <Show>
      <SimpleShowLayout>
        <TextField source='id' />
        <TextField source='inn' />

        <FunctionField
          source='fullName'
          render={(record) => `${record.firstName} ${record.lastName}`}
        />

        <TextField source='phoneNumber' />
        {/* <TextField source='email' /> */}
        <TextField source='createdAt' />
        <TextField source='formSchema' />
        {/* <TextField source='status' /> */}
        <DeleteButton mutationMode='pessimistic' />
      </SimpleShowLayout>
    </Show>
  )
}

/* <TextField source='inn' />
<TextField source='firstName' />
<TextField source='lastName' />

<TextField source='phoneNumber' />
<TextField source='email' />
<TextField source='createdAt' />
<TextField source='formSchema' /> */
/* 
   {
        "id": 2,
        "documentTypes": "DAD_PASSPORT",
        "name": "dad_passport.pdf",
        "path": "/usr/src/app/java_docs/12345678901234_abdikaarov/dad_passport.pdf",
        "url": "http://34.229.95.91:8080/api/docs/view/2"
    }
*/
