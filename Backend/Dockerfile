FROM mcr.microsoft.com/dotnet/core/runtime:2.2-stretch-slim AS base
WORKDIR /app

EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
COPY ["Super_Groc.sln", "super_groc/"]
COPY . /super_groc/
WORKDIR /super_groc
RUN ls -a
RUN dotnet restore Super_Groc.sln
RUN dotnet build Super_Groc.sln -c Release -o /app

FROM build AS publish
RUN dotnet publish Super_Groc.sln -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Service.dll"]
