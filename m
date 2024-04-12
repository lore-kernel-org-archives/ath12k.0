Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF4AC4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5Xx4onHe7PXvLmZ4qMLjapzHVbdEEUK4acE+zo8M7M=; b=Ooqnn0sp0egOV2ZX2p7b9ThNja
	aYabta+7qSrEbDGiW7CUV9kiUWsFlMBPbUQcyoj+0pjCThQ8meqSU01AIs5GhZ4CwOjxqZ+fQZGkP
	6LZJwqiJLz4ZMmfyxxi1wpaO8I/0MXUc6GfH5Y8tzZftXT28qB/FD0ON/w/WksCRZku2nuoC8INa8
	T41swgAfHPCNgpv7hAW6U6TbHUpZ4brdvEca0Ph0GcHChFJmY1cckFlX8y7mvEjSZwNG+IzNoO4VL
	y3CxVNmTCP/6Dzuxgt2XGwhRIPIr7f+ExmdXAq71QcKBVIPdKOxlsKwaba2Uiz35EROd/me57kI61
	CFeZ8bCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3k-0000000FV57-3QsS
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3g-0000000FV1d-24i7
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C5stR4001439;
	Fri, 12 Apr 2024 06:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=u5Xx4onHe7PXvLmZ4qMLjapzHVbdEEUK4acE+zo8M7M=; b=V4
	fREQQV/R6h2k3Ykd40z8FPjgikJQ7gyOD0cAzR01wfc8W0zyOprpdAVaozcfrl1D
	nQduzsB6PFs0fCodbq/rvewdPkWP95jG3rQsY5otQT+HcJcFYRlk+36yGAawvxfx
	ja9szxqcO31Khj1yIJcRepb1LZdPdMHNaPYeDfhZJ6/0nwgzDroQfj3RfDOF/d/P
	6p8ImEPBmA230AwPT3mdzZnS07Lr2nQdqC7lBRXF3kRhauTTDyZZ/VoNLJyS53kz
	oplLFJu0z/qR4Ls6R/WgJIawHmcaS4bvYO8GkQr/dhcWaiSNkZCHS881ESD9/LTf
	f+0kWWSSA680gaWngxYA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xey6vr0s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66gbv019955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:42 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:40 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 04/10] wifi: ath12k: fix warning on DMA ring capabilities event
Date: Fri, 12 Apr 2024 14:06:14 +0800
Message-ID: <20240412060620.27519-5-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412060620.27519-1-quic_bqiang@quicinc.com>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Fp0wOBK8mZ-nczm5L7q4CORg_zO3Y9lI
X-Proofpoint-GUID: Fp0wOBK8mZ-nczm5L7q4CORg_zO3Y9lI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxlogscore=571
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230644_823736_4A610227 
X-CRM114-Status: UNSURE (   9.67  )
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

We are seeing below warning in both reset and suspend/resume scenarios:

[ 4153.776040] ath12k_pci 0000:04:00.0: Already processed, so ignoring dma ring caps

This is because ab->num_db_cap is not cleared in
ath12k_wmi_free_dbring_caps(), so clear it to avoid such
warnings.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index a5575ce9eed4..0fb1fdb935e1 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4041,6 +4041,7 @@ static void ath12k_wmi_free_dbring_caps(struct ath12k_base *ab)
 {
 	kfree(ab->db_caps);
 	ab->db_caps = NULL;
+	ab->num_db_cap = 0;
 }
 
 static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
-- 
2.25.1


