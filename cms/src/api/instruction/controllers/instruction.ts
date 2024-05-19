/**
 * instruction controller
 */

import { factories } from '@strapi/strapi'

export default factories.createCoreController("api::instruction.instruction", ({ strapi }) => ({
   async find(ctx) {
      const { data, meta } = await super.find(ctx);
      delete data.attributes.createdAt;
      delete data.attributes.updatedAt;
      const entry = data.attributes;
      return {
         ky: entry.content,
         ru: entry.localizations.data[0].attributes.content,
      };
   },
}));


