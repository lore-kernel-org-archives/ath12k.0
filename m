Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA2DC43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=; b=MVJvw5+PhHhWXbeFANHf6EWsvy
	1ZICPAJEcF37hvCbg7nEtvVnz/1THoVJ5F0Bgxv+bUkfZeEEhOSqlxl8/TNIuVGpbgDg0PlAWCiae
	J6Uxt/wfD3FhBTtlbv0dtPbs3Oc8cp1N+MJwwVABQh8mkDBpohWIVDUIs/BEd31q4SnNrrNaRPHKZ
	OoMXiKW4QyMHLgL/tpaglNDszh6jj2Vj0R6XUXMyurQtadJD1a/At91AhTx/obvLQ/hhpV05QOJ0M
	ze4IWqXpa+prM3p1WgqqpK/8BClViM99jBJGYa5JFDJPXKjs+nq3o3iu+9UCKBiSOOGMVl+8MlS42
	+NMtiEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7c-00000008Pla-3fD1;
	Mon, 13 Jul 2026 07:30:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7a-00000008Pkx-3OYQ
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:30:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhpH469297
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=; b=LCYlIHNcyydq3vdI
	MR2zmAEaG0+UrIEfnTvXW/PB3Vy4AcbWEQguNvgp+r0u8YPi7+vTlTNTrdhgNutt
	8bdoMxIaB0MTq5cjc8ulQ+vpk1/pppDmU/GPXO0ZoILA2RIeITCu2iA+wO2j/73p
	T10ERJlBPWjltF35oCWQgHjH1X5tuQeAuoTddvDUQppx2Byc2hBr6KgAurFEQn7r
	K//5WQ/VM4o0bh1c2RTY+OD66xE9gTH+Ym50jz38hRJa7syzpCkR+XSl+x6KB/Ik
	5NF6t2YlrzeX6wSJf7vGlQD7o6mMuiZlf7Lou9vuvJVu0et2JeLhWo6zveLMElb0
	BrsKBA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf484xtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88fc985a65so2686416a12.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927834; x=1784532634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=;
        b=iAHRog6oW/vcodAkBCF4YCjk6xxe2mxwVoitw/MiIhCI1Js0hSQtjuDx2PaWgTBEk5
         ZqsX2/FcZKfUAPnRdAo8qcxB5OIoMrMFyXUw9S4hF+QRp3q7l6HkF9+CZX8l5erOErcb
         HjceT0QKLLEOh33fHbfL4dpw4+kjAR1ENWIYK0iODalYZ+QRiQz6xldIE5QP4rCtSc0p
         ldjWVzuOQ799zBY89wHxc3eKVXkOSgKY+SCHPoOPIxufOgFene22P2hUa4xZk2J6UbwP
         CXy7tOzf4bW8UGVrlgGPg3NLLbYgW8o/REjlI9cgvwQO95M/tZ97sVsn75fPBHIQmQmv
         h7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927834; x=1784532634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=;
        b=mPKaHNveWthnhaKRMzrMC80az9dvAGl9m4qTwlDs/rcMl5ah76NgxpmE26seRU31Nx
         FH4oZTgunWTivwal3huDstXrjZBmA+Mj90cqxhZdwlx02WxO7//YypZIl5r29MKOvMlQ
         GHo+Up4T5hdctl247DcQCMEaHqSB9p+d8SUIht0Mu0ayBsTy2hPQDyaTIMqo1tXMp6Ix
         xRFcrJv/xgyUStqakdVDxitv9XHxBvxhYpPoSPPiDrEgwH+4WCYddQ2YNC9HFl220qrs
         BYqiZf+8Plw4houM82krL6kJVZaJng1u9I9f3oo29vJsR+zEb/Rv7S1TuBbb31hmG8wz
         PKHw==
