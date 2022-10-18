defmodule IndyFormSampleWeb.UserIndyFormLive.FormComponent do
  use IndyFormSampleWeb, :live_component

  alias IndyFormSample.Accounts, as: Context

  use IndyForm.FormComponent, context: Context

  @form_key "user"
  @create_action :new
  @edit_action :edit

  form_component(@form_key, @create_action, @edit_action, change_listeners: true)

  def on_init(socket) do
    show_phone? = show_phone?(socket.assigns.row.contact_me)
    show_email? = show_email?(socket.assigns.row.contact_me)
    socket
    |> assign(:show_phone, show_phone?)
    |> assign(:show_email, show_email?)
  end

  defp show_phone?(value) do
    value in [:phone, :phone_email]
  end

  defp show_email?(value) do
    value in [:email, :phone_email]
  end

  def on_value_change(socket, {:contact_me, _old_value, new_value}) do
    show_phone? = show_phone?(new_value)
    show_email? = show_email?(new_value)

    socket
    |> assign(:show_phone, show_phone?)
    |> assign(:show_email, show_email?)
  end

  def on_value_change(socket, _), do: socket
end

  # @impl true
  # def update(%{user: user} = assigns, socket) do
  #   changeset = Accounts.change_user(user)

  #   {:ok,
  #    socket
  #    |> assign(assigns)
  #    |> assign(:changeset, changeset)}
  # end

  # @impl true
  # def handle_event("validate", %{"user" => user_params}, socket) do
  #   changeset =
  #     socket.assigns.user
  #     |> Accounts.change_user(user_params)
  #     |> Map.put(:action, :validate)

  #   {:noreply, assign(socket, :changeset, changeset)}
  # end

  # def handle_event("save", %{"user" => user_params}, socket) do
  #   save_user(socket, socket.assigns.action, user_params)
  # end

  # defp save_user(socket, :edit, user_params) do
  #   case Accounts.update_user(socket.assigns.user, user_params) do
  #     {:ok, _user} ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:info, "User updated successfully")
  #        |> push_redirect(to: socket.assigns.return_to)}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, :changeset, changeset)}
  #   end
  # end

  # defp save_user(socket, :new, user_params) do
  #   case Accounts.create_user(user_params) do
  #     {:ok, _user} ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:info, "User created successfully")
  #        |> push_redirect(to: socket.assigns.return_to)}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, changeset: changeset)}
  #   end
  # end
