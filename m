Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADACC3DA59
	for <ath12k@archiver.kernel.org>; Mon, 22 Jul 2024 03:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OxsB1Eb+nYihqqeipBFvmDquOT5BKc79Lkof1AXgEKk=; b=3OE1EhoRhMl4JUfbfj0XfXXbPt
	l68Of8BFwREn1wISu4u4di3KBkiONMuDVNpOsY+m8BFfs4knwaUlf1JziwOlGgw81Jhuf8VFQtwTC
	gVJa7rDjwMDGn6/mVtITZClXRgGln92staPnuXwWibKMRV+CNJygn6UQh0z4GgsqWpQ9OgsOTnLJ7
	NIgQOHoMhoaxJMfijmyFqR20uBOO1TVfFjt0DGOW4BBMdoub5EDZCx6MFcHR6nGROfovMEg9k3Ou7
	slYIWKJCfqZAaS6WOZjl0H2g/yPmvQJQhueBn22/B1Ejhai0tN9ybja86COrBlKjm+7rQphJoraRW
	QyzIsH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVjoD-00000008D5c-2LXZ
	for ath12k@archiver.kernel.org;
	Mon, 22 Jul 2024 03:33:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVjo9-00000008D54-3AST
	for ath12k@lists.infradead.org;
	Mon, 22 Jul 2024 03:33:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNt3AI010043;
	Mon, 22 Jul 2024 03:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OxsB1Eb+nYihqqeipBFvmD
	quOT5BKc79Lkof1AXgEKk=; b=Z8pZbrhRQCif3Z2Ifv6srjw4kFtlJtivkvich1
	WMOmiCPttybj58w5/UZOF+aenD8J4mlNR6K/yC6dqBs36+lP0m9NMILrZoxrNtei
	aNQAFFkhDYbRx2ZS//RCCluQ3Ep4F5o42pz0NnrHq5AuPMNTJfjzlMUQMzufOukc
	dKk2pApCcBJN+YWOmQFuz09zom6neldneRqIaL7yE19Q8UgkJ4qTuVhjFx4VbhRT
	FcI4GyV0Lethc8sVTs3Er9MLKktJrik8NEy2FhCOL4PRb2vGMC8drvhiCD5YFsbo
	nk6344B6ZP/CECl5ckRUk0k2h/tCKrWXiSTSG5EmyE5rDSfg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40gurth9ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 03:33:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M3XoSf022125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 03:33:50 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 21 Jul 2024 20:33:49 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix reusing outside iterator in ath12k_wow_vif_set_wakeups()
Date: Mon, 22 Jul 2024 11:33:32 +0800
Message-ID: <20240722033332.6273-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BE-fLvp19VvKE4AcaQdh6mlf45YKr45F
X-Proofpoint-ORIG-GUID: BE-fLvp19VvKE4AcaQdh6mlf45YKr45F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-21_22,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_203354_487547_813539B1 
X-CRM114-Status: GOOD (  14.52  )
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

Smatch throws below warning:

	drivers/net/wireless/ath/ath12k/wow.c:434 ath12k_wow_vif_set_wakeups()
	warn: reusing outside iterator: 'i'

	drivers/net/wireless/ath/ath12k/wow.c
	    411         default:
	    412                 break;
	    413         }
	    414
	    415         for (i = 0; i < wowlan->n_patterns; i++) {
	                            ^^^^^^^^^^^^^^^^^^^^^^
	Here we loop until ->n_patterns

	    416                 const struct cfg80211_pkt_pattern *eth_pattern = &patterns[i];
	    417                 struct ath12k_pkt_pattern new_pattern = {};
	    418
	    419                 if (WARN_ON(eth_pattern->pattern_len > WOW_MAX_PATTERN_SIZE))
	    420                         return -EINVAL;
	    421
	    422                 if (ar->ab->wow.wmi_conf_rx_decap_mode ==
	    423                     ATH12K_HW_TXRX_NATIVE_WIFI) {
	    424                         ath12k_wow_convert_8023_to_80211(ar, eth_pattern,
	    425                                                          &new_pattern);
	    426
	    427                         if (WARN_ON(new_pattern.pattern_len > WOW_MAX_PATTERN_SIZE))
	    428                                 return -EINVAL;
	    429                 } else {
	    430                         memcpy(new_pattern.pattern, eth_pattern->pattern,
	    431                                eth_pattern->pattern_len);
	    432
	    433                         /* convert bitmask to bytemask */
	--> 434                         for (i = 0; i < eth_pattern->pattern_len; i++)
	    435                                 if (eth_pattern->mask[i / 8] & BIT(i % 8))
	    436                                         new_pattern.bytemask[i] = 0xff;

	This loop re-uses i and the loop ends with i == eth_pattern->pattern_len.
	This looks like a bug.

Change to use a new iterator 'j' for the inner loop to fix it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/d4975b95-9c43-45af-a0ab-80253f18c7f2@stanley.mountain/
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wow.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
index c5cba825a84a..027f036eb415 100644
--- a/drivers/net/wireless/ath/ath12k/wow.c
+++ b/drivers/net/wireless/ath/ath12k/wow.c
@@ -361,7 +361,7 @@ static int ath12k_wow_vif_set_wakeups(struct ath12k_vif *arvif,
 	struct ath12k *ar = arvif->ar;
 	unsigned long wow_mask = 0;
 	int pattern_id = 0;
-	int ret, i;
+	int ret, i, j;
 
 	/* Setup requested WOW features */
 	switch (arvif->vdev_type) {
@@ -431,9 +431,9 @@ static int ath12k_wow_vif_set_wakeups(struct ath12k_vif *arvif,
 			       eth_pattern->pattern_len);
 
 			/* convert bitmask to bytemask */
-			for (i = 0; i < eth_pattern->pattern_len; i++)
-				if (eth_pattern->mask[i / 8] & BIT(i % 8))
-					new_pattern.bytemask[i] = 0xff;
+			for (j = 0; j < eth_pattern->pattern_len; j++)
+				if (eth_pattern->mask[j / 8] & BIT(j % 8))
+					new_pattern.bytemask[j] = 0xff;
 
 			new_pattern.pattern_len = eth_pattern->pattern_len;
 			new_pattern.pkt_offset = eth_pattern->pkt_offset;

base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45
-- 
2.25.1


