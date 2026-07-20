Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89F2C44524
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=; b=BGsPfa3cv0PSxURRn1T1hJmZZh
	d4/bFHvbGR5I6oXjXwN33qy1IZs5UR/RDokKOaG2s6lPYXbU4NW9fK8ev1hz2bH6CyGtRvCiR4dIB
	05dVIaHc1+MD4mfB3ZmuSShQ1jagc0wrC8PMZBvdmP408gh0uAAUL2S2w9bu6wDRaWoa0Ixi2X81J
	otJjIokb69A1BHNAVlHv03Cl/Irm0PfR0+eiOsxxEmoxLtRqjyxkKc+zZYiV6kC+BWDwgKsk41K8z
	6fe1yOahC+Mo4fMsqzp/r4n4dpEY13KDUnb79KjsxruDC9D+gHawbfvRxNhQyRnQDB75U6IRn+M3u
	JzO1f/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhj7-00000005zKS-292q;
	Mon, 20 Jul 2026 06:43:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhj4-00000005zI4-3o46
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RcmH1800270
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=; b=aDeEFhlvYTzVAgIV
	BaFeNpXf7krTTaQvgyPEGa3tOxY22zB6B9Yv5PXquBu+iA7t0OPpyUkKiyaJP/EE
	daprQU2iRGNgWhlVLOAzviToR8nkHk88TS4S+018qsowRfQICCC+zPC2TM9pYAUk
	T9+w9FdlttD08/siPe7u+grSMhB6fLPQvPyYSpr2nufuftnZ7SoFf6o+WN8WVkzv
	HWKtIaJRakw6mOZZ9E3gHNJDV8VJ3fJr8PjYFBsCPsH5rgHVdbVfGYmsV1fLF04t
	Fm6ZctZzlf6U8hiS03PBH8dlmRcs9/w5rGk5tT0xjsBPQ9yBiCVM2xwam+GNIjRT
	eI2LSw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c6ct27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso997466a12.2
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 23:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529821; x=1785134621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=;
        b=CMS0eTIPnFmG1j7TiUVRVayTyIrFTgnOf3QxGvC58jyd5ZwDp6BNHgq7F7L94OnDcV
         RptiXVOYFiGLw8rmNACrWms2TvoVrg6tQKQDzRE0wGtvfa3pjFJFDbtG6r4KH1FSK/8/
         Sx9UIvt9WAHtMaHr0Y772NbXTJr6xmGJ5AbmKKyr2lbwGm0ZymmwtB3bGZo/XF3/1M6J
         xwPC8oglmN395LgELt75Y+QkATQ+xqr8Tn6B9G372Fa57HE6y+lRuJWSxP7GbVenT7RW
         uV/QlLs7FfZTqefjHdofBnEh9DbxijuUfBc1fuXU1fMVz01R0h95tohq2sbPkUcc1klz
         lm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529821; x=1785134621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHqVBdkvTS9RGcZbYw3ny3/a6eyNFEqIY0DGCMDX0qc=;
        b=olUJEYIGwHsT+QLc2TLzfFPvfavEIDljtHhti6FuUkAySZ5pEZFT8rMIDV2INuCPFD
         +ufWZR5gHqYSUwQCn++TieeeVtHlrMp//G1DPFDmBNBedYbysDIam3CxYH6lPD+hqB9l
         bLFLdL3gwul7nhCjAwGquREBywhPYSDdGLAppeCuxLXp4jcSSlB9s9AIeDrDlPzgeyLE
         TelHlknW7O99ODk76rnAa07n30my5SQZ34PPD1cECYpQNoFsEaMUCuNrlGlJndIu2kXX
         j0fsSdXhUa6aOmNmowuFE+IE0q8Mqg3gyYbyDAkHJiHSE1TtuujWsHkEKx43XZ9541fF
         fviA==
