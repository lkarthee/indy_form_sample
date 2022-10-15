defmodule IndyFormSample.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IndyFormSample.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        contact_me: :none,
        email: "some email",
        name: "some name",
        phone: "some phone"
      })
      |> IndyFormSample.Accounts.create_user()

    user
  end
end
