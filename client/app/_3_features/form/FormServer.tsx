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
  const formType: TFormType = await getData('/api/form-type')
  const docsList: DocsList[] = await getData('/api/docs-lists')
  const errors = await getData('/api/form-error')

  Object.entries(formType).forEach(([key, value]) => {
    value.options = (value.options as Array<DocsList | string>)
      .map((el) => {
        const matchingDoc = docsList.find((doc) => doc.option === el)
        if (matchingDoc) return matchingDoc
        return el
      })
      .filter((el): el is DocsList => el !== undefined)
    value.errorsText = { ...errors }
  })

  // console.log(formType)

  const t = await getTranslations('form')
  const text: Ttext = {
    inn: t('inn'),
    lastName: t('lastName'),
    firstName: t('firstName'),
    phoneNumber: t('phoneNumber'),
    email: t('email'),
    submit: {
      isSubmitting: t('submit.isSubmitting'),
      default: t('submit.default'),
    },
    addFile: {
      add: t('addFile.add'),
      choosen: t('addFile.choosen'),
      loaded: t('addFile.loaded'),
    },
    errors: {
      uploadFile: t('error.uploadFile'),
      addFile: t('error.addFile'),
      email: t('error.email'),
      firstName: t('error.firstName'),
      formType: t('error.formType'),
      inn: t('error.inn'),
      lastName: t('error.lastName'),
      phoneNumber: t('error.phoneNumber'),
    },
    modal: {
      button: t('modal.button'),
      title: t('modal.title'),
      save: t('modal.save'),
      note: t('modal.note'),
      clickDrop: {
        clickAndDrop: t('modal.clickDrop.clickAndDrop'),
        drop: t('modal.clickDrop.drop'),
      },
      upload: t('modal.upload'),
      error: {
        duplicate: t('modal.error.duplicate'),
        limit: t('modal.error.limit'),
      },
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
