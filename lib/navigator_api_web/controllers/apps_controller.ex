defmodule NavigatorApiWeb.AppsController do
  use NavigatorApiWeb, :controller

  @mock_data [
    %{
      id: 1,
      name: "Intranet",
      link: "https://intranet.bank.com",
      description: "Internal company portal for communication and resources.",
      details: "Access HR policies, IT support, and internal announcements."
    },
    %{
      id: 2,
      name: "Expense Tracker",
      link: "https://expenses.bank.com",
      description: "Tool for tracking and submitting company expenses.",
      details: "Submit expense reports, track reimbursement status, and view company expense policies."
    },
    %{
      id: 3,
      name: "Project Management",
      link: "https://projects.bank.com",
      description: "Collaborative project management tool.",
      details: "Track project progress, assign tasks, and manage deadlines with your team."
    }
  ]

  # GET /api/apps
  def index(conn, _params) do
    # Vrací pouze základní údaje
    basic_data = Enum.map(@mock_data, fn app ->
      %{id: app.id, name: app.name, link: app.link, description: app.description}
    end)

    json(conn, basic_data)
  end

  # GET /api/apps/:id
  def show(conn, %{"id" => id}) do
    # Najde detail aplikace podle ID
    case Enum.find(@mock_data, fn app -> app.id == String.to_integer(id) end) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Application not found"})

      app ->
        json(conn, app)
    end
  end
end
