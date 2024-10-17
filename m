Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D5ED2F7E3
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 03:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJEn4r5GPs/o23DpmP8yG0gTbw4JKLdP7cf2Ql1BpkU=; b=zhHCsKX+AAbHQMdbQ4uI3dZHt8
	OHml++BO2ByzjwRoEtEOZs41O+NAxkCBEEgaPbkjqZ4nazsi0XGNHXeFnMulf1aRkb1Ua6PTjoTaS
	/OiJV6nnxiHzcutfVZ6LxE47nOtBVLuWvdhWv/44zJN6C9U2ssH8NcW3jWOvVdyTTP6SlU5pWnH+B
	wH2QzcAIg/ygylOOSiEPCC+jw24KvK/EUqdz6k7aUYdsniLPwTyb3/ha5adfwz0Zuf2I2Zv7XK5tC
	0INtZf3a1X6xOV+mBhHvAKCjmVnLoR9MLGUPG8hduFQpU7QJHqieawi7hQSiQ/KfPc+IDH2KGeBll
	jAawTTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GvN-0000000DdIt-435r
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 03:11:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GvF-0000000DdEm-1gP9
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 03:11:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFVZ2c026699;
	Thu, 17 Oct 2024 03:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJEn4r5GPs/o23DpmP8yG0gTbw4JKLdP7cf2Ql1BpkU=; b=nPpIWX0PHf9nicqY
	Grs/JU01mm4lalDZke/qUKfCBva/C1bh3qtq3e2PQVJ5WrO1nhrDJ+/kw4i4zE70
	ASkFK28nGZzFwOXoSxyDvrYltM0zMDvw/dAhf0dS/eBGlbMCEz9j6QTN20xs55Zn
	9sHfqmZNzqJ4WsxGFSF8l35ZM269segviRpN2yuWUKnoxFvk7w6u8RDYR6Gq8H4p
	fAXCnOYnXfFh8CMFm1sS2qs00taedb9SqylhgG2V2tW7CrgGJrA4e3Dj3XW4MazX
	kCJ8aB2SjnNeLEvoP+j+iaWWcOCUmIljKZuQiXLFUxKdSnGp4lY71ehQfLQ+pNDQ
	A7mj4w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6k5n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 03:11:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H3BWuD020902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 03:11:32 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 20:11:30 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 06/11] wifi: ath12k: fix struct hal_rx_mpdu_start
Date: Thu, 17 Oct 2024 11:10:51 +0800
Message-ID: <20241017031056.1714-7-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241017031056.1714-1-quic_kangyang@quicinc.com>
References: <20241017031056.1714-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZegQ25W21xXr0kyQjAaThXXexVLWND3Q
X-Proofpoint-ORIG-GUID: ZegQ25W21xXr0kyQjAaThXXexVLWND3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=643
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_201133_452521_42A63CF1 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

Current struct hal_rx_mpdu_start in hal_rx.h is not matched with
hardware descriptor definition.

So update this structure and related code.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal_rx.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
index c69df852ae69..2de7b0eba9f2 100644
--- a/drivers/net/wireless/ath/ath12k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/hal_rx.h
@@ -452,15 +452,16 @@ struct hal_rx_phyrx_rssi_legacy_info {
 	__le32 rsvd1;
 } __packed;
 
-#define HAL_RX_MPDU_START_INFO0_PPDU_ID	GENMASK(31, 16)
-#define HAL_RX_MPDU_START_INFO1_PEERID	GENMASK(31, 16)
-#define HAL_RX_MPDU_START_INFO2_MPDU_LEN GENMASK(13, 0)
+#define HAL_RX_MPDU_START_INFO0_PPDU_ID			GENMASK(31, 16)
+#define HAL_RX_MPDU_START_INFO1_PEERID			GENMASK(31, 16)
+#define HAL_RX_MPDU_START_INFO2_MPDU_LEN		GENMASK(13, 0)
 struct hal_rx_mpdu_start {
+	__le32 rsvd0[9];
 	__le32 info0;
 	__le32 info1;
-	__le32 rsvd1[11];
+	__le32 rsvd1[2];
 	__le32 info2;
-	__le32 rsvd2[9];
+	__le32 rsvd2[16];
 } __packed;
 
 #define HAL_RX_PPDU_END_DURATION	GENMASK(23, 0)
-- 
2.34.1


