Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB60C7EE20
	for <ath12k@archiver.kernel.org>; Thu, 13 Apr 2023 21:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBdtMzcoSO7N4k1pjCO6x5BUBW9DZnLvPjoRs0lXm80=; b=cfdFRv1qqEls6k
	vetacmKYg1dz44cQnR06q1NPjyynIY45pusWS5njylNaMkBMsV28jRs4moOLBsekvGVTHcyIkOyuz
	RhHUlJ+armdZzU9gqxBDL3NaFU2jpWZU4EoapxpseqFo9DEwlqL3EOdAGEnNX9kIAP91JSfqsS6Do
	ffp6WdKK1Pf7TQmyh/JcrjeWoGv2LVE1kXqR6of4uq0SU+hRV7bFkiQRjdy3rqmBoSwvPYq52RaT1
	XeAfxLvtfgh2UUZxk/9Sj/R0m3/e9vnZROQjUnuJuE6K4q2YdxhB5V+k6pD/pazNgvyZEBqrRTmDd
	q6q6zBpz824UEwVqdsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4rd-007DvG-0M
	for ath12k@archiver.kernel.org;
	Thu, 13 Apr 2023 21:52:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4rU-007Dpp-2v
	for ath12k@lists.infradead.org;
	Thu, 13 Apr 2023 21:52:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DJv7Av030327;
	Thu, 13 Apr 2023 21:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=epCihspHMPzrtm/vMwrnK+aBfr8BU8kaeXFujDRzLdo=;
 b=YVuOAwAO0N0LnZzYFkQLo6BOgyGkgHP4cXGNx5mmVfU5lc5GIuFvLG5QnkL/sq9q3gFP
 2w1Ybhv8mfrzu5o74hqsaWk7E5yWdGi816569dgyGac5p6hCHyQ5zZFoLFOqnn7LEjKu
 ho5zGNpn/s5s/10p9fUeegq05VUakWT/JjtOwurn0hin/f+6Wun45tdg84Khky/3sivU
 o+lsHmXWAwlFmuXSeZ4PG2w5RBx40O5P6eXfat3kpHq8ahClVLV2065M7wnK9uJK0Wmk
 eK4/Q2Tq0bDeIHwGqMxFybhGcMkmuMJhYQSi1SqeS0Kf2iYy9v4+gQRJf+B0k5cJ9Jm9 Gg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pxqf989re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 21:52:12 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33DLqBgc006714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 21:52:11 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 13 Apr 2023 14:52:10 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH v3 08/11] wifi: ath12k: peer assoc for 320 MHz
Date: Thu, 13 Apr 2023 14:51:53 -0700
Message-ID: <20230413215156.2649-9-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230413215156.2649-1-quic_alokad@quicinc.com>
References: <20230413215156.2649-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e7qvmRUL6ppkV9wzGUSNzllk6_iHZBKl
X-Proofpoint-ORIG-GUID: e7qvmRUL6ppkV9wzGUSNzllk6_iHZBKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_16,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_145213_059807_8D55BA11 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Add required peer association definitions and processing if the
bandwidth is 320 MHz.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu<quic_pradeepc@quicinc.com>
---
v3: No change from v2.
v2: No change from v1.

 drivers/net/wireless/ath/ath12k/wmi.c | 2 ++
 drivers/net/wireless/ath/ath12k/wmi.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f81724260b9b..e5513e979d78 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1808,6 +1808,8 @@ static void ath12k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 			cmd->peer_flags |= cpu_to_le32(WMI_PEER_80MHZ);
 		if (arg->bw_160)
 			cmd->peer_flags |= cpu_to_le32(WMI_PEER_160MHZ);
+		if (arg->bw_320)
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_EXT_320MHZ);
 
 		/* Typically if STBC is enabled for VHT it should be enabled
 		 * for HT as well
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index c2c340af3612..f348ea9e325d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1169,6 +1169,7 @@ enum wmi_tlv_peer_flags {
 
 enum wmi_tlv_peer_flags_ext {
 	WMI_PEER_EXT_EHT = 0x00000001,
+	WMI_PEER_EXT_320MHZ = 0x00000002,
 };
 
 /** Enum list of TLV Tags for each parameter structure type. */
@@ -3549,6 +3550,7 @@ struct ath12k_wmi_peer_assoc_arg {
 	bool bw_40;
 	bool bw_80;
 	bool bw_160;
+	bool bw_320;
 	bool stbc_flag;
 	bool ldpc_flag;
 	bool static_mimops_flag;
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
