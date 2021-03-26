%{
  configs: [
    %{
      name: "default",
      strict: true,
      checks: [
        {Credo.Check.Readability.StrictModuleLayout}
      ]
    }
  ]
}
