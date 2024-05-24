import { getTranslations } from 'next-intl/server'
import { Ttext } from './types'
import TSForm from './TSForm'
import { getData } from '@/app/_4_entities'

interface FormServerProps extends myTS.I {}
export interface DocsList {
  text: Record<string, string>
  option: string
  multiple: boolean
}
interface Options {
  options: DocsList[]
  name: Record<string, string>
  errorsText: Record<string, string>
}

export type TFormType = Record<string, Options>

const FormServer: React.FC<FormServerProps> = async ({ i }) => {
  const formType: TFormType = await getData('/api/type-forms?populate=*')
  const docsList: DocsList[] = await getData('/api/list-docs?populate=*')
  const contentForm: myTS.ContentForm = await getData(
    `/api/content-form?locale=${i}`
  ).then(({ data }) => data.attributes)
  console.log(formType)

  Object.entries(formType).forEach(([key, value]) => {
    value.options = (value.options as Array<DocsList | string>)
      .map((el) => {
        const matchingDoc = docsList.find((doc) => doc.option === el)
        if (matchingDoc) return matchingDoc
        return el
      })
      .filter((el): el is DocsList => el !== undefined)
  })

  const text: Ttext = {
    inn: contentForm.form_INN,
    lastName: contentForm.form_lastName,
    firstName: contentForm.form_firstName,
    phoneNumber: contentForm.form_phoneNumber,
    email: contentForm.form_email,
    submit: {
      isSubmitting: contentForm.form_submit_isSubmitting,
      default: contentForm.form_submit_default,
    },
    fileInput: {
      addFile: {
        add: contentForm.form_addFile_add,
        choosen: contentForm.form_addFile_chosen,
        loaded: contentForm.form_addFile_loaded,
      },
      modal: {
        button: contentForm.form_modal_button,
        title: contentForm.form_modal_title,
        save: contentForm.form_modal_save,
        note: contentForm.form_modal_note,
        clickDrop: {
          clickAndDrop: contentForm.form_modal_clickDrop_clickDrop,
          drop: contentForm.form_modal_clickDrop_drop,
        },
        upload: contentForm.form_upload,
        error: {
          duplicate: contentForm.form_modal_error_limit_duplicate,
          limit: contentForm.form_modal_error_limit,
        },
      },
    },
    errors: {
      uploadFile: contentForm.form_error_uploadFile,
      addFile: contentForm.form_error_addFile,
      email: contentForm.form_error_email,
      firstName: contentForm.form_error_firstName,
      formType: contentForm.form_error_formType,
      inn: contentForm.form_error_inn,
      lastName: contentForm.form_error_lastName,
      phoneNumber: contentForm.form_error_phoneNumber,
    },
  }

  /* 
   inn: '',
      lastName: '',
      firstName: '',
      phoneNumber: '',
      email: '',
  */
  // const options = {
  //   twoParents: {
  //     name: 'twoParents option',
  //     options: [
  //       populate('twoParents', false, 1),
  //       populate('twoParents', false, 2),
  //       populate('twoParents', false, 3),
  //     ],
  //   },
  //   oneParent: {
  //     name: 'oneParent option',
  //     options: [
  //       populate('oneParent', false, 1),
  //       populate('oneParent', false, 2),
  //     ],
  //   },
  //   svoenazvine: {
  //     name: 'guardian option',
  //     options: [populate('guardian', false, 1), populate('guardian', true, 2)],
  //   },
  //   divorsed: {
  //     name: 'divorsed option',
  //     options: [populate('divorsed', false, 1), populate('divorsed', false, 2)],
  //   },
  // }

  // function populate(letter: string, multi: boolean, index: number) {
  //   if (multi) {
  //     return {
  //       option: `${letter}-${index}`,
  //       text: {
  //         ky: `${letter}-${index}T=KY`,
  //         ru: `${letter}-${index}T-RU`,
  //       },
  //       multiple: true,
  //       mOptions: [
  //         {
  //           option: `${letter}-${index}MO1`,
  //           text: {
  //             ky: `${letter}-${index}MO1=KY`,
  //             ru: `${letter}-${index}MO1-RU`,
  //           },
  //         },
  //         {
  //           option: `${letter}-${index}MO2`,
  //           text: {
  //             ky: `${letter}-${index}MOT2=KY`,
  //             ru: `${letter}-${index}MOT2-RU`,
  //           },
  //         },
  //       ],
  //     }
  //   }
  //   return {
  //     option: `${letter}-${index}`,
  //     text: {
  //       ky: `${letter}-${index}T=KY`,
  //       ru: `${letter}-${index}T-RU`,
  //     },
  //     multiple: false,
  //   }
  // }

  return <TSForm opt={formType} text={text} lang={i} />
}

export default FormServer
