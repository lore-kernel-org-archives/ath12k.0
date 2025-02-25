Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405A7C021B2
	for <ath12k@archiver.kernel.org>; Tue, 25 Feb 2025 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8KgdG51XjvvUBG5Q6EnKiwzUq2eg9eLK3JCQWf+60w=; b=PZfRBTvkq92Fd2Zjcp8xKKncxc
	3Dha5NJ9BUbgu9pdmZD3nBvqd7qDFRwmE0mQPae/3J26Q/7WJRyyPsIJtPqYu/RYJ9SKFqfv7hl+o
	128cBn6PZk2kpH9f9vA7YCHRMOJhpw+0JimW5H/AXfIduMPsbhtxpNodNoJ/pFdL8xOunGBVXA7BQ
	Uj8YDZHFU+p8j8BVkX+mhuxPpMz86/Bnvz+QyGp+1L0/KLxYBn6Rz5INjId/leVQ0+0twTNjJDlxm
	wIrAIn9a8tZSRABQippCChzXqYne8Lqxi2vLfFXeC8NvDXo3NjPF0zfWC0DBfeZ/0yB24o640b/Qb
	RAnFs3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpkS-0000000GGvf-00ai
	for ath12k@archiver.kernel.org;
	Tue, 25 Feb 2025 07:53:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmolT-0000000G8Z1-0tIp
	for ath12k@bombadil.infradead.org;
	Tue, 25 Feb 2025 06:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M8KgdG51XjvvUBG5Q6EnKiwzUq2eg9eLK3JCQWf+60w=; b=eEaywKzcYw392ju+tnBmRAaMr2
	CgKkBUmw+IZFfOOkAPMkq49pcgMoiR6rDw/4Eqo6XTunYdEsRca+TT57NUdcsHij4N4trvXxCwt0H
	NVNyzohPywyoHqIIp5DY6l7186rBfzxS/PCTQX2066P8/1LyYDu8Qit64n1VzLGur3YiwqKVqDdsi
	n4gbM3uLnM1polnGjJNllYpuayK3hoEsaGlrN0mWIX8mB3Fv93+SeQccWWz3PqMkQKSNMNE1Ynkpm
	nNyVt6q6Uapf3p4Id54QAbDTp9AdQeOz/POIjUOKJOoqCGJ4gD6HoV6GVDU/rH9g/Ax2zE7Gjf0WF
	LixekVmQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmolP-00000003JR6-11wa
	for ath12k@lists.infradead.org;
	Tue, 25 Feb 2025 06:49:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P4EBJS001751;
	Tue, 25 Feb 2025 06:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8KgdG51XjvvUBG5Q6EnKiwzUq2eg9eLK3JCQWf+60w=; b=hyrIgfPqY6UaNJXO
	R4NqEBfLCFyPdXN2L5O9teL/V6Czg2gF9NPFHPyhtxJvh1nfoPC4+jPSLq+HaQfD
	dX8oqnm35AaeQ7NJNArSTct7gJrtYsXoox8QVZyeNER0H+iyKrpNuEtS3p5ICp1y
	B+3JV0eure7LccLNjfW9rkG3VMwHFxUz4Io0piVVMWOC8WGcMHjkbfU4PH8no2II
	kph+PWMw3qCG5ir6l40KxMEYBer7+dtQEZjqFpdbTr0qi1AoNm7D2XEUxNDROqhh
	IKUL9WpAw7C4h0zME0OYPP5KmIxdtu0MOn3g+Hf3NtALMi8YY0wxuF0dkWyVUhOs
	gsonuA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4516nm8dx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 06:49:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51P6npco031298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 06:49:51 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 22:49:47 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Sowmiya Sree
 Elavalagan" <quic_ssreeela@quicinc.com>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v6 12/13] wifi: ath12k: Power down userPD
Date: Tue, 25 Feb 2025 12:18:33 +0530
Message-ID: <20250225064834.2002499-13-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225064834.2002499-1-quic_rajkbhag@quicinc.com>
References: <20250225064834.2002499-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ObCymHXRD-SvQ3HL02d86QHnJvucJI09
X-Proofpoint-GUID: ObCymHXRD-SvQ3HL02d86QHnJvucJI09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_02,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064955_831423_94781AF4 
X-CRM114-Status: GOOD (  14.28  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Set the stop bit in SMEM to power down the userPD. Wait for stop-ack IRQ
to indicate power down completion. Release the userPD firmware using its
peripheral ID.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 842ba9451e80..60257c4d2210 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -463,6 +463,34 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	return ret;
 }
 
+static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	unsigned long time_left;
+	u32 pasid;
+	int ret;
+
+	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit),
+				    BIT(ab_ahb->stop_bit));
+
+	time_left = wait_for_completion_timeout(&ab_ahb->userpd_stopped,
+						ATH12K_USERPD_STOP_TIMEOUT);
+	if (!time_left) {
+		ath12k_err(ab, "UserPD stop wait timed out\n");
+		return;
+	}
+
+	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit), 0);
+
+	pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
+		ATH12K_AHB_UPD_SWID;
+	/* Release the firmware */
+	ret = qcom_scm_pas_shutdown(pasid);
+	if (ret)
+		ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
+			   ab_ahb->userpd_id, ret);
+}
+
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
 {
 	struct ath12k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
@@ -679,6 +707,7 @@ static const struct ath12k_hif_ops ath12k_ahb_hif_ops_ipq5332 = {
 	.irq_disable = ath12k_ahb_ext_irq_disable,
 	.map_service_to_pipe = ath12k_ahb_map_service_to_pipe,
 	.power_up = ath12k_ahb_power_up,
+	.power_down = ath12k_ahb_power_down,
 };
 
 static irqreturn_t ath12k_userpd_irq_handler(int irq, void *data)
@@ -1094,6 +1123,7 @@ static void ath12k_ahb_remove(struct platform_device *pdev)
 	struct ath12k_base *ab = platform_get_drvdata(pdev);
 
 	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+		ath12k_ahb_power_down(ab, false);
 		ath12k_qmi_deinit_service(ab);
 		goto qmi_fail;
 	}
-- 
2.34.1


