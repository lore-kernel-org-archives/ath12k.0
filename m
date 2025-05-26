Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4FAC54FB3
	for <ath12k@archiver.kernel.org>; Mon, 26 May 2025 03:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cKRV5GKyuP23Y3M9k0BT2svzLUAessr9qg1Tki7V058=; b=eeEk8KYjtn9XPjzty1pgcdKj5S
	1IkXG26e8IWLiABHRVWO1S0OFUqNFrCT1P/DbTkTATfCnRV0bPhg3Vy/V+PZq3kNPd+bm4pDI+OpU
	N/odIo8De7W5CPHGKIEhFbUAlCVC2x9LwgKQaIuqQnrMhABtcqt6uuVtceJMjAi3ANv9NapgrOtfF
	ySpS4lLo0uYiZiIAwLUu0cGJSN4fSt5H1uxzSTy5hwASBD0ojtmoTqEuIsOY/HTFFBPPdcMw01nRb
	JmmNxbYTPUma7tmHwD3aRKOPajYtIrGw3i8AG8fbsRgoMfWZY1Gh7M+qlHmR7HUZC4vdgPk081fzH
	oBuBfBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJOoS-000000081cw-16Ci;
	Mon, 26 May 2025 03:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJOoP-000000081cO-2ehd
	for ath12k@lists.infradead.org;
	Mon, 26 May 2025 03:47:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNo5Bc007771;
	Mon, 26 May 2025 03:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cKRV5GKyuP23Y3M9k0BT2s
	vzLUAessr9qg1Tki7V058=; b=DbYNA2K6351IrXC8Mt7KDWNbOvCfaGKtZ920Uq
	JLwMxC6S0rB15+Wc+6dFYf+cVhlDBjnRBWrzDDtCSDtxQMe2H7RO9RmXkbpCfRaB
	hQbQI6VCBWVhzOV4jt3fKR0BtNzEVSwb8amv5IqJqPS+oY/FtBBDTRaY/o+6Madk
	lbmVsbkaiQd5O4ndV/ZKzuoOcSFNPssV/YmVuX5G32qBIbpWmPQ/3FqOERiQ6X3P
	3VD9D4bImkBsE/vB5pHUEj/uISC2d0Lepeq+DPQPdzadoW9avATeSw9YsxtgwWdi
	yMwlPtrRawe5wvmHG9YwGBmNW3wWyBEJOQkAcByo0BL5anqA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5jvje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 03:47:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q3ldRx016814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 03:47:39 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 May 2025 20:47:37 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>,
        Sarika Sharma <quic_sarishar@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Decrement TID on RX peer frag setup error handling
Date: Mon, 26 May 2025 09:17:13 +0530
Message-ID: <20250526034713.712592-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6833e45b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=C3E12wa_uFYmd_9f3VUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDAyOCBTYWx0ZWRfXyeyqLkUYgsKc
 ufE+dTar19ok2HfyMLf5zvahcponN8GMkFp3tX9TyVnOIRxxpq05BI0z7m26p79vyooHWxBglCH
 LWtbbC306UIKKo1BiC5Jg0UE2ghC3qr2PzF2hxXenbhx/S0vPmV2PAoZWsaXRlHa4BzSablvFEV
 z4fYnRAMO2TkLr1QhbeCmnA49MLk4ir1YxJF5UHd1MABF8GT9kWpYknXQ1tYRmN+lb4lgXU4oBy
 9rZQEnreHcEVLBjjkdi5Ae2+Ss0wxLHwax/c1udcgFdroXj9ICowbzjggPnHXkk3cU1utcgK9a6
 dnKIBeshsim0HqEJnLS5QMCmdIrr1Sz0l+isYYWc16S/mFhQQS8mB0GKLzQH/ybiCcO8OkyrvcG
 R4nRs6vdf0079bOWmMxhCc4774Fa4eOcqoOesGj85ffyEVrBbWNNuuegYQu9LtFk0HtfxZ8K
X-Proofpoint-GUID: V23L18Z-8ub8mD2g8DhyQZyfb0OvQqEF
X-Proofpoint-ORIG-GUID: V23L18Z-8ub8mD2g8DhyQZyfb0OvQqEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=662 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_204741_709308_2DC56560 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>

Currently, TID is not decremented before peer cleanup, during error
handling path of ath12k_dp_rx_peer_frag_setup(). This could lead to
out-of-bounds access in peer->rx_tid[].

Hence, add a decrement operation for TID, before peer cleanup to
ensures proper cleanup and prevents out-of-bounds access issues when
the RX peer frag setup fails.

Found during code review. Compile tested only.

Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 6317c6d4c043..c6b10acb643e 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -84,6 +84,7 @@ int ath12k_dp_peer_setup(struct ath12k *ar, int vdev_id, const u8 *addr)
 	ret = ath12k_dp_rx_peer_frag_setup(ar, addr, vdev_id);
 	if (ret) {
 		ath12k_warn(ab, "failed to setup rx defrag context\n");
+		tid--;
 		goto peer_clean;
 	}
 

base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
-- 
2.34.1


