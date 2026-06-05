$path = "e:\vibe code\DISTRIK AITINYO UTARA\distrik_aitinyo_utara.html"
$c = Get-Content -Path $path -Encoding UTF8 -Raw

$reps = @{
    # Layanan Publik
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Administrasi Kependudukan</div>' = '<div class="layanan-ikon">📋</div><div class="layanan-nama">Administrasi Kependudukan</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Perizinan Usaha</div>' = '<div class="layanan-ikon">🏗️</div><div class="layanan-nama">Perizinan Usaha</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Mediasi &amp; Sengketa</div>' = '<div class="layanan-ikon">⚖️</div><div class="layanan-nama">Mediasi &amp; Sengketa</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Pemberdayaan Kampung</div>' = '<div class="layanan-ikon">🌾</div><div class="layanan-nama">Pemberdayaan Kampung</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Pendidikan &amp; Sosial</div>' = '<div class="layanan-ikon">🎓</div><div class="layanan-nama">Pendidikan &amp; Sosial</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Lingkungan &amp; Adat</div>' = '<div class="layanan-ikon">🌿</div><div class="layanan-nama">Lingkungan &amp; Adat</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Kesehatan Masyarakat</div>' = '<div class="layanan-ikon">🏥</div><div class="layanan-nama">Kesehatan Masyarakat</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Data &amp; Statistik</div>' = '<div class="layanan-ikon">📊</div><div class="layanan-nama">Data &amp; Statistik</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Pengaduan Online</div>' = '<div class="layanan-ikon">💬</div><div class="layanan-nama">Pengaduan Online</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Peta Wilayah</div>' = '<div class="layanan-ikon">🗺️</div><div class="layanan-nama">Peta Wilayah</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Bantuan Sosial</div>' = '<div class="layanan-ikon">🤝</div><div class="layanan-nama">Bantuan Sosial</div>'
    '<div class="layanan-ikon">.*?</div><div class="layanan-nama">Penghargaan</div>' = '<div class="layanan-ikon">🏆</div><div class="layanan-nama">Penghargaan</div>'

    # Topbar & others
    '<span>.*? Zona Waktu: WIT \(UTC\+9\)</span>' = '<span>🕐 Zona Waktu: WIT (UTC+9)</span>'
    'padding:3px 10px;">.*? Masuk</a>' = 'padding:3px 10px;">🔐 Masuk</a>'
    '<span>.*? Minggu, 31 Mei 2026</span>' = '<span>📅 Minggu, 31 Mei 2026</span>'
    '<a href="#" class="nav-btn">.*? Pengaduan</a>' = '<a href="#" class="nav-btn">📢 Pengaduan</a>'
    '<div class="ticker-label">.*? Pengumuman</div>' = '<div class="ticker-label">📢 Pengumuman</div>'
    
    # Berita Tgl
    '<div class="meta">.*? 28 Mei 2026 &nbsp;\|&nbsp; .*? 324 pembaca</div>' = '<div class="meta">📅 28 Mei 2026 &nbsp;|&nbsp; 👀 324 pembaca</div>'
    '<div class="mini-tgl">.*? 20 Mei 2026</div>' = '<div class="mini-tgl">📅 20 Mei 2026</div>'
    '<div class="mini-tgl">.*? 15 Mei 2026</div>' = '<div class="mini-tgl">📅 15 Mei 2026</div>'
    '<div class="mini-tgl">.*? 10 Mei 2026</div>' = '<div class="mini-tgl">📅 10 Mei 2026</div>'
    '<div class="mini-tgl">.*? 5 Mei 2026</div>' = '<div class="mini-tgl">📅 5 Mei 2026</div>'

    # Sistem Pemda
    '<span class="sistem-ikon">.*?</span>SIPD' = '<span class="sistem-ikon">🖥️</span>SIPD'
    '<span class="sistem-ikon">.*?</span>OSS' = '<span class="sistem-ikon">🏢</span>OSS'
    '<span class="sistem-ikon">.*?</span>Satu Data' = '<span class="sistem-ikon">📊</span>Satu Data'
    '<span class="sistem-ikon">.*?</span>SIPPN' = '<span class="sistem-ikon">⭐</span>SIPPN'
    '<span class="sistem-ikon">.*?</span>Cek Bansos' = '<span class="sistem-ikon">🤲</span>Cek Bansos'
    '<span class="sistem-ikon">.*?</span>SIKS-NG' = '<span class="sistem-ikon">👨‍👩‍👧</span>SIKS-NG'
    '<span class="sistem-ikon">.*?</span>e-Kinerja' = '<span class="sistem-ikon">📈</span>e-Kinerja'
    '<span class="sistem-ikon">.*?</span>MyASN' = '<span class="sistem-ikon">👤</span>MyASN'
    '<span class="sistem-ikon">.*?</span>SIMBG' = '<span class="sistem-ikon">🏗️</span>SIMBG'
    '<span class="sistem-ikon">.*?</span>SRIKANDI' = '<span class="sistem-ikon">📁</span>SRIKANDI'
    '<span class="sistem-ikon">.*?</span>e-SAKIP' = '<span class="sistem-ikon">📝</span>e-SAKIP'
    
    # Arrows
    'Jelajahi Wisata .*?<' = 'Jelajahi Wisata →<'
    'Pelajari Lebih .*?<' = 'Pelajari Lebih →<'
    
    # Pengaduan section
    'class="btn-emas">.*? E-LAPOR' = 'class="btn-emas">🌐 E-LAPOR'
    'class="btn-putih">.*? Hubungi Langsung' = 'class="btn-putih">✉️ Hubungi Langsung'
    'class="btn-putih">.*? Whistleblowing' = 'class="btn-putih">⚠️ Whistleblowing'
    
    # Kontak icons
    '<span style="font-size:20px;flex-shrink:0;">.*?</span>\s*<div><div style="font-size:11px;color:#999;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Jam Pelayanan' = '<span style="font-size:20px;flex-shrink:0;">🕐</span><div><div style="font-size:11px;color:#999;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Jam Pelayanan'
    '<span style="font-size:20px;flex-shrink:0;">.*?</span>\s*<div><div style="font-size:11px;color:#999;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Alamat' = '<span style="font-size:20px;flex-shrink:0;">🌍</span><div><div style="font-size:11px;color:#999;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Alamat'
    '<span style="font-size:20px;flex-shrink:0;">.*?</span>\s*<div><div style="font-size:11px;color:#999;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Kontak' = '<span style="font-size:20px;flex-shrink:0;">📞</span><div><div style="font-size:11px;color:#999;text-transform:uppercase;letter-spacing:1px;margin-bottom:3px;">Kontak'
}

foreach ($k in $reps.Keys) {
    $c = [regex]::Replace($c, $k, $reps[$k])
}

$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllText($path, $c, $Utf8NoBomEncoding)
