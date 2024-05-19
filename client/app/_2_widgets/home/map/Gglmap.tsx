'use client'

interface GglmapProps {}

const Gglmap: React.FC<GglmapProps> = ({}) => {
  return (
    <iframe
      className='min-w-[360px] flex-1 rounded-10 xsm:min-w-[225px]'
      src='https://www.google.com/maps/embed?hl=ru&pb=!1m18!1m12!1m3!1d3608.344229973389!2d51.44102747625387!3d25.259003229192977!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e45da18a8ac2bef%3A0xad58f8007682d155!2sVillaggio%20Mall!5e0!3m2!1sen!2sqa!4v1712808215097!5m2!1sen!2sqa'
      height='173'
      allowFullScreen={false}
      loading='lazy'
      referrerPolicy='no-referrer-when-downgrade'
    ></iframe>
    // <iframe
    //   src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d43028.05857815528!2d51.40331912788301!3d25.282777025233727!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3e45da18a8ac2bef%3A0xad58f8007682d155!2sVillaggio%20Mall!5e0!3m2!1sen!2sqa!4v1712636195925!5m2!1sen!2sqa'
    //   width='600'
    //   height='200'
    //   style={{ border: 0 }}
    //   allowFullScreen={false}
    //   loading='lazy'
    //   referrerPolicy='no-referrer-when-downgrade'
    // ></iframe>
  )
}

export default Gglmap
