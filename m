Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69576CC6B00
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 05:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ze9UmSNIj/3iPt4j8tPt2plfwrglInSEO+r/gtfPlXY=; b=2ux1n6oeQvYUvvVuBWjnN9Cjbb
	GRKqAROUxs5LMjyJyulN3EAcaz/g8cq5djxXzTi1IdgXBdDvYmyhWgGjfGw4SsMcC0ffHrs6kSbaD
	oo6YIl9BfC0ZSXpj9twm+bdN8XzZCMPKGdnk9WljwzBuQbHDIEdzR6f1Gd6/JYGaiUHIUmqIhT250
	PihwTAu/3vUpnGPTkQKgwjg0xhhBH4zUY4kLnMR0SCbKBxHJURJb6WPaTOO+FOAygZZGE4gHaf9N8
	50EBvSS8Vctp1FL7CxnqDDsdNWL8tlfLmB8NDBW+D+AKN+eHrh/UF2PiVHnOInwIiI1mE/tGQQOlN
	j34koYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8AO3-0000000Gna0-0JqH;
	Thu, 02 Apr 2026 05:14:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8AO0-0000000GnZb-1aVC
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 05:14:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4ud62800070
	for <ath12k@lists.infradead.org>; Thu, 2 Apr 2026 05:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ze9UmSNIj/3iPt4j8tPt2plfwrglInSEO+r
	/gtfPlXY=; b=Qd+fUoH/qYdoO6aGc0SGciYh4I755YmK6aFXsEV0MP04glZCRjO
	MkfgmlX4nvf/xt4YORjlQJaMJitWcjpkX4QqnNR4dTUICM6mQ6qjOh5WI++jwXh3
	DgQ8dgdCTshVWQ8R+eRLArLuKbnyn02fgKZIC1jWQXIkOWA7binrLXq0bvC7lSBz
	EtVs6kB+z+84ucNQb7GRyON3gGoyy0EcW8BjARGYB3OIZEG4Vz2agYbsmjmXaXqC
	HnXqy2wQawehR9jcSheHutg12/J0eTNJ3XGHpNH5xtW5Rx5KN/qDLrbP34/ROQka
	sU0yN9IIJtmC1h8Qf/DYAg+yzH54Dh3mPrQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk2b3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 05:14:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so14626785ad.0
        for <ath12k@lists.infradead.org>; Wed, 01 Apr 2026 22:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775106869; x=1775711669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ze9UmSNIj/3iPt4j8tPt2plfwrglInSEO+r/gtfPlXY=;
        b=KnEggwgXnWBSvYtiAjhguBXzrJbUdXuQ++uNvRpC2PvqfKSFWg9Gy/FaOaRTHLmW5X
         GhTVEktviSVY48x3IyW8ExqkD6BHEtOOieuDslSvaXy6L4H08BAQFUXLEDscX+EqQoYs
         71dfaFbF7HwQltGyjXvZF16wxtak6lHy4ODk9uGilfV6v8/mNJWJ7EKNfU3GpgzCjpZD
         A0+WCkod1+b4fSrFuuleGDKWyOaof2MbLrg1QxigtZndD5crnN3UYwntvDtnTBqKhk7w
         cN3uXh5gr5HHe0ufZgJo5F442AgBScTsBMK2uXdpQhYTYgqQBHLz3PnvO4XhSlYwPVH2
         wBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106869; x=1775711669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze9UmSNIj/3iPt4j8tPt2plfwrglInSEO+r/gtfPlXY=;
        b=chnQq4bM6rdQTljaT6JLYguiokuQ4jm7bYDCp13R8RoS1KXCisasQnO2Jhtkm2Fjos
         aYjDJmvTZ7kBVYwTt2TGoo2HvRrqTjE98C6NyP6RXrukxjPnr5CteUHkkPaD+ejCaiZh
         KoA8kccThLhpuyQXxHU+ap/CrB35djIg58Crd0H/AJpT+9happh2QtTXO91WC5fjwO0y
         QOT8NIYYJ2cAZy9T+YWf0HTThT7HHFOwYlUMMPHr4x4Cc0vEdmgx4oTFtzWK4yG4wD/y
         ziHYEIX5Oy/7r8j4rkc//dAFkBnlaCD4FXsEAkqYIUBJSItn9ZC6+pO/GV7uV4tFkNxO
         8pVg==
