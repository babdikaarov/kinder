import type { Schema, Attribute } from "@strapi/strapi";

export interface AdminPermission extends Schema.CollectionType {
   collectionName: "admin_permissions";
   info: {
      name: "Permission";
      description: "";
      singularName: "permission";
      pluralName: "permissions";
      displayName: "Permission";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      action: Attribute.String &
         Attribute.Required &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      actionParameters: Attribute.JSON & Attribute.DefaultTo<{}>;
      subject: Attribute.String &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      properties: Attribute.JSON & Attribute.DefaultTo<{}>;
      conditions: Attribute.JSON & Attribute.DefaultTo<[]>;
      role: Attribute.Relation<"admin::permission", "manyToOne", "admin::role">;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"admin::permission", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"admin::permission", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface AdminUser extends Schema.CollectionType {
   collectionName: "admin_users";
   info: {
      name: "User";
      description: "";
      singularName: "user";
      pluralName: "users";
      displayName: "User";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      firstname: Attribute.String &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      lastname: Attribute.String &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      username: Attribute.String;
      email: Attribute.Email &
         Attribute.Required &
         Attribute.Private &
         Attribute.Unique &
         Attribute.SetMinMaxLength<{
            minLength: 6;
         }>;
      password: Attribute.Password &
         Attribute.Private &
         Attribute.SetMinMaxLength<{
            minLength: 6;
         }>;
      resetPasswordToken: Attribute.String & Attribute.Private;
      registrationToken: Attribute.String & Attribute.Private;
      isActive: Attribute.Boolean & Attribute.Private & Attribute.DefaultTo<false>;
      roles: Attribute.Relation<"admin::user", "manyToMany", "admin::role"> & Attribute.Private;
      blocked: Attribute.Boolean & Attribute.Private & Attribute.DefaultTo<false>;
      preferedLanguage: Attribute.String;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"admin::user", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"admin::user", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface AdminRole extends Schema.CollectionType {
   collectionName: "admin_roles";
   info: {
      name: "Role";
      description: "";
      singularName: "role";
      pluralName: "roles";
      displayName: "Role";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      name: Attribute.String &
         Attribute.Required &
         Attribute.Unique &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      code: Attribute.String &
         Attribute.Required &
         Attribute.Unique &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      description: Attribute.String;
      users: Attribute.Relation<"admin::role", "manyToMany", "admin::user">;
      permissions: Attribute.Relation<"admin::role", "oneToMany", "admin::permission">;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"admin::role", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"admin::role", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface AdminApiToken extends Schema.CollectionType {
   collectionName: "strapi_api_tokens";
   info: {
      name: "Api Token";
      singularName: "api-token";
      pluralName: "api-tokens";
      displayName: "Api Token";
      description: "";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      name: Attribute.String &
         Attribute.Required &
         Attribute.Unique &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      description: Attribute.String &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }> &
         Attribute.DefaultTo<"">;
      type: Attribute.Enumeration<["read-only", "full-access", "custom"]> &
         Attribute.Required &
         Attribute.DefaultTo<"read-only">;
      accessKey: Attribute.String &
         Attribute.Required &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      lastUsedAt: Attribute.DateTime;
      permissions: Attribute.Relation<"admin::api-token", "oneToMany", "admin::api-token-permission">;
      expiresAt: Attribute.DateTime;
      lifespan: Attribute.BigInteger;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"admin::api-token", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"admin::api-token", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface AdminApiTokenPermission extends Schema.CollectionType {
   collectionName: "strapi_api_token_permissions";
   info: {
      name: "API Token Permission";
      description: "";
      singularName: "api-token-permission";
      pluralName: "api-token-permissions";
      displayName: "API Token Permission";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      action: Attribute.String &
         Attribute.Required &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      token: Attribute.Relation<"admin::api-token-permission", "manyToOne", "admin::api-token">;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"admin::api-token-permission", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"admin::api-token-permission", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface AdminTransferToken extends Schema.CollectionType {
   collectionName: "strapi_transfer_tokens";
   info: {
      name: "Transfer Token";
      singularName: "transfer-token";
      pluralName: "transfer-tokens";
      displayName: "Transfer Token";
      description: "";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      name: Attribute.String &
         Attribute.Required &
         Attribute.Unique &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      description: Attribute.String &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }> &
         Attribute.DefaultTo<"">;
      accessKey: Attribute.String &
         Attribute.Required &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      lastUsedAt: Attribute.DateTime;
      permissions: Attribute.Relation<"admin::transfer-token", "oneToMany", "admin::transfer-token-permission">;
      expiresAt: Attribute.DateTime;
      lifespan: Attribute.BigInteger;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"admin::transfer-token", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"admin::transfer-token", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface AdminTransferTokenPermission extends Schema.CollectionType {
   collectionName: "strapi_transfer_token_permissions";
   info: {
      name: "Transfer Token Permission";
      description: "";
      singularName: "transfer-token-permission";
      pluralName: "transfer-token-permissions";
      displayName: "Transfer Token Permission";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      action: Attribute.String &
         Attribute.Required &
         Attribute.SetMinMaxLength<{
            minLength: 1;
         }>;
      token: Attribute.Relation<"admin::transfer-token-permission", "manyToOne", "admin::transfer-token">;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"admin::transfer-token-permission", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"admin::transfer-token-permission", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface PluginUploadFile extends Schema.CollectionType {
   collectionName: "files";
   info: {
      singularName: "file";
      pluralName: "files";
      displayName: "File";
      description: "";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      name: Attribute.String & Attribute.Required;
      alternativeText: Attribute.String;
      caption: Attribute.String;
      width: Attribute.Integer;
      height: Attribute.Integer;
      formats: Attribute.JSON;
      hash: Attribute.String & Attribute.Required;
      ext: Attribute.String;
      mime: Attribute.String & Attribute.Required;
      size: Attribute.Decimal & Attribute.Required;
      url: Attribute.String & Attribute.Required;
      previewUrl: Attribute.String;
      provider: Attribute.String & Attribute.Required;
      provider_metadata: Attribute.JSON;
      related: Attribute.Relation<"plugin::upload.file", "morphToMany">;
      folder: Attribute.Relation<"plugin::upload.file", "manyToOne", "plugin::upload.folder"> & Attribute.Private;
      folderPath: Attribute.String &
         Attribute.Required &
         Attribute.Private &
         Attribute.SetMinMax<
            {
               min: 1;
            },
            number
         >;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"plugin::upload.file", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"plugin::upload.file", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface PluginUploadFolder extends Schema.CollectionType {
   collectionName: "upload_folders";
   info: {
      singularName: "folder";
      pluralName: "folders";
      displayName: "Folder";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      name: Attribute.String &
         Attribute.Required &
         Attribute.SetMinMax<
            {
               min: 1;
            },
            number
         >;
      pathId: Attribute.Integer & Attribute.Required & Attribute.Unique;
      parent: Attribute.Relation<"plugin::upload.folder", "manyToOne", "plugin::upload.folder">;
      children: Attribute.Relation<"plugin::upload.folder", "oneToMany", "plugin::upload.folder">;
      files: Attribute.Relation<"plugin::upload.folder", "oneToMany", "plugin::upload.file">;
      path: Attribute.String &
         Attribute.Required &
         Attribute.SetMinMax<
            {
               min: 1;
            },
            number
         >;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"plugin::upload.folder", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"plugin::upload.folder", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface PluginContentReleasesRelease extends Schema.CollectionType {
   collectionName: "strapi_releases";
   info: {
      singularName: "release";
      pluralName: "releases";
      displayName: "Release";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      name: Attribute.String & Attribute.Required;
      releasedAt: Attribute.DateTime;
      scheduledAt: Attribute.DateTime;
      timezone: Attribute.String;
      status: Attribute.Enumeration<["ready", "blocked", "failed", "done", "empty"]> & Attribute.Required;
      actions: Attribute.Relation<
         "plugin::content-releases.release",
         "oneToMany",
         "plugin::content-releases.release-action"
      >;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"plugin::content-releases.release", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"plugin::content-releases.release", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface PluginContentReleasesReleaseAction extends Schema.CollectionType {
   collectionName: "strapi_release_actions";
   info: {
      singularName: "release-action";
      pluralName: "release-actions";
      displayName: "Release Action";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      type: Attribute.Enumeration<["publish", "unpublish"]> & Attribute.Required;
      entry: Attribute.Relation<"plugin::content-releases.release-action", "morphToOne">;
      contentType: Attribute.String & Attribute.Required;
      locale: Attribute.String;
      release: Attribute.Relation<
         "plugin::content-releases.release-action",
         "manyToOne",
         "plugin::content-releases.release"
      >;
      isEntryValid: Attribute.Boolean;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"plugin::content-releases.release-action", "oneToOne", "admin::user"> &
         Attribute.Private;
      updatedBy: Attribute.Relation<"plugin::content-releases.release-action", "oneToOne", "admin::user"> &
         Attribute.Private;
   };
}

export interface PluginI18NLocale extends Schema.CollectionType {
   collectionName: "i18n_locale";
   info: {
      singularName: "locale";
      pluralName: "locales";
      collectionName: "locales";
      displayName: "Locale";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      name: Attribute.String &
         Attribute.SetMinMax<
            {
               min: 1;
               max: 50;
            },
            number
         >;
      code: Attribute.String & Attribute.Unique;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"plugin::i18n.locale", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"plugin::i18n.locale", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface PluginUsersPermissionsPermission extends Schema.CollectionType {
   collectionName: "up_permissions";
   info: {
      name: "permission";
      description: "";
      singularName: "permission";
      pluralName: "permissions";
      displayName: "Permission";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      action: Attribute.String & Attribute.Required;
      role: Attribute.Relation<"plugin::users-permissions.permission", "manyToOne", "plugin::users-permissions.role">;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"plugin::users-permissions.permission", "oneToOne", "admin::user"> &
         Attribute.Private;
      updatedBy: Attribute.Relation<"plugin::users-permissions.permission", "oneToOne", "admin::user"> &
         Attribute.Private;
   };
}

export interface PluginUsersPermissionsRole extends Schema.CollectionType {
   collectionName: "up_roles";
   info: {
      name: "role";
      description: "";
      singularName: "role";
      pluralName: "roles";
      displayName: "Role";
   };
   pluginOptions: {
      "content-manager": {
         visible: false;
      };
      "content-type-builder": {
         visible: false;
      };
   };
   attributes: {
      name: Attribute.String &
         Attribute.Required &
         Attribute.SetMinMaxLength<{
            minLength: 3;
         }>;
      description: Attribute.String;
      type: Attribute.String & Attribute.Unique;
      permissions: Attribute.Relation<
         "plugin::users-permissions.role",
         "oneToMany",
         "plugin::users-permissions.permission"
      >;
      users: Attribute.Relation<"plugin::users-permissions.role", "oneToMany", "plugin::users-permissions.user">;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"plugin::users-permissions.role", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"plugin::users-permissions.role", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface PluginUsersPermissionsUser extends Schema.CollectionType {
   collectionName: "up_users";
   info: {
      name: "user";
      description: "";
      singularName: "user";
      pluralName: "users";
      displayName: "User";
   };
   options: {
      draftAndPublish: false;
      timestamps: true;
   };
   attributes: {
      username: Attribute.String &
         Attribute.Required &
         Attribute.Unique &
         Attribute.SetMinMaxLength<{
            minLength: 3;
         }>;
      email: Attribute.Email &
         Attribute.Required &
         Attribute.SetMinMaxLength<{
            minLength: 6;
         }>;
      provider: Attribute.String;
      password: Attribute.Password &
         Attribute.Private &
         Attribute.SetMinMaxLength<{
            minLength: 6;
         }>;
      resetPasswordToken: Attribute.String & Attribute.Private;
      confirmationToken: Attribute.String & Attribute.Private;
      confirmed: Attribute.Boolean & Attribute.DefaultTo<false>;
      blocked: Attribute.Boolean & Attribute.DefaultTo<false>;
      role: Attribute.Relation<"plugin::users-permissions.user", "manyToOne", "plugin::users-permissions.role">;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"plugin::users-permissions.user", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"plugin::users-permissions.user", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface ApiAboutAbout extends Schema.CollectionType {
   collectionName: "abouts";
   info: {
      singularName: "about";
      pluralName: "abouts";
      displayName: "about";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      description: Attribute.Text &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      image: Attribute.Media &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::about.about", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::about.about", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::about.about", "oneToMany", "api::about.about">;
      locale: Attribute.String;
   };
}

export interface ApiBlogBlog extends Schema.CollectionType {
   collectionName: "blogs";
   info: {
      singularName: "blog";
      pluralName: "blogs";
      displayName: "blog";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      image: Attribute.Media &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      post: Attribute.Blocks &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::blog.blog", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::blog.blog", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::blog.blog", "oneToMany", "api::blog.blog">;
      locale: Attribute.String;
   };
}

export interface ApiCalendarCalendar extends Schema.CollectionType {
   collectionName: "calendars";
   info: {
      singularName: "calendar";
      pluralName: "calendars";
      displayName: "Calendar";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      calendatID: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      publicKey: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      category: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::calendar.calendar", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::calendar.calendar", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::calendar.calendar", "oneToMany", "api::calendar.calendar">;
      locale: Attribute.String;
   };
}

export interface ApiContentFormContentForm extends Schema.SingleType {
   collectionName: "content_forms";
   info: {
      singularName: "content-form";
      pluralName: "content-forms";
      displayName: "contentForm";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      form_INN: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_email: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_button: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_upload: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_inn: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_addFile: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_formType: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_lastName: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_firstName: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_fileSizeLimit: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_uploadFile: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_phoneNumber: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_error_email: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_note: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_save: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_error_limit: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_error_notSameExtention: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_error_limit_duplicate: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_clickDrop_drop: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_modal_clickDrop_clickDrop: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_submit_default: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_submit_isSubmitting: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_addFile_add: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_addFile_loaded: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_addFile_chosen: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_firstName: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_lastName: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_phoneNumber: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_description: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_submit: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_submitted_title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_submitted_description: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_submitted_close: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_errors_failed_title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_errors_failed_description: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_success_title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_success_description: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      form_alerts_cancel: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::content-form.content-form", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::content-form.content-form", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<
         "api::content-form.content-form",
         "oneToMany",
         "api::content-form.content-form"
      >;
      locale: Attribute.String;
   };
}

export interface ApiDetailDetail extends Schema.SingleType {
   collectionName: "details";
   info: {
      singularName: "detail";
      pluralName: "details";
      displayName: "details";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      tel1: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      tel2: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      weekday: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      weekend: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      orgName: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      address: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      googleMapEmbededLink: Attribute.Text &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::detail.detail", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::detail.detail", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::detail.detail", "oneToMany", "api::detail.detail">;
      locale: Attribute.String;
   };
}

export interface ApiGalleryGallery extends Schema.CollectionType {
   collectionName: "galleries";
   info: {
      singularName: "gallery";
      pluralName: "galleries";
      displayName: "gallery";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   attributes: {
      album: Attribute.Media & Attribute.Required;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::gallery.gallery", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::gallery.gallery", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface ApiGroupCategoryGroupCategory extends Schema.CollectionType {
   collectionName: "group_categories";
   info: {
      singularName: "group-category";
      pluralName: "group-categories";
      displayName: "groupCategory";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      category: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      age: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      language: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      image: Attribute.Media &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::group-category.group-category", "oneToOne", "admin::user"> &
         Attribute.Private;
      updatedBy: Attribute.Relation<"api::group-category.group-category", "oneToOne", "admin::user"> &
         Attribute.Private;
      localizations: Attribute.Relation<
         "api::group-category.group-category",
         "oneToMany",
         "api::group-category.group-category"
      >;
      locale: Attribute.String;
   };
}

export interface ApiHeroHero extends Schema.SingleType {
   collectionName: "heroes";
   info: {
      singularName: "hero";
      pluralName: "heroes";
      displayName: "hero";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      description: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      image: Attribute.Media &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      link: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::hero.hero", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::hero.hero", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::hero.hero", "oneToMany", "api::hero.hero">;
      locale: Attribute.String;
   };
}

export interface ApiHomeGalleryInfoHomeGalleryInfo extends Schema.SingleType {
   collectionName: "home_gallery_infos";
   info: {
      singularName: "home-gallery-info";
      pluralName: "home-gallery-infos";
      displayName: "home gallery info";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      description: Attribute.Text &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      image: Attribute.Media &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::home-gallery-info.home-gallery-info", "oneToOne", "admin::user"> &
         Attribute.Private;
      updatedBy: Attribute.Relation<"api::home-gallery-info.home-gallery-info", "oneToOne", "admin::user"> &
         Attribute.Private;
      localizations: Attribute.Relation<
         "api::home-gallery-info.home-gallery-info",
         "oneToMany",
         "api::home-gallery-info.home-gallery-info"
      >;
      locale: Attribute.String;
   };
}

export interface ApiHomeProgramItemHomeProgramItem extends Schema.CollectionType {
   collectionName: "home_program_items";
   info: {
      singularName: "home-program-item";
      pluralName: "home-program-items";
      displayName: "Home program item";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      image: Attribute.Media &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      description: Attribute.Text &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::home-program-item.home-program-item", "oneToOne", "admin::user"> &
         Attribute.Private;
      updatedBy: Attribute.Relation<"api::home-program-item.home-program-item", "oneToOne", "admin::user"> &
         Attribute.Private;
      localizations: Attribute.Relation<
         "api::home-program-item.home-program-item",
         "oneToMany",
         "api::home-program-item.home-program-item"
      >;
      locale: Attribute.String;
   };
}

export interface ApiInstructionInstruction extends Schema.SingleType {
   collectionName: "instructions";
   info: {
      singularName: "instruction";
      pluralName: "instructions";
      displayName: "instruction";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      content: Attribute.Text &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::instruction.instruction", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::instruction.instruction", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::instruction.instruction", "oneToMany", "api::instruction.instruction">;
      locale: Attribute.String;
   };
}

export interface ApiLanguageLanguage extends Schema.SingleType {
   collectionName: "languages";
   info: {
      singularName: "language";
      pluralName: "languages";
      displayName: "language";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      navigation_main: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      navigation_about: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      navigation_admin: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      navigation_gallery: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      navigation_parents: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      footer_address: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      gallery_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      parent_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      parents_button: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      calendar_label: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      calendar_filter: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      calendar_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_map_hours: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_map_contacts: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_hero_button: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_about_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_why_us_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_programs_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_ourGroups_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_galleryInfo_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_galleryInfo_button: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_calendar_reference_promo: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_calendar_reference_button: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      home_calendar_reference_header: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      share_link_copy: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      share_link_share: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      share_link_copied: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::language.language", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::language.language", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::language.language", "oneToMany", "api::language.language">;
      locale: Attribute.String;
   };
}

export interface ApiListDocListDoc extends Schema.CollectionType {
   collectionName: "list_docs";
   info: {
      singularName: "list-doc";
      pluralName: "list-docs";
      displayName: "listDoc";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      text: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      variant: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      multiple: Attribute.Boolean &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }> &
         Attribute.DefaultTo<false>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::list-doc.list-doc", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::list-doc.list-doc", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::list-doc.list-doc", "oneToMany", "api::list-doc.list-doc">;
      locale: Attribute.String;
   };
}

export interface ApiLogoLogo extends Schema.SingleType {
   collectionName: "logos";
   info: {
      singularName: "logo";
      pluralName: "logos";
      displayName: "logo";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   attributes: {
      logo: Attribute.Media & Attribute.Required;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::logo.logo", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::logo.logo", "oneToOne", "admin::user"> & Attribute.Private;
   };
}

export interface ApiTypeFormTypeForm extends Schema.CollectionType {
   collectionName: "type_forms";
   info: {
      singularName: "type-form";
      pluralName: "type-forms";
      displayName: "typeForm";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      text: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      variants: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      name: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      order: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }> &
         Attribute.SetMinMaxLength<{
            minLength: 1;
            maxLength: 4;
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::type-form.type-form", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::type-form.type-form", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::type-form.type-form", "oneToMany", "api::type-form.type-form">;
      locale: Attribute.String;
   };
}

export interface ApiWhyUsWhyUs extends Schema.CollectionType {
   collectionName: "why_uses";
   info: {
      singularName: "why-us";
      pluralName: "why-uses";
      displayName: "WhyUs";
      description: "";
   };
   options: {
      draftAndPublish: false;
   };
   pluginOptions: {
      i18n: {
         localized: true;
      };
   };
   attributes: {
      title: Attribute.String &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: true;
            };
         }>;
      image: Attribute.Media &
         Attribute.Required &
         Attribute.SetPluginOptions<{
            i18n: {
               localized: false;
            };
         }>;
      createdAt: Attribute.DateTime;
      updatedAt: Attribute.DateTime;
      createdBy: Attribute.Relation<"api::why-us.why-us", "oneToOne", "admin::user"> & Attribute.Private;
      updatedBy: Attribute.Relation<"api::why-us.why-us", "oneToOne", "admin::user"> & Attribute.Private;
      localizations: Attribute.Relation<"api::why-us.why-us", "oneToMany", "api::why-us.why-us">;
      locale: Attribute.String;
   };
}

declare module "@strapi/types" {
   export module Shared {
      export interface ContentTypes {
         "admin::permission": AdminPermission;
         "admin::user": AdminUser;
         "admin::role": AdminRole;
         "admin::api-token": AdminApiToken;
         "admin::api-token-permission": AdminApiTokenPermission;
         "admin::transfer-token": AdminTransferToken;
         "admin::transfer-token-permission": AdminTransferTokenPermission;
         "plugin::upload.file": PluginUploadFile;
         "plugin::upload.folder": PluginUploadFolder;
         "plugin::content-releases.release": PluginContentReleasesRelease;
         "plugin::content-releases.release-action": PluginContentReleasesReleaseAction;
         "plugin::i18n.locale": PluginI18NLocale;
         "plugin::users-permissions.permission": PluginUsersPermissionsPermission;
         "plugin::users-permissions.role": PluginUsersPermissionsRole;
         "plugin::users-permissions.user": PluginUsersPermissionsUser;
         "api::about.about": ApiAboutAbout;
         "api::blog.blog": ApiBlogBlog;
         "api::calendar.calendar": ApiCalendarCalendar;
         "api::content-form.content-form": ApiContentFormContentForm;
         "api::detail.detail": ApiDetailDetail;
         "api::gallery.gallery": ApiGalleryGallery;
         "api::group-category.group-category": ApiGroupCategoryGroupCategory;
         "api::hero.hero": ApiHeroHero;
         "api::home-gallery-info.home-gallery-info": ApiHomeGalleryInfoHomeGalleryInfo;
         "api::home-program-item.home-program-item": ApiHomeProgramItemHomeProgramItem;
         "api::instruction.instruction": ApiInstructionInstruction;
         "api::language.language": ApiLanguageLanguage;
         "api::list-doc.list-doc": ApiListDocListDoc;
         "api::logo.logo": ApiLogoLogo;
         "api::type-form.type-form": ApiTypeFormTypeForm;
         "api::why-us.why-us": ApiWhyUsWhyUs;
      }
   }
}
