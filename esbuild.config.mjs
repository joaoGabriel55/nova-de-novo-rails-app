const entryPoints = ["application.ts"];
const watchDirectories = [
  "./app/javascript/**/*.{js,ts,tsx,jsx}",
  "./app/views/**/*.html.erb",
  "./app/assets/builds/**/*.css", // Wait for cssbundling changes
  "./config/locales/**/*.yml",
];
