import {
  DeepKeys,
  DeepValue,
  FieldComponent,
  FormState,
  Updater,
  ValidationCause,
  ValidationError,
} from '@tanstack/react-form'
import { TFormType } from './FormServer'

type NoInfer<T> = any

export type Ttext = {
  inn: string
  lastName: string
  firstName: string
  phoneNumber: string
  email: string
  submit: {
    isSubmitting: string
    default: string
  }
  fileInput: {
    addFile: {
      add: string
      loaded: string
      choosen: string
    }
    modal: {
      button: string
      title: string
      save: string
      note: string
      clickDrop: {
        clickAndDrop: string
        drop: string
      }
      upload: string
      error: {
        sizeLimit: string
        duplicate: string
        limit: string
        isNotSameExtention: string
      }
    }
  }
  errors: {
    sizeLimit: string
    uploadFile: string
    addFile: string
    email: string
    firstName: string
    formType: string
    inn: string
    lastName: string
    phoneNumber: string
  }
  alerts: {
    title: string
    description: string
    cancel: string
    submit: string
    submitted: {
      title: string
      description: string
      close: string
    }
    errors: {
      failed: {
        title: string
        description: string
      }
      success: {
        title: string
        description: string
      }
    }
  }
}
export type Inputs = {
  inn: string
  lastN: string
  firstN: string
  file_1: string
  fileName_1: string
  default: string
  file: FileList
  upload: {
    name: string | null
    file: FileList | null
  }[]
}

export interface DocFileInputProps {
  value: FileList | null
  removeField: () => void
  show: FileList | null
  multiple?: boolean
  onChange: (file: any) => void
  error: ValidationError[]
  text: {
    modal: {
      button: string
      title: string
      save: string
      note: string
      clickDrop: {
        clickAndDrop: string
        drop: string
      }
      upload: string
      error: {
        sizeLimit: string
        duplicate: string
        limit: string
        isNotSameExtention: string
      }
    }
    addFile: {
      add: string
      loaded: string
      choosen: string
    }
  }
}

export type fileUrls = {
  name: string
  shortName: string
  size: string
  url: string
}

export interface DocNameInputProps
  extends React.InputHTMLAttributes<HTMLInputElement> {
  name?: string
}

export interface FormOptionsProps {
  changeHandler: (updater: Updater<string>) => void
  opt: Record<string, { name: Record<string, string> }>
  onBlur?: () => void
  error: ValidationError[]
  lang: string
}

export type TFormData = {
  formOption: string
  inn: string
  lastName: string
  firstName: string
  docLength: number
  phoneNumber: string
  email: string
  docs: {
    name: string
    file: FileList | null
  }[]
}

export interface SelectButtonProps
  extends React.HTMLAttributes<HTMLButtonElement> {
  errorText: {
    formType: string
    addFile: string
  }
  lang: string
  text: {
    add: string
    loaded: string
    choosen: string
  }
  getOption: () => string
  pushField: (name: { name: string; text: Record<string, string> }) => void
  opt: TFormType
  originOpt: TFormType
  isOpen: boolean
  setIsOpen: React.Dispatch<React.SetStateAction<boolean>>
  wrapper: <TSelected = FormState<TFormData>>(props: {
    selector?: (state: FormState<TFormData>) => TSelected
    children: ((state: NoInfer<TSelected>) => React.ReactNode) | React.ReactNode
  }) => JSX.Element
  field: FieldComponent<TFormData, NoInfer<any>>
  error: ValidationError[]
  setFieldValue: <TField extends DeepKeys<TFormData>>(
    field: TField,
    updater: Updater<DeepValue<TFormData, TField>> | string,
    opts?: {
      touch?: boolean
    }
  ) => void
  docArrayLength: () => number
  compare: number
  validateFields: () => void
}

export interface InputProps
  extends React.InputHTMLAttributes<HTMLInputElement> {
  name: string
  error: ValidationError[]
}

export type Ioptions = 'default' | 'passport' | 'COB'

export interface TSFormProps {
  opt: TFormType
  lang: string
  text: Ttext
}

export type OptionOPT = {
  name: string
  options: (
    | {
        option: string
        text: {
          ky: string
          ru: string
        }
        multiple: boolean
        mOptions: {
          option: string
          text: {
            ky: string
            ru: string
          }
        }[]
      }
    | {
        option: string
        text: {
          ky: string
          ru: string
        }
        multiple: boolean
        mOptions?: undefined
      }
  )[]
}

export type TAlert = {
  isOpen: boolean
  title?: string
  description?: string
}
