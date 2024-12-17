program Gravitasi;

uses crt;

type
  TPlanet = record
    Nama: string;
    Gravitasi: real; 
  end;

var
  Planets: array[1..8] of TPlanet;
  PilihanPlanet: integer;
  Massa, Jarak, Kecepatan: real;

function HitungKecepatan(g: real; jarak: real): real;
begin
  HitungKecepatan := sqrt(2 * g * jarak);
end;

procedure TampilkanPlanets;
var
  i: integer;
begin
  writeln('Daftar Planet:');
  for i := 1 to Length(Planets) do
    writeln(i, '. ', Planets[i].Nama, ' (Gravitasi: ', Planets[i].Gravitasi:0:2, ' m/s^2)');
end;

begin
  clrscr;

  Planets[1].Nama := 'Merkurius'; Planets[1].Gravitasi := 3.7;
  Planets[2].Nama := 'Venus'; Planets[2].Gravitasi := 8.87;
  Planets[3].Nama := 'Bumi'; Planets[3].Gravitasi := 9.8;
  Planets[4].Nama := 'Mars'; Planets[4].Gravitasi := 3.71;
  Planets[5].Nama := 'Jupiter'; Planets[5].Gravitasi := 24.79;
  Planets[6].Nama := 'Saturnus'; Planets[6].Gravitasi := 10.44;
  Planets[7].Nama := 'Uranus'; Planets[7].Gravitasi := 8.69;
  Planets[8].Nama := 'Neptunus'; Planets[8].Gravitasi := 11.15;

  repeat
    clrscr;
    TampilkanPlanets;
    writeln;
    write('Pilih planet yang telah di sediakan (1-8, atau 0 untuk langsung keluar): ');
    readln(PilihanPlanet);

    if (PilihanPlanet < 0) or (PilihanPlanet > 8) then
      writeln('Pilihan anda tidak valid!')
    else if PilihanPlanet > 0 then
    begin

      writeln('Planet yang dipilih: ', Planets[PilihanPlanet].Nama);
      writeln('Gravitasi: ', Planets[PilihanPlanet].Gravitasi:0:2, ' m/s^2');
      writeln;

     
      write('Masukkan massa benda dalam kg: ');
      readln(Massa);
      write('Masukkan jarak jatuh benda dalam meter: ');
      readln(Jarak);

      Kecepatan := HitungKecepatan(Planets[PilihanPlanet].Gravitasi, Jarak);

      writeln;
      writeln('Hasil perhitungan:');
      writeln('Kecepatan benda saat mencapai tanah: ', Kecepatan:0:2, ' m/s');
      writeln;
      write('Tekan Enter untuk kembali ke menu awwal...');
      readln;
    end;
  until PilihanPlanet = 0;

  writeln('selesai, semoga program ini membantu.');
end.