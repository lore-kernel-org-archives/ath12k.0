Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40A606A88F
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XZKI3RJf;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOmgD5Sj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZ1jsTDl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nbDRUTCjPqhAgek+pBusAFytes8H5KmD5kCm/TKSo5E=; b=XZKI3RJfwKED0n
	vO7MvJH4HeXmfy72e+sAI6gyhrd1ZNgyEtV9Gdr3lO4DGBowK/OPIeiZAUapoRq5XruB3wcMOM2Ys
	nTkUxhowaua28rBXSlFFS8MKrWbg9/S/EKjwSPR+FvU0KmRXEfz/v6obdU+jL4jTsCXsYKuT2IvE1
	suYeyciBlQN2RZyHP/67ZR36yHaD8xskq2qIoRgbS2lQeIcyJU59UwaaVW3/Vu+FHTdX/Xcs3j5vm
	omX7pi6ApTjd4TPYX/SCcaKfjW9QKr8fGuvNsXmzK0R7CKhSN3FItwFPDpxD5I0dpWjKAHHmmTO8c
	ApFhuYfFF+T9HKFhVFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqJ-00000007ZJ4-0vji;
	Wed, 18 Nov 2026 02:56:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqG-00000007ZFp-2qR1
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:56:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6dk1989923
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nbDRUTCjPqh
	Agek+pBusAFytes8H5KmD5kCm/TKSo5E=; b=bOmgD5SjgRqTDRntytt1/YxUHFR
	0m8KNT+6DyqTn+lXmxruTvj2h3WgtwyYCTJGYiGAqP+xExKKNKO/+rpY4skNt6Sw
	cTvHZA8qvby9PDxwF5n5qH70Ertwn2CUZZcxk/T+QsZK8tHew6ZaBOK3s5Wdzcv5
	sdUX86mFBcLr1LS0p55p8m8VZ1uIVYKp+lPAKhcKJ++rFSPt8vw6ZaiFEdrsYPfl
	sRv1RwJgCRNYee+RkgaD9poWE0sLcXMAxWtdAMeXrk61sXKr35u5RhXJFY4hYuQX
	LjDxyexLtyC1MheT18vDKOe4hafjnbIjvW6u0qzDvKIO13E5UaNf7IgHndA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8guhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb5375cd68so4874425ad.0
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970571; x=1795575371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbDRUTCjPqhAgek+pBusAFytes8H5KmD5kCm/TKSo5E=;
        b=kZ1jsTDlr0q5CN4sxO1vSQERYM0iIJSqs7EthjatvrLDIj7iU5DLk/Wqgc3xhns/y4
         PloQNYG7k0kQsvkWnzGi8e1A+7dcYX0h3PR0DRMQkCahT/fIHgk7Dkb9UiF90u4w74BJ
         noh3kd4BxhbXCW8pG6jr+X0uy3qTDElkq0epHWH5DzyPWmFWdyldWLLJl1HC+dd3Iveh
         dC1czFNbr8R10XnsKtr7AHW1ROJDW2uPo6xwL2gOEVy3zDCQbIDeMjgJ7ClB7e8wJcbe
         Wy3J2Xsvbcfm6+rQbYi1Ojscbp6axfVBPTfveHFsRrr4jiL39dwhgjBKWAB/NldBP4k4
         Akcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970571; x=1795575371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbDRUTCjPqhAgek+pBusAFytes8H5KmD5kCm/TKSo5E=;
        b=jBc9ikWHvO1EDk1X/OtpoVe0DcDcHJY8hDE+Sm2+P1vhehv+ntxMBuUS5Bk7fHnJVr
         Rn2to0PtnKgKLP5/Fwy8Bq/XdW9PN1At3NEtMYW/rMJTN9xfC6JGVu22+PvnlDBLTmA7
         PYTmVRAi+CNpmcZfpFo7dxCjJm24rYKkjcBsKmMz4g2M66g7KUgJ1y10pr2J+pQN4quQ
         ivqz+0XOr2Xzx4LIMzqxIAT8dqzsXUJHJl4NyDQ7vwMlQQ2lzN0Khanmw4KEUgeGtxJh
         H08R+jP6c3ChPiOohSScOWjXB/huAYDyu3WHYtdjv0xVdIlkJPG7VzptEE+yBOMXmTeN
         piDQ==
X-Gm-Message-State: APuU4Z+6nRLOHeSE16BioYjjZHhSlNV0nM3vwpJ25mJIa+eOftbc87eP
	NqgKs/Xz4wBH/tA72FxVNeqL1ZIoRAyRtSmNzDuXX7ZjAg6S4pAtd+XNjUn4+F6re848V3FgnyR
	DiElWvB7z6HDmuTgNH9Iq0gwutSwoCPaR3aY6kyNPbKdKxop/sXs0hpno2on3yyYdLukkRk/W73
	w=
