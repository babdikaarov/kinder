'use client'

import { SelectButtonProps } from './types'
import Warn from './allerts/warn'
import { cn } from '@/app/_5_shared'
import './selectButton.css'
import AddSVG from './addSVG'
import { DocsList } from './FormServer'

export const SelectButton: React.FC<SelectButtonProps> = ({
  errorText,
  pushField,
  opt,
  text,
  getOption,
  setIsOpen,
  isOpen,
  wrapper: Subscribe,
  field: Field,
  originOpt,
  lang,
  validateFields,
}) => {
  const handleOptionClick = (e: DocsList) => {
    // const nameOption = e.target.value
    setIsOpen(false)
    pushField({ name: e.option, text: e.text })
  }
  return (
    <div className='relative z-10 w-full max-w-[600px]'>
      <Subscribe selector={(state) => state}>
        {(state) => {
          let validDocsForm = false
          let isAllDocsChoosen = false
          const docLength = state.fieldMeta.docLength
          const docs = state.values.docs

          if (
            getOption() &&
            docLength &&
            originOpt[getOption()].options.length === docs.length &&
            docs.length > 0
          ) {
            validDocsForm = !docs.some((doc: { file: null | any }) => {
              if (doc.file === null) {
                return true
              } else {
                return doc.file.length === 0
              }
            })
            isAllDocsChoosen = true
          }

          return (
            <>
              <button
                type='button'
                className={cn(
                  'relative z-20 flex h-[50px] min-w-full items-center gap-4 text-nowrap rounded border-[0.5px] border-solid border-dark-600 bg-white px-2 text-dark-300',
                  isAllDocsChoosen ? 'bg-slate-200' : ''
                )}
                onClick={() => {
                  validateFields()
                  if (getOption()) {
                    setIsOpen(!isOpen)
                  }
                }}
                disabled={isAllDocsChoosen ? true : false}
              >
                <AddSVG
                  isAllDocsChoosen={isAllDocsChoosen}
                  validDocsForm={validDocsForm}
                />
                {isAllDocsChoosen && validDocsForm
                  ? text.loaded
                  : isAllDocsChoosen
                    ? text.choosen
                    : text.add}
              </button>
            </>
          )
        }}
      </Subscribe>
      <Field
        name='docLength'
        validators={{
          onChangeListenTo: ['docs', 'formOption'],
          onChange: ({ fieldApi }: { fieldApi: any }) => {
            if (!fieldApi.form.getFieldValue('formOption')) {
              return errorText.formType
            } else {
              if (
                fieldApi.form.getFieldValue('docs').length !==
                originOpt[getOption()].options.length
              ) {
                return errorText.addFile
              } else {
                return undefined
              }
            }
          },
        }}
      >
        {(field) => {
          return (
            <>
              <Warn error={field.state.meta.touchedErrors} className='z-40' />
              <div
                className={`grid w-full transition-grid-rows duration-300 ease-linear ${isOpen ? 'grid-rows-[1fr]' : 'grid-rows-[0fr]'}`}
              >
                <div className='flex  w-full flex-col items-start overflow-hidden rounded bg-white shadow'>
                  {!getOption()
                    ? null
                    : opt[getOption()].options.length > 0
                      ? opt[getOption()].options.map((option, index) => (
                          <input
                            key={index}
                            className='mx-3 my-4 h-[46] w-full text-start hover:cursor-pointer'
                            type='button'
                            value={option.text[lang]}
                            onClick={() => {
                              handleOptionClick(option)
                              field.handleChange(Math.random())
                            }}
                          />
                        ))
                      : null}
                </div>
              </div>
            </>
          )
        }}
      </Field>
    </div>
  )
}
