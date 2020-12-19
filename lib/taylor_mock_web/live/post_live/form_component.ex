defmodule TaylorMockWeb.PostLive.FormComponent do
  @moduledoc """
  Component for handing actions from the blog post form.
  """
  use TaylorMockWeb, :live_component

  @impl true
  def update(%{post: post} = assigns, socket) do
    changeset = TaylorMock.Blog.change_post(post)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"post" => post_params}, socket) do
    changeset =
      socket.assigns.post
      |> TaylorMock.Blog.change_post(post_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  @impl true
  def handle_event("save", %{"post" => post_params}, socket) do
    case TaylorMock.Blog.create_post(socket.assigns.current_user, post_params) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Post created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