X-Gm-Message-State: AOJu0YwsVOUNWjhNufKXlrUYvsogpNPGZYTz2WOZduFbsmPx715VfGey
	yJPS94jSrRDbPmjs+6qWDRqcKSCsOg3uepVUIWus/5ZXBOUctqlw/19PPxCgU6NLtWj6BDoqFfd
	E5jJi/G53JnGwR0dvU1tSDOWSSRnrT8SnG6A+ZKXel7upQodOrMymb9N45A2lz94hVl6+/1QC
X-Gm-Gg: AeBDies2ycBp6mazM7FlqnILioQIunoAkcVec0bJoZgo1ynmEnn0NOD5/Ss8K9IdP1U
	6AkaUuKhOI5LzSLcJwUs0ew+8w4Mqrv8Bk5Xf8XOioyLmPaSyZ/uwpEqn/bIhul9DdsOlHk5AQq
	Z+GLrxOzmfYzal/zLheM9AEjSq3EeOJQcm74gMUPKCVVsLQjuOU0w3aY7YBRucXw59t4U2fnYmk
	4SPPTd/Dg0UDvGI1HP3Ngs+kKLTLcMXuVjojpVKiJbBE1VoWuHdAb1rpL8C5onix5MAIa6zVRUh
	usXr7gzA5NSGSahr9+Wdipe+IMQflhfjinV4WI5C2Z/Y+LpT1RkI3FqD8W9EI608uZ1IBchgY+j
	ayL8pJZkkNlAivy875WBrEiJP6tMXAN+wUEx7ihDfaTf9CJgxrLSaQTGk7gzEzE+79HffUQEn9i
	ZjLAqko3gewdiJNVUI15OLb9Kz+m5mS2aCoU+I+DiB1Cgr3zEa
X-Received: by 2002:a17:903:38d0:b0:2b0:59fd:bbe5 with SMTP id d9443c01a7336-2b27586171dmr20050525ad.4.1775106868790;
        Wed, 01 Apr 2026 22:14:28 -0700 (PDT)
X-Received: by 2002:a17:903:38d0:b0:2b0:59fd:bbe5 with SMTP id d9443c01a7336-2b27586171dmr20050245ad.4.1775106868152;
        Wed, 01 Apr 2026 22:14:28 -0700 (PDT)
Received: from hu-rdevanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749ecbd1sm19441755ad.83.2026.04.01.22.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:14:27 -0700 (PDT)
From: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        Harshitha Prem <harshitha.prem@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Create symlink for each radio in a wiphy
Date: Thu,  2 Apr 2026 10:44:02 +0530
Message-Id: <20260402051402.3903795-1-roopni.devanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0MyBTYWx0ZWRfXxlzfjjbczGNv
 au79B+Yb263PkIQyOLsDhEm3fkgoQ7dT9UB5uY35FFeybnrr2wbOIqNFyNQdyCxhWE2hjKUjzn4
 TgV9vLPmsnpQ8dVC9lH7AU2eg+H2OaWJKYJscrSF6Feg+xbWthu0VyzXPX1wRgu0Mf3NQ3QIwY3
 xV/qzo6gyczo2/6hLUY/cL+BsggUAbC751GEBa2hMkkReKpxc+FrpCjZDG0IxtYFBw3jiO5otnA
 4cSAwS/yaJaZnujJyNWg53PzWKxDjH0Bw32u2S64WZRc+4oGXOkKq6aCSqVsfT8solyh8V0hq3u
 pA4e9sBF8mLkrqpXdkfzJT0i7dTOUljZYpozYtM5oOdHY28bfJeWQWL1LUi9ICfbXdWt6D25v/P
 P6l27U16m4PVzOJV7UatC1UUlwAybfB7swaiseYiCxdBC9ztK3pzIASU3vMDrN5Uq2sb2FDCnsD
 b90cT9OhsHYGmgofnqg==
