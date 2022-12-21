Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5DDC4167B
	for <ath12k@archiver.kernel.org>; Wed, 21 Dec 2022 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huHRSwaxFz3494yz/MAZNXsImCClB3OOEPbb+f38opA=; b=tTaDNoPD6jnS35
	uZFtHJSsldnfRE7f4mLpDV67QdigNqa6MqBGVt6sCtqH19jcJLY8LqlWxp7IGyzJ+t1FI81ob/vMP
	8XhTcucXc4q9Bzi3QI+D0V0pEiVK4NrvlbJcguDStcnvprI5tWIwjBful61h+gw5hl8MkHK79Y7so
	Krb3Ct+Dpu67QF94flTd6rEmtHA85PUs5TajpvN0DhsfFCabMgCEZ3NtJoa20XeDn92wcMsRe2850
	anY1jPhnHfm4LXRMBFVC320EAfwsHYmDHbY0eMzVOBRLMerdA5jqQMIddMoJ7/zqpXoBgJiIEDFVd
	gNmIt4LyZUQqgbDKY1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wnW-00DrtP-D5
	for ath12k@archiver.kernel.org; Wed, 21 Dec 2022 10:58:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wll-00DqTH-Bl
	for ath12k@lists.infradead.org; Wed, 21 Dec 2022 10:56:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL9nxXg021669;
	Wed, 21 Dec 2022 10:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=fjIrs5eCGAufFm7GzMSc4H56gYrOm65WIWG+sLqF64s=;
 b=hW1deZTkAN35r0+mpYt89+afpeaJpyQy+AksX/MkQ5fduJtwxvXcqPW+Y8Af0frBPgkj
 ZViAGf1lmspmZoOPxaq8Knt0yQEPpi7pewEGmYsah17jqjV8VCNtefzj4HnJYPu2je1b
 9bCtKCqZxcH7X4bYNjiU519HG4w3RHds3HR9MCVL1X7/J0ZzETC950syXvuuO3mi7z9J
 mO4aD7jonsZa9ccubFKAYUomNEofbGYkdkPQ+WydUCjRwwfnnKO0frQ5kdOBbaXm97EX
 5bP2DjpvzRWlOMoxzKGT51KnvMO591pyZTefnlOx5giYK+rmayEy3Kaw4mJgrd4zZngr 1Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk39tbqvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:56:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLAuFqC016817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:56:16 GMT
Received: from tmariyap-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 02:56:14 -0800
From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>
Subject: [PATCH 2/4] wifi: ath12k: hal_rx: Use memset_startat() for clearing queue descriptors
Date: Wed, 21 Dec 2022 16:25:27 +0530
Message-ID: <20221221105529.19345-3-quic_tmariyap@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221105529.19345-1-quic_tmariyap@quicinc.com>
References: <20221221105529.19345-1-quic_tmariyap@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hy2Sy6_8Wh26py4ik7gLTPsVrTZk37c7
X-Proofpoint-GUID: hy2Sy6_8Wh26py4ik7gLTPsVrTZk37c7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_05,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=710 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_025617_506284_C3D27D23 
X-CRM114-Status: GOOD (  16.12  )
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

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_startat() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct and fixes the below clang
warning.

Warning:
include/linux/fortify-string.h:314:4: warning: call to '__write_overflow_field' declared with 'warning' attribute:
detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-03171-QCAHKSWPL_SILICONZ-1
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal_rx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.c b/drivers/net/wireless/ath/ath12k/hal_rx.c
index d47befb83e38..ee61a6462fdc 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.c
@@ -30,8 +30,7 @@ static int ath12k_hal_reo_cmd_queue_stats(struct hal_tlv_64_hdr *tlv,
 		  u32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_get_queue_stats *)tlv->value;
-	memset(&desc->queue_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, queue_addr_lo);
 
 	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -64,8 +63,7 @@ static int ath12k_hal_reo_cmd_flush_cache(struct ath12k_hal *hal,
 		  u32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_flush_cache *)tlv->value;
-	memset(&desc->cache_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, cache_addr_lo);
 
 	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -103,8 +101,7 @@ static int ath12k_hal_reo_cmd_update_rx_queue(struct hal_tlv_64_hdr *tlv,
 		  u32_encode_bits(sizeof(*desc), HAL_TLV_HDR_LEN);
 
 	desc = (struct hal_reo_update_rx_queue *)tlv->value;
-	memset(&desc->queue_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_startat(desc, 0, queue_addr_lo);
 
 	desc->cmd.info0 &= ~cpu_to_le32(HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED);
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
