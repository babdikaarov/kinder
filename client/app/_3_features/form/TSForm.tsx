'use client'
import { useEffect, useState } from 'react'
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
import { error } from 'console'

export default function TSForm({ opt, text, lang }: TSFormProps) {
  const [isOpen, setIsOpen] = useState(false)
  const [options, setOptions] = useState(opt)
  const [compare, setCompare] = useState(0)
  const form = useForm({
    defaultValues: {
      formOption: '',
      inn: '',
      lastName: '',
      firstName: '',
      phoneNumber: '',
      email: '',
      docs: [] as Array<{
        name: string
        file: FileList | null
      }>,
      docLength: 0,
    },
    onSubmit({ value }) {
      return new Promise<void>((resolve) => {
        setTimeout(() => {
          console.log(value)
          resolve() // Call resolve to indicate that the promise has been resolved
        }, 2000)
      })

      // const data = {}
      // data.formOption = value.formOption
      // data.inn = value.inn
      // data.lastName = value.lastName
      // data.firstName = value.firstName
      // data.docs = {}
      // value.docs.forEach(el => {
      //   data.docs[el.name] = el.file
      // })
      // console.log(data)
    },

    validatorAdapter: zodValidator,
  })

  const { Subscribe, Field, setFieldValue, getFieldValue } = form

  useEffect(() => {
    if (!getFieldValue('formOption')) return
    setCompare(opt[getFieldValue('formOption')].options.length)

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [getFieldValue, options])
  // FIXME react-share
  return (
    <>
      <form
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
          name='formOption'
          validators={{
            // onSubmit: z.string().min(1, text.errors.formType),
            onChange: ({ value }) => (value ? undefined : text.errors.formType),
          }}
        >
          {(field) => {
            return (
              <>
                <FormOptions
                  lang={lang}
                  changeHandler={(e) => {
                    setIsOpen(false)
                    field.handleChange(e)
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
          name='inn'
          validators={{
            onChange: z.string().min(1, text.errors.inn),
          }}
        >
          {(field) => {
            return (
              <TextInput
                name={text.inn}
                value={field.state.value}
                onChange={(e) => field.handleChange(e.target.value)}
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
            onSubmit: z.string().min(5, text.errors.phoneNumber),
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
                                  )?.text[lang]
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
                              return text.errors.uploadFile
                            },
                          }}
                        >
                          {(subField) => {
                            return (
                              <DocFileInput
                                text={text.fileInput}
                                error={subField.state.meta.touchedErrors}
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
                  lang={lang}
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
          selector={(state) => [state.isSubmitting, state.canSubmit]}
        >
          {([isSubmitting, canSubmit]) => (
            <button
              type='submit'
              // disabled={!canSubmit}
              className={cn(
                'h-[50px] w-full  rounded bg-blue-500 text-white',
                !canSubmit ? 'opacity-65' : 'opacity-100'
              )}
            >
              {isSubmitting ? text.submit.isSubmitting : text.submit.default}
            </button>
          )}
        </form.Subscribe>
      </form>
    </>
  )
}
