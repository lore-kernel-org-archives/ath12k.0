Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0688CEE020E
	for <ath12k@archiver.kernel.org>; Tue, 19 Sep 2023 07:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7Kkd/XUelwSynnsvj8UI72Kjr/mSA0DPQnokd9HViI=; b=nNHRWnNQOxdO5H
	XpiOo4Ju/kyE0Xc1xms+a7LZE0OKk6xEWB4N7L8grlITFMYVjLg07OkXT6A7nYTzI0bKbXqWyV4QA
	C2kIEnhEme5ggSe3SwDNlVVuj4KIqwFOniD71aTp4j9xo6fHOzk9vrB8JvmOUceHYbvksVY9v4149
	cs+mH4dscM5qqJcb0VtmuA3kjhjgL+MZCY3jHNKPl2L/+sDzNxK2KIJgM9s4RNL4zRy+6AXS+HYGU
	hBe6MWYOXVzkkNCxJMAKVxuY6DM/ey3xq1oeHLZ0KFz0GGcxo3RsnsT/AgjI9xUdX40TM3uTJFulI
	gR13puIx0mvej60l0OKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiUzO-00HD4H-2R
	for ath12k@archiver.kernel.org;
	Tue, 19 Sep 2023 07:17:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiUzM-00HD3X-1M
	for ath12k@lists.infradead.org;
	Tue, 19 Sep 2023 07:17:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38J68kOH019141;
	Tue, 19 Sep 2023 07:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=hGyq9ihHkxlut94AhRS/2Mgoj005wpiMbe1t/CRvrmU=;
 b=gVelRH4vYG/8t1ab4IahcaPSKZQkWA8N1+TlBnyOYebZaBc5vkoD+8sD+07D8dXNO4iY
 mImVx6Vannmp2nmDkXOGLRbBm5q48OIFo5yALJM7fp9ViyEd5fG0T6Mwmw0DjejnM2v9
 YMnPRwEtD/tm6jO/Ib+52QAMyzt6P4766wct7i+Tyv2rDrg4lcMdQDDnbzopBbdlP5Qq
 ++1dYJPS/FkppqqIG7j5VzGTMenUruYCxNl93QfW5ggdbiI7wZ9OT1uoBSOgpcwvKy7R
 EB/h5vUuLVmt3fu3ySub56Pbuvt/RVgydLvaPQv9Hu1sy2l/AFWRJt/Pz3/vc3ZOqBxC uQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6nh7a4sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 07:17:40 +0000
Received: from pps.filterd (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 38J7GhD9020364;
	Tue, 19 Sep 2023 07:17:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3t7386je0u-1;
	Tue, 19 Sep 2023 07:17:39 +0000
Received: from NASANPPMTA03.qualcomm.com (NASANPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38J7Hdwa022206;
	Tue, 19 Sep 2023 07:17:39 GMT
Received: from aisr-linux.qualcomm.com (aisr-linux.qualcomm.com [10.201.124.194])
	by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 38J7Hc2k022181;
	Tue, 19 Sep 2023 07:17:39 +0000
Received: by aisr-linux.qualcomm.com (Postfix, from userid 4090849)
	id 333F1E020C5; Tue, 19 Sep 2023 12:47:37 +0530 (IST)
From: Aishwarya R <quic_aisr@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <quic_aisr@quicinc.com>
Subject: [PATCH 3/7] wifi: ath12k: get 6 GHz power type from HE operation element
Date: Tue, 19 Sep 2023 12:47:20 +0530
Message-Id: <20230919071724.15505-4-quic_aisr@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230919071724.15505-1-quic_aisr@quicinc.com>
References: <20230919071724.15505-1-quic_aisr@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1iP_pd3X1808r2SUCG0TiNF2OJhUNaeX
X-Proofpoint-GUID: 1iP_pd3X1808r2SUCG0TiNF2OJhUNaeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_01,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_001740_464355_AAED5A01 
X-CRM114-Status: GOOD (  13.41  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

When 6 GHz AP or STA is assigned a channel ctx, it needs to
extract the power type from HE operation element.
If unset power type is present, by default IEEE80211_REG_LPI_AP
power mode will be used.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aishwarya R <quic_aisr@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 5b9af264d305..01f81b087fa2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5823,6 +5823,7 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct ath12k_vif *arvif = (void *)vif->drv_priv;
 	int ret;
 	struct ath12k_wmi_peer_create_arg param;
+	enum ieee80211_ap_reg_power power_type;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -5830,6 +5831,16 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		   "mac chanctx assign ptr %pK vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
+	if (ar->supports_6ghz && ctx->def.chan->band == NL80211_BAND_6GHZ &&
+	    (arvif->vdev_type == WMI_VDEV_TYPE_STA ||
+	     arvif->vdev_type == WMI_VDEV_TYPE_AP)) {
+		power_type = vif->bss_conf.power_type;
+		ath12k_dbg(ab, ATH12K_DBG_MAC, "mac chanctx power type %d\n",
+			   power_type);
+		if (power_type == IEEE80211_REG_UNSET_AP)
+			power_type = IEEE80211_REG_LPI_AP;
+	}
+
 	/* for some targets bss peer must be created before vdev_start */
 	if (ab->hw_params->vdev_start_delay &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP &&
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
