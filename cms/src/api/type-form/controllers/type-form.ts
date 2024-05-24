/**
 * type-form controller
 */

import { factories } from "@strapi/strapi";

export default factories.createCoreController("api::type-form.type-form", ({ strapi }) => ({
   async find(ctx) {
      const { data, meta } = await super.find(ctx);
      const entry = {};

      data
         .sort((a, b) => a.attributes.order - b.attributes.order)
         .forEach((el: any) => {
            //  console.log(el.attributes.variants.split(",").map((el: string) => el.trim()));

            entry[el.attributes.name] = {
               name: {
                  ky: el.attributes.text,
                  ru: el.attributes.localizations.data[0].attributes.text,
               },
               options: el.attributes.variants.split(",").map((el: string) => el.trim()),
            };
         });

      //   console.log(entry);
      return entry;
   },
}));
