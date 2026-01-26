Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C54C88E41
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 03:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9QW6Uv5usvydDnfSBID/9FlJrc/Ltmy/riUzMPbIuis=; b=45KSaGQPoanhO1LmngjgfRezX4
	EWB6xjYaBFpcycrMfNUyMC5Gv9evLKmbFZiyWvtNHWv/jcGdP8DntaWWWGup/DENY3vQPDPDPqIlp
	PqK+/Tdpcq6A/CefLR0MTh2BFhOf3hrFSyt0S8Gdi6iaNT/s1V1AA29j6ph7ehHMoB3i4S3u92GlK
	ZfNILL6EJ8+IE1bo/dlxMWJaDzt6K/K6dZi4vk71s8Tj9+4x+PFr1FkyEekWetMW6E5P6qoKxRO+o
	6f91MRzl8/OBIo9z+eOeLENpfaTzWPzJHqeUd8C3WUGKiKBTOl3J/fQwEng82FI64zSloAyGHKf6H
	g4F6dUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkD0P-0000000BoyV-0b0Y;
	Mon, 26 Jan 2026 03:11:09 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkD0M-0000000Boxm-1Vaj
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 03:11:07 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-790ac42fd00so40263577b3.3
        for <ath12k@lists.infradead.org>; Sun, 25 Jan 2026 19:11:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769397064; cv=none;
        d=google.com; s=arc-20240605;
        b=H84asRfbTdRfPnjkq26ceWsKa6QsS9Z0Bi6QM8z/8nUl1zh6hlku720ca96E13yuEv
         Yz6OuyqBDo7fFng2IS1Laix1u0bdLYFIgkOPiLJwTggXNtIS+T+6FtRb/HsC9qr10rer
         P1lBQkwJWobZL1OT1LQFNhfweWukMY1kTu08UJ4vSgQy3FwYbcBOPEcp80hTUDW5QZPU
         ZMJgm8TOuPTwTw9cKGjk1eqTvLJByoBCfB0ULn1Vujq3lmWAdI0eRK87STUC3VdmAv05
         0/s0+dgyVylE7gfZfXJBTBfGjW2rDINNPAK/myLTyFV6q8Y8D+FqzoPEcuzc8fsqmaR5
         U/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9QW6Uv5usvydDnfSBID/9FlJrc/Ltmy/riUzMPbIuis=;
        fh=1SVnUWCOlqesgPz0exmlrbRHUNpcaNpUxuycVPutrXI=;
        b=MN+0f9kiXGjIByZe75PQqH05emg8t0Z47Tqp7o7t5EIvbaCklVBkgjLQk9WFCm1lt2
         mGojW6zOo7kkBdxRF2FPuhzQWCkBHrrstLuIEGTJ19i/uP80/0XNF9WWSGjWHdtMYJpd
         i08ZTXPChkvpIejKc9ZRro+FGFtYjeIloeIf+/GlZUC0Jop0uuODRGT6kgp8hmytOSh7
         MZ4kMKAdAhcDOvadcIzyNfqWZKrEneXlVATcTVooSjobUtU1LQxvooNHti8pK6cQUl8K
         IundwuZW+lsldqWiA+vk3D0xl20JMLVnYKgC4eSRc01KadsUzFLheRjLTcFrgFWGRxik
         PmuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769397064; x=1770001864; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9QW6Uv5usvydDnfSBID/9FlJrc/Ltmy/riUzMPbIuis=;
        b=drTL6ofa18ds9DISZUvxaOUTLOuBH8353r6NzOKTL7IW/B0wJ8rjCkNmc0+1wgJ3Wn
         0+DuLBsGcBSsEghXcqH69+ynqNgafcfpqPzF1Vx2WCfaK0ePipF+/R0/Mena+1xbRPUs
         5v/eW9sGMfKqMelqp9N58OWxpIVNrZydcMfrtt+LWF/tRdd9oF6kPWgTAlEj85EIO+N5
         8/3fEXpbKt+gA/xbjOAcACBnSfZWn2rPtN84wACTcCTy0pPrpGJ5cK1g3onDJyaGRoXO
         q7Usvr4u3stUqJxVpWpjDPQxGkMDlVuNjL8i8clfBxg6QJcNE8RHfd0ov3p6psotYb8m
         eNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769397064; x=1770001864;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QW6Uv5usvydDnfSBID/9FlJrc/Ltmy/riUzMPbIuis=;
        b=sl+QntGFFg/VIp9u6v9i9jKE4wnqRZmZuk2XnwLFwIH5Ue5cpzhDEIivAc1V7Elth0
         jwcR19qwhd2c+29P7NBr/aJR44De0ctrjLbqXc2C29DNbDaJ9Ut0dWyi05Fs1v1m9FP1
         mxLraOUrUGvNKKNL4l/81DSY1xGqyIqJPzLgC7nqzysuBE09GcUZz6r2j8TwsuMAbSKj
         VPUBpIJ/Uni1mVJ44WWjdeFHD83ERSW5zqjyf3T9mtWqB7KF0z/jAiCO5jbKK1p/L5XU
         1HYVOAWRIlCpM4tikPbAG9VsCv6f8c8dGsoId5OynY6OMdpzOKHuoLfU37Ga5gqZLWgf
         R/ww==
