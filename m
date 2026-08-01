Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C8FC5516F
	for <ath12k@archiver.kernel.org>; Sat,  1 Aug 2026 00:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F+mu3lYgplfrwjY2DJL/ygTm4SmYdcK4n2UmUXCZpKc=; b=twq1YF6462orJ0UMPzr70RBzuj
	2OJnfVTTZvVt22m5Z5QKWH2R/QtwJ8ot7GT4KWl9b19UaBKjdgZClPdNXE+S+M3OPaOgUSLzP47i+
	1iHWfK9sLUDqhGj8LXVYGcQ2RifFjoIuP/fW5mWYLxfmhcCLHLRajRDWPr3lXhmEukZvH3AKyQjKQ
	Mm2VBkDqC8aqJ4iQXBiln9XpOXiWdlRdpV4TrRd9PuuehLnXYeQXa8nmvwY8bXbd2yz5DKQtJaN/2
	XlZzgC3n36yX0HCeXNLSfC5S9H/TfeS0ijKXdnWzMM2fMAi6rBSkPPTDaDpfswbiaT/5bwJgXisNE
	/q6tBbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxp2-0000000DmOu-2TxV;
	Sat, 01 Aug 2026 00:43:28 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxp0-0000000DmOX-1mQT
	for ath12k@lists.infradead.org;
	Sat, 01 Aug 2026 00:43:27 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso1721138e87.2
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 17:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785545004; x=1786149804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+mu3lYgplfrwjY2DJL/ygTm4SmYdcK4n2UmUXCZpKc=;
        b=KEY2CrTTax71sutG+T1Tn1cGg7iYF2zxgry5YbTGomW6/8YYChm3hvhbMlpMkU+YWw
         FID5rw+Qmc1ut9wOLcLbys55dw+jMaX86Wnk0iZkuE3wa0RS8vRYR6BAaF9bCG+y+ejX
         cqAv/DXJHvyHgqJ2WXvzdw/cuv9tw1nHWG/3Hb2L8z6ynPWPiPayHnYPaHZjtAc9Tv+9
         OQZFDy3Ovh74l0YbH2/l2R6QLuL78dPvDUVioJswF8sEEg+56AAaTYHa7nY/MawzhqHr
         jxFqClaai72w6T921PF89blnms2V1oB3yOINmjC3PxWp9Li8BaN/ymXJQd8f05idk8JP
         hpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545004; x=1786149804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+mu3lYgplfrwjY2DJL/ygTm4SmYdcK4n2UmUXCZpKc=;
        b=fNpfjKVG2e8gOzQe8yh2tACsQ+1X1QMso/8m68mQGAn5Ny/xdAzm5PDZ/kHRRhwWOB
         d9aQRIZ3gxUGIwL17fOswkFQCRzaPIybUt9XBCWJ5ypGRQ6c3A83ymeLlRIYyG+UTfIQ
         3yuGO7Kf/x5XtA6msoK1og0BIPEi+xPA6j1kmvpTZqPGhku3XhE7zpFstQANscpg9eYe
         +Pt78UdYkZjLawjLh1LHypdiQZ/E7B05yp2n8twvYoHaWy98z815vPshTn9yRjWS7BxQ
         ySneoctxgwN3h53ZYIJRJm33/bmP+qAksSd4pimdJ0vLSZ270e/JrXrW8+k/8CXx3F36
         Uo/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rph1sAh4VQoPrsK6zUlxmRYglntOxxj61dOvJINI9I3D9nvvtRNmZQjheA78hAP43DwH/1XTBw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzowxptO/c6ktJ2x9M01FzpuwlUhvdFuhGV3riTxY3KZY/grKdM
	lwvdNjAokbtG5WdDFhH585XkSHPWxLvoAiJ8li7iHr0ie5Doztx9tRa/
