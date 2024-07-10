import { getNationStateCities, getNationStates } from "@/infra/http/location";
import { useQuery } from "@tanstack/react-query";
import { useState } from "react";

export const useStatesCities = () => {
  const [selectedState, setSelectedState] = useState("RN");

  const { data: states } = useQuery({
    queryKey: ["states"],
    queryFn: getNationStates,
  });

  const { data: cities } = useQuery({
    queryKey: [`states/${selectedState}`],
    queryFn: () => getNationStateCities({ state: selectedState }),
  });

  return {
    states: states || [],
    cities: cities || [],
    onStateChange: setSelectedState,
  };
};
