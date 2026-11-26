Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883EF606A6A7
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E6twt+3l;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QRtJRlld;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Flp5Mr10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rUmomVq3pxKdEuVLsOEIdEZuTgnyv7Nb3Q+X1uZgbq0=; b=E6twt+3l9gzAOg
	o/PXiWkUZtGunBkDosHbnLL37UO2yGJtkdqiYCRxSIlWilKukLqXOsw9IwZ7qw+BCxrBBN/asf4yc
	QOKqYjJ3XBv3NB4NGiRZy+wZ08knXGWqApsZ+9rOoX4fwJLVfToyTlSobbxAYADgzStQ5+xRi895t
	8MVsdkWybT3w7OSLa4QK6pA7tp/9Ftxytrm9pyrXmcbcBTa6tpmXx4kUnaQGSPPG7v87GHW54Bzck
	yZUKG9Y5Y/wzW4XrVgu8CqoTwRIlWRISG80e1Hx9gWnn/W8CAfRS3v4rszqIt9UUZAqrDKQo810/V
	fZ9F3KI0sj2+z347xIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVfB-0000000CX5q-1C8r;
	Thu, 26 Nov 2026 09:21:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVf6-0000000CX0W-44Qa
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 09:21:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NYQK2860059
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rUmomVq3pxK
	dEuVLsOEIdEZuTgnyv7Nb3Q+X1uZgbq0=; b=QRtJRlldmAvKKEDNR4t7lUUnzBu
	wUAljhQXDI9vFpeR6bsXyhpR+LyXWRPGIjyu4TbdkMleXAmxGhuS0DjqVnRtaXN9
	sMadzbIx2aVjYsm2TgR/SUNRxZohXCAvLTAwv8XhG4GKHcoa4AFYK6sRBAx0aEXC
	Ruo/uI/bg8z24bFR+0Ar/tCU3DZ9Potbxj1gxfb/GFt/2HaOQvbVC1HzMB00ar1S
	VBE16KcXGnEOMjGocGhCIlCdLan27+LsHYfV3XmZ6OequaaXGMqS8MgiFf8YVWRX
	mSMdNjDHPfM6txH8PqOPrG0DjpxGZ0pzqEK9NyvmawKOIk4knUjBjpiuv0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g87ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:21:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso4918115b3a.3
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 01:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684863; x=1796289663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUmomVq3pxKdEuVLsOEIdEZuTgnyv7Nb3Q+X1uZgbq0=;
        b=Flp5Mr10oykVFsJMN+aJKqqrJGlQ+K9/hRvB+lPA6xEJJZaXMQXOBznxzAOzBYE5cl
         8x66b3bBjDCoByH5+mmyAlRh8H6HlQcts4BZzdLsuFLsQTzpfJNJlDcEhmVICk18PHcc
         F3WZM8/Qy+rh3khg2CT0n0r3FnnI6kyba/6jCJprVjNBgODBdAUGU4LD+hj/Dz9j8rTV
         TvzEhvHbY1q1AAMwwekSepPRgwymGv6SaEapFqNm37ixlfM+3QF8LfxzSgVVzbBBKpik
         5wtDCnU3BWi/SU0TjLZUo6zRC6zztdp3aVm2zkpEuWAIfUM1FyGVETS6FyuXGCT9VEVx
         V6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684863; x=1796289663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rUmomVq3pxKdEuVLsOEIdEZuTgnyv7Nb3Q+X1uZgbq0=;
        b=2csRxZg1I0QwSGsellATvjkF34p2CgifFmiG/5J7G5DQIP9NgWlt5XMjyr6t06PVFx
         B3FxOhj7HCLqhMRQVmNCadMDNShMakAM8Yox2CO/btm5IHUp/JqzBuwcVR4oOui1TcMl
         /WJB/itfTb5BarES2vMmB+4tQ9E+NGwE52fIKkC/sCDqjPVaRJ+X1Ki4euBruANBovzL
         /J+uW21ql3cfxtgGNFK1V+/xKXYn1ll5DvgmLcaK/e1neQFfm+VHLEHyn23SX6kWjut8
         mPGf4uQ8kga9/49gLKAM++64M5cF+T1ZFTtX3BdccNH1a0JakURMqM3u364K/YCZjQuB
         q5+g==
X-Gm-Message-State: APuU4Z+fwpNaZLrL3gvR5/zmuO+1WRvvMhXHmPRyqrrWQmW9oZSBed0F
	3dB8Msaj9sqx9JPZdpRTYkQ6EJ90smQ/wNKtLQlz7RZZHLwSfRiHsLwsnFgfwozYhNiPgpxpiHI
	7DkQE6g86XSEN5WgJvqp/EZWSnELe1BzWVPTkL2lYUrIxzWbGTppP16U4QO5KlI++fAffELLNtj
	w=
