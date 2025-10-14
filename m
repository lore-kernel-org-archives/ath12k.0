Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553D6CCD184
	for <ath12k@archiver.kernel.org>; Tue, 14 Oct 2025 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ngV3me/8DmyF7oHzvUgvhxjjo1DOdZIWbh2YahoE+dE=; b=LUl29Oj6d9a04OsH6fbBGuXr3g
	x8U55XjPPhl6WJuB4fzieSlYHHa1O2zYWydDll35ri2b9ix3lJ89K2awTEpO4RjzHiN2irpleUsVj
	UW6apvkPNv/g9PwDx9It1P+tv+Fy8X8ik+CxSrgaXTA8cXEBIskYmzYeEOEyD77RVqUfT/vO5HL27
	5d2uJI3YOov6Cu0zpZMJlCOpgSgYU1N7bZtGDFJ/Ys4aqDw1RUzTjruQoE6APZ5+6xYqFUSewjXgE
	wW56t1UPNk0cDklz43EioJPvWE7hvE2mf7ol0YihztIFxoA7RlD8MhIt/dAdfx8kIo1OwH3qiG2VL
	2fyyF9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8chM-0000000FxsY-0Hkk;
	Tue, 14 Oct 2025 10:56:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8chJ-0000000Fxs9-3kbh
	for ath12k@lists.infradead.org;
	Tue, 14 Oct 2025 10:56:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ee12807d97so3645585f8f.0
        for <ath12k@lists.infradead.org>; Tue, 14 Oct 2025 03:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760439364; x=1761044164; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ngV3me/8DmyF7oHzvUgvhxjjo1DOdZIWbh2YahoE+dE=;
        b=R6XN/wg81n9I3KzQyhOj8aHiVpIIuzLrMmZffiXNhI3lvlPiUm2dQLE0m8Le6T5yzm
         YTGxrD8psnReh32BjyWMaSBi39cRgRIG3mOVSeSJsbpq7Kg+L9TSqxmlR84MA4x3qCBN
         2wfAkWLyKjOIaCReqqV22K6AsuM1XtYRwKParMkoYqPxxmjN1YhZc3uPcncgyYuC3Y18
         RnW0eQZwOkGumLtoSg10xxY0aWCjAkbnnVoP5wtxK5EWTqRG9zi4oTm2mdt1CvJ3E0iO
         CocizjfaNjnpzKUvGOb+pW9UMTniH5cXUYoh6GYKrpM0fpN52qrErFIrMwd/qZLMJ3Sl
         CA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439364; x=1761044164;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngV3me/8DmyF7oHzvUgvhxjjo1DOdZIWbh2YahoE+dE=;
        b=Hk6n2lE/BUD2qHRWWcDflVSdfB9BTRol7H2ega0AU5t+E9K96BZctbYf7eQ28jbP6l
         V9Oby/u0Fi+sEv/GfL0tHi1mp0VgZusH0Sed32nB95cXFiw/Wi+7NiIthI0Iwh4VjUB7
         RIahnw5oTgdfWjaxJNEwrI5hnqZLDycRVXJVkCdIxjnU7YxqPu/9q53jHo/LhgXZ5fCM
         Eohinh4OUrNJoHWO8dwY1aNDkjM1OabX1JL+O5Xbq1cbH+yct8jUHQ5U1/2KcunEW6Vf
         lBdKo71QDYo/LIP8U5A1zRjh0divvYcr/568bUGOAyBYK/v9tjFBNejADuoI4I6UYYGy
         ilmA==
X-Gm-Message-State: AOJu0YxIH2QmcHB11DoAHdogcnC7Q1oz2D9Hm7JcBcehOgkOE4VWvGsU
	zbn12iB4CTg+69edOLGyeEbCWn1xQxjDSNWzy2uW6Yu6dAWbYA9FVL1+eKwQPlf1GiZSHEOlMQk
	fyiRIHkwDb/+aHLIs6yA6fXqguKBQyVaISnkPO8E=
X-Gm-Gg: ASbGncudvZpkl6C9KhPoHYXTBkwR6aWlgfQcWPv6J8dyKnXmsijTAIfvngZoi3JEhKJ
	M30+6oecZo9hlHW5DDanAz84Wt9upn9jNgOcSo4qe3cVqg/8X+R7hYEOm+izY45SFkEO/TCbSUa
	F1Cif0C9n1El/t9bzb3hChXYmLd6ls+42eBgXUbUQZaDeK7oS/NgdnbE4gEICv1LSWQRxYhCMiQ
	D7pyw/AIvuPHPyP7IU/HbWgQySvD+2Pimm62R5cvVsRD1d2P7wR91hp
X-Google-Smtp-Source: AGHT+IG6YI369mbW5zwkQw9O8kprxPfhNfR4oqb6cHs26NPb5FfGkKEM1jBcg/o+iJyDcmpnhpfEbyrHHATpV0ufyaM=
X-Received: by 2002:a05:6000:2203:b0:425:57dd:58c4 with SMTP id
 ffacd0b85a97d-4266e7d7eb1mr17157093f8f.26.1760439363683; Tue, 14 Oct 2025
 03:56:03 -0700 (PDT)
