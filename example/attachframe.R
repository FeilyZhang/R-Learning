id <- c(1, 2, 3, 4)
name <- c("Feily Zhang", "Haoyue Li", "Xin Chen", "Mingfeng He")
sex <- c("male", "female", "male", "male")
score <- c(99, 100, 99, 99)
frame <- data.frame(id, name, sex, score)
attach(frame)
  id <- id + score
  print(id)
  print(frame$id)
  frame$id <- id + score
detach(frame)
print(frame)