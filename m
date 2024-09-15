Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6DFC3ABA1
	for <ath12k@archiver.kernel.org>; Sun, 15 Sep 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mciwgDNG2b89eoTrM6qpGJvMZriXh8DfuwYrXm4Ieu8=; b=1WDPZd+78wCuJhtmofAnZeqAMi
	89VS1s8H6L0So2/YFpzgNZbZ++fcpf9y4eHx7QZp5LBUt1rq7pQufXsqKOYxMFTW3kfa20MFC7jVZ
	rdrLhHFgNgYTPtCQHOZ+ft0lsq/kGv766Aw56rartHXcUHAgCLgTP4UkCnfLEoAMtkN5LkFk8EMyj
	+4lHwv1NdQToMWUyONRWIqtO3jRflnvIpzQNGEyNuJ5mNcVDyZ/z4BbZtvCIg0f3TmjcuvFkn4fCM
	O5EMDWCBqHn9nGp9RhsFnsPMYc6/FwY+aZDiceun1fAaP5DRhRy7zynPe6rCG1t/1QYi1b705uP8p
	jXmtrn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sps8w-00000002M2X-4BUh
	for ath12k@archiver.kernel.org;
	Sun, 15 Sep 2024 16:30:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sps8t-00000002M2A-3KKu
	for ath12k@lists.infradead.org;
	Sun, 15 Sep 2024 16:30:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5365a9574b6so3497611e87.1
        for <ath12k@lists.infradead.org>; Sun, 15 Sep 2024 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1726417830; x=1727022630; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mciwgDNG2b89eoTrM6qpGJvMZriXh8DfuwYrXm4Ieu8=;
        b=l6FscAym/GxQEOcR/W3F7QJhWigXDz+XSZthptRW7MYh3EF8HzZE2SDaLcmycfUgXD
         NdCtok6Yc5jvPrInPw78X3vjfaSGgpZ5rmuyrbLv2jnyBWq1FX0Xp95YxXfe6/BwgpcO
         HXENZvCNwStcTunPDQ6gGeW+gsa6+hVpibMrSHtlO7iplIQAjDW7eTmJpqKIvOGMXPEA
         6+lQSR1W4rybwMyA4UmaNYoe2dq7PjpTHnH3sNDQRGAFlds3hXDNfKLwYw9+Y32IKzUF
         0uAIBLGFb8QdKtk0QfvLcIIhp7lvda1EYKLK7t44Z95x6CUffsXRTL7wKMCO4oqPtYP0
         qLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726417830; x=1727022630;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mciwgDNG2b89eoTrM6qpGJvMZriXh8DfuwYrXm4Ieu8=;
        b=ESZBG0E9Q9CB5x6A2tFd4LKS9aKvOULFgRqA3np88xdSV7W2ORAkdDVkeXEWeeQtM7
         VW7Zz6Zxg8uxxFIpfK4A9JBg33chSIbTtI+sjMwp9Fgky36XnSYGHJnvuRFR/WzF0dLF
         z+YEcmOfkevT33a4G1qUw5DjVf8+f/R1TOcy3vPcZvE8JrSvW1Wo9oEYtAGRUFD7ju4C
         nxeHqh9Bpl7GUwByQNsygkxRsoHFnr6tyjsEDpbJWqb/+6GEJZLDQt+c+BwKyPHOAeGA
         49a3jpxzUO+O6bpJpEDF8qwumRs2se/XsbbWi0k2EhiBOqBDHmBC6WL5VJTbOzwHKcb8
         JKwg==
X-Gm-Message-State: AOJu0YyMBN4jLN5KLRgmg2zpfDmE7VnNVR6nfgjsP7u8MIWuqGGmY1Zw
	RTL/t6qCNb3INRo8x6qTr364/9498z6BFw02PLl36lW1jzO7pNZbYLBkRENugxNfgIHXmmcUnNJ
	rqWbDuGVuYfA4AUQWlf6rQTgZilqMD0E5VaSgrufHXx8BQCCY9g==
X-Google-Smtp-Source: AGHT+IFMaPCLkriYzPSTTIPIvgEtA691VLZ4ug8jT/05fmNbfQw27WzHiYGfIQ4cDrEiTPhVF2XqJjM+NslDVCnr2pY=
X-Received: by 2002:a05:6512:ad5:b0:536:54bd:8374 with SMTP id
 2adb3069b0e04-5367ff399dfmr4925356e87.60.1726417829299; Sun, 15 Sep 2024
 09:30:29 -0700 (PDT)
MIME-Version: 1.0
From: Benoit Masson <benoitm@perenite.com>
Date: Sun, 15 Sep 2024 18:30:18 +0200
Message-ID: <CAGHj7OK5tvjfUkb_oFMwk041mo_41WV0Uu-h2v_0_YQqjTrFyA@mail.gmail.com>
Subject: ath12k driver on Debian 12 - High ping latency and MLO support query
 on 6.11rc7
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_093031_857172_7E600E08 
X-CRM114-Status: UNSURE (   5.88  )
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

Hello ath12k developers,

I'm testing the ath12k driver on Debian 12 with a custom 6.11rc7
kernel for an M2 QCNCM865 card. While generally stable, I'm
encountering two issues:

1. High ping latency/jitter:
- ath12k: 3.5ms to 55ms (40ms jitter)
- Intel AX211 (same setup): ~4ms LAN, ~6ms internet (stable)
- AP: TP-Link BE800 (6GHz band) - Tested with various OFDMA, MIMO, and
MLO settings

2. MLO support:
- When connected via MLO, performance mirrors 6GHz-only connection
- Doesn't appear to utilize all three bands

Questions:
1. Are there any recent patches addressing the latency issue for
kernel 6.11rc7?
2. Is MLO fully supported by Linux/Qualcomm for this hardware? I'm
willing to test any proposed solutions or gather additional data if
needed.

Thank you for your ongoing work on the driver. Best regards,
Benoit



lshw output:
           *-network
                description: Ethernet interface
                product: Qualcomm Technologies, Inc
                vendor: Qualcomm Technologies, Inc
                physical id: 0
                bus info: pci@0000:02:00.0
                logical name: wlp2s0
                version: 01
                serial: 4c:82:a9:XX:YY:ZZ
                width: 64 bits
                clock: 33MHz
                capabilities: bus_master cap_list ethernet physical
                configuration: broadcast=yes driver=ath12k_pci
driverversion=6.11.0-rc7 firmware=N/A ip=192.168.1.169 latency=0
link=yes multicast=yes
                resources: irq:97 memory:dc600000-dc7fffff

lspci output
02:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi
7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
Subsystem: Foxconn International, Inc. WCN785x Wi-Fi 7(802.11be)
320MHz 2x2 [FastConnect 7800]
Flags: bus master, fast devsel, latency 0, IRQ 97, IOMMU group 14
Memory at dc600000 (64-bit, non-prefetchable) [size=2M]
Capabilities: [40] Power Management version 3
Capabilities: [50] MSI: Enable+ Count=16/32 Maskable+ 64bit-
Capabilities: [70] Express Endpoint, MSI 00
Capabilities: [100] Advanced Error Reporting
Capabilities: [148] Secondary PCI Express
Capabilities: [158] Transaction Processing Hints
Capabilities: [1e4] Latency Tolerance Reporting
Capabilities: [1ec] L1 PM Substates
Kernel driver in use: ath12k_pci
Kernel modules: ath12k

