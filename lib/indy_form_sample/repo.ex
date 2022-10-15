defmodule IndyFormSample.Repo do
  use Ecto.Repo,
    otp_app: :indy_form_sample,
    adapter: Ecto.Adapters.Postgres
end
