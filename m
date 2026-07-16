Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BB6C44512
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 22:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3nRkUv88r9cKh0IXmbHWf2SIDOCHcKjHAdTtSiaNXXU=; b=lC7GzKgcqwqfXDTsz26PSUg+fC
	dByMNIkI4qU4EMOvjailtx5tWxM9VPkhkHeLUoSnlTbgOPGJLKXBKt2U7ojAJKPvg7yy37qfQhscF
	J+xRZnFkZ+jQ7SeMjmo/4Am+iBQZSDz/26x1SNm0/b+dGMwMTMZwkRJHrHGEkgDFTnseOA6i7E31G
	LACGwBlP2Um4bgwVmtsyVLGxvczj5NkifN9WMggd+eP1yORXvba5R+vIYEhnJtDZLwsn4bEmF8kO6
	Pvnwlhup+rdlpxSArVId8Wh3QxZ/2DCnxN9JYD1LcY8oermflEWPZPaT50gZx+pkB7s+EKUJsMYGa
	B6+ujDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUgi-00000000kRi-1Ht1;
	Thu, 16 Jul 2026 22:36:16 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUge-00000000kQ6-2MAC
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 22:36:14 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <stian@pokerfj.es>)
	id 1wkUgW-0069GC-7A; Fri, 17 Jul 2026 00:36:04 +0200
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <stian@pokerfj.es>)
	id 1wkUgV-0002gi-OS; Fri, 17 Jul 2026 00:36:03 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1471791)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wkUgF-00415X-Rb;
	Fri, 17 Jul 2026 00:35:47 +0200
From: Stian Knudsen <stian@pokerfj.es>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: ath12k: WCN785x firmware resets regulatory domain on resume causing ~7s
 reconnect delay
Date: Fri, 17 Jul 2026 00:35:46 +0200
Message-ID: <-_iDJ_M5RrqACWB0qmtleg@pokerfj.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_153612_609095_0314FE3C 
X-CRM114-Status: UNSURE (   7.80  )
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

After resume from suspend, the WCN785x firmware resets its regulatory state to
WORLD and takes approximately 7 seconds to re-discover the country code from AP
beacons. This causes a consistent ~16 second total delay before wifi reconnects
after resume.

This is an improvement request rather than a crash bug: the driver currently
contains no WMI code for saving or restoring regulatory state across
suspend/resume, and I would like to ask whether this is feasible.

Hardware:
Lenovo ThinkPad T14 Gen 5 (BIOS: R2LET40W 1.21)
Wifi: Qualcomm WCN785x Wi-Fi 7 FastConnect 7800 [17cb:1107]
Subsystem: Lenovo [17aa:e0e6]
Kernel: 7.1.3-arch2-1 (Arch Linux, close to vanilla)
Firmware: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Kernel taint: 0 (untainted)

Observed behavior:
On every resume from suspend, the following sequence is observed in dmesg and wpa_supplicant logs:
kernel: ath12k_wifi7_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
kernel: ath12k_wifi7_pci 0000:02:00.0: fw_version 0x1103006c fw_build_timestamp 2026-03-06 09:10 ...
wpa_supplicant: wlp2s0: CTRL-EVENT-REGDOM-CHANGE init=DRIVER type=WORLD
[ ~7 seconds pass ]
wpa_supplicant: wlp2s0: CTRL-EVENT-REGDOM-CHANGE init=DRIVER type=COUNTRY alpha2=DE
[ ~9 seconds pass ]
NetworkManager: policy: auto-activating connection 'SSID'
NetworkManager: device (wlp2s0): Activation: successful, device activated.

Total delay from resume to connected: ~16 seconds, 100% reproducible on every
resume.

The device advertises itself as self-managed (phy#0 (self-managed) in iw reg
get). All standard userspace methods of setting the regulatory domain are
ignored by the firmware -- iw reg set, wireless-regdb, cfg80211
ieee80211_regdom modprobe option -- and i found this blog which documents this:
https://www.julienturbide.com/blog/wifi-7-linux-ath12k-wcn785x-regulatory-domain

Grepping the ath12k driver source (7.1.3) reveals no WMI code for saving or
restoring regulatory state across suspend/resume:
 $ grep -r "regdom|regulatory|country.*suspend|suspend.*country" drivers/net/wireless/ath/ath12k/
(no output)

The firmware resets to WORLD on every resume and must re-discover the country
code from AP beacons, taking ~7 seconds.

Is there a WMI command available in the WCN785x firmware to cache and restore
the last known country code on resume, avoiding the need to re-discover it from AP beacons? If so, would it be feasible to add this to the driver's suspend/resume path to reduce the post-resume reconnect delay?
Full dmesg output and wpa_supplicant logs are available on request.



