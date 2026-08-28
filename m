Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAE0C61DB9
	for <ath12k@archiver.kernel.org>; Fri, 28 Aug 2026 00:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pCMIFIxYCUsj1hMH+KHMzj8zPNuf6elRBMAuZZ590uw=; b=E64jtZAuY7ECOqPurQe6kr2GXj
	JbGWqbcdLE2JJnNN5aHIiQDlxQbGJwX99FCbCVSBUZel+5rWLbMFSgLy5AsFhuo9xLjxjvX8h1h5u
	Ti8QuV8nTqljPpZUc9DunK3ZmZdxh3gmPXYbznvKwDpVcCp1r+84e3d+CpGhKFhfUSqQiXBRMpExy
	5mq4zkj/7rA6vhhFfLNeSNmD758hP9mTlh4fEIDfpE47ce4Bv/LChe0joI2hd9Mw1eSVbyyAtKX0V
	hk3GKvaFsJ8km+Y438FaVjibb9g08Jdd9bfN9/IMcg6hXcLAqWqromIIxwXWlW97AYqWbS98IJa4z
	A08UGvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzkos-00000004xsv-0usA;
	Fri, 28 Aug 2026 00:51:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzkoi-00000004xrz-36UL
	for ath12k@lists.infradead.org;
	Fri, 28 Aug 2026 00:51:45 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c2529b3139fso59820066b.3
        for <ath12k@lists.infradead.org>; Thu, 27 Aug 2026 17:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787878293; x=1788483093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCMIFIxYCUsj1hMH+KHMzj8zPNuf6elRBMAuZZ590uw=;
        b=akbssEt9LF5qWgvXlbT0rxiEzVwlt7rusxFdu1FxmEEs8aOIaN9QQ81taZMH2nHJW6
         RZSaRi/BEed+RxLmVMfX90MCPR/XAxxJ/GH/ZhMYNCaguyaPDzBrJOd6GG9jOy2bvW6H
         tNGPRiYNAaM0np2PM9cNntE+0A5sIve80r+K9BdONehXGR6S4pBPwq5oUWdV789nM9Yw
         gjwOxB2z1KopdQaTm31dbIbG68VOtXDBkDAnqNDVWOElBHzXxQo/J58bH91bgq4OyRu/
         wMG4UpYY3UXUQwTm+Xl0YG27LndjsUP0BiS/HfDCIdyrHwEIYaQpK6CLiLHyTR3at4q0
         jCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787878293; x=1788483093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCMIFIxYCUsj1hMH+KHMzj8zPNuf6elRBMAuZZ590uw=;
        b=lcbnJR4+zcO+H6P7u9j/lTbTkTuvNHmL3lAPj1n9HrON2qoJUixm9xQVQDViwbXuCK
         tjYyaP4nDeWSNSaJN/2PZBXX3hxe7jFiP4Pw/6YyaHCljqM/zx8T0c8RsKoLVfYHzQ6N
         ubYsF/X2cXJnfhe92b9GW0cG4TZA5hLKQmMSqp6Fh8Z8pH9qziDY0Z6kFTDsK4OM8sbr
         j4zgVTPpmx1UWhW6UGOloQ2W2gcA8ByKi4gHM4VPPOk5Bgb0ZZoujKXsCBzxSkOddy7O
         EpXoLPIE8ILCg7SwKnkuB2SbTaRn83CCn4JpwbAtg7QRZpEuyTxicWJm7azt1OWWDw4y
         UZ2w==
X-Forwarded-Encrypted: i=1; AHgh+RpmQixqpNq9KjOZx3q0Qm+ozRMTHbHvZrQuQXNtjppZr2hoL9Udmdq70ew2pIK/vGDUScrKVNE=@lists.infradead.org
X-Gm-Message-State: AFuF++kdZR+u2RUNsOsWzanPp1ZW/Rb8a2tfFNqk3X/Lgn52WlHy/h2I
	vZDCk9Al/+gcJGT+OIajh4etCNiKIdFTIMRSC6UA3CzB797DuOOoi+h26IfYefvF
