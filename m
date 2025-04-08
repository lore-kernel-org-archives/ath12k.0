Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71674C369A5
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m6NoS6tSTLHJBTzmLdQ/GO+z95NzVibJaNFXoO+LAVQ=; b=zSIWz9aXjXJ4GP0eJGeK9qBgD4
	r3hE4WFR0f7wtlFwTiPBGuQTU47HO+5RioICLgk4GcZ7WvIi9LuRTQ25ZkxATGT6wrx5a3yD1XcOj
	R1tm2svnKfPFmTySerMh+VcHH6BqkUMI8OWkM/o7pCL2nUhOwRKYoAwc5Z3kegh+5yyiWG1G8ndJC
	REJT64q+VYJ9WjmeZ/slhTjqq0RAf3q54j8z2MpVyn65k2MWYgMkqkfT1uaR64u7qvf8I/5W9zuQ+
	bo1AZaewUzWXvXwBlwYA8vmrBftggtub3zAIxKjMmV9jz7gtujJaKZsSC5U823oAguMsDiiDlJfiv
	ZbYYUPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DuL-000000058lV-0sbn
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 18:42:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CUO-00000004vqn-3TRN
	for ath12k@bombadil.infradead.org;
	Tue, 08 Apr 2025 17:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=m6NoS6tSTLHJBTzmLdQ/GO+z95NzVibJaNFXoO+LAVQ=; b=koGtprtrfyoLqJAWMCGNIRx7KK
	aWc/EQNEZ/zSndtscrfISiUBtDIUd56b3conAB6xLi7NfNbfiXSETj1h4jYC7cf3h6rLDwaWz1JIU
	hJovXk1FEUPhR2WQy+NbEpXLERnIK6dobJdZyMd68i23cNv9A5wLX8Ej4lrcF+IJyL5NfF9pwN86p
	Zeerbqi1Y7X3GA1r2PPqmOMXaEA/insAU17p5kRWySFrfcHCj/P/y5eujq4SBOXTro90gpK/VGo9v
	Mq8FMSOHgoaZqub4LG47J+1Zdd2D7vo28f+dSZfsW9A7EhFC358bv5ACY977UvRXg/1+qx9230GLH
	vwujPE9w==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2CUH-00000008LMD-1CVe
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 17:11:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2295d78b433so58325525ad.2
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 10:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744132298; x=1744737098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6NoS6tSTLHJBTzmLdQ/GO+z95NzVibJaNFXoO+LAVQ=;
        b=K1pw2jIlmS1YoPQdAwgHb9aocJ0J6euaY71sUl/9eknzHC6OjxZ6h4p8hejuwFtPgB
         OkRjjog1wpP9HM685tKIHr+3pUqmf4fPO4ij8RGqfHv+cLx7q+wCo/A188UaYhB2/D8j
         QiQNeEMggRAUDLAlx/qACYHJUdbwCeqs9MfUgAvULpORzGz0+BeLw2/mXO3eGbFeMGiH
         ZY65oRPhWglUUc3CiJ6T74fHR0Jxog0Wp82SM8cM8/lxql6zYEg56TYf7rgB58si5nrk
         FlMkCmjl8rUMIwrppMw1kegRd9uG/ejCPh0vfXRTjJ/0k3d3jsabMJXYheNXg4U781Y7
         NyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744132298; x=1744737098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6NoS6tSTLHJBTzmLdQ/GO+z95NzVibJaNFXoO+LAVQ=;
        b=fwu4KV38Vrl7qdT3n4U28I1C5/tkLeUGgjtzJdFR5jeHpenPcKio7iEZ3L+XlE5MOG
         kWVmt5p0LjCPPBUxzwBu8ZDHNq7kclK8gSg8Qbx9L3vxsMgPA5iwL89ueVgCgScZCz2r
         ioX4GiUCVNRkggeruUZFchLsvIGBgipkyW/e4u6ILD3dTFSkVqLPJAykcSGD3HVl4kmH
         j32T0O9Mq99ggIkX2ykkFdUffB0zNDzd2JKsMZqVILmhCIrlye1BP8Es8imPcgHJuuRg
         2FmlDhyzCGKoI1QHWUwqT85GsKpnaxhQnfQfK8Z8V1zlHfzRvNVehysIw5Q2GifpNbL5
         jBfA==