X-Gm-Gg: AZFdTZdqm9cAelNgVx6IIeqq5+AJB+jfYPILrZpTMaImQoEiadP9qsaOh2i1eMnPURI
	jLNBtMO4Ox2mY2Hc+ZNUCI1PDPzxjq81QZyBuGIJ1cK3G6X1QNIjb7slZA84dF3hltoQXG7FM7C
	YxCbhj/FMHNpIOziQ5FhJd0nLwt7kJRCH8/0Bo4SL1PjJrhwk8xrzrNtVCm7RnyH6gWoG2aoWuX
	bCitOrxWL5AmhlUHwFb0eDIDuXwY6V39nZD6SJ/ZAtMMjSvXb3WGC7hhajTsvRlF6fAzmNonjX0
	3s/k8reucGkveDknToekatrCwOSxFK20x+VJdBTfScJX0Z3H8T5iUZi3gieVpPnvOyblzvaJ/zd
	hAOrEc9LUvdCxTQV8NjzQ0CR3T7ulby8cOTmrF9Sa5dazmG6n+YDuXmwuqA3bXPyG0vamrvtQfm
	Ifnz4i7ADCJ3LtFr3xOvUlMbm+C5bpz3I=
X-Received: by 2002:a05:6a00:1817:b0:8a0:5dd9:7983 with SMTP id d2e1a72fcca58-8c87b9cfaaamr18250004b3a.12.1795684862773;
        Thu, 26 Nov 2026 01:21:02 -0800 (PST)
X-Received: by 2002:a05:6a00:1817:b0:8a0:5dd9:7983 with SMTP id d2e1a72fcca58-8c87b9cfaaamr18249983b3a.12.1795684862228;
        Thu, 26 Nov 2026 01:21:02 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:21:01 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 5/7] wifi: ath12k: restart STA link vdev on chanctx assign if channel changed
Date: Thu, 26 Nov 2026 17:20:35 +0800
Message-Id: <20261126092037.462830-6-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S1WBQE5IC71kLd-tKO-aOP3ZRTVO869q
X-Proofpoint-GUID: S1WBQE5IC71kLd-tKO-aOP3ZRTVO869q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX3XvLkzR6/rly
 VXwQYng0qMPiE6OX+Yw6KjRAEELowpGmj/NdsUvwP9G0sSF4S4oqHntIlAxyu3az6AvATfx8TaC
 VgiQXH+rwrvuAIZxrTelHeVHATqggFYUwg5zlWzfhVKBG4pzJSeYvrRg7raSfUbDsO+q11QRbc2
 B+Y9kmxYSHtGwzyGlg1sIJ2NTTyJNZ1UCyrW7HtP6XmPIt1wsQ0wgsaegjtCBtccILGLSgM2cp9
 Md5CW5ksuBYWFUN9fPbWkl9dlUs08zgqOL3wJW9fadyq1U7Ez7mbyl8WDZo7znaK97Lz3QGeQp9
 Dpt2RZLW41dqwVUeH/rT8CaBBwmtBd9b6YpHz9DFwUYoNp+JXvOAxcsWWH2OwGy05DSafyaIcd7
 zoTtXv3NJBVUldpNbS8L8ueTk8cqICjjQiBW3Us9Q4Qz0LfMXk3V4ybtNJmRRnbdF83kty0CzXb
 Be/L2jcOANYysy+VL7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXx1E+sxw1a3yM
 xgM+nOLK6vI2cvkwN+1PrVkJn+L05ZqKXvk5Sm3OzXBU8UobH3zYU6yOxhX6/dv4b7mkx2YSYrT
 Z5C0AcmE2K13MmWauWUsXhOR9AUbJoE=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b07f9ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=XL2xf8-uihB83E6xwaYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_012105_145482_6C347F82 
