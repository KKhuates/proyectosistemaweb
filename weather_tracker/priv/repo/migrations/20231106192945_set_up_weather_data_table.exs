defmodule WeatherTracker.Repo.Migrations.SetUpWeatherDataTable do
  use Ecto.Migration
  def up do
    execute("CREATE EXTENSION IF NOT EXISTS timescaledb")
    create tabke(:weather_conditions, primary_key: false)do
      add :timestamp, :naive_datetime, null:false
      add :altitude_m, :decimal, null: false
      add :presurre_pa, :decimal, null: false
      add :temperature_c, :decimal, null: false
      add :co2_eq_ppm, :decimal, null: false
      add :tvoc_ppb, :decimal, null: false
      add :ligth_lumens, :decimal, null: false
    end
    execute("SELECT create_hypertable('weather_condition','timestamp')")
  end
  def down do
    drop table(:weather_conditionsL)
    execute("DROP EXTENSION IF EXISTS timescaledb")
  end
end