MIME-Version: 1.0
From: Ross Brown <true.robot.ross@gmail.com>
Date: Tue, 14 Oct 2025 11:55:52 +0100
X-Gm-Features: AS18NWBlYmHaVK0Ti1i6lQ38dOGYpde91GJqMkK3MaqWQHiSKAtEp3nCdS25TXY
Message-ID: <CAMn66qZENLhDOcVJuwUZ3ir89PVtVnQRq9DkV5xjJn1p6BKB9w@mail.gmail.com>
Subject: NCM865 - Linux - Incredibly poor performance
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_035605_972995_64B2CA83 
X-CRM114-Status: UNSURE (   4.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

The NCM865 chipset suffers INCREDIBLY poor performance on Linux -
usually about 1/10th of what adaptors from other vendors are able to
achieve from the same AP and same machine, in the same location.

Fastfetch output:
             .',;::::;,'.                 crystalyne@ross-framework-13
         .';:cccccccccccc:;,.             ----------------------------
      .;cccccccccccccccccccccc;.          OS: Fedora Linux
42.20251014.0 (Silverblue) x86_64
    .:cccccccccccccccccccccccccc:.        Host: Laptop (AC)
  .;ccccccccccccc;.:dddl:.;ccccccc;.      Kernel: Linux 6.16.11-200.fc42.x86_64
 .:ccccccccccccc;OWMKOOXMWd;ccccccc:.     Uptime: 33 seconds
.:ccccccccccccc;KMMc;cc;xMMc;ccccccc:.    Packages: 1521 (rpm), 57 (flatpak)
,cccccccccccccc;MMM.;cc;;WW:;cccccccc,    Shell: bash 5.2.37
:cccccccccccccc;MMM.;cccccccccccccccc:    Display (NE135A1M-NY1):
2880x1920 @ 120 Hz (as 1440x960) in 14" [Built-in]
:ccccccc;oxOOOo;MMM000k.;cccccccccccc:    DE: GNOME 48.5
cccccc;0MMKxdd:;MMMkddc.;cccccccccccc;    WM: Mutter (Wayland)
ccccc;XMO';cccc;MMM.;cccccccccccccccc'    WM Theme: Adwaita
ccccc;MMo;ccccc;MMW.;ccccccccccccccc;     Theme: Adwaita [GTK2/3/4]
ccccc;0MNc.ccc.xMMd;ccccccccccccccc;      Icons: Adwaita [GTK2/3/4]
cccccc;dNMWXXXWM0:;cccccccccccccc:,       Font: Adwaita Sans (11pt) [GTK2/3/4]
cccccccc;.:odl:.;cccccccccccccc:,.        Cursor: Adwaita (24px)
ccccccccccccccccccccccccccccc:'.          Terminal: Ptyxis 48.5
:ccccccccccccccccccccccc:;,..             Terminal Font: Adwaita Mono (11pt)
 ':cccccccccccccccc::;,.                  CPU: 11th Gen Intel(R)
Core(TM) i7-1185G7 (8) @ 4.80 GHz
                                          GPU: Intel Iris Xe Graphics
@ 1.35 GHz [Integrated]
                                          Memory: 2.61 GiB / 15.40 GiB (17%)
                                          Swap: 0 B / 8.00 GiB (0%)
                                          Disk (/): 21.36 MiB / 21.36
MiB (100%) - overlay [Read-only]
                                          Disk (/etc): 34.72 GiB /
491.06 GiB (7%) - btrfs
                                          Local IP (wlp170s0): 192.168.8.191/24
                                          Battery (Framewo): 44% (56
mins remaining) [Discharging]
                                          Locale: en_GB.UTF-8

AP Used for speedtest: GL-iNet Spitz AX X3000 (Performance degradation
seen on all APs, not just this one)

NCM865 speedtest:
speedtest-cli
Retrieving speedtest.net configuration...
Testing from toob (145.40.178.183)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by YouFibre (London) [111.02 km]: 90.277 ms
Testing download
speed................................................................................
Download: 35.88 Mbit/s
Testing upload speed......................................................................................................
Upload: 64.41 Mbit/s

Intel AX210 speedtest:
speedtest-cli
Retrieving speedtest.net configuration...
Testing from toob (145.40.178.183)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by YouFibre (London) [111.02 km]: 8.698 ms
Testing download
speed................................................................................
Download: 551.98 Mbit/s
Testing upload speed......................................................................................................
Upload: 605.40 Mbit/s

Mediatek RZ616 speedtest:
speedtest-cli
Retrieving speedtest.net configuration...
Testing from toob (145.40.178.183)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by YouFibre (London) [111.02 km]: 8.932 ms
Testing download
speed................................................................................
Download: 582.44 Mbit/s
Testing upload speed......................................................................................................
Upload: 618.28 Mbit/s