X-CRM114-Status: GOOD (  26.92  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When mac80211 changes the active links on an MLO STA interface it calls
assign_vif_chanctx() and unassign_vif_chanctx() on the affected links.
A deactivated link has its channel context released, and a link that is
activated again gets one assigned.

Currently unassign_vif_chanctx() does not stop the vdev of a STA link,
but it still clears is_started. The vdev and the BSS peer therefore stay
in firmware while the driver believes the vdev is not started. When the
link gets a chanctx again, assign_vif_chanctx() starts a vdev that is
already running in firmware and counts it twice in num_started_vdevs.

Fix this by not clearing is_started for a STA vdev in
unassign_vif_chanctx(), so the driver state matches the firmware state
and the vdev and the BSS peer stay in firmware across an active links
change. Only non-STA vdevs, which are stopped there, clear is_started.
A STA vdev may already have been stopped, with is_started cleared, by
station removal, so the is_started check at entry is limited to non-STA
vdev types.

As a result, assign_vif_chanctx() can see a STA vdev that is still
started. Compare the new channel with the one the vdev was started on,
recorded in started_chandef:

 - Same channel: nothing to do, the vdev is already running on it.
 - Channel changed: restart the vdev on the new chanctx (vdev restart if
   it is up, otherwise stop and start), the same way
   switch_vif_chanctx() does.

A started vdev of any other type still hits WARN_ON() and returns
-EBUSY as before.

Since unassign_vif_chanctx() no longer clears is_started for a STA vdev,
clear it in ath12k_mac_station_remove(), where the STA vdev is actually
stopped, but only if the stop succeeded. Otherwise is_started stays set
after a disconnect although the vdev is stopped in firmware, and on
targets using vdev_start_delay (WCN7850, QCC2072)
ath12k_mac_station_add() skips ath12k_start_vdev_delay() on reconnect,
so the vdev is never started.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  5 +++
 drivers/net/wireless/ath/ath12k/mac.c  | 47 +++++++++++++++++++++++---
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..7c7057468916 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -331,6 +331,11 @@ struct ath12k_link_vif {
 	bool is_created;
 	bool is_started;
 	bool is_up;
+	/*
+	 * Channel the vdev was last started on. Used to tell whether a
+	 * still started vdev needs a restart when it gets a chanctx again.
+	 */
+	struct cfg80211_chan_def started_chandef;
 	u8 bssid[ETH_ALEN];
 	struct cfg80211_bitrate_mask bitrate_mask;
 	struct delayed_work connection_loss_work;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2b4dfef3efb7..e79a9e55c248 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7178,6 +7178,13 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
 		if (ret)
 			ath12k_warn(ar->ab, "failed to stop vdev %i: %d\n",
 				    arvif->vdev_id, ret);
+		else
+			/*
+			 * vdev is stopped in firmware now; clear the flag so
+			 * ath12k_mac_station_add() starts it again on reconnect
+			 * (vdev_start_delay targets).
+			 */
+			arvif->is_started = false;
 	}
 
 	if (sta->mlo)
@@ -11549,6 +11556,7 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
 	}
 
 	ar->num_started_vdevs++;
+	arvif->started_chandef = *chandef;
 	ath12k_dbg(ab, ATH12K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
 		   ahvif->vif->addr, arvif->vdev_id);
 
@@ -12443,9 +12451,32 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		goto out;
 	}
 
-	if (WARN_ON(arvif->is_started)) {
-		ret = -EBUSY;
-		goto out;
+	if (arvif->is_started) {
+		if (WARN_ON(ahvif->vdev_type != WMI_VDEV_TYPE_STA)) {
+			ret = -EBUSY;
+			goto out;
+		}
+
+		if (cfg80211_chandef_identical(&arvif->started_chandef, &ctx->def)) {
+			ath12k_dbg(ab, ATH12K_DBG_MAC,
+				   "vdev %d still started on same channel, skip restart\n",
+				   arvif->vdev_id);
+			return 0;
+		}
+
+		if (arvif->is_up) {
+			ret = ath12k_mac_vdev_restart(arvif, ctx);
+		} else {
+			ret = ath12k_mac_vdev_stop(arvif);
+			if (!ret)
+				ret = ath12k_mac_vdev_start(arvif, ctx);
+		}
+
+		if (ret)
+			ath12k_warn(ab, "failed to restart vdev %i addr %pM on freq %d: %d\n",
+				    arvif->vdev_id, vif->addr,
+				    ctx->def.chan->center_freq, ret);
+		return ret;
 	}
 
 	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
@@ -12510,7 +12541,7 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx unassign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
-	WARN_ON(!arvif->is_started);
+	WARN_ON(ahvif->vdev_type != WMI_VDEV_TYPE_STA && !arvif->is_started);
 
 	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath12k_mac_monitor_stop(ar);
@@ -12527,8 +12558,14 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		if (ret)
 			ath12k_warn(ab, "failed to stop vdev %i: %d\n",
 				    arvif->vdev_id, ret);
+		arvif->is_started = false;
 	}
-	arvif->is_started = false;
+
+	/*
+	 * is_started is intentionally not cleared for a STA vdev: it is not
+	 * stopped here, so the flag has to keep matching the firmware state.
+	 * assign_vif_chanctx() restarts it if the channel changed.
+	 */
 
 	if (test_bit(WMI_TLV_SERVICE_11D_OFFLOAD, ab->wmi_ab.svc_map) &&
 	    ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
-- 
2.34.1


