/**
 * list-doc controller
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreController("api::list-doc.list-doc", ({ strapi }) => ({
   async find(ctx) {
      const { data, meta } = await super.find(ctx);
      const entry = data.map((el: any) => {
         // console.log(el);

         return {
            text: {
               ky: el.attributes.text,
               ru: el.attributes.localizations.data[0].attributes.text,
            },
            option: el.attributes.variant,
            multiple: el.attributes.multiple,
         };
      });
      //   console.log(entry);
      return entry;
   },
}));
