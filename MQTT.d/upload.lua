return function (item)
    print("Uploading",item.name)
    file.open(item.name,"w")
    file.write(item.content)
    file.close()
end