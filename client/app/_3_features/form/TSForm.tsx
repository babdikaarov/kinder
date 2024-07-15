'use client'
import { FormEvent, useEffect, useRef, useState, useTransition } from 'react'
import { useForm } from '@tanstack/react-form'
import FormOptions from './FormOptions'
import { TextInput } from './TextInput'
import { SelectButton } from './SelectButton'
import DocNameInput from './DocNameInput'
import DocFileInput from './DocFileInput'
import { zodValidator } from '@tanstack/zod-form-adapter'
import { z } from 'zod'
import { TAlert, TSFormProps } from './types'

import { cn } from '@/app/_5_shared'
import { PhoneInput } from './PhoneInput'
import Alert from './allerts/Alert'
import ErrorAlert from './allerts/error'
import SuccessAlert from './allerts/success'
import { Loader } from 'lucide-react'
import AlertSubmited from './allerts/AlertSubmited'

export default function TSForm({ opt, text, locale }: TSFormProps) {
  const [isToPatch, setIsToPatch] = useState(false)
  const [isOpen, setIsOpen] = useState(false)
  const [options, setOptions] = useState(opt)
  const [compare, setCompare] = useState(0)
  const [postStatus, setPostStatus] = useState({
    failed: false,
    success: false,
    submitted: false,
  })
  const refAlert = useRef(null)
  const refAlertSubmitted = useRef(null)
  const refForm = useRef(null)

  // FORM CONFIG start

  const form = useForm({
    defaultValues: {
      formOption: '',
      inn: '',
      lastName: '',
      firstName: '',
      phoneNumber: '+996',
      email: '',
      docs: [] as Array<{
        name: string
        file: FileList | null
      }>,
      docLength: 0,
    },
    onSubmit: async ({ value }) => {
      // return new Promise((resolve, reject) => {
      // console.log(value)

      const formData = new FormData()
      if (!isToPatch) {
        formData.append('inn', value.inn)
      }
      formData.append('firstName', value.firstName.trim())
      formData.append('lastName', value.lastName.trim())
      formData.append('formSchema', value.formOption)
      formData.append('phoneNumber', value.phoneNumber)
      formData.append('email', value.email.trim())
      formData.append('isAdmin', 'false')
      // fix me
      value.docs.forEach((doc) => {
        if (doc.file) {
          for (let i = 0; i < doc.file.length; i++) {
            const file = doc.file[i]
            formData.append(`docs[${doc.name}]`, file)
            // formData.append(`docs[${doc.name}]`, file, file.name)
          }
        }
      })
      formData.forEach((value, key) => {
        if (value instanceof File) {
          console.log(`${key}: ${value.name} (${value.size / 1024 / 1024} mb)`)
        } else {
          console.log(`${key}: ${value}`)
        }
      })
      const requestOptions = {
        method: isToPatch ? 'PATCH' : 'POST',
        body: formData,
      }

      try {
        await new Promise((resolve) => setTimeout(resolve, 3000)) // set a 3-second delay
        const response = await fetch(
          isToPatch
            ? `${process.env.BACKEND_URL}/api/form/${value.inn}`
            : `${process.env.BACKEND_URL}/api/form`,
          requestOptions
        )
        // const result = await response.json()
        if (!response.ok) {
          console.log(response.statusText)
          throw new Error(response.statusText)
        }
        console.log(response)
        setPostStatus((prev) => ({ ...prev, success: true }))
        if (refAlertSubmitted.current) {
          ;(refAlertSubmitted.current as HTMLButtonElement).click()
        }
        return response
      } catch (error: any) {
        setPostStatus((prev) => ({ ...prev, failed: true }))
        console.log(error.message)
        return error
      }
    },

    validatorAdapter: zodValidator,
  })

  // FORM CONFIG end

  const { Subscribe, Field, setFieldValue, getFieldValue } = form

  useEffect(() => {
    if (!getFieldValue('formOption')) return
    setCompare(opt[getFieldValue('formOption')].options.length)

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [getFieldValue, options])

  useEffect(() => {
    if (postStatus.failed || postStatus.success) {
      const timer = setTimeout(() => {
        setPostStatus((prev) => ({
          ...prev,
          failed: false,
          success: false,
        }))
      }, 15000)
      return () => clearTimeout(timer)
    }
  }, [postStatus])

  // JSX render start

  return (
    <>
      <form
        ref={refForm}
        onSubmit={(e) => {
          e.preventDefault()
          e.stopPropagation()
          form.handleSubmit()
        }}
        className={cn(
          'ml-[200px] flex w-full max-w-[600px] flex-col items-center justify-center  xl:items-start',
          'lgExtra:m-auto',
          'xl:ml-[120px]',
          'gap-6'
        )}
      >
        <form.Field
          name='inn'
          validators={{
            onChange: z.string().min(14, text.errors.inn),
            onChangeAsyncDebounceMs: 1000,
            onChangeAsync: async ({ value }) => {
              // console.log(isToPatch);

              if (value.length === 14) {
                try {
                  const response = await fetch(
                    `${process.env.BACKEND_URL}/api/form/byInn/${value}`
                  )
                  setIsToPatch(response.ok)

                  if (response.ok) {
                    const data = await response.json()
                    // console.log(data)
                    setFieldValue('firstName', data.firstName)
                    setFieldValue('lastName', data.lastName)
                    setFieldValue('email', data.email)
                    setFieldValue('phoneNumber', data.phoneNumber)
                    setFieldValue('formOption', data.formSchema)
                    // console.log(getFieldValue('formOption'))
                    // console.log(options)
                  }
                } catch (error) {
                  console.log(error)
                }
              }
              return undefined
            },
          }}
        >
          {(field) => {
            return (
              <TextInput
                // className={isToPatch ? 'text-dark-300' : ''}
                // disabled={isToPatch}
                name={text.inn}
                value={field.state.value}
                onChange={(e) => {
                  let inputValue = e.target.value.replace(/\D/g, '')
                  // Limit to 14 digits inn
                  if (inputValue.length > 14) {
                    inputValue = inputValue.slice(0, 14)
                  }
                  field.handleChange(inputValue)
                }}
                error={field.state.meta.touchedErrors}
              />
            )
          }}
        </form.Field>
        <form.Field
          name='firstName'
          validators={{
            onChange: z.string().min(1, text.errors.firstName),
          }}
        >
          {(field) => {
            return (
              <TextInput
                name={text.firstName}
                value={field.state.value}
                onChange={(e) => field.handleChange(e.target.value)}
                error={field.state.meta.touchedErrors}
              />
            )
          }}
        </form.Field>
        <form.Field
          name='lastName'
          validators={{
            onChange: z.string().min(1, text.errors.lastName),
          }}
        >
          {(field) => {
            return (
              <TextInput
                name={text.lastName}
                value={field.state.value}
                onChange={(e) => field.handleChange(e.target.value)}
                error={field.state.meta.touchedErrors}
              />
            )
          }}
        </form.Field>
        <form.Field
          name='phoneNumber'
          validators={{
            onChange: z.string().min(1, text.errors.phoneNumber),
            onSubmit: z.string().min(13, text.errors.phoneNumber),
          }}
        >
          {(field) => {
            return (
              <PhoneInput
                name={text.phoneNumber}
                value={field.state.value}
                onChange={(e) => field.handleChange(e as unknown as string)}
                error={field.state.meta.touchedErrors}
              />
            )
          }}
        </form.Field>
        <form.Field
          name='email'
          validators={{
            onChange: z.string().email({ message: text.errors.email }),
          }}
        >
          {(field) => {
            return (
              <TextInput
                name={text.email}
                value={field.state.value}
                onChange={(e) => field.handleChange(e.target.value)}
                error={field.state.meta.touchedErrors}
              />
            )
          }}
        </form.Field>

        <form.Field
          name='formOption'
          validators={{
            onChange: ({ value }) => {
              return value ? undefined : text.errors.formType
            },
          }}
        >
          {(field) => {
            return (
              <>
                <FormOptions
                  fieldValue={field.getValue()}
                  lang={locale}
                  changeHandler={(e) => {
                    field.handleChange(e)
                    setIsOpen(false)
                    setOptions(opt)
                    form.setFieldValue('docs', [])
                  }}
                  onBlur={field.handleBlur}
                  opt={options}
                  error={field.state.meta.touchedErrors}
                />
              </>
            )
          }}
        </form.Field>

        <form.Field
          name='docs'
          mode='array'
          validators={{
            onChange: ({ value }) => {
              // console.log(value)

              return undefined
            },
          }}
        >
          {(field) => {
            return (
              <>
                {field.state.value.map((_, i) => {
                  return (
                    <div
                      key={i}
                      className='relative  flex w-full max-w-[600px] gap-5'
                    >
                      <div className='w-full'>
                        <form.Field name={`docs[${i}].name`}>
                          {(subField) => {
                            return (
                              <DocNameInput
                                value={
                                  opt[getFieldValue('formOption')].options.find(
                                    (el) => {
                                      return el.option === subField.state.value
                                    }
                                  )?.text[locale]
                                }
                                onChange={(e) =>
                                  subField.handleChange(e.target.value)
                                }
                              />
                            )
                          }}
                        </form.Field>
                        <form.Field
                          name={`docs[${i}].file`}
                          validators={{
                            onSubmit: ({ value }) => {
                              if (value?.length) {
                                return undefined
                              }
                              // patch logic
                              return text.errors.uploadFile
                            },
                            onChange: ({ value }) => {
                              if (value) {
                                const maxFileSize = 10 * 1024 * 1024 // //file size limit 10mb
                                for (let i = 0; i < value.length; i++) {
                                  const file = value[i]
                                  if (file.size > maxFileSize) {
                                    return `${text.errors.sizeLimit}: ...${file.name.slice(-12)}`
                                  }
                                }
                              }

                              return undefined
                            },
                          }}
                        >
                          {(subField) => {
                            return (
                              <DocFileInput
                                text={text.fileInput}
                                error={
                                  subField.state.meta.touchedErrors ||
                                  subField.state.meta.isTouched
                                }
                                multiple={
                                  opt[
                                    form.getFieldValue('formOption')
                                  ].options.find(
                                    (el) =>
                                      el.option === field.state.value[i].name
                                  )?.multiple
                                }
                                onChange={(e) => {
                                  subField.handleChange(e)
                                  form.setFieldValue(
                                    'docLength',
                                    Math.random(),
                                    { touch: true }
                                  )
                                }}
                                value={subField.state.value}
                                show={subField.getValue()}
                                removeField={() => {
                                  setOptions((prev) => {
                                    const selectedOptionKey =
                                      form.getFieldValue('formOption')
                                    const updatedOptions = { ...prev }

                                    opt[selectedOptionKey].options.forEach(
                                      (optItem) => {
                                        if (
                                          optItem.option ===
                                          field.state.value[i].name
                                        ) {
                                          const existsInState = prev[
                                            selectedOptionKey
                                          ].options.some(
                                            (stateItem) =>
                                              stateItem.option == optItem.option
                                          )

                                          if (!existsInState) {
                                            updatedOptions[
                                              selectedOptionKey
                                            ].options.push(optItem)
                                          }
                                        }
                                      }
                                    )

                                    return updatedOptions
                                  })

                                  field.removeValue(i)
                                }}
                              />
                            )
                          }}
                        </form.Field>
                      </div>
                    </div>
                  )
                })}
                <SelectButton
                  isToPatch={isToPatch}
                  validateFields={() => form.validateAllFields('submit')}
                  lang={locale}
                  docArrayLength={() => form.getFieldValue('docs').length}
                  setFieldValue={setFieldValue as any}
                  error={field.state.meta.errors}
                  errorText={{
                    formType: text.errors.formType,
                    addFile: text.errors.addFile,
                  }}
                  wrapper={Subscribe}
                  field={Field}
                  setIsOpen={setIsOpen}
                  isOpen={isOpen}
                  text={text.fileInput.addFile}
                  getOption={() => form.getFieldValue('formOption')}
                  pushField={(newField: {
                    name: string
                    text: Record<string, string>
                  }) => {
                    field.pushValue({ name: newField.name, file: null })
                    setOptions((prev) => ({
                      ...prev,
                      [form.getFieldValue('formOption')]: {
                        ...prev[form.getFieldValue('formOption')],
                        options: prev[
                          form.getFieldValue('formOption')
                        ].options.filter((el) => el.option !== newField.name),
                      },
                    }))
                  }}
                  compare={compare}
                  opt={options}
                  originOpt={opt}
                />
              </>
            )
          }}
        </form.Field>
        <form.Subscribe
          selector={(state) => [
            state.isSubmitting,
            state.canSubmit,
            state.isSubmitted,
          ]}
        >
          {([isSubmitting, canSubmit, isSubmitted]) => {
            function openAlert() {
              // if (!refAlert.current) return
              // ;(refAlert.current as HTMLButtonElement).click()
              form.validateAllFields('submit').then((errors) => {
                if (errors.length === 0) {
                  if (!refAlert.current) return
                  if (canSubmit) {
                    ;(refAlert.current as HTMLButtonElement).click()
                  }
                }
              })
            }
            return (
              <>
                <button
                  type='button'
                  className={cn(
                    'flex h-[50px]  w-full items-center justify-center gap-2 rounded bg-blue-500 text-white',
                    !canSubmit && !isSubmitting
                      ? 'bg-red-100 text-red-600 '
                      : 'bg-blue-500'
                  )}
                  onClick={openAlert}
                >
                  {isSubmitting ? (
                    <>
                      <div>{text.submit.isSubmitting}</div>
                      <Loader className='animate-spin-slow' />
                    </>
                  ) : (
                    <div>{text.submit.default}</div>
                  )}
                </button>
                <Alert refFrom={refForm} myRef={refAlert} text={text.alerts} />
              </>
            )
          }}
        </form.Subscribe>
      </form>

      <ErrorAlert
        className={
          postStatus.failed ? 'grid-rows-[1fr]  p-4 ' : 'grid-rows-[0fr]'
        }
        text={text.alerts.errors.failed}
        onClick={() => {
          setPostStatus((prev) => ({ ...prev, failed: false }))
        }}
      />

      <SuccessAlert
        className={
          postStatus.success ? 'grid-rows-[1fr]  p-4 ' : 'grid-rows-[0fr]'
        }
        text={text.alerts.errors.success}
        onClick={() => {
          setPostStatus((prev) => ({ ...prev, success: false }))
        }}
      />

      <AlertSubmited
        resetForm={() => {
          form.reset()
        }}
        myRef={refAlertSubmitted}
        text={text.alerts.submitted}
      />
    </>
  )
}
