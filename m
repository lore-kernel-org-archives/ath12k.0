Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6171C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=; b=QEtFTmAG9CsITAmcUySshNaFs0
	kMLQ66x66+xY25eq/1CXP+b+RNsQdkgm+xBaxyyuLsDYSRhEYyMhad6pztkWPlE5x0BQemK0fts3A
	kFUeedpY7JMV5W2ZReZFqiyC8uF5i8zPN6rhgQaCC5jPHWVF9T8z/F9AsZy9swWkSlRM5sw1VIN0Z
	LNQMnUdNBTRZJq7SmrguF1Ik4syQLlmIgJs0Hag2omESD+NrrTuUW85Ni7dFuc1r30K22rJpQ9jQD
	fvVCSVdLvqvblMrOCTWx1WfUY4HhCgqPxK7bpBHEhQP8tjfvFooZPnG9n96+2oF0DfEk6mF6G14qw
	kd264UPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAh-00000008Qq1-2NKy;
	Mon, 13 Jul 2026 07:33:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAf-00000008QoU-0DRv
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NniY469617
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=; b=cbNVdvkAUEjBNEwh
	IeuJBP8QuSZaeVi3jKFaYwbpYpNIS4BTns9OKxsMbtvCT6CfMQGRh7+QD8JaIbbX
	7qHcUsM2TUDsE/zaHE2kHGqnDbGp7NwtnEOl6rPgMWbho+jQJFAJZFkNeWhlBV71
	u11PxtSk3FfaQSusnOqrnUobIHVSomxACE3tRh4L8x51N0Kx/VlSvJSUWQOY3/Oh
	1ploYdilKTZk/A8omdrlSapl6dValW9XFwddTYsCcDjxjofI7wc2MUMkiirmqtR/
	bqOPR5ANK5vuavNBnBlLj4IFaR/2+qCJhaWZlYRbU2he3j6kwbqjWbDvfG0i5Vj4
	dXkoag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf484y95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so39837795ad.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928024; x=1784532824; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=;
        b=aeiksINWExw8ve/aCqjOrO93UzZiF1GfP1fNgV0cWpEseEkCOHEDDp7DniBBD0hzcV
         1gyBomqXGfEaupoSsVtoSP7qogTJ7HC0ufSlXa8h5+Hy+4cNXYg9LprvpiET7tN5GLt2
         Q+CbQISychoE6ku+Ue84q/JDwRl67jpEaOpyxtDKum7BrsQxmmq4TQftDx/rufvNa7Y6
         TKzydRd7p2xIgfv58fj0QSkxspoBzdNGWQPWSnoXGiEiLM5DCy3N7YxzmJFFjFq9L2fT
         4PkNJdzAw6u2v42can4/Lpky8xLWe0KiNENguIo6xIMpJp5ZCvIFLUNDUZ0wgV7fTo4z
         72SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928024; x=1784532824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=;
        b=IwPROTaixnasClVA1vofYXhQoioIGdpDaVcD3IZfoCAkDM+r1b6I1CHw6WUT9Hu5MY
         yga37zq5RSVuYZ+NBXDJg6PFYknGpLlZHUE0Y3NmaAUM8d0U4ms2BqeWNSmw75HrnNoK
         NGD7JhKVM3zPMQApyUzSkL7L7QT4Cy0pqRhfD0wd8j1GxkFoLYINdlufOuqckYh/gBFL
         DRF1xwHY+q3hvDdmiVtSjJKfT6VpFdH/37WXeX98iuZqW86UNFUYrHlklyhxw9f7WcaU
         Ox7zYVjJnNadtabXY+hqI5Hn32QjABN/pwcL2+xQR6b47Zx74ZcRwmZRWn0zF7TaU1Nq
         C/Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrqL/HItv8mOOQRiBvzpGD63C7LF+UNpAfTKvUVBiQbHmH7OpX/vdGCCssUwPau7siL++YyV68=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWs7H32c4kqbj0HgZ1jj+S3PT3ighd9tL+1zjWL8lXByJvWH2G
	eXTzGZBROXzL2MbZ6vRG0bdYIpz/fJPabZky0sbzne72NUbqibm1iZnqwqTdHkQEXKKDpRBUXhX
	UdTA/3umkXO99grABCa5HWYtnKcSnmeyST59o2Egetvmw0z0ae4Oa4yuQrFMwqy5Q2w2/G0kX/Q
	o=
