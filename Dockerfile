FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS buildstage
WORKDIR /aspnet
COPY ["DevOpsDemo.Client/DevOpsDemo.Client.csproj", "DevOpsDemo.Client/"]
RUN dotnet restore DevOpsDemo.Client/DevOpsDemo.Client.csproj
COPY . .
WORKDIR /aspnet/DevOpsDemo.Client
RUN dotnet build DevOpsDemo.Client.csproj

FROM buildstage AS publishstage
RUN dotnet publish DevOpsDemo.Client.csproj --no-restore -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /deploy
COPY --from=publishstage /app .
CMD [ "dotnet", "DevOpsDemo.Client.dll" ]

