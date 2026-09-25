Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE06C98306
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5+0mAmKxUM1XeRLsm139VMveExpHBAiGp2IilLfPQE=; b=VgWjrJqCscLkcVqhB7AooDv4v+
	FMNtbAv2hKMRLKSl47Gu5H4Y6emIOFQ/U0PZyk/ls1jXXeFVXVTLelAVqAvUTSP1gR0+dxu8vZHgJ
	jdz31dWO/vYe75FW3zJnyQyVlqGpOMwRVGC0qdi8+eGQZiuZb23oXFzyAImeyeue+VoPxa+1ksm3L
	xjFr1q+E4fBPPFklvrqjgMV9Ozeuw9vSw6NiIuDapmiiNeTepAa5rA2rwAMkwmRypO4LoUfBQfhob
	aGWbf+DZR3OLzRhiWYT9Km3DWTqK1t6+2dJfDeIA7+6oiu1yQ0Bo9dbmuEWQB7SUJqqGkDC8CWAlG
	hIWg1vtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yD5-0000000Cfpq-3afa;
	Fri, 25 Sep 2026 05:10:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yD3-0000000Cfon-24DV
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 05:10:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YTg23736784
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 05:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z5+0mAmKxUM
	1XeRLsm139VMveExpHBAiGp2IilLfPQE=; b=htmiuO7BQRoqlLcpux8G5+qV0LU
	3GsGtNbAuwWkUvyvsTYaAgnPanCHyBGo/ulJQpY7a1boW7AwpotEIKKC6G2/IgMp
	3/TaXIjt212ymbilfcUBC2iURnsUggXFYnMswVC1r4/AiWoElMiQrE5J22ckRXLA
	xll7++/GZE/cS2TgW9eyjhNyoUc+kkJuA3v2TVZLIcvDp1HwBXkkBZcKfjV8tRXk
	QmEmIUvHKMjeYDDVK3h1KhiDG6mvCrsjcauLl4pcu+MwOiDAglcY8qEc/1gO0xJX
	uWpeOEMr43O09AGVx+jdU7wWItFdcckTvNOKXmw7miF7irTNMLsguOwLcqQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e2s2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 05:10:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso759489c88.0
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 22:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790313056; x=1790917856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5+0mAmKxUM1XeRLsm139VMveExpHBAiGp2IilLfPQE=;
        b=aTInVMHnDhYx5LUkb3JhIUhgpRg5Zob5GzVZaQBXZlcdSE7LfmI0HGDQS1q6/ZHFd/
         Vb/zRz4YDFzhrykNi4HAqFDCYbDfCw2F9TXzkQtjA577Bbx0ZSBYkLeWdoH8mOhX0XBB
         Y8aRAQEtzAX9WLPr5Rt21Ku4u3coidpFvx/l9ZYW18VByRXbOu1Tm1obzb14kZ2XO+7P
         td5gKbPT3KWjp7+6SwWqgz7cPceNJGHGMvc2O4sxgmy9TEaU+w2dHrIh47dRgJmhg2J1
         il1HgpE36bs+nTO+2S2Kba5fxz2Gqe8Nm8UHHDvsVgmWYD8PxEtO09RPeqR1iW4N5539
         o1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790313056; x=1790917856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z5+0mAmKxUM1XeRLsm139VMveExpHBAiGp2IilLfPQE=;
        b=XgRRmZK1aIi3Llds6zNgQZKuq1UFcED/Hchayne+bHeBo5CFERmJHgbdr96uKTF3sC
         Mjgy97y3sV6hDjf5WfdmOoAQ9cLm1Ff75pbOLWzw1WSBvztPYQVQBlPIQSitpZdRMPuO
         9uo/oeODWzdQhNfFB1ucKMdFHXB45Zl/nBIYt6/0K94fsrtD6EGE/g66MIyTl56j5LqA
         Oku1aL36ep6qt4rBfsaOuJRwa+oQwFxVeDdvoYGRPNG/etQevaqE1nSVq1C+ouFh4Eqg
         IQ2fguwsRHGcbq4NxODVGZ53TjslZgPkrfFvVO06OtJ5DX+PJ8XsbcZS/S1yAJ0Y4gAA
         +qcA==
