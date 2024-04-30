Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791AAC4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZKf9Am5uSibPx6rVg8Bxxng0Qs+fK/1XtQlUCRIJkI8=; b=cD9Sz6/NvkuEFT2UzItRQ0ZFb+
	GC3YLMcHV8xjqXOAbUxlgeSVTbnAFTkTEwV37ElzM9POaM79TECgk1iQMHL1m7gXYtWmpUrCplE5w
	qyma9Ke1wodZlq1erDKPIdnkX6wKiFb1AXnCcgbKrcTKyLQyB2qH+sFmKuWv2TszS12gVf09Q/RHl
	VwvacNPp6DjFVjjHZY06a4D6JqFzCiC8fky3ZkCwOgp+XkKx6DvWF4ZXO9G08p82j6vtM0QMOvg/Z
	rcoMwux4xOvOiUr+S4+WrTrq2XTgfx7TH+kq5j0i+sNCMg066k/eCpjBcLaKeQKhR9Ete1Q/5jGzh
	8OZNq6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1i9R-00000005ToX-0jOZ
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 07:43:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1i9N-00000005TnC-0s6q
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 07:43:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U7ewEL001828;
	Tue, 30 Apr 2024 07:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=ZKf9Am5
	uSibPx6rVg8Bxxng0Qs+fK/1XtQlUCRIJkI8=; b=fFyoL0+C6W6rBN4ktIh2amA
	dSz1vig1kDOJ1d4T10acFjRWv7/1yaHymvTf8nso+bI/GvVabdFv0/lcYCvcRTtW
	qDI7volGmugbuynEW/HiFmlTCEiOU1BpF+DPoy+4z7OCEH/fL07O5FRPmwni7GNw
	RPWtJ2iDkR3q3AS3Cb5+PTwPvl9SP6Upr5i2Rr/K4GkNvVuxz2WuaIjIrnzEN5qE
	ft56CfjgQ0gT7bThtexqJVjn5dMG32UjwqBfNnYKzUR2CfEhhONa+hTlWtIe6xf8
	dzgfv+fLeUhiXzdnaJhFnlMbBEqSw01We3iEVQQtpQgEkiOoDGGL1/0Xd8dGRpw=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtvf7g07r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 07:43:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U7hdbZ021480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 07:43:39 GMT
Received: from hu-kathirve-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 00:43:37 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
Subject: [PATCH v4 0/2] wifi: ath12k: drop failed transmitted frames from metric calculation
Date: Tue, 30 Apr 2024 13:13:11 +0530
Message-ID: <20240430074313.885807-1-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T3BOwQ6Isjhfmf2m_oopdHvedir6D9Xf
X-Proofpoint-ORIG-GUID: T3BOwQ6Isjhfmf2m_oopdHvedir6D9Xf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=862 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_004341_281718_DB89A086 
X-CRM114-Status: UNSURE (   6.91  )
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

- Use ieee80211_free_txskb() instead of dev_kfree_skb_any().
- Drop failed transmitted frames from mesh metric calculation to avoid
false link metric averaging.

Karthikeyan Kathirvel (1):
  wifi: ath12k: drop failed transmitted frames from metric calculation.

Sven Eckelmann (1):
  wifi: ath12k: Don't drop tx_status in failure case
---
v4:
	- Removed an invalid patch uploaded in v3
	- Replaced a dev_kfree_skb_any() by
	  ieee80211_free_txskb() in
	  ath12k_dp_tx_free_txbuf()
v3:
	Addressed Nicolas Escande's comment
v2:
	Addressed Jeff's comment
---
 drivers/net/wireless/ath/ath12k/dp_tx.c    | 47 +++++++++++++++-------
 drivers/net/wireless/ath/ath12k/hal_desc.h | 22 +++++++++-
 2 files changed, 54 insertions(+), 15 deletions(-)


base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
-- 
2.34.1


