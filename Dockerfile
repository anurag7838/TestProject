 FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
 WORKDIR /app
 EXPOSE 80
 FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
 WORKDIR /src
 COPY ["MyFirstProject.csproj", ""]
 RUN dotnet restore "./MyFirstProject.csproj"
 COPY . .
 WORKDIR "/src/."
 RUN dotnet build "MyFirstProject.csproj" -c Release -o /app/build
 FROM build AS publish
 RUN dotnet publish "MyFirstProject.csproj" -c Release -o /app/publish
 FROM base AS final
 WORKDIR /app
 COPY --from=publish /app/publish .
 ENTRYPOINT ["dotnet", "MyFirstProject.dll"]