X-Gm-Message-State: AFuF++kGSHsIe+YZefyloqGLbXw8TQDKK8GwuHRnS43PaQi7UgWez3wz
	kpLm/Q4F6qLsRMuVazH+p07uUiWjYzj4AFaDTkQoClV0BUbDOoKT2WrWE02Frrcs8k8dbH/hMWe
	BqZDAZUQ1is0tchswYUQHUmv1QEqvdjHg9qmcjHIlg3/rfmKzswZHnuVWZs4B1F6b83N+jiJw
X-Gm-Gg: AYBFou09+sY6nXSFLGASKTJL8yLHH3d7zarfG3OB5PhP0eOJAsPJK7WrBUxX+s286XX
	Fe0DOcEz9D7lvbBTlvl8lGjSRoIhVBF+zKoaknXeenAjRXF4R7VmfTt9mPDhX9yHoAfX5W/ZQWO
	gX6k0n82bwUUSYwAi3UjvCENZf+RS2dVw/6vJpIDtQnwzmslpBP4W4jEST2m8XN9vB3a8kKDsZD
	kZ5LJrC0hFfsAvI+IEZ5PlmxDQ3QNSWEHAo94w+bpkhIqrjrJT7u+OhZ7eFJshJxLjRmty7R5Gi
	NcGHRKAb8Ey+ft3EcfTGiwsksX4Amd02LQtPMRVOVGezzhK1kOYAXqANhd97osU+2z9XuzhRHI9
	6mbtQcqsTH+bRVbE4ucrDgGqKsS85vfrEiBZKRKIAjgn9HjdYQD973XUTjIzGtjmWxupBWbZdaG
	4YQUk4s5dsdn6VHQ==
X-Received: by 2002:a05:7022:b042:20b0:143:8829:5fbf with SMTP id a92af1059eb24-14503fdf3b2mr3682101c88.28.1790313055961;
        Thu, 24 Sep 2026 22:10:55 -0700 (PDT)
X-Received: by 2002:a05:7022:b042:20b0:143:8829:5fbf with SMTP id a92af1059eb24-14503fdf3b2mr3682077c88.28.1790313055203;
        Thu, 24 Sep 2026 22:10:55 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c505sm2955163c88.5.2026.09.24.22.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:10:54 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: move is_authorized flag to ath12k_sta
Date: Fri, 25 Sep 2026 10:40:36 +0530
Message-Id: <20260925051036.2838210-3-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
References: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMCBTYWx0ZWRfX1eh1gdm9tgG2
 mZr0+vjSHvvN8D0kN3uYiXEdFkULS4Ho+xfAGreT9LEVGKwUm+qyn2f5mcq5HLHDoQd54IQ89nj
 zsAxgApUbFTKOQplR50knJuiMKADoEYQDIVrIpsfN+vx4+mexZtrsxBCZ2Kpyu42W/0ckJvfkHe
 lyaGFUckmbTd0ee/XuCpRkt/Y7FQpWgejsVr5K5Gvp2cljP15l4hcWV6mjYOTBMKj0zG1qJ+gxn
 rkExYVRLMIj0y2jrPzVKbEVDcRmj/ix53GLJzI3CRB1Dt1yZxaSDx8vzjA5Qd35/RVT3HNCAOtH
 RFK7U04+if2+tKF6nMmrlJJ6GZBG4Evj0nocJL6umcTBLAAKqK//Q2f8WHf9t6QIJpjeUB6ScvE
 pfE1hLU2t8PFNC6/SHuSvXrad0fJUYUc5Qz6nguvCtdAjHg7Xu1z1OBqt8Rt59AI4/WNUxMi8Dz
 Fp/NAM92fvaLyZspVmQ==
X-Proofpoint-GUID: N7I1KezEa3u2IEHg-64zAAMYrGLK9nsk
X-Proofpoint-ORIG-GUID: N7I1KezEa3u2IEHg-64zAAMYrGLK9nsk
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab60260 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=P8DYBBCEK76YGRFjgHgA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMCBTYWx0ZWRfXwt0X1hc+e49R
 xq2tzR2WpN2xsDzUhB8di8bPXbhNqud8TA8pg/fm+lyOsHujwaDodQw08JGX9f5o7uWYkgwQ4RU
 6Ki8AGcdQkRTsQ6AMNrE+1J6VpXwKAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_221057_541402_05F4A3C9 
