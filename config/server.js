module.exports = ({ env }) => ({
  host: env('CMS_HOST', '0.0.0.0'),
  port: env.int('CMS_PORT', 1337),
  app: {
    keys: env.array('APP_KEYS'),
  },
});
