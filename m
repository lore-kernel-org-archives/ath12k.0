Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1DBE7718F
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4LH3u2csEVYMvumO2dpdbOmUHBzlaSzLqwCcCPqEFA=; b=lw2+ATg40TIsWtlR51Linf+IWJ
	trxYQCBH3XQebl0RAOJgGGELNKrvAtoR+WjM5SjXyZmFUS8mgzapzUcQLj/Lj6MzrhcnpnUyy6Jvh
	oFYKpWXuMKMROeW1PDYqmsgpihIuNRjHnPPRepQWAvUGmiTMpPcoOg1epEGYFYmWQ6XnluSTxJBAk
	9iqgs/QkOgv+EWKBaz9Rwmt7yHfXgs8n1Bj2xiAJzlQvLy+YSZWPcN2XtTm6K4ecun4UQ8H8Y9sMC
	jz4bpJNeCoHKB3Y3Mg+RaArGdlXDbBdoRuhnfZUb/bmI8HRUw/agL8qCLiHFe5xWU66OLZVB68GxG
	PfqmTyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlGU-0000000AOQX-31mV
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 16:26:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlBv-0000000ANU7-2HBW
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 16:22:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBgeP4025279;
	Mon, 23 Dec 2024 16:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4LH3u2csEVYMvumO2dpdbOmUHBzlaSzLqwCcCPqEFA=; b=eYd2GYxseyOccO5y
	olDpA67kmBAfMqHIB3lpWUsDLV64MlEpbNEm0NGdWoX9flLSvUs+YD1enq4q4o0a
	T97ZQBju/mXSof1yXCthNVAMuQ9PPelCiBtfV/51sCGB4beRbPpm4fs4nytTXv0c
	qr/96wa4xxcLVKNi3tDtY6RnUr4sRk2XMx22blRXPBNaowV20B/06HFMDKU25vUi
	re7OFApPJJgXHpQvPz8M3pn+SBu377WVCrKBmkeOwHtVWy6IZfi8phARvqEaM0bK
	e5xS1udgWGkTc6iAkOMvavjcYtBipuNoyejaG2tFvoyI19f79hVh02key5QfHA08
	ogJNtw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q77rh23m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNGLtJS011400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 16:21:55 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 08:21:53 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Mon, 23 Dec 2024 21:51:38 +0530
Subject: [PATCH 3/4] wifi: ath12k: update the latest CSA counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241223-ath12k_mlo_csa-v1-3-78b6d7515568@quicinc.com>
References: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
In-Reply-To: <20241223-ath12k_mlo_csa-v1-0-78b6d7515568@quicinc.com>
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
X-Proofpoint-GUID: IZ_6088-tyEmXbGOw7yAsKXlRgKrCJ0C
X-Proofpoint-ORIG-GUID: IZ_6088-tyEmXbGOw7yAsKXlRgKrCJ0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_082159_709919_D69BF1B8 
X-CRM114-Status: GOOD (  16.01  )
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
index ff973372a01a85bede15fde72bbe7db99bcfb300..99f6dc2fbbe3d0aa71ab96e500cfaa8e4bf9930f 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1933,6 +1933,7 @@ int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 				cpu_to_le32(offs->cntdwn_counter_offs[0]);
 		cmd->ext_csa_switch_count_offset =
 				cpu_to_le32(offs->cntdwn_counter_offs[1]);
+		cmd->csa_event_bitmap = cpu_to_le32(0xFFFFFFFF);
 	}
 
 	cmd->buf_len = cpu_to_le32(bcn->len);
@@ -6876,17 +6877,15 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
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
@@ -6909,8 +6908,14 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
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