X-Gm-Message-State: AOJu0YwUCTznQv4fRtIzsd2b8jTNn0NKxwu+sTsi0M7R+x/UoxMHOI+1
	Bq0x1Sqdh8aZy+4II+7ELOF8KIXYEwnk30jp/LRA6cB9iq9mwKVfETeLmHuqi7I=
X-Gm-Gg: ASbGncsRTVNc9iV51EZB2DT3YLnaKNw7GPXppyNYQlKNGMfZ6L88q6s6s4UNxrB7nxD
	82S4wISC2YSpuy7XQdbOzmrLjgUA2JwbLF2dyxPxzvy4iUe6wYsfsH9A+zxPgaDsUk4Rp87AS5K
	dwhPoDNWsLnMJ1hc847SiDfZaOzHn75LWfXVUZ5DyBYoqi7z0WOD9/YawLH1RLHuTZ4Sj0sApzQ
	piq72J9Zt6Mu7TZpNGtVLDtuazhUmxufEpehltgLNBClf0rzkF/e1HmqKl6Y7Wbf0Mi48UxMKr0
	vvxYvaPfZ/JLlYF+r2G8P8T4uiDGAwYhAJ7hyiRkuOo=
X-Google-Smtp-Source: AGHT+IGa/Bvol6h86EL/0eQDUFZDFJ8hCY0TRtXWuYkc3YSaxiH7Z8RpQeeV75AxpzroWYGzTA0IKQ==
X-Received: by 2002:a17:902:c40c:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22ac29add7bmr68235ad.25.1744132297761;
        Tue, 08 Apr 2025 10:11:37 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865bd80sm103386545ad.118.2025.04.08.10.11.35
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:11:37 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: ath12k@lists.infradead.org
Subject: ath12k: request a board file for sm8650
Date: Wed,  9 Apr 2025 01:09:36 +0800
Message-ID: <20250408170936.5902-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_181149_382525_04D6AF71 
X-CRM114-Status: UNSURE (   6.16  )
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

Hi, in my sm8650 based device(Oneplus Pad 2), it is equipped with
wcn7850, it doesn't work. No common board file for

bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=1107,qmi-chip-id=2,qmi-board-id=255

device specified board file from androd image can't be loaded. I
have also tried many board files for other devices which are from
board-2.bin, none of them worked. Can someone upload a board file
for it? Thanks!

default:
	demsg | grep -i 'ath12k'
	[    1.064804] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
	[    1.065551] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
	[    1.069350] ath12k_pci 0000:01:00.0: MSI vectors: 16
	[    1.071626] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
	[    1.642144] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
	[    1.676854] ath12k_pci 0000:01:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
	[    1.720470] ath12k_pci 0000:01:00.0: failed to fetch board data for bus=pci,vendor=17cb,device=1107,subsystem-vendor=17cb,subsystem-device=1107,qmi-chip-id=2,qmi-board-id=255 from ath12k/WCN7850/hw2.0/board-2.bin
	[    1.726844] ath12k_pci 0000:01:00.0: failed to fetch board.bin from WCN7850/hw2.0
	[    1.728877] ath12k_pci 0000:01:00.0: qmi failed to load bdf:
	[    1.734862] ath12k_pci 0000:01:00.0: qmi failed to load board data file:-2

board file from android rom:
	demsg | grep -i 'ath12k'
	[    4.054474] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
	[    4.057350] ath12k_pci 0000:01:00.0: enabling device (0000 -> 0002)
	[    4.059490] ath12k_pci 0000:01:00.0: MSI vectors: 16
	[    4.060620] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
	[    4.635118] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
	[    4.639740] ath12k_pci 0000:01:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:05 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
	[    4.836061] ath12k_pci 0000:01:00.0: ignore reset dev flags 0x0
	[   14.818289] ath12k_pci 0000:01:00.0: qmi failed to load bdf file
	[   14.818694] ath12k_pci 0000:01:00.0: qmi failed to load board data file:-110

One more thing deserves a notice,
fw_build_id from my Dsp firmware:
	"wlan_hmt": "WLAN.HMT.2.0-02702-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
	mainline:   "WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3"

Best wishes,
Pengyu

