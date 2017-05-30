defmodule Mix.Tasks.ItemsTest do
  alias Mix.Tasks.Items

  use ItemsApi.ConnCase

  test "one item match to be removed" do
    Repo.insert! %ItemsApi.Item{id: 1, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/bhdfdypytj6fksfbdtph.jpg", item_removal_date: DateTime.utc_now |> Ecto.Date.cast!}

    today = DateTime.utc_now
    Items.remove(today)
    assert length(Repo.all(ItemsApi.Item)) == 0
  end

  test "two items match to be removed" do
    Repo.insert! %ItemsApi.Item{id: 1, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/bhdfdypytj6fksfbdtph.jpg", item_removal_date: DateTime.utc_now |> Ecto.Date.cast!}
    Repo.insert! %ItemsApi.Item{id: 2, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/sdfssdfsdf6fksfbdtph.jpg", item_removal_date: DateTime.utc_now |> Ecto.Date.cast!}

    today = DateTime.utc_now
    Items.remove(today)
    assert length(Repo.all(ItemsApi.Item)) == 0
  end

  test "Some items matched to be removed" do
    Repo.insert! %ItemsApi.Item{id: 1, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/bhdfdypytj6fksfbdtph.jpg", item_removal_date: nil}
    Repo.insert! %ItemsApi.Item{id: 2, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/sdfssdfsdf6fksfbdtph.jpg", item_removal_date: nil}
    Repo.insert! %ItemsApi.Item{id: 3, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/bhdfdypytj6fksfbdtph.jpg", item_removal_date: DateTime.utc_now |> Ecto.Date.cast!}
    Repo.insert! %ItemsApi.Item{id: 4, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/sdfssdfsdf6fksfbdtph.jpg", item_removal_date: DateTime.utc_now |> Ecto.Date.cast!}

    today = DateTime.utc_now
    Items.remove(today)
    assert length(Repo.all(ItemsApi.Item)) == 2
  end

  test "No items match to be removed" do
    Repo.insert! %ItemsApi.Item{id: 1, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/bhdfdypytj6fksfbdtph.jpg", item_removal_date: nil}
    Repo.insert! %ItemsApi.Item{id: 2, image: "http://res.cloudinary.com/my-lost-pet/image/upload/v1489935267/sdfssdfsdf6fksfbdtph.jpg", item_removal_date: nil}

    today = DateTime.utc_now
    Items.remove(today)
    assert length(Repo.all(ItemsApi.Item)) == 2
  end

  test "image removing from cloudinary return error, so it should not delete items from db" do
    Repo.insert! %ItemsApi.Item{id: 1, image: "", item_removal_date: DateTime.utc_now |> Ecto.Date.cast!}
    Repo.insert! %ItemsApi.Item{id: 2, image: "", item_removal_date: DateTime.utc_now |> Ecto.Date.cast!}

    today = DateTime.utc_now
    Items.remove(today)
    assert length(Repo.all(ItemsApi.Item)) == 2
  end
end