X-Gm-Gg: AZFdTZdk3bAVdzq9K+e+TLeSUHGYsMBS/lTbHEH+w27WI71oZtr8lhG+X2vca/kG17D
	eMHHdMZvtNCG+Sam00ZhLAGch2FZ8ZFjDgpaYOyHP6+gd7Qwmfakx8VpOTzl+0fxLmp/xO0vrqj
	g9PuDAbWhyvFX4JSvcs56qXfXNasHWSXkVzNLgZtTLjwQc9owJMTfcmn+Kqy5Z4IgRsA4MeyNYF
	E4JzRzDGvElwXaseTEKtvBVnFtH48IzxZ9vrr7c9qlzuiDzqfEq1ZgDqRtplA+RnkUhjZbDY7tb
	+DSD5ejSrfrYwu+QuOz7YMzJBssPkVT+Xo/1URFvM2lXtBEo03M7hYvOhKJgg5d/GP35NnQeyi5
	QQWpUQk5r4iGc6abFobMakJvFM1hduuQOZ7whX7F32Uu1xpf1LsdD7A8Hj3JdvobjQYVUzuFmpK
	8SouN7vcu9cO7PoO6NU6IA7s1OaezqYYE=
X-Received: by 2002:a17:903:1ac7:b0:2ef:eaa8:9b55 with SMTP id d9443c01a7336-2eff753acfbmr9743685ad.53.1794970570587;
        Tue, 17 Nov 2026 18:56:10 -0800 (PST)
X-Received: by 2002:a17:903:1ac7:b0:2ef:eaa8:9b55 with SMTP id d9443c01a7336-2eff753acfbmr9743535ad.53.1794970570002;
        Tue, 17 Nov 2026 18:56:10 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:09 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 5/7] wifi: ath12k: restart STA link vdev on chanctx assign if channel changed
Date: Wed, 18 Nov 2026 10:55:18 +0800
Message-Id: <20261118025520.39269-6-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _9pO9T7GUJNW7ptH3tVG04qAOYFkFOwP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX//k0hNnfMVmr
 ZOO6gZwIsJvx0wPX1ljLGKi+AcWEoY7lT89CgFBvobthJemhkE5kHaIZrxAqgNNSmejSSbUz51n
 ANJTNdUtR8rcSdlAGmNpv5V+sCTmSTo=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd13cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XL2xf8-uihB83E6xwaYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX9HTCNBBqXCC7
 XM/sRfKPzWXUG/1GT1s4hVYYlOXnd4XYUlWEJ72MkFUKT1ZAonmPrvbA669h9TVNGPeL72vplxa
 LBslNBpt2AxF9IzDkIHQS7EqmD2uvXsHPWMBxfnD9QMsQcHpvtzG7Sg/UFSQ5t8n3rBGT1xSeVq
 /YWpKllJ7ILLQ/R3SZSWdo5DL64tVl3exTZmqK2m67A4iHLqU48/X8Gao3Cu3vj7HBvxAp7ooBU
 Evj7NIee+GmQqNbM0EalgLUtSY4XrZlqGkepaKUQvAJAscu0pyq3SbdQUQS7mguyb3NvvkCX+Ys
 4kI6ciIzZ1rSKqKhWarem5wjCaaNnb33OfVNHpP8N2L1LTvu4WKV8Y0hKvtpLN7SLdat0KiZwfw
 urHmmh2Tl/17xLweOCfV/zQRF0AslqBJEs4NHjJliXCvtgsDxsL9gp6Hc4BjpEQu2HMYet+AC1J
 JaSubVTE+MC/DS/gXRA==
X-Proofpoint-ORIG-GUID: _9pO9T7GUJNW7ptH3tVG04qAOYFkFOwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_185612_861660_1C054603 
X-CRM114-Status: GOOD (  27.22  )
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
index 08d9af0a1127..f57d4ef413e8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7167,6 +7167,13 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
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
@@ -11536,6 +11543,7 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
 	}
 
 	ar->num_started_vdevs++;
+	arvif->started_chandef = *chandef;
 	ath12k_dbg(ab, ATH12K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
 		   ahvif->vif->addr, arvif->vdev_id);
 
@@ -12430,9 +12438,32 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
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
@@ -12497,7 +12528,7 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx unassign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
-	WARN_ON(!arvif->is_started);
+	WARN_ON(ahvif->vdev_type != WMI_VDEV_TYPE_STA && !arvif->is_started);
 
 	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath12k_mac_monitor_stop(ar);
@@ -12514,8 +12545,14 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
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


