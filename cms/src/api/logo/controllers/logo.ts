/**
 * logo controller
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreController("api::logo.logo", ({ strapi }) => ({
   async find(ctx) {
      const host = `${process.env.UNSECURE_CON}` + ctx.request.header.host;
      const { data, meta } = await super.find(ctx);

      const url = host + data.attributes.logo.data.attributes.url;
      data.attributes.logo.data.attributes.url = url;

      return data.attributes.logo.data.attributes;
   },
}));
