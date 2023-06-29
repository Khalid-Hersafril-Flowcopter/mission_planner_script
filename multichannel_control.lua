function update()
    gcs:send_text(0, "Hello world")

    return update, 100
end