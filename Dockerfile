FROM quay.io/sreejithvh6/dotnetimage:latest
WORKDIR /app
# copy csproj and restore as distinct layers
COPY *.csproj ./dotnetapp/
WORKDIR /app/dotnetapp
RUN nuget restore

# copy and build everything else
WORKDIR /app/
COPY . ./dotnetapp/
WORKDIR /app/dotnetapp
RUN dotnet publish -c Release -o out