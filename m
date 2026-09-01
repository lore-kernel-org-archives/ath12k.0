Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6843EC61DD6
	for <ath12k@archiver.kernel.org>; Tue,  1 Sep 2026 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MatJlJXhqEbHsgisvSSw+ap61p7CAazHvfTs4veKE8o=; b=v9ZosGFbQ06iOTMqCDhMMMDMPv
	6jCeo2655smUPlqHoaw6bC0Br07rIpTcccApVkdYus/EwMQwXABt4rCb7OliknRS5tBMt/a8y4l9M
	G8xyDaWBphcNXKNkXLbWRiwq72q6QuMphS8zXNxKqrdHmbOLcu7ejP6S0wUntgYsUBDkACF7CPhz5
	H5OHe4zuNtLFO/11bM8gpNcEuXNJSkBYCXmAxpgkY9WmLd2nn3JiNDFe6oH4nScZyd63BqL/DSReS
	SM4InSkTNZE4XE10h0RYeteyF2v0Exwj9i3se8EeXFfY6dWV1UrQwzUEFwizb8plOW893mge2P82Z
	Ya5PdLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KIE-0000000BLZc-0TNL;
	Tue, 01 Sep 2026 08:56:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KIB-0000000BLYN-32lj
	for ath12k@lists.infradead.org;
	Tue, 01 Sep 2026 08:56:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179QKu1282968
	for <ath12k@lists.infradead.org>; Tue, 1 Sep 2026 08:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MatJlJXhqEb
	HsgisvSSw+ap61p7CAazHvfTs4veKE8o=; b=H54HGPWZG+wJOTSrAnQWSSU4BQX
	oLp9JMeTDfiLFaeyFbZKkwZklJDwNsSf+BMEQ2JOKY7L+tkNN1S11q2KaMRMUeZs
	mRlN5J6U7G56xbz84PQVIB8wGQ9/luL+pp3yhWcrZbA9hm9vCPYpykFS/ZIXMt+h
	4NDBSqq8uX4TPOgT/4dDVEw00RLv/BqR8i7QDT/c6TvOtahj7YW60RmNr8DI6QIS
	GXRfWoX4vur4/aKPEyzfrZaWSgzLYSvosUQgQ6fvxiGfqKs0K4ILTdTBbcnRhmUW
	L8PB2+/8j9LPoSOLt834ge7haj8vxy5l2IbPgL6nNmW02erYUiXfgdpLS2Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx9mvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 08:56:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso8396925ad.0
        for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788252990; x=1788857790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MatJlJXhqEbHsgisvSSw+ap61p7CAazHvfTs4veKE8o=;
        b=DimQUVKXdGfD+Hwl0+NWX3BW/7zPuNFMu914M2KE24IaLPYQFkgkYvurNYJ4axssmt
         ndQT6ai7TWsdtEoXQDKDyX/u4wlFD3c8An/oQfcMoulEH26voJxL/qQrIF9JsYdRmFjl
         +zV1GMjyHANxLLiv1T+ANfdCvZssI/HSP7fKxPI/PnfN8IrQrsRpXACJDtB35bw0ISkY
         cYUsDFbSkB/2Qqr3503Yjkz8x8457x4Op9tsuUJMfyWVw8wDADP4IGULou0kD9sM3liL
         6mm6DJfL6FFgqcQESbu0afOPj5pqiuTU4+C6ZSAGa37t2U1NJw1+yHdoQqIxFIdmcalF
         m+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252990; x=1788857790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MatJlJXhqEbHsgisvSSw+ap61p7CAazHvfTs4veKE8o=;
        b=Pjz79PWcV6LYDNJ/GHMZSzm4nehSOOwW4d2w5sWtMZJySJ/ZG8IsBDpV55oC5kr911
         ZoFyihBL+7MCuow6Q60Psb6bZHww8QXw5k1YRqmQnHopUUAoVlfbTEjQHi20z5ty7XhE
         RnjNHj29k+cqHjM8gKhOI9OaPa1V5xxo9ESpacqyOzq59o+LgaWzm4M0G/n5y3GrQhtd
         zW/hbdmgiRxYR7VcQuhLSN+7YdUm0XEmk1kRj0lcRJGbhMr6asOqddNM0q5ArwwULTwE
         Sf5wzxKE44rxBO+U6R2mbW7802w1IRzUx/3l2m/fIRwSSL0BrUOHvKqENWadM+C9PHwr
         7Daw==
X-Gm-Message-State: AFuF++mjH5/InCpzq8iJNgt3/h2NR8PWXG9kNCQvLI/4rOk9uJsGwnGe
	UXIQsZaEq2ZkwQVcXaOP1+2DtGQdN325eJbGXdLWQpxgAf1/7R7VgyBbrgaDZ6Dmdbx9AbM/jJd
	n02rS3rc0P97w/7dcxkbaHTo5uPSS6tPqx4B6Pn59O+pN1QXD5cbXoOfuuvmm3Ut+cuJW70MM
