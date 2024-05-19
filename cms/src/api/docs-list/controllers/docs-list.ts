/**
 * docs-list controller
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreController("api::docs-list.docs-list", ({ strapi }) => ({
   async find(ctx) {
      const { data, meta } = await super.find(ctx);
      const entry = data.map((el: any) => el.attributes.docType);
      return entry;
   },
}));