X-Forwarded-Encrypted: i=1; AHgh+RpM692fOOlt1k4FxGQg4z1IjiiAd5AeFfVnpOLHB53/AGmqyqgXkUC481jESTobyDucm2NuDRs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMNiCfuFOuROXWsyJq3IgzhvR5MN8asztgN+rYic8X8i0ZSrsG
	qkcDHJQ27dAC/ZwOVZw7PsbpzZi2/tbqQtXKpEtB769g43ln2L4H4pK+6bk3WAjDrW76C3pcQ/s
	AcXGeQlzrWr7cr9bJwyV6VscwFc3Z3fHI0SvABeZTVRPatEb/8Uixi0tuOLzacO/c
X-Gm-Gg: AfdE7cnukZiOGHS3I6FAee/39owWUMBJmUf5HK6Jwxk4sAoPUb8ZgqRWg08ZZmIKFlw
	+bqcVaiT4OZMWPo8sK2VQHGmDovqpdtnXJU6QTIU/Z/pEkGrHpvvrEj626SYeTuLuQyoal7Bbmo
	DHu29c+x2DezDdOkJOXu3dV0y2FdyuA6zgOsl2s4NrddbyiuyowQLhubsUhJaWB7vK8AtrIGDHA
	fEc/NVN8ZQEZxQ1AfQ3l4hdLr/HwOk5TiuOr+4ps0O98TNnpQtuRSDWIWVkRUFyUR4LEpH9WquB
	WOqYgyBcxvrFp0F9ogWjL4yw0ZINUk4nPtGxcxXw9f202VgcMePuXdUOpcT90b0BH8m9YU8Aaoe
	yRqw+xK+9SBAWr2pmOjoFKXSXGNcKck6TFgVOnSBKTaNEdvt5XWi2BQ==
X-Received: by 2002:aa7:88c1:0:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84c2923d612mr13079325b3a.3.1784529820843;
        Sun, 19 Jul 2026 23:43:40 -0700 (PDT)
X-Received: by 2002:aa7:88c1:0:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-84c2923d612mr13078971b3a.3.1784529813302;
        Sun, 19 Jul 2026 23:43:33 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm3812097b3a.42.2026.07.19.23.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:43:31 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:43:23 +0800
Subject: [PATCH ath-current v2 2/8] wifi: ath12k: factor out peer assoc
 send-and-wait into a helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ath12k-fw-allocated-ml-peer-id-v2-2-630632758a80@oss.qualcomm.com>
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: yDnocVEKhG5jKPOcuMZprupNLLf9mnWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfXyvrFqek7HP3y
 1i2Gl7UB376wNSLTQLaHdxsEM8az6CYWfrpE/n9e1v8/sY7/0VBdEmCPe52I4n6fcXGxP6QNZW1
 hoeUMAsVhGCc9JhYoI68GZ4AcP3ymbjLP5nlICGfiw2fJ1HXghtS5Pr6z//BoGA/nlL0bRlmkcl
 TrYw8K7lIWsfCn1ec/kxRz1Rm4NUy8kicYEUPeDIyo0T9AjeR1dSeN7zIGlSs8reI7jQiBWlu0V
 tTE88cnwtSC7qOTgaAPVkggM+4Zv+bZnSrXyBQ/Xtplz2AT6wpN7P0LRinkkgpW0DI6EAvrHXoy
 JEoTSIxIlNajAWqg2UEv2oAY+jDQeei4PRxbBXqg8SybPzdl9CZ38zNB7xsex6tsras0vB3xDgm
 exXPUrk20AP3GLvbad6OijmwXMqknuPhE8HzV8LXK/oMslurQRuvtMVi1UoYmtaAjWEOCsxuAIn
 WDrqpHrBRUtFvpF0TCg==
X-Proofpoint-ORIG-GUID: yDnocVEKhG5jKPOcuMZprupNLLf9mnWx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfXy6x/WziHdU56
 5EhebmUdE+oK/FD8Dd2kZ1xMx5ZphTbkbyTWmSv5HjKM/xn7CxsDy2tISV1+sQZHjU4Vmb9FtqY
 CBtgEg4v/UxQAlU/JxhGynI6BdSGygo=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5dc39d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pIzPn9nKbmV5hhrGKQQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234343_066842_841A8E75 
X-CRM114-Status: GOOD (  15.77  )
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


