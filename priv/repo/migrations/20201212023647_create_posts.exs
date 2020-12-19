defmodule TaylorMock.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:title, :string, null: false)
      add(:body, :text, null: false)
      add(:user_id, references(:users, on_delete: :delete_all), null: false)
      timestamps()
    end

    create(unique_index(:posts, [:title]))
    create(index(:posts, [:user_id]))
  end
end
