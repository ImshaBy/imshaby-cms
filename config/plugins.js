module.exports = ({ env }) => ({
  upload: {
    config: {
      provider: 'aws-s3',
      providerOptions: {
        s3Options: {
          accessKeyId: env('ACCESS_KEY_ID'),
          secretAccessKey: env('ACCESS_SECRET_KEY'),
          endpoint: env('BUCKET_URL'), // e.g. "s3.fr-par.scw.cloud"
          params: {
            Bucket: env('BUCKET_NAME'),
          },
        }
      },
    },
  },
});
