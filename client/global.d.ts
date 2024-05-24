declare interface IntlMessages extends myTS.LocalizationData {}

declare namespace myTS {
  type I = {
    i: string
  }
  type L = 'ky' | 'ru'
  interface ContentForm {
    createdAt: string // or Date if you want to parse it as a Date object
    updatedAt: string // or Date if you want to parse it as a Date object
    locale: string
    form_INN: string
    form_email: string
    form_modal_title: string
    form_modal_button: string
    form_upload: string
    form_error_inn: string
    form_error_addFile: string
    form_error_formType: string
    form_error_lastName: string
    form_error_firstName: string
    form_error_uploadFile: string
    form_error_phoneNumber: string
    form_error_email: string
    form_modal_note: string
    form_modal_save: string
    form_modal_error_limit: string
    form_modal_error_limit_duplicate: string
    form_modal_clickDrop_drop: string
    form_modal_clickDrop_clickDrop: string
    form_submit_default: string
    form_submit_isSubmitting: string
    form_addFile_add: string
    form_addFile_loaded: string
    form_addFile_chosen: string
    form_firstName: string
    form_lastName: string
    form_phoneNumber: string
  }
  interface LocalizationData {
  navigation_main: string;
  navigation_about: string;
  navigation_admin: string;
  navigation_gallery: string;
  navigation_parents: string;
  footer_address: string;
  gallery_header: string;
  parent_header: string;
  parents_button: string;
  calendar_label: string;
  calendar_filter: string;
  calendar_header: string;
  home_map_hours: string;
  home_map_contacts: string;
  home_hero_button: string;
  home_about_header: string;
  home_why_us_header: string;
  home_programs_header: string;
  home_ourGroups_header: string;
  home_galleryInfo_header: string;
  home_galleryInfo_button: string;
  home_calendar_reference_promo: string;
  home_calendar_reference_button: string;
  home_calendar_reference_header: string;
  share_link_copy: string;
  share_link_share: string;
  share_link_copied: string;
  createdAt: string; // or Date if you want to parse it as a Date object
  updatedAt: string; // or Date if you want to parse it as a Date object
  locale: string;
}
}
