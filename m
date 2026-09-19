Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70472C982D8
	for <ath12k@archiver.kernel.org>; Sat, 19 Sep 2026 00:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F7yCcOb3zGW0wm52DDSHOVW0iD2YeayJ4a5hsdIEwKA=; b=YhoRnL5GIKW9r0ID8IVH+9Q+W8
	0Ib8DG4B9g5t3ub73gcJGb/DilpWpCnFYavDj9uO8cPmqoSL8McKj0EJm3cufQwSqXrNVyAta3N+M
	D54XRAJEYWPzeKG+Kz7N+UJgEznqsle1+t/+bbgOWvc+fp3TLgxye1ScuXW+FmAwcmyQ787GzF1vb
	oDP67ihXL37V0YL4Ips9c2TOSbY53B1CCoU6crPtphYKtXoLJ3LnTAF9WOfdBaxzt3WpQ5Ta2m6Fn
	66X6bPsfApbFsqg7YazRv5UphEepcnLM03KNcMIIqRIA9ZP3/Ko0IRINX2Eb6ffCuANgOvRTk2DWy
	8i6+4KlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iiq-0000000Fji0-1sMA;
	Sat, 19 Sep 2026 00:14:28 +0000
Received: from mail-oi2-x18.google.com ([2607:f8b0:4864:32::18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iin-0000000Fjhc-3NNf
	for ath12k@lists.infradead.org;
	Sat, 19 Sep 2026 00:14:26 +0000
Received: by mail-oi2-x18.google.com with SMTP id 46e09a7af769-7f4f1354076so288341a34.1
        for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 17:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789776861; cv=none;
        d=google.com; s=arc-20260327;
        b=ErFPaeDWToXyfh2v59spuuZahix7LJZkWb+KkwthRtg3jsQKrW7aONL0ZyLI4gdHte
         x1DiyD+SDjRrS/piZNcjnguiBt70Y/WfkwA8P9f0TmiBbsEqOZTb17zOCS3HdabgVbmQ
         VI1dcIo+DosEE+FyUEmWk3ZZuzVXCTWasZMsMxCtv9lN3WYLLR1covwRbpf8OmlgHKdi
         dznJxxMNxtbdbudRam3I/IB8EowaLQAVYCK906hskcllyjb/R9OAXaIe4300rNn23612
         2MdeSLCpEj5TeAJNfhtPqUqZE6wNaIo53REhnGmPvH9/GzKVziDmm96pd8FBSh98PctQ
         YSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=F7yCcOb3zGW0wm52DDSHOVW0iD2YeayJ4a5hsdIEwKA=;
        fh=snW9gIRUeZOKqjHnVm/eaZYZd/EBxCoeJiLAKSNdhCk=;
        b=QN+x634qwhP8M87qNED3Kk7xONsMdy4a6bQRR8mXlAe0Z6EyGZmGjiemylaK/hYczQ
         5ZCbPwMCAi1W5IBMTKmvEkDdFLTuan88A2HhNC4ohaYahB+GJV9pBPWSzUvtJI+Hs6yb
         u87iw2UyXUq58Sv9C02rLapIyFI+mFT2n0Hd2sEWi+s38kmXhP0TAO5HwymdOhq6jC2C
         uWZ7WKJ23OTD7cPl8oattMEjqz9ynZZAcOxb3RP1FDXa1nZEnSskWaQ0M0u8wFPwqLM+
         3vWDUPReGyFGlt60AwJU4HayQyPsomyYksR/3pC8Z96llM+oGUpOnCLFs8FRl5Zx9mky
         ERlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789776861; x=1790381661; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7yCcOb3zGW0wm52DDSHOVW0iD2YeayJ4a5hsdIEwKA=;
        b=E9q31UcirHSw16NFfpAZbadV3D5Re+Ak5agHuLcMXPVQ22vnCO1Mcp6hj6h2ynKJat
         LLKZE9LqL2ZZQd3UIbI4AlMZo2VyBPnyTUKPJY9TihLReqzJVuio0gVhTLRuH8UVz24b
         B/kGmeIW/STTFp34pnMJ0qQKbKYbWKMdRbSA+zG6HQfau9aM2oHwUx9zQAVQzBbRyLhV
         QRG3X/a2/ejFUmCsEVACn9ABxfzInZaRfHgcPmsrdoXXq1bsMAwluxNHDkoIirTYNazz
         fReP3pyun+8KE7JFMlGAh23TikC5gqysqTQ7agDmgAny4RXt41X88RC5A45iHTBJVPrh
         Iwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789776861; x=1790381661;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F7yCcOb3zGW0wm52DDSHOVW0iD2YeayJ4a5hsdIEwKA=;
        b=A1C9jmPILvrP2Jk7rQT9mkQzoaIXAPl2Y1JY8RhY3xFZ+ii58TsffgA/4C1v53KKS2
         B0tsc5e2pHEkeI0Hxwt3NdIMUwIgNBcRYo1V8THlLSCXjzdlOuYDq6yfPkVjn4AGs0bD
         PDk3L2kp4rTKwbgm4+bYuPz4oncc9kJkIlf3icSbg/+W+TsYkHRhKxqnOwedfxV5/B8d
         4o5L/rd+zGkz/dmdDnEmTNNh79Ilr4nO0canjabw4B1+0GvIKlSEzhZG61uUMQwgYjqC
         hgM0aAWrvnHOqDy9diaKomzYKSEsJyUL++VHmX6C90rhGwimwJzyPqTSOHX9qxXrHtC1
         1jgQ==
X-Gm-Message-State: AFuF++nrm0Vc1IgCfD8OcXFKwU3tD2asnt1+dGrA2DrywJXBzjWS+d9a
	qwsOwqc4uw7FKXqFSMMSabL0hxEdaEjDcaV+FLmxmPNg/34kEuEchMk7udn7zsfzbrMV7Ecat/q
	mXs0c+c6aW9MOiniML2ffCHl/fYJ9zD8rSQ0SBSBos/gI
X-Gm-Gg: AYBFou0G7vvYzNhvkhtcPCeIxjFj70SGeMWQRy1GyQPqSm7LilvxmfKmWzoYUD5QQZo
	Nx6wTi1PzEfDOfP2zMT6wzLbi91W00UdS/rJuThTJemui2y39NX3mGmtgYCnVkDerboHB3lKFmn
	htDaoZol76RjD+/Rpo5XhJ3ZVb3QFp7c/ip+HxAg06HPhoqbNND6VhtcGtgvi1TKDfGkR2skUGo
	2d4jJQqM4Mivwd5F6oQ85sa9KRlpxyrHLcGj+DPPhsVCgphxJtmpufD/DrEBEPc60GuFSi7TqLz
	vy2EEL6e3vF84PYvr6HJOzKP0XR8rPn0U/nb+ESCgfiklMLkGKmbjqocz8WR/VCgos+PB8wYy1h
	2ChLzBc+6+/A=
X-Received: by 2002:a05:6820:4c0e:b0:6bd:b927:672f with SMTP id
 006d021491bc7-6ca90d95792mr3392259eaf.9.1789776861475; Fri, 18 Sep 2026
 17:14:21 -0700 (PDT)
MIME-Version: 1.0
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 19 Sep 2026 01:13:45 +0100
X-Gm-Features: AcwNN1ViQ_B0Zd0gt7Bx9VZopK9doBcppxekD88aARRC7XnDy5E2g43kBAgubvc
Message-ID: <CAFcmK8h2nv5VPFErt-E93G6cKb-Ju33hfc=pSrTABK7nu_4kRg@mail.gmail.com>
Subject: WCN7850 on Surface Pro 11: no board-2.bin entry, firmware reports no
 board ID
To: ath12k@lists.infradead.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_171425_877785_9CE54BD5 
X-CRM114-Status: GOOD (  11.80  )
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

Hi,

The WCN7850 in the Microsoft Surface Pro 11 (X1E80100) finds no entry in
ath12k/WCN7850/hw2.0/board-2.bin and falls through to the board.bin
API-1 path. I am looking for some advice on what the correct fix is.

The device reports:

  chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
  PCI 17cb:1107, subsystem 17cb:1107

A debug print in ath12k_qmi_request_target_cap() shows board_info is
absent from the capability response:

  cap_resp board_info_valid 0 chip_info_valid 1 soc_info_valid 1

chip_info and soc_info are present, so the response itself is fine. The
0xff is ATH12K_BOARD_ID_DEFAULT, substituted by the driver.

The names ath12k then looks up are:

  bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=1107,qmi-chip-id=2,qmi-board-id=255
  bus=pci,qmi-chip-id=2,qmi-board-id=255

Neither exists in board-2.bin (linux-firmware-atheros 20260810-2).
The only subsystem-device=1107 entries there are qmi-board-id=44 and
qmi-board-id=82.

Using a different entry from the same board-2.bin as board.bin does work
(i.e. extract using ath12k-bdencoder and rename). I have been running
the subsystem-device=3378, qmi-board-id=255 entry, which associates and
passes traffic normally. That may be another board's data rather than a fix,
but it does suggest the firmware accepts entries from this
linux-firmware release, and that what is missing is an entry under a
name this device derives.

I also checked what Windows provides:

  - Windows loads bdwlan.elf on this machine, via the catch-all
    PCI\VEN_17CB&DEV_1107 section of qcwlanhmt8380.inf. The same file
    appears in that driver for several other 8380 devices, so it is not
    Surface-specific.

  - That file fails against the upstream firmware with -110 ("qmi failed
    to load bdf file"). It works if the Windows firmware and PHY ucode
    are used with it, so the data is valid for the part but looks tied
    to the firmware version:

    Windows:  WLAN.HMT.1.1.c5-00310-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
    upstream: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

What is the right way to give this device board data? Happy to provide
further info or test patches.

Thanks,
Dale

