import { useStatesCities } from "@/infra/hooks/use-state-cities";
import {
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/lib/components/form";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/lib/components/select";
import React from "react";
import { Control } from "react-hook-form";

type Props = {
  formControl: Control;
  stateFormName: string;
  cityFormName: string;
};

export const StateCitySelect = ({
  formControl,
  stateFormName,
  cityFormName,
}: Props) => {
  const { states, cities, onStateChange } = useStatesCities();

  return (
    <>
      <FormField
        control={formControl}
        name={stateFormName}
        render={({ field }) => (
          <FormItem>
            <FormLabel>Estado</FormLabel>
            <Select
              required
              onValueChange={(value) => {
                field.onChange(value);
                onStateChange(value);
              }}
              value={field.value}
            >
              <FormControl>
                <SelectTrigger>
                  <SelectValue placeholder="Selecione..." />
                </SelectTrigger>
              </FormControl>
              <SelectContent>
                {states.map((state) => (
                  <SelectItem key={state} value={state}>
                    {state}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
            <FormMessage />
          </FormItem>
        )}
      />
      <FormField
        control={formControl}
        name={cityFormName}
        render={({ field }) => (
          <FormItem>
            <FormLabel>Cidade</FormLabel>
            <Select required onValueChange={field.onChange} value={field.value}>
              <FormControl>
                <SelectTrigger>
                  <SelectValue placeholder="Selecione..." />
                </SelectTrigger>
              </FormControl>
              <SelectContent>
                {cities.map((state) => (
                  <SelectItem key={state} value={state}>
                    {state}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
            <FormMessage />
          </FormItem>
        )}
      />
    </>
  );
};
