Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A92C07E98
	for <ath12k@archiver.kernel.org>; Tue, 28 Nov 2023 02:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn/kUiAgY6uYeXXEBlaI6QNKBK2cv/v/c8up1luiUwg=; b=xAz1B3F2NloGHg
	myjGFtGY9oexviXyYQFI4PeesXK4gfnM6/uCgTKIsMut+pD+4jMw1iPGZ3WTd879SwO/JQijTzaaz
	HhaLAemR8zQPmirEwxjh5DFBnAvyxdF8W2Zl8H7Ct3wRuv/6V+6hBeMlNU5/wH0urGFAmrZVX0o2q
	6zKs3ZTwAUjNDVsubvDgoWzcvc1A7zy3wdgg1cd1mcOnZQviLVJgyH/0FZqbFkJgZhhKH9zCF0dDV
	izBZcm0qTm9KTZ3dPYW0lViIZmnhJiJr/9hzaUS0NU1kXXYbX9Qc4AyxMNx/pq1Kb1eRgu4jDnSWa
	PM/tgnbim+oOwR9JgncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7oFc-003vba-1x
	for ath12k@archiver.kernel.org;
	Tue, 28 Nov 2023 02:55:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7oFZ-003vaE-06
	for ath12k@lists.infradead.org;
	Tue, 28 Nov 2023 02:55:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS0QAMX028995;
	Tue, 28 Nov 2023 02:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=j8FJVpZykPgWirSCW2PoZ3nFck+YF6PKLufClewYn98=;
 b=DLKOaju+8N/ghEN9sLkej2rrLWVDmfH+wRyeK1oe8DD9EYhmleYlpRkj+RpGXsjqt4LR
 wg1CM3CGljrVT3G8h0WupIKn9WJs9jdu0mUvkkv9AHzd748O6eulFXoAkwGSl3MlpVx8
 KpjMJFaAMBNC2uUelHDY7rUe67mhob4xFdFU7BSqgSWp02I074adJ+7ShvluPA8KD05a
 Xvz0CXeq5JsMNFkCZ9Z24pgmZACdyCjovCwIb0RWas64RmrEExenpzkRySviYNMn5Pmv
 9A85218KhdoGCiag+/d/f5Vo0M420fcG9ivYXIv/FSNWm+ItCsw59jGjjlhgjH/SAwJZ 3g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un586r9bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 02:55:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS2sxvq029719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 02:54:59 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 27 Nov 2023 18:54:58 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 3/3] wifi: ath12k: change MAC buffer ring size to 2048
Date: Tue, 28 Nov 2023 10:54:40 +0800
Message-ID: <20231128025440.46988-4-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128025440.46988-1-quic_bqiang@quicinc.com>
References: <20231128025440.46988-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Uzu5Qg-63h2WfkfCpBnrIEIndOt3bdyP
X-Proofpoint-GUID: Uzu5Qg-63h2WfkfCpBnrIEIndOt3bdyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_01,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=841 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_185501_182945_E3435D6C 
X-CRM114-Status: GOOD (  17.60  )
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

For WCN7850, there is a SRNG named MAC buffer ring, i.e.,
dp->rx_mac_buf_ring. During initialization, it is setup
by host and then under control of firmware. During RX
process, firmware fetches buffers from
dp->rx_refill_buf_ring to fill that MAC buffer ring,
and those buffers are taken by RXDMA to carry real WLAN
frames received from air.

Currently a low RX throughput is observed. Checking
firmware log, lots of errors are reported by MAC buffer
ring, complaining that it is running out of buffers,
which further indicates that RXDMA is suffering from
starvation. Currently the size of dp->rx_mac_buf_ring
is configured as 1024. After changing it to 2048, those
error messages are reduced, and a 6.4% increase is seen
in peak throughput. Note that 2048 is an empirical
value. It is chosen here because the RX throughput
meets our expectation after the change.

This change only applies to WCN7850 since other
chips don't have a MAC buffer ring.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h    | 1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 50db1403ebce..ce55cb550379 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -165,6 +165,7 @@ struct ath12k_pdev_dp {
 #define DP_REO_CMD_RING_SIZE		128
 #define DP_REO_STATUS_RING_SIZE		2048
 #define DP_RXDMA_BUF_RING_SIZE		4096
+#define DP_RX_MAC_BUF_RING_SIZE		2048
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
 #define DP_RXDMA_MON_STATUS_RING_SIZE	1024
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 9f831e3971f9..f6fbe867bbd4 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -4110,7 +4110,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 			ret = ath12k_dp_srng_setup(ab,
 						   &dp->rx_mac_buf_ring[i],
 						   HAL_RXDMA_BUF, 1,
-						   i, 1024);
+						   i, DP_RX_MAC_BUF_RING_SIZE);
 			if (ret) {
 				ath12k_warn(ab, "failed to setup rx_mac_buf_ring %d\n",
 					    i);
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
