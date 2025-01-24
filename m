Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF10C0218C
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 06:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h03jnFA4DOIK8dmnpsO8ACVpW6Rhs4aSpGniW0oKIHE=; b=joa+CF64rWoo+FpEc5SZuJQBCC
	Dw6Bq29/8siF7Ly2jb3iRIvb2vR+yNqy+Sbj/6vnNXiA4htczS8Im4qidSUoEo7YbTRRTlUUlToDi
	xbeihCWZkSo2bt/XckL3Prhtwo5Vtuozn5UmGpySfssLR1pIYz4nUPSKV7DVdAtLaa+Ix+sg/3N+M
	vafH/TbDU1XTnLELDPEJNh3+6mtx9MN5KxNk0MvjEDZi+FCs0GTf/s+xr0PHre5RME7x3cJ6Bbv8w
	ecsH6Od3jBlGfcvBZ4xdxbtXzRjIBYsrbiO743pUk3afT3SUHnOU8ADnKB4NIbzy47MTDDn8GuL2E
	hKh+gk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbD03-0000000Dzip-14m4
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 06:17:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbD01-0000000DzhW-05rU
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 06:17:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O6AZwZ005609;
	Fri, 24 Jan 2025 06:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h03jnFA4DOIK8dmnpsO8ACVpW6Rhs4aSpGniW0oKIHE=; b=nH0nJrghZtjtSOHB
	SVJY+IqQo+ON5zsolaLSNLdIvZD/BzOPddmLzdAb/cG7p9+LkJF0Mo766oWfOf1e
	yYvXPmJq03b/kyISl9PV9AfXZDM3SG7c0YIPAXiicfcWvYIaF9pjDEDKQdcBG/5j
	XUxFIEbOBjPfFMQEmbBv7Mf2efHhD1WuhNTvalAjUIrr/bqrrpfbbtcbmkL/t2bQ
	AJeNcDXb6+PnVmn460RxvCnQSMwfUVIxGg+QRfxbDYbuYGLqAz7BVqF6Vz2ZoLsq
	YdAL3THgN2CCXCXKzlG0ligVlr/2eES3qMLG/dU9OrPyGoEn6C1jHwrZQB1KBRsh
	4vEwOQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c5c500dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 06:16:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O6GwRJ005439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 06:16:58 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 22:16:56 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Fri, 24 Jan 2025 11:46:37 +0530
Subject: [PATCH v2 3/4] wifi: ath12k: update the latest CSA counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250124-ath12k_mlo_csa-v2-3-420c42fcfecf@quicinc.com>
References: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
In-Reply-To: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o9AJYzKoe3VKubidEt9lpinFHXMiNzmm
X-Proofpoint-ORIG-GUID: o9AJYzKoe3VKubidEt9lpinFHXMiNzmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_221701_073043_477FA9C4 
X-CRM114-Status: GOOD (  15.82  )
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

At present, the driver configures the firmware to send the Channel Switch
(CS) count event only when the count reaches zero during a Channel Switch
Announcement (CSA). For frames managed by the upper layer, where the driver
does not update the counter, the CS count in these frames remains unchanged
throughout the entire CSA period. This is because the upper layer is not
aware of the latest ongoing count. Indicating same count value throughout
the CSA time is wrong and could lead to connection instabilities.

Fix this by configuring firmware to send CS count event for every count and
then accordingly decrementing the count in mac80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 6ed3d2e8e86e362bb2fafa6bd267c45e2b2e314f..35ebd54971a595ad5a07df09581f0ae9af38f27a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1934,6 +1934,7 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 				cpu_to_le32(offs->cntdwn_counter_offs[0]);
 		cmd->ext_csa_switch_count_offset =
 				cpu_to_le32(offs->cntdwn_counter_offs[1]);
+		cmd->csa_event_bitmap = cpu_to_le32(0xFFFFFFFF);
 	}
 
 	cmd->buf_len = cpu_to_le32(bcn->len);
@@ -6880,17 +6881,15 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 					  const struct ath12k_wmi_pdev_csa_event *ev,
 					  const u32 *vdev_ids)
 {
-	int i;
+	u32 current_switch_count = le32_to_cpu(ev->current_switch_count);
+	u32 num_vdevs = le32_to_cpu(ev->num_vdevs);
 	struct ieee80211_bss_conf *conf;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_vif *ahvif;
-
-	/* Finish CSA once the switch count becomes NULL */
-	if (ev->current_switch_count)
-		return;
+	int i;
 
 	rcu_read_lock();
-	for (i = 0; i < le32_to_cpu(ev->num_vdevs); i++) {
+	for (i = 0; i < num_vdevs; i++) {
 		arvif = ath12k_mac_get_arvif_by_vdev_id(ab, vdev_ids[i]);
 
 		if (!arvif) {
@@ -6913,8 +6912,14 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 			continue;
 		}
 
-		if (arvif->is_up && conf->csa_active)
-			ieee80211_csa_finish(ahvif->vif, 0);
+		if (!arvif->is_up || !conf->csa_active)
+			continue;
+
+		/* Finish CSA when counter reaches zero */
+		if (!current_switch_count)
+			ieee80211_csa_finish(ahvif->vif, arvif->link_id);
+		else if (current_switch_count > 1)
+			ieee80211_beacon_update_cntdwn(ahvif->vif, arvif->link_id);
 	}
 	rcu_read_unlock();
 }

-- 
2.34.1


