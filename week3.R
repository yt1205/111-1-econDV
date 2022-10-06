#canvas
ggplot(data=...)+
  #layers是一群geom的function,選擇你要的圖形
  geom_...(data=...)+
  geom_...(data=...)



#範例圖

data0=data.frame(
  x=c(1, 2, 3, 4),
  y=c(2, 3, 6, 7),
  alpha_stroke=c(0,10,5,1)
)

ggplot(
  data=data0
)+
  geom_point(
    aes(x=x,y=y,
        stroke=alpha_stroke,
        alpha=alpha_stroke),
    fill="blue",
    size=2,
    color="red",
    shape=21
  )

#資料分組

data0=data.frame(
  x=c(1, 2, 3, 4),
  y=c(2, 3, 6, 7),
  alpha_stroke=c("A","B","A","B")
)
split(data0,data0$alpha_stroke) -> 
  data_split
data_split
# data cleaning /manipulation
ggplot()+
  geom_point( # 透明組
    data=data_split$A,
    aes(
      x=x,y=y
    ),
    alpha=0.4,
    color="red",
    size=3,
  )+
  geom_point(
    data=data_split$B,
    aes(
      x=x, y=y
    ),
    shape=21,
    size=5,
    fill="yellow", # 填色
    color="black", # stroke顏色
    stroke=5
  )

# Google sheets
ggplot(
  data=data1
)+
  geom_line(
    mapping=aes(
      x=Time,
      y=Index1
    ),
    color="black"
  )+
  geom_line(
    mapping=aes(
      x=Time,
      y=Index2
    ),
    color="red"
  )+
  geom_line(
    mapping=aes(
      
      x=Time,
      y=Index3
    ),
    color="green"
  )

###
# pivot wide data to long data
tidyr::pivot_longer(
  data=data1,
  cols=2:4,
  # column names to What
  names_to = "IndexName",
  values_to = "IndexValue"
) -> data1_long

ggplot(
  data=data1_long
)+
  geom_line(
    aes(
      x=Time,
      y=IndexValue,
      color=IndexName
    )
  )
