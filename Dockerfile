
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env

#FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env


# FROM quay.io/sreejithvh6/dotnetimage:latest
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./


RUN dotnet restore
COPY . ./

RUN dotnet publish -c Release -o out

ENTRYPOINT ["dotnet", "aspnetapp.dll"]