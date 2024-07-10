import { z } from "zod";

export namespace Customer {
  const schema = z.strictObject({
    id: z.number(),
    name: z
      .string()
      .min(2, { message: "O nome deve ter pelo menos 2 letras." })
      .max(50, { message: "O nome deve ter no máximo 50 letras." }),
    email: z.string().email({ message: "Email inválido" }),
    phoneNumber: z.string(),
    whatsapp: z.string(),
    address: z.object({
      street: z.string(),
      number: z.string(),
      complement: z.string().optional(),
      neighborhood: z.string(),
      city: z.string(),
      state: z.string(),
      zipCode: z.string(),
    }),
    createdAt: z.string().datetime(),
    updatedAt: z.string().datetime(),
  });

  export const createSchema = schema.omit({
    id: true,
    createdAt: true,
    updatedAt: true,
  });

  export type Type = z.infer<typeof schema>;
  export type CreateType = z.infer<typeof createSchema>;
}