X-Proofpoint-GUID: sloRDiuuLAhLKJSm62o37Hfj2yAVOUTl
X-Proofpoint-ORIG-GUID: sloRDiuuLAhLKJSm62o37Hfj2yAVOUTl
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69cdfb35 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jmIJ6Y7K9lkSVFxMRE0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_221432_567389_8CF372C3 
X-CRM114-Status: GOOD (  21.95  )
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

In single-wiphy design, when more than one radio is registered as a
single-wiphy in the mac80211 layer, the following warnings are seen:

1. debugfs: File 'ath12k' in directory 'phy0' already present!
2. debugfs: File 'simulate_fw_crash' in directory 'pci-0000:57:00.0' already present!
   debugfs: File 'device_dp_stats' in directory 'pci-01777777777777777777777:57:00.0' already present!

When more than one radio is registered as a single-wiphy, symlinks for
all the radios are created in the same debugfs directory:
/sys/kernel/debug/ieee80211/phyX/ath12k, resulting in warning 1. When a
symlink is created for the first radio, since the 'ath12k' directory is
not present, it will be created and no warning will be thrown. But when
symlink is created for more than one radio, since the 'ath12k'
directory was already created for symlink for radio 1, a warning is
thrown complaining that 'ath12k' directory is already present. To resolve
warning 1, create symlink for each radio in separate debugfs directories.
For the first radio, the symlink will always be the 'ath12k' directory.
This ensures that the existing directory structure is retained for
single-wiphy and multi-wiphy architectures. In single-wiphy architecture
with multiple radios, create symlink in separate debugfs directories
introduced by mac80211.

Existing debugfs directory in single-wiphy architecture:
/sys/kernel/debug/ieee80211/phyX/ath12k is a symlink to
/sys/kernel/debug/ath12k/pci-0001:01:00.0/macY

Proposed debugfs directory in single-wiphy architecture with one radio:
/sys/kernel/debug/ieee80211/phyX/ath12k is a symlink to
/sys/kernel/debug/ath12k/pci-0001:01:00.0/mac0

Proposed debugfs directory in single-wiphy architecture with more than
one radio:
/sys/kernel/debug/ieee80211/phyX/radio0/ath12k is a symlink to
/sys/kernel/debug/ath12k/pci-0001:01:00.0/mac0 and
/sys/kernel/debug/ieee80211/phyX/radioY/ath12k is a symlink to
/sys/kernel/debug/ath12k/pci-0001:01:00.0/macY

Where X is phy index and Y is radio index, seen in
'iw phyX info | grep Idx'. Two symlinks for the first radio are to ensure
compatibility with the existing design. Add radio_idx inside ar, to track
the radio index in probing order.

API ath12k_debugfs_pdev_create() that creates SoC entries is called more
than once when hardware group starts up, resulting in warning 2. To
resolve this warning, remove all other calls to this API and add one
inside the ath12k_core_pdev_create(). This API carries all pdev-specific
initializations and can conveniently hold a call to
ath12k_debugfs_pdev_create().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
Signed-off-by: Harshitha Prem <harshitha.prem@oss.qualcomm.com>
Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c    |  4 ++--
 drivers/net/wireless/ath/ath12k/core.h    |  2 ++
 drivers/net/wireless/ath/ath12k/debugfs.c | 29 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.c     |  2 +-
 4 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index c31c47fb5a73..2519e2400d58 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -835,8 +835,6 @@ static int ath12k_core_soc_create(struct ath12k_base *ab)
 		goto err_qmi_deinit;
 	}
 
-	ath12k_debugfs_pdev_create(ab);
-
 	return 0;
 
 err_qmi_deinit:
@@ -869,6 +867,8 @@ static int ath12k_core_pdev_create(struct ath12k_base *ab)
 		goto err_dp_pdev_free;
 	}
 