X-Gm-Gg: AYBFou3C+X+daNQcD3WXynfrUJwOgAFyoDngUaSJacoQQczs8p6qqASFw7GrIhCJYUA
	Q3nNcUJBV7e1j6TYwIrmgAu8+8qtJBD9JsYTMgCrQHuhqnGy3BSgSHuQ2kWb7ZiwQV9+daE9ib1
	tIKjY8tL2iBkBIWYm58bZQlEnz+Z06d5SLdpzfglI+48ZjebUIn37fzO10CocYhz9427W5ebQoH
	eMJZg/DZZNSruygOsyRIOWcdhADnhxMJcKYUJTWb4wSyuxvOt4BotLsTeof/SLXllLEIltV1f0+
	TawI4WCdJgInXqqPZFjQSIcc9EJTFFr0OS7qLVkqiv93GmV7U/rdwIBiFT2xtophLCFEwChf/UE
	Q2YVv1QHT0PJssugvOkJyYWmgDNcdGpApUlRBvp8cVoB0WEHPxq3MpG6TF+BvEOuTMY8hVrwZyK
	P3duK5tMcCavvQLA==
X-Received: by 2002:a17:903:2c08:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2d952960702mr42859345ad.21.1788252989757;
        Tue, 01 Sep 2026 01:56:29 -0700 (PDT)
X-Received: by 2002:a17:903:2c08:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2d952960702mr42859045ad.21.1788252989294;
        Tue, 01 Sep 2026 01:56:29 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm22490776eec.12.2026.09.01.01.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:56:28 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath12k: move is_authorized flag to ath12k_sta
Date: Tue,  1 Sep 2026 14:26:16 +0530
Message-Id: <20260901085616.2959268-3-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
References: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PJZpTnxMxU_SRcAs2vdk5mWTunENDzn1
X-Proofpoint-ORIG-GUID: PJZpTnxMxU_SRcAs2vdk5mWTunENDzn1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3OSBTYWx0ZWRfX5Csyn65evAJu
 JFk9CdpB3F+rLb35GW3+xwVjRceLswIg9cBeSgnadYahYbHrOgnQY/96hiXrvAOlsRINgZ+SRq1
 urnq+byCCOIiLSHP+kfR2YUA3PexEbY=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96933e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=P8DYBBCEK76YGRFjgHgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3OSBTYWx0ZWRfXyO7TrV88Syox
 X9FJA/VeoUKyMW/GLVsPtm93WDlyAQC0C/i2d3W1nYBH9ynn20QthE2H4mlkpuhOlj+ZG91Jmjw
 c6dDyqe/vi7YvQn6cKnnECk8eqdRuuni6W7416PSvHA0KD7mlf4CPNNrxODqKpXirfCw5c+s7sQ
 0kNE+eDIho6oFCdjt7ju8gy2cY1F+lVVXy0Hu0lfUwslfQ8ceNbful9k+f0hu7R4TKToLj/9C9z
 Kw/aHjwjONiex/+Q4VhtGHxS5HlFtCjRfPMW9pLrj3W6HHgnPmtzYEfToA3MbAQzzNwaUMcV54q
 /kkF2JwpdxCiEcwDFokY+8mZcHJ+QiWdsQiYYVMvRuNjctoe1brdQha8jicNPmYfDuqju8Y+pvR
 L6pmMChEN659xoj2nIzr7BPDu5SrDNOOW13ZTadblzDtsaFTIQ9zo9IVTb5coFoQI8g9NP/IGov
 qyAaq6kU9qV3jHbFOXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_015631_884970_1C75ED2E 
X-CRM114-Status: GOOD (  19.58  )
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
index 5ddd60e0a1f5..4ec2ee1b17fc 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3914,11 +3914,8 @@ static void ath12k_bss_assoc(struct ath12k *ar,
 	struct ath12k_link_sta *arsta;
 	struct ieee80211_sta *ap_sta;
 	struct ath12k_sta *ahsta;
-	struct ath12k_dp_link_peer *peer;
-	bool is_auth = false;
 	u32 hemode = 0;
 	int ret;
-	struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -4022,17 +4019,8 @@ static void ath12k_bss_assoc(struct ath12k *ar,
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
@@ -7020,20 +7008,11 @@ static int ath12k_mac_station_unauthorize(struct ath12k *ar,
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
@@ -7055,21 +7034,12 @@ static int ath12k_mac_station_authorize(struct ath12k *ar,
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


