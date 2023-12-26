import react from "@vitejs/plugin-react";
import { defineConfig } from "vite";
import FullReload from "vite-plugin-full-reload";
import RubyPlugin from "vite-plugin-ruby";

export default defineConfig({
  plugins: [
    react(),
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 200 }),
  ],
});