X-Gm-Gg: AR+sD13DG6sJ5EKA4b/BIh9tK+8DX1tJTwe8rFLvIyDM97q9wGtNtATizWvOpEPacPh
	zJpqU/7HS7dYXHP74ozoWiEy7aD9gQe81upxNXVXk98OZz3O0GBCw2WQvRGryrYltDylPkTY7j5
	OT4xwysAOTjqM9Gro7+Hweya9RDjUDN8W5Y9/N+1SyBTyn9QYv3d+4LauKi+qawauv4PJ/xj1BO
	WWqXuQWEMVSvfLadtVYAXCc4tUpykNANqskgfaRt/Q3+5smquABWPoestFNEXdOubQixOcITnWG
	tIH0qHkKyo2H8fUvUdT9YwlUTcT95+avYU9CGJ889jF6ImskY9UsbjeXPTXUfK4E4EJaz/wXe0e
	2CfUme4tKDqXBYBrUX7pTBYaUHUOP8NV0x+pUhswq98ySCDv77IeFErwFSkI4HmiVPaNJD0IeYU
	sx1xDR9+Slo21CLdVb6t0UKQr/YHbrr+zQGJXHb3FEwRxvx13DlKAue/e/Kva6e3h9gfJgEdKZi
	nYf3gmfxrdI5/nhD5hxL/lZ
X-Received: by 2002:ac2:4a6a:0:b0:5b0:f9d:f7d9 with SMTP id 2adb3069b0e04-5b2e4f83e1dmr200946e87.45.1785545003821;
        Fri, 31 Jul 2026 17:43:23 -0700 (PDT)
Received: from zbok.dom.cz (89-79-165-104.dynamic.play.pl. [89.79.165.104])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23d23d7sm598582e87.37.2026.07.31.17.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 17:43:22 -0700 (PDT)
From: Kamil Bienkiewicz <perceivalpercy@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	Kamil Bienkiewicz <perceivalpercy@gmail.com>
Subject: [PATCH v2] wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332
Date: Sat,  1 Aug 2026 02:42:43 +0200
Message-ID: <20260801004243.489010-1-perceivalpercy@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_174326_504284_A846DF57 
X-CRM114-Status: GOOD (  13.16  )
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

Only the two QCN9274 hw_params advertise NL80211_IFTYPE_AP_VLAN; the
IPQ5332 entry does not. As ath12k sets SW_CRYPTO_CONTROL, mac80211 does
not add the mode on the driver's behalf, so AP/VLAN is absent from the
wiphy and hostapd cannot create WDS station interfaces:

  nl80211: Failed to create interface <name>: -95 (Operation not supported)

The 4-address datapath itself (sta_set_4addr, per-station TCL metadata,
WMI_PEER_USE_4ADDR/WMI_VDEV_PARAM_WDS, 4-address frame and NULL/EAPOL
handling) is shared Wi-Fi 7 code with no per-chip or per-bus gating, so
IPQ5332 can already deliver it. AP_VLAN is a software interface type, so
no interface combination changes are needed.

On a mixed-bus single-wiphy group the effect is wider still, since
ath12k_mac_get_ifmodes() intersects interface_modes across all radios:
one IPQ5332 masks AP_VLAN for the QCN9274 radios too.

Advertise AP_VLAN on IPQ5332 as QCN9274 does. Tested with 4-address WDS
stations on IPQ5332 + 2x QCN9274; RADIUS dynamic VLAN was not tested.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kamil Bienkiewicz <perceivalpercy@gmail.com>
---
v2: rebased onto ath/main (8150c22bc). No functional change; v1 was
generated against a backports tree and its trailing context no longer
matched after .supports_cong_ctrl_max_msdus was added to the IPQ5332
hw_params entry.

IPQ5424 (line ~845, and possibly QCC2072/WCN7850) appears to need the
same change, but I have no such hardware, so I have limited this to
IPQ5332 which I could test.
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 7b86f324b..a20c21807 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -664,7 +664,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 				   BIT(NL80211_IFTYPE_AP) |
-				   BIT(NL80211_IFTYPE_MESH_POINT),
+				   BIT(NL80211_IFTYPE_MESH_POINT) |
+				   BIT(NL80211_IFTYPE_AP_VLAN),
 		.supports_monitor = true,
 		.supports_cong_ctrl_max_msdus = true,
 
-- 
2.55.0


