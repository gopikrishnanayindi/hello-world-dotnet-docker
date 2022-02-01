FROM quay.io/sreejithvh6/dotnetimage:latest
##RUN mkdir -p /app

# copy csproj and restore as distinct layers
COPY *.csproj /app

WORKDIR /app
RUN dotnet restore


RUN dotnet publish -c Release -o out

ENTRYPOINT ["dotnet", "aspnetapp.dll"]