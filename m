Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E5CC6FD1D
	for <ath12k@archiver.kernel.org>; Mon, 20 Mar 2023 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pd6mrRkzuO2vU9p6aYobfLItyfY/c9nPiDRCrObvPXI=; b=NIZvRPtv3Tx8qD
	wZtzjqteEBPoexgI3gEX7DYT7e6fz5BgaW7u7EGXq4i9xK/6Bf+heXi6hH3epfWZkw0Zzer6GOuqb
	F7gtpUGzvu9vmDYwm1F/umYKxAutWx456w/caEhu6F7JpiJx4/AhbXb4yB6UiK0GD+h7I/2/SUeFt
	niwjbMVc5UCtSBXZvkCLpTCP+fcp6+q0VMOfLAX6hBZXze/26vLT/bLvdJ5TrZOwWkb8b/HSwXYWo
	kKxkxTs4hNGfreGvVEnKmH3zXHbArKjQ1halTrQNW6B08qm8hQCdx/zPGqAS7e4n5o0/5562v423F
	JExqg8dz49mzmfXxCkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBR5-008Qmu-1L
	for ath12k@archiver.kernel.org;
	Mon, 20 Mar 2023 09:04:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peBR2-008QmN-1U
	for ath12k@lists.infradead.org;
	Mon, 20 Mar 2023 09:04:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K8Oiuk011611;
	Mon, 20 Mar 2023 09:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=qX1zSXC14jS26upULSeJeN1INE+4o0vg26j8+oy9NzE=;
 b=KRx7YV6NMdb1l44Q7+vUL4QfhSZp1G+AG7FRZle+Nd173Aj9c0zRetgS769vR7DW4r+Y
 meT0UM/bQPl/bOh1ltZRr9zNfFOuEvvLJ/vOs1X5OJp+Mdyyikrgbdz2CpZlNEzoYndN
 POuuOzLI6HafMWml8NsE6SX9ZKPLUmeH5vrMPvxmi/F9p+jgUuqTvU5NPCwF+uPo9GQD
 LgmFyGqIOsLilFxE6exiUFBUPtCqrk3YIp/ddEDbeCXikdjj1RnkCmkflyQGxKOtqGF0
 JdoelCXffjvzBy2BpRItVucM+h/9bUDYkbszib7SLPITT9a2fFK0+3PKYXQZwnPmE72j Jg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pd2nv4n63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 09:04:06 +0000
Received: from pps.filterd (NASANPPMTA01.qualcomm.com [127.0.0.1])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 32K945v1012788;
	Mon, 20 Mar 2023 09:04:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA01.qualcomm.com (PPS) with ESMTP id 3pe2d4j031-1;
	Mon, 20 Mar 2023 09:04:05 +0000
Received: from NASANPPMTA01.qualcomm.com (NASANPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32K944lA012783;
	Mon, 20 Mar 2023 09:04:05 GMT
Received: from hprem-linux.qualcomm.com (hprem-linux.qualcomm.com [10.201.162.248])
	by NASANPPMTA01.qualcomm.com (PPS) with ESMTP id 32K944Kn012772;
	Mon, 20 Mar 2023 09:04:04 +0000
Received: by hprem-linux.qualcomm.com (Postfix, from userid 4146166)
	id 92EC6B003A2; Mon, 20 Mar 2023 14:34:02 +0530 (IST)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix incorrect handling of AMSDU frames
Date: Mon, 20 Mar 2023 14:34:00 +0530
Message-Id: <20230320090400.30027-1-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jKH19elZ_wcSU3EvKJJFqEeNfAljEiFt
X-Proofpoint-GUID: jKH19elZ_wcSU3EvKJJFqEeNfAljEiFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_04,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=809 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_020408_635999_0DAE7B5D 
X-CRM114-Status: GOOD (  13.47  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

When a data traffic with size greater than 1500 is initiated,
say size 65500, it is sent as a set of AMSDUs (3 MSDUs)
in a MPDU.

These AMSDUs are incorrectly classified as multicast
and peer id gets changed, except for first msdu,
because of mcast_bcast bit derived from rx_desc
for every msdu received.

The mcast_bcast bit in rx_desc is only valid for
first msdu. Hence, add changes to derive mcast_bcast
only if it is a first msdu.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 0adcbcfa0db5..46ba6ea1a5b3 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -196,7 +196,8 @@ static void ath12k_dp_rxdesc_set_msdu_len(struct ath12k_base *ab,
 static bool ath12k_dp_rx_h_is_mcbc(struct ath12k_base *ab,
 				   struct hal_rx_desc *desc)
 {
-	return ab->hw_params->hal_ops->rx_desc_is_mcbc(desc);
+	return (ath12k_dp_rx_h_first_msdu(ab, desc) &&
+		ab->hw_params->hal_ops->rx_desc_is_mcbc(desc));
 }
 
 static bool ath12k_dp_rxdesc_mac_addr2_valid(struct ath12k_base *ab,
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
