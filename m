Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743D9C61D92
	for <ath12k@archiver.kernel.org>; Wed, 22 Nov 2023 06:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HQK0TptjsBa1zEll9VM9PVYrzoPKG18UgR2+09OzliA=; b=hwqcIMk3tXf2Rx
	UP/3i7GPrJKbWoBoySxhhjRyfiGbhLeJqF0cglgbVi2zkCEMauoYH4Sj91fgraj2Y/7JTyxd7rhTM
	bYbNezVYBR+ETirYOwHU8gs+77YZdXCiVlSO9fp+wKnVLIo1X1VWDcQbKkOhcwnIehHyIdB8Nbt+d
	OqpqHUrdFnH+81biVmVKuXelPHIudpI5VqOQo2tP9AM/iawBhjRQG6ImlYvXOCTk9KnFS8JHvK4q9
	dVP02dRycYCK7MbeK3F9M5LBpB7T8lE8HNVLxV09iB50/KM1+ro4QZAo215H3UgyuySpeIyVfa1Dp
	8QC3tpSQmfulQE+y13qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5gu1-000qiM-0S
	for ath12k@archiver.kernel.org;
	Wed, 22 Nov 2023 06:40:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5gtx-000qh7-3A
	for ath12k@lists.infradead.org;
	Wed, 22 Nov 2023 06:39:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM5W8kI015327;
	Wed, 22 Nov 2023 06:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=oIavnNmrxOGK6W8+sL2Y2u3L5GHYFMOv93RZAzeaqAg=;
 b=abyWJyMWwx5UO84mAKI3gHmFCQwvlzlCFftKGTY2+YV1E49zHSElTLmlVT9IewDqsqkz
 POPZF4fdFQVOJ9oSgCBg3hdaZ065yFtB2jejkULddrGa6sYlD8V2HYAMYk4fQ4+FT3IF
 cz8b3AQmovtvHOhEtAuTnefPAZW6qkSs+7ZOVh93IHfUUandJ+2HJF849pRVHhH67XDP
 Xbgi2B0UH1Kq/fvZI+XTgL5WsjKzxH78XcHS7lZ9M6gRC7sdOcPUYyVuGmKwgxK6ivEi
 Vpndj/IV6lFpvM0vFMRIqwDNjyr0hqZx2eFvt6pHkf5tITQF3qWJjmVjMSKgkyqQwelC pA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhbjvg58s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 06:39:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AM6dqr7010425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 06:39:52 GMT
Received: from tamizhr-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 22:39:50 -0800
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: Remove unsupported and unused ring configurations
Date: Wed, 22 Nov 2023 12:09:29 +0530
Message-ID: <20231122063932.10321-1-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V2RuGsJGvw0fQuLaGKykk6g61-sMan7w
X-Proofpoint-ORIG-GUID: V2RuGsJGvw0fQuLaGKykk6g61-sMan7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_04,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=660
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_223958_158193_EDA8A4B1 
X-CRM114-Status: GOOD (  11.71  )
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

Currently in driver doing memory allocation for tx_monitor, tcl_cmd_ring
and tcl_status ring. Here driver support for tx_monitor mode is not
there and memory for tcl_cmd and tcl_status rings are allocated by
firmware and it uses that memory instead of host allocated. So avoid
these unused ring setup configuration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Tamizh Chelvam Raja (3):
  wifi: ath12k: fix calling correct function for rx monitor mode
  wifi: ath12k: Remove unsupported tx monitor handling
  wifi: ath12k: Remove unused tcl_*_ring configuration

 drivers/net/wireless/ath/ath12k/dp.c     | 16 -------
 drivers/net/wireless/ath/ath12k/dp.h     |  2 -
 drivers/net/wireless/ath/ath12k/dp_mon.c | 40 +----------------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 57 ------------------------
 drivers/net/wireless/ath/ath12k/dp_tx.c  | 43 +-----------------
 drivers/net/wireless/ath/ath12k/dp_tx.h  |  1 -
 6 files changed, 2 insertions(+), 157 deletions(-)


base-commit: 9a36440d929d134c56030a8492405708a143f580
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
