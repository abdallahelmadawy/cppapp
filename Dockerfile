FROM gcc:13 AS build
WORKDIR /src
COPY . .
RUN g++ -O2 *.cpp -o app

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=build /src/app /app/app
EXPOSE 8080
CMD ["/app/app"]