X-Gm-Gg: AfdE7cna5A9rVuy7ql42mhzqjMVoyfJMH3mgmN0dduy4R/AVB40aVuJovml7fdkihYP
	Y3Zu6ouuTGPZLlE6oKm/jIqEeK5ka4KYBL8GKBPbB9pnQgS7Dyh3FncQh7fqa6v+AXkllkW84qf
	S+OMTVkZ5veEpN0fjsBuWhYt+DM9ibaJMHnl29AT7V1RPIqHvTtPmzEzRa4mWPP02n9nGOizJT2
	uVekG8V4WFYWFQy8YhFrO2hRk7SP1q1jaFVLHjgVcgYiv9nc4/zeqZuWFpIrV76dQwrS7duWFM+
	WX4u7JjPpyZaIBXAc0c9l6V5D2BjOgYdEDhnF8ZDfzZz5It81CxYW877hA1bnM5huQ4bI8fGo+Z
	9eosOaMf9jvlHWYroJUNOeBmsOb6scHmfV5K4tvB10uytL0PXlQ1NOezmEyaHWiZN
X-Received: by 2002:a17:903:2f83:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2ce9f15c5fdmr80618905ad.37.1783928023952;
        Mon, 13 Jul 2026 00:33:43 -0700 (PDT)
X-Received: by 2002:a17:903:2f83:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2ce9f15c5fdmr80618635ad.37.1783928023341;
        Mon, 13 Jul 2026 00:33:43 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:42 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:33:17 +0800
Subject: [PATCH ath-current 2/8] wifi: ath12k: factor out peer assoc
 send-and-wait into a helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-2-d0a2a1a519eb@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX8mn7I+PRBmqh
 ZWiiqcIUH8DzRQE4A5TBbW5lGXUKwaMMmm3avPn9H2PKRJIEMy8Vh6eiv2smUVI4XHHImdllYI1
 s1FdEkX6KIvu2FWxg7C4qsM+20JtHpk=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a5494d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pIzPn9nKbmV5hhrGKQQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX8lF28jij0PU3
 WSItkDH0B33QMOqB7tYJS+X9D/043AgDwhitBMf7mmCHCQcmR37fGpcJk6RqCcBQ9UFhKt1snK+
 wNmQgPfQoXqVcoy0r/Auarf4+5IJ7FgvSG4KYTF/3Ge7dBx4Yjl8wRRPohpAAoIfh7gvMRAd643
 6tcmIYQn1GYq2O59Rvcr/I0dIPWPCrciq8TPaVmWmeI/9J1z/WkI0pHrNoJYV8w1De9u98uPptg
 +EcZTAX8OMH5dVp4WlCetUu6JvTuUg5zYoD/8RKI1T1jn7T8tnvXL8nJWZmF5MONOzvh+zpzva8
 v6EmCad1I5yL07uXconFELdrw3f2F6jmmx0Wt41nMN4rbppPh5XQR9VsLJ2je61cpBb6cj5c2Q6
 xeyyUUJkblXMa4MHxtFuUkYczWPwT5wHjf41PonE0dfh76bmKyh7EXH+erjaibhgLKb/DFNZfdO
 xda/5CSvil7zBuo5XqA==
X-Proofpoint-GUID: GHBNDYLIHHX2KHPwA6Ll3U4Z1gL7R3Dr
X-Proofpoint-ORIG-GUID: GHBNDYLIHHX2KHPwA6Ll3U4Z1gL7R3Dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003345_093432_A562ABBC 
X-CRM114-Status: GOOD (  16.34  )
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

ath12k_bss_assoc(), ath12k_mac_station_assoc() and
ath12k_sta_rc_update_wk() all open-code the same sequence: reinit the
peer_assoc_done completion, send the peer assoc WMI command, then wait
for the firmware confirmation event. The reinit_completion() was buried
in ath12k_peer_assoc_prepare(), far from the wait_for_completion_timeout()
that consumes it, making the reinit/send/wait sequence hard to follow,
and the three open-coded copies are easy to get out of sync.

