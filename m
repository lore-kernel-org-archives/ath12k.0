Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF75CC53219
	for <ath12k@archiver.kernel.org>; Tue, 28 Jul 2026 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TdVpO0t8Plo/a9fBWYcScqqmx4ugirwq63bNqhUWRVo=; b=shbullMS/JBL5sn/EN3GhEPsPF
	qXEwWl2o4lXsNc19QqXqubaAsowWKzrcjOqHukQWpCTye+Oix5EF5TID6insLz+GzcFKfaaOoEGnT
	8ZbikHndPOYc1P6dbfHuR0OKY6/GIGIUf5nzyjub+PkqOaU6rqJ97b0FzVgmxCU0nDWAkUdqfsuUY
	x7DJcEl17H4zrlrjy/7/iT1C8QPuj2deCaYVTlEnmMohJDHW2fLKuwgVS95/eQAYebzTT5Sacfp6Q
	cZpUxtfcneanefkp40p3sE2TIPEdyIaxUG8onbxsf4VnTfc2TfD82yepeOtcuVdioMF932q//xoFN
	6iditpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonWJ-00000006ALq-2J9V;
	Tue, 28 Jul 2026 19:31:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonWG-00000006ALC-3qL8
	for ath12k@lists.infradead.org;
	Tue, 28 Jul 2026 19:31:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so1992165e9.2
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785267074; x=1785871874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdVpO0t8Plo/a9fBWYcScqqmx4ugirwq63bNqhUWRVo=;
        b=RTzjWoFOhwCn96U5aqTzqzKQiPEaOJVd6ZdAkyJvUNhNJ9/AdVjODiP0L37C8S7dc/
         gTrJwPUhOVM/Y1yVfv0etXgzICkUm/VXty9nSniGy58hPVmla274GN8UavE88P/eVndu
         s4r0qehCnzDiL64Oc2i6C28zc1tkJ7kXm1MLLOAAEES2rEauiVl4sr3NMZ5yYYvNn2v3
         GNk8lFTL9dK6Jr++XZBWHZ2LutDPJPCdk5w8scR4kwY4a0bQB7Q7uSUVXbxVFO0MJe6s
         R+C+mvBWzTg3THTSVgTKDUaaXTuSeeEB63vWvxc9jQ61I+LVG+lXEnq8OCrF8CMJqU++
         765g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267074; x=1785871874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdVpO0t8Plo/a9fBWYcScqqmx4ugirwq63bNqhUWRVo=;
        b=D+IJWdXjWrW7y7Ee+rMtb3ELfANlr91IF7GiHO0V59usw2P90L5ctLQqSd4IfPOuWV
         VbRX0AegkwiCjSxVDvVzkPEVf3vkY9qJi5xrbbjLA+vYuGVtKYlEUkES4Fy6LPWmw2PH
         vsnBzMIg4RSee68H3fG7VEglGisJz8d8gcpa3zdA2YcRNupL4UmtM+/Nei19lnfdwA1r
         Z6Pup2U4qlU5hHkXBWjzKjR+aS4nS28UpXIoSRcI9oo6SpIeVLavbhI14raItlK8ytUg
         bbPmH/GhV+ZaTLMosZj8RfahWjSEXCrQvWqClLP0Pl46li6wBfNv7tIUI2XCQ67Z3vP1
         ETmA==
X-Forwarded-Encrypted: i=1; AHgh+RouTzwBlA/cdEs6rVepYwrdzaAk7otTa8sRVx2jX7gEsFRM1UNlMGTjADhKFG2+n/tX4txnkqY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSDpz8YLFiujvYPseDWJDGRJQ8AZ2RONg9y8kLtYUY15jWBcg9
	8URzZusE+AkP/5TN5Q83VYiGHu2pIciEsmD408EV5cz+QYWC1EH/0HtM
X-Gm-Gg: AR+sD10D/UVodFBwbcG3yVKMC4m1/h6d3Rd+kauvMVJlSNBanbUraU7AR2bHtWJi8n4
	laZ9wQXaBKgS05OHOjtUlcaMqiGxo/qN52LnPv5pBAdc357xuvepL64dR4vNkDJf+GU88QZT6pl
	8AOf0Ci4VqVuD0Vxr5L5pJO0VIYQ5yvg7hyYTyw0Ik6LFx7hDI1HsOUPwfW42X7mYNJfXebeqJK
	Zj6IEqrniLmjDOr1h7oXQV3JKA9notK7UIfufQOvSO6rCJkCMMNTYBv5ObZ0bMPrDgb8SRg9FPH
	fnKOGmC7Yol6hczH+DCvOYtKJkgXjPkNXGhGwDTyQwZksI3C/Aia1AuGCuVWLdN5tZt+1gsuXNp
	Jrw/NCo47UmX1j3gXa2dhnDz7wwEwTbMFcw9yMCLbMrDr/KqxKp0DuzJQcHe1V6NCsqDmsmHFQt
	Sv/mAlfZLe
X-Received: by 2002:a05:600c:3b14:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-496c6426375mr42288015e9.1.1785267074260;
        Tue, 28 Jul 2026 12:31:14 -0700 (PDT)
Received: from zbok.dom.lan ([2001:470:1f0b:afc:aee6:6ba4:3fe:6c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd7bab1sm1496955e9.13.2026.07.28.12.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:31:13 -0700 (PDT)
From: Kamil Bienkiewicz <perceivalpercy@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	Kamil Bienkiewicz <perceivalpercy@gmail.com>
Subject: [PATCH] wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332
Date: Tue, 28 Jul 2026 21:31:05 +0200
Message-ID: <20260728193105.1064227-1-perceivalpercy@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_123116_971811_BCEF8AA2 
X-CRM114-Status: UNSURE (   8.41  )
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
IPQ5424 (and possibly QCC2072/WCN7850) appear to need the same change,
but I have no such hardware, so I have limited this to IPQ5332 which I
could test.

--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -655,7 +655,8 @@
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 				   BIT(NL80211_IFTYPE_AP) |
-				   BIT(NL80211_IFTYPE_MESH_POINT),
+				   BIT(NL80211_IFTYPE_MESH_POINT) |
+				   BIT(NL80211_IFTYPE_AP_VLAN),
 		.supports_monitor = true,
 
 		.idle_ps = false,
-- 
2.47.0

