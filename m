Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22826C00528
	for <ath12k@archiver.kernel.org>; Thu, 20 Jul 2023 02:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QA+6Ogu7RAeAd3nNabcyQuWztg9UbQHdDDJ9k/j2kHo=; b=olueRplKuVZuw0
	SPm6OAUXDFUcQqKgXR95M53oCK5sOxNWrd8i/yMFeE1KS0t3C88o91OwfTV0q7oNfuCPOLqfwpFys
	EK2rCW+6n5pe2+twoX4a5kaYqyeN5mV28YD3X2TAdF6xMP5+jnmuwJuhEOsHbzOIkLJzYA2t3ztCo
	o2uNtCSlT6rdLadihMN6UY0H4BXaDVhCrMCwOVFwGoQtLixthPAFDnNVNQ9ViY+VM3eSu2HJXYGSp
	r0oV3dwYMRHthtJUSSZWWkmWpbnT5ioFdZujLUNH+ezfi+MuOoPPtZwAeWHRwgDevmI5m2ZrVGXxG
	EvOjTWMUDVwydQSnXMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMJmj-009av4-2k
	for ath12k@archiver.kernel.org;
	Thu, 20 Jul 2023 02:52:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMJmf-009atM-1V
	for ath12k@lists.infradead.org;
	Thu, 20 Jul 2023 02:52:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36K2EK30011108;
	Thu, 20 Jul 2023 02:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=VTwSNz8UzpZ0VbH7nHekqHXggX9pRSKZTyzvOZzKjZI=;
 b=AOg3NhiHPvbn4OUmxSGpCZ9yIZUyuxtfLNi9F20NYQSyfP67jOrW46DetO+BOv7fomAI
 w4VuOo8rO1bLLtUv4lwJqudoG5JVWYmv0GePNa5VMncsmaay6PF9u/NJLtzj55Jl2Ovz
 seO72xP2/XKbXvi/9pbbGY+Xh7QD+srI/AWr3dUFn5NHBOTZeO4aHhAYu8BRTOmdQXLq
 6PHT15RL+8PRsnmBqF8Cu3a26SeEigNfrVEtOIbj+m7hsFOaaRpV+IMyQK0yXA9j8q2J
 pBkR1eOEyetDhb4TfA0yDYjJLXIea348d0EdVeK0r4F9D4I6peDNX4HhlTPYnLZw7ouF Vg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rx7412n4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 02:52:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36K2qpIf006897
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 02:52:51 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 19 Jul 2023 19:52:50 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 3/3] wifi: ath12k: fix invalid m3 buffer address
Date: Wed, 19 Jul 2023 22:52:32 -0400
Message-ID: <20230720025232.7701-4-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720025232.7701-1-quic_wgong@quicinc.com>
References: <20230720025232.7701-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yKeYJh1f0jMgJRGee4lziw0TA3BzxT0M
X-Proofpoint-ORIG-GUID: yKeYJh1f0jMgJRGee4lziw0TA3BzxT0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 mlxlogscore=804
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_195253_621592_5292A01A 
X-CRM114-Status: GOOD (  14.06  )
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

This is to fix m3 buffer reuse issue as m3_mem->size isn't set to
ZERO in free function, which leads invalid m3 downloading to
firmware and firmware crashed.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index d0da9b63a114..edc45d78b5d5 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2535,6 +2535,7 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 	dma_free_coherent(ab->dev, m3_mem->size,
 			  m3_mem->vaddr, m3_mem->paddr);
 	m3_mem->vaddr = NULL;
+	m3_mem->size = 0;
 }
 
 static int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