Move the sequence into a new helper ath12k_mac_peer_assoc() and call it
from all three sites. The reinit, send and wait now live together so the
completion's lifecycle is easy to read.

While at it, ath12k_sta_rc_update_wk() previously warned but still
waited the full timeout when the peer assoc command failed to send. Now
a send failure returns immediately and skips the pointless 1 second
wait, matching the other two callers.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 59 +++++++++++++++++------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b7eba8ea981b..3e3b06e15f80 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3594,8 +3594,6 @@ static void ath12k_peer_assoc_prepare(struct ath12k *ar,
 
 	memset(arg, 0, sizeof(*arg));
 
-	reinit_completion(&ar->peer_assoc_done);
-
 	arg->peer_new_assoc = !reassoc;
 	ath12k_peer_assoc_h_basic(ar, arvif, arsta, arg);
 	ath12k_peer_assoc_h_crypto(ar, arvif, arsta, arg);
@@ -3835,6 +3833,29 @@ static u32 ath12k_mac_ieee80211_sta_bw_to_wmi(struct ath12k *ar,
 	return bw;
 }
 
+static int ath12k_mac_peer_assoc(struct ath12k *ar,
+				 struct ath12k_wmi_peer_assoc_arg *peer_arg)
+{
+	int ret;
+
+	reinit_completion(&ar->peer_assoc_done);
+
+	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to run peer assoc for %pM vdev %i: %d\n",
+			    peer_arg->peer_mac, peer_arg->vdev_id, ret);
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&ar->peer_assoc_done, 1 * HZ)) {
+		ath12k_warn(ar->ab, "failed to get peer assoc conf event for %pM vdev %i\n",
+			    peer_arg->peer_mac, peer_arg->vdev_id);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static void ath12k_bss_assoc(struct ath12k *ar,
 			     struct ath12k_link_vif *arvif,
 			     struct ieee80211_bss_conf *bss_conf)
@@ -3915,18 +3936,10 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	}
 
 	peer_arg->is_assoc = true;
-	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to run peer assoc for %pM vdev %i: %d\n",
-			    bss_conf->bssid, arvif->vdev_id, ret);
-		return;
-	}
 
-	if (!wait_for_completion_timeout(&ar->peer_assoc_done, 1 * HZ)) {
-		ath12k_warn(ar->ab, "failed to get peer assoc conf event for %pM vdev %i\n",
-			    bss_conf->bssid, arvif->vdev_id);
+	ret = ath12k_mac_peer_assoc(ar, peer_arg);
+	if (ret)
 		return;
-	}
 
 	ret = ath12k_setup_peer_smps(ar, arvif, bss_conf->bssid,
 				     &link_sta->ht_cap, &link_sta->he_6ghz_capa);
@@ -6480,18 +6493,10 @@ static int ath12k_mac_station_assoc(struct ath12k *ar,
 	}
 
 	peer_arg->is_assoc = true;
-	ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
-	if (ret) {
-		ath12k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
-			    arsta->addr, arvif->vdev_id, ret);
-		return ret;
-	}
 
-	if (!wait_for_completion_timeout(&ar->peer_assoc_done, 1 * HZ)) {
-		ath12k_warn(ar->ab, "failed to get peer assoc conf event for %pM vdev %i\n",
-			    arsta->addr, arvif->vdev_id);
-		return -ETIMEDOUT;
-	}
+	ret = ath12k_mac_peer_assoc(ar, peer_arg);
+	if (ret)
+		return ret;
 
 	num_vht_rates = ath12k_mac_bitrate_mask_num_vht_rates(ar, band, mask);
 	num_he_rates = ath12k_mac_bitrate_mask_num_he_rates(ar, band, mask);
@@ -6840,14 +6845,8 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 						  peer_arg, true);
 
 			peer_arg->is_assoc = false;
-			err = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
-			if (err)
-				ath12k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
-					    arsta->addr, arvif->vdev_id, err);
 
-			if (!wait_for_completion_timeout(&ar->peer_assoc_done, 1 * HZ))
-				ath12k_warn(ar->ab, "failed to get peer assoc conf event for %pM vdev %i\n",
-					    arsta->addr, arvif->vdev_id);
+			ath12k_mac_peer_assoc(ar, peer_arg);
 		}
 	}
 }

-- 
2.25.1


