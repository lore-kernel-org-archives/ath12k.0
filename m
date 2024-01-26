Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2634EC47DDF
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwNQ1hC2q3wKWkatICKj0qukLTSwyQUTijUHRiQSwNc=; b=xtEqHlF/L6gokRmoCS/nFyJU+e
	1YNBzHO+SHevyA1MxCxx2R8lw567S6aPtSpbwX664F3Ck3vQURvDzKyoFPLfqoAfPANaZGLmwksqX
	ry3RTQH3i00lqaVslDdY0Ye7u9d/4OLS6EGkqLftSDxVN7ewKJkPH1kQE3VNRIrlR1uMlT71jMkX+
	HhvlgGuVCWLSAV/hJWwcM9qUTrfDeyc0jhq6VkofzUbowfKSc4rmX1+VG7Xyh2zL0Y62DVoKYe/d8
	/8vOfcs19uwuqn1KQ16w9V/STthZfje32wTdy1zH26xamRsNzBNYQKiOunhFqyWf7RCjeWpr/VJYr
	+M7FIqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKlj-000000042oO-24Cy
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 11:53:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKld-000000042im-0URZ
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 11:53:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40Q3SdKA022473;
	Fri, 26 Jan 2024 11:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=wwNQ1hC2q3wKWkatICKj0qukLTSwyQUTijUHRiQSwNc=; b=Zc
	41BYJdX+NTCnzeUUp2ofRcdqf6t7Uq/YhRcv9cWnH3jgEW46GynSUBXO4gJJeNOO
	LY2rxUkZBIIrsQgi578ogj54UpLIWjHJPQMcadRtgkSQ7AcQ9MfvLKZ7AWT1eJUo
	LA4HDpT0cywckGpcDxh3uPpF+KY8EM1NrthAITv6EF4qANW2k0Qxz3h+1QKXXcpp
	K9kgiEmo/YzBqq7tDXQhr5jZnglw1Gge9XRy7y1Q/63NXoZyx+hzAOCgc/plSKC6
	HqukqgfujdOBoI0is525kCch4RLXOstKV3vMFLhLVHxf2jnqd6PNy0f+vbQnJnmh
	jfGvfoAiM5f89gV2OcqQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv4v810b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:53:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QBr4nw026969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:53:04 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 26 Jan 2024 03:53:02 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 10/11] wifi: ath12k: fix incorrect logic of calculating vdev_stats_id
Date: Fri, 26 Jan 2024 19:52:30 +0800
Message-ID: <20240126115231.356658-11-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126115231.356658-1-quic_kangyang@quicinc.com>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HkBg5B8a6_e-ofpzhnT1W2DQ07PAKf2n
X-Proofpoint-ORIG-GUID: HkBg5B8a6_e-ofpzhnT1W2DQ07PAKf2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=990
 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_035305_264130_3210214C 
X-CRM114-Status: GOOD (  13.10  )
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

During calculate vdev_stats_id, will copmare vdev_stats_id with
ATH12K_INVAL_VDEV_STATS_ID. If vdev_stats_id is relatively small, then
assign ATH12K_INVAL_VDEV_STATS_ID to vdev_stats_id.

Obviously, this logic is incorrect. ATH12K_INVAL_VDEV_STATS_ID is 0xff,
and the data type of this variable is u8. Which means this judgement
will always be true. So will get 0xff for every vdev except the first
one.

Correct this logic and replace it with the maximum value
ATH12K_MAX_VDEV_STATS_ID.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v4: new patch.

---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d8c8bd420aa2..6b8b92d22553 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5520,7 +5520,7 @@ ath12k_mac_get_vdev_stats_id(struct ath12k_vif *arvif)
 	do {
 		if (ab->free_vdev_stats_id_map & (1LL << vdev_stats_id)) {
 			vdev_stats_id++;
-			if (vdev_stats_id <= ATH12K_INVAL_VDEV_STATS_ID) {
+			if (vdev_stats_id >= ATH12K_MAX_VDEV_STATS_ID) {
 				vdev_stats_id = ATH12K_INVAL_VDEV_STATS_ID;
 				break;
 			}
-- 
2.34.1


