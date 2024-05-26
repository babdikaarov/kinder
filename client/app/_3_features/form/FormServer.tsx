import { getTranslations } from 'next-intl/server'
import { Ttext } from './types'
import TSForm from './TSForm'
import { getData } from '@/app/_4_entities'
import { error } from 'console'
import { string } from 'zod'

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
  // console.log(formType)

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
    inn: contentForm.form_INN || 'form_INN',
    lastName: contentForm.form_lastName || 'form_lastName',
    firstName: contentForm.form_firstName || 'form_firstName',
    phoneNumber: contentForm.form_phoneNumber || 'form_phoneNumber',
    email: contentForm.form_email || 'form_email',
    submit: {
      isSubmitting:
        contentForm.form_submit_isSubmitting || 'form_submit_isSubmitting',
      default: contentForm.form_submit_default || 'form_submit_default',
    },
    fileInput: {
      addFile: {
        add: contentForm.form_addFile_add || 'form_addFile_add',
        choosen: contentForm.form_addFile_chosen || 'form_addFile_chosen',
        loaded: contentForm.form_addFile_loaded || 'form_addFile_loaded',
      },
      modal: {
        button: contentForm.form_modal_button || 'form_modal_button',
        title: contentForm.form_modal_title || 'form_modal_title',
        save: contentForm.form_modal_save || 'form_modal_save',
        note: contentForm.form_modal_note || 'form_modal_note',
        clickDrop: {
          clickAndDrop:
            contentForm.form_modal_clickDrop_clickDrop ||
            'form_modal_clickDrop_clickDrop',
          drop:
            contentForm.form_modal_clickDrop_drop ||
            'form_modal_clickDrop_drop',
        },
        upload: contentForm.form_upload || 'form_upload',
        error: {
          duplicate:
            contentForm.form_modal_error_limit_duplicate ||
            'form_modal_error_limit_duplicate',
          isNotSameExtention:
            contentForm.form_modal_error_notSameExtention ||
            'form_modal_error_notSameExtention',
          sizeLimit:
            contentForm.form_error_fileSizeLimit || 'form_error_fileSizeLimit',
          limit: contentForm.form_modal_error_limit || 'form_modal_error_limit',
        },
      },
    },
    errors: {
      sizeLimit:
        contentForm.form_error_fileSizeLimit || 'form_error_fileSizeLimit',
      uploadFile: contentForm.form_error_uploadFile || 'form_error_uploadFile',
      addFile: contentForm.form_error_addFile || 'form_error_addFile',
      email: contentForm.form_error_email || 'form_error_email',
      firstName: contentForm.form_error_firstName || 'form_error_firstName',
      formType: contentForm.form_error_formType || 'form_error_formType',
      inn: contentForm.form_error_inn || 'form_error_inn',
      lastName: contentForm.form_error_lastName || 'form_error_lastName',
      phoneNumber:
        contentForm.form_error_phoneNumber || 'form_error_phoneNumber',
    },

    alerts: {
      title: contentForm.form_alerts_title || 'form_alerts_title',
      description:
        contentForm.form_alerts_description || 'form_alerts_description',
      cancel: contentForm.form_alerts_cancel || ' form_alerts_cancel',
      submit: contentForm.form_alerts_submit || ' form_alerts_submit',
      submitted: {
        title:
          contentForm.form_alerts_submitted_title ||
          'form_alerts_submitted_title',
        description:
          contentForm.form_alerts_submitted_description ||
          'form_alerts_submitted_description',
        close:
          contentForm.form_alerts_submitted_close ||
          ' form_alerts_submitted_close ',
      },
      errors: {
        failed: {
          title:
            contentForm.form_alerts_errors_failed_title ||
            'form_alerts_errors_failed_title',
          description:
            contentForm.form_alerts_errors_failed_description ||
            'form_alerts_errors_failed_description',
        },
        success: {
          title:
            contentForm.form_alerts_success_title ||
            'form_alerts_success_title',
          description:
            contentForm.form_alerts_success_description ||
            'form_alerts_success_description',
        },
      },
    },
  }

  return <TSForm opt={formType} text={text} lang={i} />
}

export default FormServer