X-CRM114-Status: GOOD (  18.44  )
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

Authorization state is shared across all link peers that belong to the
station level property. Storing is_authorized in struct
ath12k_dp_link_peer duplicates the same state for every link and
requires all copies to be updated whenever the authorization state
changes.

Move is_authorized to ath12k_sta and update the authorize/unauthorize
handlers to set it there directly. ath12k_bss_assoc() only reads the
flag to decide whether to re-authorize the BSS peer after vdev up, so
read it from ahsta instead of looking up the dp_peer.

Previously, is_authorized was protected by dp_lock. After moving it to
ath12k_sta, all accesses are serialized by the wiphy mutex, so the flag
is now protected by the wiphy lock instead.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h    |  2 ++
 drivers/net/wireless/ath/ath12k/dp_peer.h |  1 -
 drivers/net/wireless/ath/ath12k/mac.c     | 36 ++---------------------
 3 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a98fc6e0699d..a04757a038f2 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -529,6 +529,8 @@ struct ath12k_sta {
 	enum ieee80211_sta_state state;
 
 	bool enable_4addr;
+
+	bool is_authorized;
 };
 
 #define ATH12K_HALF_20MHZ_BW	10
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index 256fc79d714e..d01ef1aea48b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -80,7 +80,6 @@ struct ath12k_dp_link_peer {
 
 	struct ppdu_user_delayba ppdu_stats_delayba;
 	bool delayba_flag;
-	bool is_authorized;
 	bool mlo;
 	/* protected by ab->data_lock */
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index c04b4e2709b3..8de3c2421738 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3921,11 +3921,8 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	struct ath12k_link_sta *arsta;
 	struct ieee80211_sta *ap_sta;
 	struct ath12k_sta *ahsta;
-	struct ath12k_dp_link_peer *peer;
-	bool is_auth = false;
 	u32 hemode = 0;
 	int ret;
-	struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -4029,17 +4026,8 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 		   "mac vdev %d up (associated) bssid %pM aid %d\n",
 		   arvif->vdev_id, bss_conf->bssid, vif->cfg.aid);
 
-	spin_lock_bh(&dp->dp_lock);
-
-	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id,
-							 arvif->bssid);
-	if (peer && peer->is_authorized)
-		is_auth = true;
-
-	spin_unlock_bh(&dp->dp_lock);
-
 	/* Authorize BSS Peer */
-	if (is_auth) {
+	if (ahsta->is_authorized) {
 		ret = ath12k_wmi_set_peer_param(ar, arvif->bssid,
 						arvif->vdev_id,
 						WMI_PEER_AUTHORIZE,
@@ -7027,20 +7015,11 @@ static int ath12k_mac_station_unauthorize(struct ath12k *ar,
 					  struct ath12k_link_vif *arvif,
 					  struct ath12k_link_sta *arsta)
 {
-	struct ath12k_dp_link_peer *peer;
 	int ret;
-	struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	spin_lock_bh(&dp->dp_lock);
-
-	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id,
-							 arsta->addr);
-	if (peer)
-		peer->is_authorized = false;
-
-	spin_unlock_bh(&dp->dp_lock);
+	arsta->ahsta->is_authorized = false;
 
 	/* Driver must clear the keys during the state change from
 	 * IEEE80211_STA_AUTHORIZED to IEEE80211_STA_ASSOC, since after
@@ -7062,21 +7041,12 @@ static int ath12k_mac_station_authorize(struct ath12k *ar,
 					struct ath12k_link_vif *arvif,
 					struct ath12k_link_sta *arsta)
 {
-	struct ath12k_dp_link_peer *peer;
 	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
 	int ret;
-	struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
-	spin_lock_bh(&dp->dp_lock);
-
-	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id,
-							 arsta->addr);
-	if (peer)
-		peer->is_authorized = true;
-
-	spin_unlock_bh(&dp->dp_lock);
+	arsta->ahsta->is_authorized = true;
 
 	if (vif->type == NL80211_IFTYPE_STATION && arvif->is_up) {
 		ret = ath12k_wmi_set_peer_param(ar, arsta->addr,
-- 
2.34.1