X-Forwarded-Encrypted: i=1; AHgh+RptYretZ2n4WzoAsscIzeu7HTcx7fgYCh7St0Csn2JLNEBcOGFtutWH1Iz+ZMz33L2UJuY5KYE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZfF46I3axgjz94CkvW73yN5M9fJEL3tiyYDN+u9t1yRs4c3gi
	fDd73TxYsZcYOEYrTBwtn+JJthpdkxJ32guHVi23wvNQJT7MMy7HbcayV2mhl92h/Apj0JGzkTv
	GX4Hd1rTHSTScPtdsAcK8NmL8ez8L6V+tbpVj0vANb1unld9mAczMUR/Cfz9zN6pr
X-Gm-Gg: AfdE7clUvDBRoLKeXwa1e1p3+9P0XM8+TNlhlK123gzkl4/MNA4ycxkHiurGiSgNqbu
	fWp+VLnbOyycPIAi1Qlc7yMYyR7hrwJs0ndhl7+oTkbW+Tv0Sc9T8w5gZtIZjpyeWO5VPkje6ys
	4tUIXWdYy2wq1phnLSU1TasorzYn1rJ/ju609yIGW/U+gg925MDcCKCATkksL1sKGo2+yrvjIwu
	a1hpIgPTyzXN8/IOKR3NRZbSdeCG0Oz+88H3NXop1Hf9EzX6sSWQmwGADfrZW7beqe1grmi95sM
	oLo7MfaLdvgeDVxuNugozRVz8ANA0rIy85Mm7lgdSv/AGhCC17JKl9VGT1+ePw8hV8swWLKc4BQ
	DnFDkNT3eDjYk5GrywOibQGwVLmIQkd1M60B0H/1tyiWs4/fjO9RTWkAmlnJPP5L6
X-Received: by 2002:a05:6a21:7a43:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c110a7b347mr8961894637.76.1783927833672;
        Mon, 13 Jul 2026 00:30:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a43:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c110a7b347mr8961872637.76.1783927833257;
        Mon, 13 Jul 2026 00:30:33 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm7947252a12.19.2026.07.13.00.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:30:31 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:29:54 +0800
Subject: [PATCH ath-current v6 2/8] wifi: ath12k: factor out peer assoc
 send-and-wait into a helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v6-2-20f6f212e413@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX/nf8Ddzh0jbz
 06oKa8KthBtbbBNHsrI0zSqD2APmZK6KpT6TPpoR6k+jQeO+FmZ61IetsgQV8LnmrSLfypw9Czg
 i/aB2IsQQxqpT2Iws01MWwhepQWJwkI=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54941a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pIzPn9nKbmV5hhrGKQQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfXy8/MK4GHYo9f
 GmXSz88bFWGp/zHQtv/xuA+99nP4VcMv1KnDvkw/WPRGblu6Ad+xX+Q8M3iHteYhmnTjhbuF42j
 KGvfL2S/ILOG2mqSQeR9PcprXLv2R34nXVHu7eSQHiNLyJZQfJHMCUu1IyuwOronVN7tcKys5qy
 HBZgT9nu6A8BBZ9GQc1Xe1oFWNXo2Wk8/eYGfd26UUMhst/1UGK8JiLWJdsEWe5s3mxmcP4QXF4
 DE3CwcWf30YS23vJajhT9g721agLlpeeSYWh8DUEQcO/CuygDv4uhLOPrPkXeBV+/ttd7/tyknS
 MlHpGrKyAQMr+2IQxNdah61QnWVLWem7VckJBCIQlINViYNtw18Z82nY62+Fafl7bsDb2pmx44t
 lidb9ut0QQCywKsiK4t7npJiW/IOxHtIS+0ZwbZeNmX3ABkZ5jl01IvvEte5w6zaJUcDZPigNAb
 zs3PWW0DihBU+NfbQEQ==
X-Proofpoint-GUID: YDGGgdK5AmYHq5rXqtEZtR4otygRLAff
X-Proofpoint-ORIG-GUID: YDGGgdK5AmYHq5rXqtEZtR4otygRLAff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003034_866296_060FC9DB 
X-CRM114-Status: GOOD (  16.44  )
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


