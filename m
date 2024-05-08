Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0903C25B74
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPhaYa9ueoCxhBgDg/0eyjwvppCIZ433XJPWNiByEHA=; b=TFS0rxjafVK/HpCZ89k+G15w5E
	Ddl/2okjaY2rYEegfELUdc7Vej3+p+mO+6Q5TJPZ1uQtBDMWrb+oV0XExi8W6DrIWTZMo8NyDougX
	3zfTOQQzUJRyqr88pLF46mpqNwGi+ITs1w8BOb+/+zUXhzqpFUAkzEsImAaG7kVWE4UMCNZLY5g4/
	rWqqsNlaoD65m0xylFo0JPUQG0TOUzuZlGpNjNjAktPtnvKkSZf1PbzuBcnhH88m5DW9Bue1cFodl
	jpqBytFSDFMROpaOcUzeW0q2pD8nbsj7V14gpcJT0nuUpDbXz2kn9bXm3Nf4BbCxe8zipyUuqIxpG
	w9jor8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nv6-0000000GtVE-2j5U
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 20:29:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nux-0000000GtQD-1WSd
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 20:29:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448Fn24M024818;
	Wed, 8 May 2024 20:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=bPhaYa9ueoCxhBgDg/0eyjwvppCIZ433XJPWNiByEHA=; b=YR
	bXBcleFQxc6FMek+RyScJrkfowXzMed+7ewdL6sJzmk9dbm89HphmdFaQNvhMg7j
	GE92iO+3tfHuzhTwEtkkkFw5jIQ9SY/jRR7yPnYLV+cH77zifyfUbK0Cswn5tChc
	GUeSzlI8fyM/aCz4SbhfDCkZHYVER1SXfllhwE4xj5LtK0KscNoIV7Th/vEXy+fq
	v9finkaYYMORrOcRfclphl8fS5/5OAE5+15vIi2mFFsFM93eQTgOAyAZVYDV4bz0
	yqPXZZmiT2OFe92+UDMKZIilex7XdYctJ7+EFTgIgrwIJONqgekRugKrXOYeWzO+
	LUS05hTbDs1dWQ+pH9tQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y08ne16p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:29:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448KTQ2O023178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 20:29:26 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 May 2024 13:29:26 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
Subject: [PATCH v2 9/9] wifi: ath12k: skip sending vdev down for channel switch
Date: Wed, 8 May 2024 13:29:12 -0700
Message-ID: <20240508202912.11902-10-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240508202912.11902-1-quic_alokad@quicinc.com>
References: <20240508202912.11902-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Fl4zXmhldJlY4w9BANQMMtTY5FOOqcSC
X-Proofpoint-ORIG-GUID: Fl4zXmhldJlY4w9BANQMMtTY5FOOqcSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=684 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_132935_665252_3AF79DEE 
X-CRM114-Status: GOOD (  12.46  )
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

Remove the unnecessary WMI vdev down operation as firmware
internally does so already as part of WMI vdev restart.
Repeated vdev down results in a firmware crash during channel
switch operation when multiple BSSID advertisements are enabled:
ath12k_pci 0000:06:00.0: firmware crashed: MHI_CB_SYS_ERROR
ath12k_pci 0000:06:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
ath12k_pci 0000:06:00.0: failed to set vdev 5 HE MU mode: -108 param_value 7b
ath12k_pci 0000:06:00.0: failed to set he mode vdev 5
ath12k_pci 0000:06:00.0: failed to restart vdev 5: -108
ath12k_pci 0000:06:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
ath12k_pci 0000:06:00.0: failed to set vdev 4 HE MU mode: -108 param_value 7b
ath12k_pci 0000:06:00.0: failed to set he mode vdev 4
ath12k_pci 0000:06:00.0: failed to restart vdev 4: -108
ath12k_pci 0000:06:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 29 +++------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 71da4fe0006f..7d7aac553b3c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7290,9 +7290,10 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 	lockdep_assert_held(&ar->conf_mutex);
 
 	for (i = 0; i < n_vifs; i++) {
-		arvif = ath12k_vif_to_arvif(vifs[i].vif);
+		vif = vifs[i].vif;
+		arvif = ath12k_vif_to_arvif(vif);
 
-		if (vifs[i].vif->type == NL80211_IFTYPE_MONITOR)
+		if (vif->type == NL80211_IFTYPE_MONITOR)
 			monitor_vif = true;
 
 		ath12k_dbg(ab, ATH12K_DBG_MAC,
@@ -7303,30 +7304,6 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			   vifs[i].old_ctx->def.width,
 			   vifs[i].new_ctx->def.width);
 
-		if (WARN_ON(!arvif->is_started))
-			continue;
-
-		if (WARN_ON(!arvif->is_up))
-			continue;
-
-		ret = ath12k_wmi_vdev_down(ar, arvif->vdev_id);
-		if (ret) {
-			ath12k_warn(ab, "failed to down vdev %d: %d\n",
-				    arvif->vdev_id, ret);
-			continue;
-		}
-	}
-
-	/* All relevant vdevs are downed and associated channel resources
-	 * should be available for the channel switch now.
-	 */
-
-	/* TODO: Update ar->rx_channel */
-
-	for (i = 0; i < n_vifs; i++) {
-		vif = vifs[i].vif;
-		arvif = ath12k_vif_to_arvif(vif);
-
 		if (WARN_ON(!arvif->is_started))
 			continue;
 
-- 
2.39.0


