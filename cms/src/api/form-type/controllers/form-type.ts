/**
 * form-type controller
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreController("api::form-type.form-type", ({ strapi }) => ({
   async find(ctx) {
      const { data, meta } = await super.find(ctx);
      delete data.attributes.createdAt;
      delete data.attributes.updatedAt;
      const entry = data.attributes;
      return entry;
   },
}));
