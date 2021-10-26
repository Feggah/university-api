defmodule ApiWeb.UniversityController do
  use ApiWeb, :controller

  alias Api.Directory
  alias Api.Directory.University

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    universities = Directory.list_universities()
    render(conn, "index.json", universities: universities)
  end

  def create(conn, %{"university" => university_params}) do
    with {:ok, %University{} = university} <- Directory.create_university(university_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.university_path(conn, :show, university))
      |> render("show.json", university: university)
    end
  end

  def show(conn, %{"id" => id}) do
    university = Directory.get_university!(id)
    render(conn, "show.json", university: university)
  end

  def update(conn, %{"id" => id, "university" => university_params}) do
    university = Directory.get_university!(id)

    with {:ok, %University{} = university} <- Directory.update_university(university, university_params) do
      render(conn, "show.json", university: university)
    end
  end

  def delete(conn, %{"id" => id}) do
    university = Directory.get_university!(id)

    with {:ok, %University{}} <- Directory.delete_university(university) do
      send_resp(conn, :no_content, "")
    end
  end
end