+	ath12k_debugfs_pdev_create(ab);
+
 	return 0;
 
 err_dp_pdev_free:
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 59c193b24764..046249c8763e 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -588,6 +588,7 @@ struct ath12k_dbg_htt_stats {
 struct ath12k_debug {
 	struct dentry *debugfs_pdev;
 	struct dentry *debugfs_pdev_symlink;
+	struct dentry *debugfs_pdev_symlink_default;
 	struct ath12k_dbg_htt_stats htt_stats;
 	enum wmi_halphy_ctrl_path_stats_id tpc_stats_type;
 	bool tpc_request;
@@ -673,6 +674,7 @@ struct ath12k {
 	u8 pdev_idx;
 	u8 lmac_id;
 	u8 hw_link_id;
+	u8 radio_idx;
 
 	struct completion peer_assoc_done;
 	struct completion peer_delete_done;
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 358031fa14eb..8c81a1c22449 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1473,18 +1473,35 @@ void ath12k_debugfs_register(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
 	struct ieee80211_hw *hw = ar->ah->hw;
-	char pdev_name[5];
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct dentry *ath12k_fs;
 	char buf[100] = {};
+	char pdev_name[5];
 
 	scnprintf(pdev_name, sizeof(pdev_name), "%s%d", "mac", ar->pdev_idx);
 
 	ar->debug.debugfs_pdev = debugfs_create_dir(pdev_name, ab->debugfs_soc);
 
 	/* Create a symlink under ieee80211/phy* */
-	scnprintf(buf, sizeof(buf), "../../ath12k/%pd2", ar->debug.debugfs_pdev);
-	ar->debug.debugfs_pdev_symlink = debugfs_create_symlink("ath12k",
-								hw->wiphy->debugfsdir,
-								buf);
+	if (ar->radio_idx == 0) {
+		scnprintf(buf, sizeof(buf), "../../ath12k/%pd2",
+			  ar->debug.debugfs_pdev);
+		ath12k_fs = hw->wiphy->debugfsdir;
+
+		/* symbolic link for compatibility */
+		ar->debug.debugfs_pdev_symlink_default = debugfs_create_symlink("ath12k",
+										ath12k_fs,
+										buf);
+	}
+
+	if (ah->num_radio > 1) {
+		scnprintf(buf, sizeof(buf), "../../../ath12k/%pd2",
+			  ar->debug.debugfs_pdev);
+		ath12k_fs = hw->wiphy->radio_cfg[ar->radio_idx].radio_debugfsdir;
+		ar->debug.debugfs_pdev_symlink = debugfs_create_symlink("ath12k",
+									ath12k_fs,
+									buf);
+	}
 
 	if (ar->mac.sbands[NL80211_BAND_5GHZ].channels) {
 		debugfs_create_file("dfs_simulate_radar", 0200,
@@ -1513,7 +1530,9 @@ void ath12k_debugfs_unregister(struct ath12k *ar)
 
 	/* Remove symlink under ieee80211/phy* */
 	debugfs_remove(ar->debug.debugfs_pdev_symlink);
+	debugfs_remove(ar->debug.debugfs_pdev_symlink_default);
 	debugfs_remove_recursive(ar->debug.debugfs_pdev);
 	ar->debug.debugfs_pdev_symlink = NULL;
+	ar->debug.debugfs_pdev_symlink_default = NULL;
 	ar->debug.debugfs_pdev = NULL;
 }
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 553ec28b6aaa..c2b747f1b9f5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15065,6 +15065,7 @@ static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
 		ar->hw_link_id = pdev->hw_link_id;
 		ar->pdev = pdev;
 		ar->pdev_idx = pdev_idx;
+		ar->radio_idx = i;
 		pdev->ar = ar;
 
 		ag->hw_links[ar->hw_link_id].device_id = ab->device_id;
@@ -15132,7 +15133,6 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 		if (!ab)
 			continue;
 
-		ath12k_debugfs_pdev_create(ab);
 		ath12k_mac_set_device_defaults(ab);
 		total_radio += ab->num_radios;
 	}

base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
-- 
2.43.0


