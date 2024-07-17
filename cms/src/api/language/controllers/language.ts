/**
 * language controller
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreController("api::language.language", ({ strapi }) => ({
   async find(ctx) {
      const { data, meta } = await super.find(ctx);
      // console.log(ctx);
      return data;
   },
}));
