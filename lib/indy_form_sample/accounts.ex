defmodule IndyFormSample.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias IndyFormSample.Repo

  alias IndyFormSample.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_rows()
      [%User{}, ...]

  """
  def list_rows do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_row!(123)
      %User{}

      iex> get_row!(456)
      ** (Ecto.NoResultsError)

  """
  def get_row!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_row(%{field: value})
      {:ok, %User{}}

      iex> create_row(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_row(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_row(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_row(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_row(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  New user.

  ## Examples

      iex> new_row()
      %User{}
  """
  def new_row() do
    %User{}
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_row(user)
      {:ok, %User{}}

      iex> delete_row(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_row(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> cast_row(user)
      %Ecto.Changeset{data: %User{}}

  """
  def cast_row(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_row(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_row(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
