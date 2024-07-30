Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B2DC49EA1
	for <ath12k@archiver.kernel.org>; Tue, 30 Jul 2024 17:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uN4uZ7Lp2qx8eJpHNL4kPRdbOYHLNdOyC4VQoaNlRWw=; b=Vu3nmvoEZsoJ8K1ReL0PMYA53i
	l/oiuq/iK2VOXqA+5XZsv3lk/TTNMpGOrc1o2pQyHUjfN3RF1Um2Sm2GvLl7SDa7x5u0e0tltr47u
	yx44DSurJ+wMm/GV5jSpYtyeY+SxZsWZ8XR8I9hJYVW/U00AhTmmYstniONjrMx7t4rjg1ZqKC6tY
	wdhCOJ4qFv/9ANkSMSJhuA4SVR9MxRuTojmECd0LdQvph2w/zvY6LSNKdL2vDJboPhR2PFbI0d4Lf
	z/F1PUkrhtGSZ+Hzvebg/01gyq6JuppeJs5z+1mMYhwqIaoreGIAUlzscaTSuWvqRyqDSBSQ0oSXR
	hVViz89g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYqMK-0000000Fyp8-3PhT
	for ath12k@archiver.kernel.org;
	Tue, 30 Jul 2024 17:10:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYqM5-0000000Fygx-2BKQ
	for ath12k@lists.infradead.org;
	Tue, 30 Jul 2024 17:09:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UB0ius030881;
	Tue, 30 Jul 2024 17:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uN4uZ7Lp2qx8eJpHNL4kPRdbOYHLNdOyC4VQoaNlRWw=; b=ack0tnsHRb7NqSXf
	eTCdefSH4dbSnSLPerNRgGJ4EZO/fJ/IZT1MGMog7pfD+gUr//TZeeGRkwRVahWo
	yDrt+i1mhQxIb2D2z9izc+GnFIUJ9VnAh7VBFuha5bypsxnM6bBGbR9q/dTQvhNE
	u1TIuSiJWA1mZORmaBQmRqB8ci2Vu/iFKO1ZhPMDdDXbKKwyy6uhDP3DFZ8uBgN6
	0rqgsUfWUX4U/LOLbXJUQoSUgsfrGAWnC7yCyNRUqFZna5zEn4KgbFkTPE7IBsRP
	4nhiHqWLfa1qq+ojMeDzsx842TX1oGTkxiQE9/RARP7BAGnzr32rkeK37lZ4l24C
	LPCK1w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq522ekp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:09:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UH9iYE004948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:09:44 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 10:09:42 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH 1/2] wifi: ath12k: Refactor ath12k_qmi_alloc_target_mem_chunk function
Date: Tue, 30 Jul 2024 22:39:09 +0530
Message-ID: <20240730170910.3281816-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730170910.3281816-1-quic_rajkbhag@quicinc.com>
References: <20240730170910.3281816-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gBUM0FEJ2IluHSdNafBfvEBAu7ZmS9V-
X-Proofpoint-ORIG-GUID: gBUM0FEJ2IluHSdNafBfvEBAu7ZmS9V-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_13,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_100945_622421_40444246 
X-CRM114-Status: GOOD (  18.92  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, all QMI target memory types share the same allocation
logic within the function ath12k_qmi_alloc_target_mem_chunk().
However, for Multi Link Operation (MLO), firmware requests a new MLO
global memory region. This memory is shared across different firmware
(SoC) participating in the MLO. To accommodate this logic change,
refactor ath12k_qmi_alloc_target_mem_chunk() and introduce a helper
function ath12k_qmi_alloc_chunk() for memory chunk allocation.
Subsequent patch will add MLO global memory allocation logic.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 82 ++++++++++++++-------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 047393bc8bea..11bf16eaadd9 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2366,9 +2366,50 @@ static void ath12k_qmi_free_target_mem_chunk(struct ath12k_base *ab)
 	}
 }
 
+static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
+				  struct target_mem_chunk *chunk)
+{
+	/* Firmware reloads in recovery/resume.
+	 * In such cases, no need to allocate memory for FW again.
+	 */
+	if (chunk->v.addr) {
+		if (chunk->prev_type == chunk->type &&
+		    chunk->prev_size == chunk->size)
+			goto this_chunk_done;
+
+		/* cannot reuse the existing chunk */
+		dma_free_coherent(ab->dev, chunk->prev_size,
+				  chunk->v.addr, chunk->paddr);
+		chunk->v.addr = NULL;
+	}
+
+	chunk->v.addr = dma_alloc_coherent(ab->dev,
+					   chunk->size,
+					   &chunk->paddr,
+					   GFP_KERNEL | __GFP_NOWARN);
+	if (!chunk->v.addr) {
+		if (chunk->size > ATH12K_QMI_MAX_CHUNK_SIZE) {
+			ab->qmi.target_mem_delayed = true;
+			ath12k_warn(ab,
+				    "qmi dma allocation failed (%d B type %u), will try later with small size\n",
+				    chunk->size,
+				    chunk->type);
+			ath12k_qmi_free_target_mem_chunk(ab);
+			return 0;
+		}
+		ath12k_warn(ab, "memory allocation failure for %u size: %d\n",
+			    chunk->type, chunk->size);
+		return -ENOMEM;
+	}
+	chunk->prev_type = chunk->type;
+	chunk->prev_size = chunk->size;
+this_chunk_done:
+	return 0;
+}
+
 static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 {
-	int i;
+	int i, ret = 0;
 	struct target_mem_chunk *chunk;
 
 	ab->qmi.target_mem_delayed = false;
@@ -2385,42 +2426,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 		case M3_DUMP_REGION_TYPE:
 		case PAGEABLE_MEM_REGION_TYPE:
 		case CALDB_MEM_REGION_TYPE:
-			/* Firmware reloads in recovery/resume.
-			 * In such cases, no need to allocate memory for FW again.
-			 */
-			if (chunk->v.addr) {
-				if (chunk->prev_type == chunk->type &&
-				    chunk->prev_size == chunk->size)
-					goto this_chunk_done;
-
-				/* cannot reuse the existing chunk */
-				dma_free_coherent(ab->dev, chunk->prev_size,
-						  chunk->v.addr, chunk->paddr);
-				chunk->v.addr = NULL;
-			}
-
-			chunk->v.addr = dma_alloc_coherent(ab->dev,
-							   chunk->size,
-							   &chunk->paddr,
-							   GFP_KERNEL | __GFP_NOWARN);
-			if (!chunk->v.addr) {
-				if (chunk->size > ATH12K_QMI_MAX_CHUNK_SIZE) {
-					ab->qmi.target_mem_delayed = true;
-					ath12k_warn(ab,
-						    "qmi dma allocation failed (%d B type %u), will try later with small size\n",
-						    chunk->size,
-						    chunk->type);
-					ath12k_qmi_free_target_mem_chunk(ab);
-					return 0;
-				}
-				ath12k_warn(ab, "memory allocation failure for %u size: %d\n",
-					    chunk->type, chunk->size);
-				return -ENOMEM;
-			}
-
-			chunk->prev_type = chunk->type;
-			chunk->prev_size = chunk->size;
-this_chunk_done:
+			ret = ath12k_qmi_alloc_chunk(ab, chunk);
 			break;
 		default:
 			ath12k_warn(ab, "memory type %u not supported\n",
@@ -2430,7 +2436,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			break;
 		}
 	}
-	return 0;
+	return ret;
 }
 
 static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
-- 
2.34.1


