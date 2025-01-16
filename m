Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08901E77188
	for <ath12k@archiver.kernel.org>; Thu, 16 Jan 2025 03:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XlOcoiUtT/8Gm+iDSWcpHmacHdnhbpbEzthArm4cL/w=; b=X88Dn56ASRr1n+GYsP+8lu/bbt
	vj8uATq8ZmVqzIT3nd2KjGXhmyD85GLpwSg7knjFTFPe7qVUaAMCwXJDJahRXdOQ6tEp6uCDsvTpW
	2DIpLSgoZa6EjpRyeFk3LNL+Revm6c0DJhaHXt/DvIyrAfAR0qISXLiSj73cSnvjCAwhYHuzlJH66
	LH3Si/HTATi95yHBRkfaUcFFjdH4Wsk1XYPllC1DGnf5yKInD3pmWGYjW7h1C7PvfiWVGuGvreEqZ
	vR+v4z/ea4EwyjD+3ptspHmoKD2etxXbc4er3Ckl2tt68wd0qcN7jWSxiIqcxqQo1TjHHLGREP7HP
	J4auF56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGYz-0000000DjAO-3OIb
	for ath12k@archiver.kernel.org;
	Thu, 16 Jan 2025 03:28:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGYx-0000000Dj9v-1jy3
	for ath12k@lists.infradead.org;
	Thu, 16 Jan 2025 03:28:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G02flP023998;
	Thu, 16 Jan 2025 03:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XlOcoiUtT/8Gm+iDSWcpHm
	acHdnhbpbEzthArm4cL/w=; b=RzxOd2ofNUaOxDhIMeBFoMu6YcVR9BYvDKEgXl
	AtXzc+R1XlQURz0KcfBRPK+MR4fx1kxTnxGTaPS9U7Q8j0B3xBR2uoqD2s3t+/mz
	2w04MnfyoR23Dgz2jrrOo8gGGNJpBKaqhNW1ybOFuKNmltcB2lclNJAcjwRvLj0M
	Hjo12llxYd0vaZe0h2rARZ76rQD8UTjAKgPfitxz+0LQlLJxxlNyX2rUdsV1vtVc
	UBrnKY9+ehrX/iZwMSNTCVMCSx0U3Rngdhtx5J2InoYsuf6w61B1dvkDksycvchi
	bp9rGf8Apd4R6ClrMLa9eXLzY3PGmogHX/zZhqzLVWC0anog==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446q7n0cn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 03:28:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G3Srrf003360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 03:28:53 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 Jan 2025 19:28:51 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH] wifi: ath12k: Fetch regdb.bin file from board-2.bin
Date: Thu, 16 Jan 2025 08:58:35 +0530
Message-ID: <20250116032835.118397-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iLyKlfUZxrHOK1nT9A8b387aYJNdrr0L
X-Proofpoint-ORIG-GUID: iLyKlfUZxrHOK1nT9A8b387aYJNdrr0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_01,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_192855_460032_AA873B21 
X-CRM114-Status: GOOD (  10.40  )
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

Currently, ath12k_core_fetch_regdb() finds regdb.bin file through
board id's but in board-2.bin file regdb.bin file is present with
default board id because of which regdb.bin is not fetched.

Add support to fetch regdb.bin file from board-2.bin through
default board id.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0606116d6b9c..3eff1fbf8247 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -173,7 +173,7 @@ EXPORT_SYMBOL(ath12k_core_resume);
 
 static int __ath12k_core_create_board_name(struct ath12k_base *ab, char *name,
 					   size_t name_len, bool with_variant,
-					   bool bus_type_mode)
+					   bool bus_type_mode, bool with_default)
 {
 	/* strlen(',variant=') + strlen(ab->qmi.target.bdf_ext) */
 	char variant[9 + ATH12K_QMI_BDF_EXT_STR_LENGTH] = { 0 };
@@ -204,7 +204,9 @@ static int __ath12k_core_create_board_name(struct ath12k_base *ab, char *name,
 			  "bus=%s,qmi-chip-id=%d,qmi-board-id=%d%s",
 			  ath12k_bus_str(ab->hif.bus),
 			  ab->qmi.target.chip_id,
-			  ab->qmi.target.board_id, variant);
+			  with_default ?
+			  ATH12K_BOARD_ID_DEFAULT : ab->qmi.target.board_id,
+			  variant);
 		break;
 	}
 
@@ -216,19 +218,19 @@ static int __ath12k_core_create_board_name(struct ath12k_base *ab, char *name,
 static int ath12k_core_create_board_name(struct ath12k_base *ab, char *name,
 					 size_t name_len)
 {
-	return __ath12k_core_create_board_name(ab, name, name_len, true, false);
+	return __ath12k_core_create_board_name(ab, name, name_len, true, false, false);
 }
 
 static int ath12k_core_create_fallback_board_name(struct ath12k_base *ab, char *name,
 						  size_t name_len)
 {
-	return __ath12k_core_create_board_name(ab, name, name_len, false, false);
+	return __ath12k_core_create_board_name(ab, name, name_len, false, false, true);
 }
 
 static int ath12k_core_create_bus_type_board_name(struct ath12k_base *ab, char *name,
 						  size_t name_len)
 {
-	return __ath12k_core_create_board_name(ab, name, name_len, false, true);
+	return __ath12k_core_create_board_name(ab, name, name_len, false, true, true);
 }
 
 const struct firmware *ath12k_core_firmware_request(struct ath12k_base *ab,

base-commit: 6a5fe6aaedcfadf8e32dd703ec20b1460523c22d
-- 
2.34.1