X-Gm-Message-State: AOJu0Yz4ae0BrJGEtx3DhWm57C1Bg6sVv+5Xsq+VGXW+ccc9jOvCfvi4
	VbhE7l+AeBgVgALkyQGg5R7ZotE3C5cFLsbQp+IAlEnOq6bOSrjagLCQkJr/nmLlyNm15mDC8at
	HWXRhKsFC6Oo+lZPvws/nQ8TVCX2z1PdIaJvA
X-Gm-Gg: AZuq6aIfUijWFepF7EEAbnb7ahn2P+/2ymMuxUTcJuUN2da+5PMya52b6dy5OOPp2mm
	NSBcb5ZcBXiS3ZAPebLrxwC0ZdMrbBJAzIvf7Jaka5uMxGbIj0a+ti9HaqxeBSOPISCQMXbVS7E
	jSkvsWZA/7ZNABHfajk16hTPYZZ/mBjdH1Y9xEjmVtVoSymnoEo09GiokXeL4mqGNoGdxSeTGn4
	UaCwfBX5b/R31Zq+DTObz0iUPJs+crCinmeZBEv0GDsJxt+Yag4qVAcD5LgfatcBnw/dwbEx8rE
	THPtkw==
X-Received: by 2002:a05:690c:39b:b0:78f:97b5:e78b with SMTP id
 00721157ae682-7945a9b05e8mr53849227b3.35.1769397064449; Sun, 25 Jan 2026
 19:11:04 -0800 (PST)
MIME-Version: 1.0
From: Doug Brewer <brewer.doug@gmail.com>
Date: Mon, 26 Jan 2026 11:10:53 +0800
X-Gm-Features: AZwV_QghhCdteAvcG6_lGjWFmaTjyxiiPtIDT8EdBZRV1HmrhMVweZhAYzxfwdI
Message-ID: <CAG0V13S2qZ_PmAz0bnnvq95bEX=paB1xAYQNnObVtXiGhnHupA@mail.gmail.com>
Subject: QCN9274 doesn't work on Linux kernel 6.19-rc7
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_191106_404827_84EB10C6 
X-CRM114-Status: UNSURE (   7.73  )
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

Hi,

I tested the QCN9274 on an x86_64 system with Linux kernel 6.19-rc7.
It appears that the QCN9274 is not working.
Do you have any ideas what might be causing this? Thanks.

# dmesg |grep ath12k
ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
ath12k_pci 0000:03:00.0: MSI vectors: 16
ath12k_pci 0000:03:00.0: Hardware name: qcn9274 hw2.0
ath12k_pci 0000:03:00.0: qmi dma allocation failed (29360128 B type
1), will try later with small size
ath12k_pci 0000:03:00.0: memory type 10 not supported
ath12k_pci 0000:03:00.0: chip_id 0x0 chip_family 0xb board_id 0x121a
soc_id 0x401a2200
ath12k_pci 0000:03:00.0: fw_version 0x150c0673 fw_build_timestamp
2025-04-24 15:29 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
ath12k_pci 0000:03:00.0: failed to fetch board data for
bus=pci,qmi-chip-id=0,qmi-board-id=4634 from
ath12k/QCN9274/hw2.0/board-2.bin
ath12k_pci 0000:03:00.0: failed to fetch board data for
bus=pci,qmi-chip-id=0,qmi-board-id=255 from
ath12k/QCN9274/hw2.0/board-2.bin
ath12k_pci 0000:03:00.0: failed to fetch board.bin from QCN9274/hw2.0
ath12k_pci 0000:03:00.0: qmi failed to load bdf:
ath12k_pci 0000:03:00.0: qmi failed to load board data file:-2