X-Gm-Gg: AR+sD13lJHNdVMuMVYQsTr4h6qo4FTb7ZetaToT9GgPrpZRUlgCGNIgHZsHxewr2P35
	WmNCNHrnxCNTU7XuI8FxKmWkasz5sAzyrnESuUrJCjp94E8q69PiAr+J5OuDe4stnQkEaGl47h2
	LUhe6V2CPrXxJquChzHcA6OBQ4aaboQMgi+rn366n6w8PCDaKMePsrpqMyg+BPKory8FHbHyVQM
	RzvWoRFSGXd3ghciobPE8x5xeY2OffEYpC2M3OIgZfLvSVbRFxZ+3lUgel82vvMRqHDShOKUF7C
	n2RzyhivysXwG41Z+OlU5ThmZT49ARU9cuyUpOYN3KYLffVdxVFyc3blTY5xuqmCL1ALCK9nw2U
	+TXBhMV+v2SMCRfzPpghhwjUJYE+JCcSavPOWWNFfPMchtNdBEdlK64SGXiSE/6WK0ijc5g37Qo
	BE2i/Elfx4MX0KREq/PJzpOgTIH4ZdjoWrVHxoCLUfzT+pKywNLtMlUt542PrGFQ9PFe5vdt2Zd
	rIf1fmUqTwnUBwUor7aVqBQiI4FkY9SG8fnuV70WkZBdA==
X-Received: by 2002:a17:907:c05:b0:c25:2d27:5648 with SMTP id a640c23a62f3a-c2556fb8e11mr180456366b.4.1787878293227;
        Thu, 27 Aug 2026 17:51:33 -0700 (PDT)
Received: from zbok.angelfish-beaver.ts.net (89-79-165-104.dynamic.play.pl. [89.79.165.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f25177bsm10549466b.57.2026.08.27.17.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 17:51:32 -0700 (PDT)
From: Kamil Bienkiewicz <perceivalpercy@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	Kamil Bienkiewicz <perceivalpercy@gmail.com>
Subject: [PATCH v3] wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332
Date: Fri, 28 Aug 2026 02:51:26 +0200
Message-ID: <20260828005126.1685832-1-perceivalpercy@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_175136_800049_6C9E771E 
X-CRM114-Status: GOOD (  15.22  )
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
IPQ5332 entry does not. ath12k sets SW_CRYPTO_CONTROL, so mac80211 does
not add the mode on the driver's behalf either -- ieee80211_alloc_hw_nm()
only does that for drivers that leave SW_CRYPTO_CONTROL clear, leaving
the declaration to drivers that can transmit software-encrypted frames.

AP/VLAN is therefore absent from the wiphy, and creating an AP_VLAN
interface without NL80211_ATTR_4ADDR is rejected by
cfg80211_iftype_allowed():

  nl80211: Failed to create interface <name>: -95 (Operation not supported)

That is the path hostapd uses for dynamic per-station VLANs, in
hostapd_vlan_if_add(). The 4-address (WDS) case is not affected, as
cfg80211_iftype_allowed() short-circuits it on WIPHY_FLAG_4ADDR_AP,
which mac80211 sets unconditionally at alloc time.

The QCN9274 entries already declare AP_VLAN, and the transmit path is
shared Wi-Fi 7 code with no per-chip or per-bus gating, so IPQ5332 can
deliver it as well. AP_VLAN is a software interface type, so no
interface combination changes are needed.

On a mixed-bus single-wiphy group the effect is wider still, since
ath12k_mac_get_ifmodes() intersects interface_modes across all radios:
one IPQ5332 masks AP_VLAN for the QCN9274 radios too.

Advertise AP_VLAN on IPQ5332 as QCN9274 does. With the mode advertised,
a non-4addr AP_VLAN interface can be created on an AP interface of an
IPQ5332 + 2x QCN9274 single-wiphy group:

  # iw dev phy0.0-ap0 interface add tvlan0 type __ap_vlan
  # iw dev tvlan0 info
  Interface tvlan0
  	ifindex 19
  	wdev 0x9
  	addr 00:03:7f:12:0b:0b
  	type AP/VLAN
  	wiphy 0
  	Radios: 0 1 2

RADIUS-assigned dynamic VLANs were not exercised end to end.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kamil Bienkiewicz <perceivalpercy@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
v3: corrected the rationale. The missing interface_modes bit gates the
non-4addr AP_VLAN path (hostapd dynamic per-station VLANs), not the
4-address WDS interfaces I originally blamed -- those are allowed via
WIPHY_FLAG_4ADDR_AP regardless (thanks Rameshkumar). Added the
interface-creation check on hardware. The diff is unchanged from v2, so
I have kept the Reviewed-by.

v2: rebased onto ath/main (8150c22bc); v1 was generated against a
backports tree and its trailing context no longer matched after
.supports_cong_ctrl_max_msdus was added to the IPQ5332 hw_params entry.

IPQ5424 (and possibly QCC2072/WCN7850) appears to need the same change,
but I have no such hardware, so I have limited this to IPQ5332 which I
could test.

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


