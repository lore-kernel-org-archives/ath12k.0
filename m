Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2874FC5AE59
	for <ath12k@archiver.kernel.org>; Tue, 27 May 2025 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jdlPmmDOMV6rAp43aqNAuv5l/hzz021OXxP1u3LOxbE=; b=a+sQXN9+aZFypUuTBtJVAsuPFX
	cgJlsab8KLAkrD+GG890b7nrXrCFB1fbcppQaummjGxq+6nolxwgCbQ5VQRrxizHRpFpn0A4CuhRk
	ov0/CeYQ0dC+ZVfj9ekO+nqbqmRA6LPRIBZGA47dAg9hTS+ZMptuInnKqUZyBC6zn5NMQzfM8Edpd
	iL8/ePTqWa7Lwk/m107ELY4lL6YtyvNHbEWfiC1MiUsdS9gZ6xapZJwQE9JQyEdKFJ1TtN20b4lL9
	M3ncytySTAmAD9YNyE7GeQwFI9mFmJJgp+z/PcJyBUpRaBSvmE1+ISJzQkTuLHKfieZscpXDr+y26
	KB3Fm1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJipw-00000009h80-36zm;
	Tue, 27 May 2025 01:10:36 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJipu-00000009h7Y-3cbp
	for ath12k@lists.infradead.org;
	Tue, 27 May 2025 01:10:36 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e7c5d470a8bso2103896276.0
        for <ath12k@lists.infradead.org>; Mon, 26 May 2025 18:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748308233; x=1748913033; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jdlPmmDOMV6rAp43aqNAuv5l/hzz021OXxP1u3LOxbE=;
        b=eLx+7/sxeU8x1STgyHLvnKzcihNI+CULMOUT5tXO8nKHvMwt8gN8q08+DHuJ4uKwMa
         AxB9sE2SHxu8dbwHunGSdChvvevrdhMHAFQD96XwJ9W//A06EY5hUSBf/bTo5dzrgVi1
         N2/tJy+/65UdKLCnR4TR3oavppZdw8pjL5PXmOq7qp8KrexWoBYMCxvt5+qpvawVMr68
         mY/2yBS8uRhnv8fxcQK0ZccNDsJomV2FkhDV7deg9/wTHFT2OBku47nqm7B3/dJlc8hT
         t0Bijt4XRbikW1OKLUBBRc4W0jPnNhQHMm7QZ4BSFtwTfFM8ekoGIiVIp4Nk8b9QeaPd
         M5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748308233; x=1748913033;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdlPmmDOMV6rAp43aqNAuv5l/hzz021OXxP1u3LOxbE=;
        b=F70UrEjDgWw6q0l38UC0/WAoyahjEcOAnkbrwVD8g78MjVrgdwhgMKbyv/kmoaahJF
         5FbPSd0ryLLvveUWoI0+5UHQ29zorqEOuHIeLu70O5hSJmNPDsrdGVPdk/UwvoR/IeDK
         FnfvsJZSFvymIncdSu3PlF3XCbL5zIAlhZm0BY05f2ktVhCd6i0ZoD7F5JajGdLw4p1q
         Aq8BNVQXAIEBGvi3ztTsECv32Fnds3KS3N69/E1oHSyMewbYGUwppj3JsCrPAE6JRaa8
         8r3bTut1Vqm4kg+e8qP69337Vz3OY+5R4TpUETsvkmg5LRfVUMl8Wk7q+yg61rwAfVhR
         UAEQ==
X-Gm-Message-State: AOJu0YwmtvLWWbLFc9ouFK+rBp2Y/C2ztEWUxbMqhgCie4XmGQruJ6Vr
	No4tOavab9km+GtnptoRAT82UngsyhRNhsM+1BohmThvAI/595yGtfOjafYUOEpuvjUHwUi9D6o
	JWtMFeOImXYF0NQ2T9VS4XiCqPdHYmiqyGtPv
X-Gm-Gg: ASbGncud/XDH5pBArHZ/kJ7AGQLYDNmwo6LQHe6tQN28lPPdY5/oA2c0YqFoM4vqQv1
	gPxEZ7hby7T28DqkajZmmjllKQH5uYiteqpGbcRs0VvazmOczeY55Gy/rEJql10wcimgl4OgHNX
	PpreVNutb7FcwszgHPgVM4a4Bit5JCLa0S
X-Google-Smtp-Source: AGHT+IHN7V+ceMNCJKVUlUFLCoHVrOliOK+NfN0Rr6eHuHcG+M3zrQiXE6otgD1F3w46drlynoqjPerywKo2kIEU6X4=
X-Received: by 2002:a05:6902:188c:b0:e7d:5e41:a8ba with SMTP id
 3f1490d57ef6-e7d91a2a204mr11367091276.34.1748308232714; Mon, 26 May 2025
 18:10:32 -0700 (PDT)
MIME-Version: 1.0
From: Doug Brewer <brewer.doug@gmail.com>
Date: Tue, 27 May 2025 09:10:21 +0800
X-Gm-Features: AX0GCFtNVdJKEoYbJZQ3d9nvewQInwDHNHGiPh4MK81FkB0PtYEkjZMx9CrnckI
Message-ID: <CAG0V13S+c14OD7MCMYaSFzWS2ZnPz2BnPfMo1MY-YZmmHX6qRw@mail.gmail.com>
Subject: WCN7850 problem on Linux kernel 6.15
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_181034_911288_DF165D26 
X-CRM114-Status: UNSURE (   4.74  )
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

Hello,

After upgrading to kernel 6.15, my ath12k failed to start:ath12k_pci
0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
ath12k_pci 0000:03:00.0: MSI vectors: 16
ath12k_pci 0000:03:00.0: Hardware name: wcn7850 hw2.0
NET: Registered PF_QIPCRTR protocol family
pcieport 0000:00:1d.0: AER: Multiple Uncorrectable (Non-Fatal) error message rec
eived from 0000:00:1d.0
pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=
Transaction Layer, (Completer ID)
pcieport 0000:00:1d.0:   device [8086:9d18] error status/mask=00008000/00010000
pcieport 0000:00:1d.0:    [15] CmpltAbrt              (First)
pcieport 0000:00:1d.0: AER:   TLP Header: 0x00000000 0x00000000 0x00000000 0x000
00000
mhi mhi0: Requested to power ON
mhi mhi0: Power on setup success
mhi mhi0: Wait for device to enter SBL or Mission mode
ath12k_pci 0000:03:00.0: AER: can't recover (no error_detected callback)
pcieport 0000:00:1d.0: AER: device recovery failed
ath12k_pci 0000:03:00.0: qmi dma allocation failed (7012352 B type 1),
will try later with small size
ath12k_pci 0000:03:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff
soc_id 0x40170200
ath12k_pci 0000:03:00.0: fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:
21 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V
2.0_SILICONZ-3
ath12k_pci 0000:03:00.0: ignore reset dev flags 0x200
ath12k_pci 0000:03:00.0: failed to receive wmi unified ready event: -110
ath12k_pci 0000:03:00.0: failed to start core: -110
failed to send QMI message
ath12k_pci 0000:03:00.0: qmi failed to send mode request, mode: 4, err = -5
ath12k_pci 0000:03:00.0: qmi failed to send wlan mode off

