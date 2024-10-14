# SMTP Sunucu Bilgileri
$smtpServer = "smtp.google.com"  # SMTP sunucu adresi (Örnek: Gmail için "smtp.gmail.com")
$smtpFrom = "edemresearcher@gmail.com"  # Gönderen e-posta adresi
$smtpTo = "edem4054@gmail.com"  # Alıcı e-posta adresi
$messageSubject = "Dosya Transferi"
$messageBody = "İşte istediğiniz dosyalar."
$smtpUser = "edemresearcher@gmail.com"  # SMTP Kullanıcı Adı (E-posta adresi)
$smtpPassword = 'yywj dbel rkgd eobc' # SMTP Şifresi (E-posta şifresi)

# Gönderilecek Dosya
$attachment = "C:\Users\Kullanici\Masaüstü\dosya.txt"

# E-posta Mesajı Ayarları
$message = New-Object system.net.mail.mailmessage
$message.from = $smtpFrom
$message.To.Add($smtpTo)
$message.Subject = $messageSubject
$message.Body = $messageBody

# Dosya Eki
$attachment = New-Object System.Net.Mail.Attachment($attachment)
$message.Attachments.Add($attachment)

# SMTP Client Ayarları
$smtp = New-Object Net.Mail.SmtpClient($smtpServer)
$smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPassword)
$smtp.EnableSsl = $true

# E-posta Gönder
$smtp.Send($message)

# İşlem Tamamlanınca Çıkış
exit
