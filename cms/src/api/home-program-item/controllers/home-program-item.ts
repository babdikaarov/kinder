/**
 * home-program-item controller
 */

import { factories } from "@strapi/strapi";
interface ModifiedImageObject {
   src: string;
   width: number;
   height: number;
}
interface ImageObject {
   ext: string;
   url: string;
   hash: string;
   mime: string;
   name: string;
   path: string | null;
   size: number;
   width: number;
   height: number;
   sizeInBytes: number;
}
export default factories.createCoreController("api::home-program-item.home-program-item", ({ strapi }) => ({
   async find(ctx) {
      const baseURL = process.env.DOMAIN_NAME || ctx.request.header.host;
      const host = `${process.env.PROTOCOL}` + baseURL;
      const { data, meta } = await super.find(ctx);

      const sortedEntry = data.map((el) => {
         const obj: Record<string, ImageObject> = el.attributes.image.data.attributes.formats;
         const modifiedObject: Record<string, ModifiedImageObject> = {};
         for (const [key, value] of Object.entries(obj)) {
            modifiedObject[key] = {
               src: host + value.url,
               width: value.width,
               height: value.height,
            };
         }
         const image = {
            alt: el.attributes.image.data.attributes.alternativeText,
            src: host + el.attributes.image.data.attributes.url,
            formats: modifiedObject,
         };

         const secondLang = el.attributes.localizations.data[0].attributes;

         const entry = {
            id: el.id,
            [el.attributes.locale]: {
               title: el.attributes.title,
               description: el.attributes.description,
            },
            [secondLang.locale]: {
               title: secondLang.title,
               description: secondLang.description,
            },
            image: image,
         };
         return entry;
      });
      return sortedEntry;
   },
}));
