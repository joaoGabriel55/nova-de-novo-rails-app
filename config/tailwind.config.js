const defaultTheme = require("tailwindcss/defaultTheme");
const colors = require("tailwindcss/colors");

module.exports = {
  mode: "jit",
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
    "./node_modules/flowbite/**/*.js",
  ],
  theme: {
    screens: {
      sm: "480px",
      md: "768px",
      lg: "976px",
      xl: "1440px",
    },
    colors: {
      gray: colors.coolGray,
      blue: colors.lightBlue,
      red: colors.rose,
      pink: colors.fuchsia,
      primary: {
        50: "#fcf5f4",
        100: "#fae7e6",
        200: "#f7d4d1",
        300: "#f0b5b1",
        400: "#e58a84",
        500: "#d6655d",
        600: "#c6554d",
        700: "#a23a33",
        800: "#87332d",
        900: "#71302b",
        950: "#3d1512",
      },
      secondary: {
        50: "#fdfaef",
        100: "#fbf3d9",
        200: "#f5e4b3",
        300: "#efd082",
        400: "#e8b657",
        500: "#e19c2e",
        600: "#d38323",
        700: "#af671f",
        800: "#8c5120",
        900: "#71431d",
        950: "#3d220d",
      },
    },
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      spacing: {
        128: "32rem",
        144: "36rem",
      },
      borderRadius: {
        "4xl": "2rem",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    require("flowbite/plugin"),
  ],
};
