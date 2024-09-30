Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6DACE8379
	for <ath12k@archiver.kernel.org>; Mon, 30 Sep 2024 17:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a8lhSik6RlyktlYZWW5NJU0ZqJr01P+wjiX7IUh/yvk=; b=vFrfs2cCNLXI57m+rnoO/peQM6
	jxfLy3h4/+J2pRyabLEjlP2zxpgZkskVew8sMOj6NR9tX3jWdk7STn1zE76AOsD9DM9J22kpDKtNH
	Z50MEl1Z7b9xSMi30cWr4hUh187oGkKRf1+6bl76vyTP0XrjE2X3nzK0nvI24iRIwLDTYEyUbBsyN
	hG5o6R7amyOUEI3Rtj9/90dyXUeyg2VxTD4EZTItZRmhZMbqx+CIQo4qt1iN1MxeOoEah7unmCQOf
	sbWHFICkreUW7S40wsdilhrMtR3QHRzuZzLVAWMk55NK0CTXBzXS2AphNn5LC7GmRwJTpQs61UYEY
	iB5LKoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svKNy-00000000P7m-0ukA
	for ath12k@archiver.kernel.org;
	Mon, 30 Sep 2024 17:40:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svKNv-00000000P7P-46CK
	for ath12k@lists.infradead.org;
	Mon, 30 Sep 2024 17:40:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UCDmEA018454;
	Mon, 30 Sep 2024 17:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a8lhSik6RlyktlYZWW5NJU
	0ZqJr01P+wjiX7IUh/yvk=; b=TJy3hHL+MD0QyjFxgacapRXb88PJoS5Qzfwbkb
	sVLilHc405RIVt/JLvJPtuxa8Br8I14Y3CBIC+K3LU3OTvTIbSmhaiLGPjvAAGu8
	KJtbZC9NTKkypZu2WGlpu6S8xL0e3c1TLiAC43JkkZRxrEdiW/TVALOVRk8rYCL2
	SVw3dP5FYjZCS1+YEW5sMu7ZjvkiubS6FGkr7JuMi1d6cGf4+T3m5ojSO+0jgEz0
	jzfY3F2TLIPa4YNs1DWEvmcJ0ede3/Rgfs6T3KbZAWZPYHh3p/WAlUunUbIp9i9s
	i2YrybiPoavP8kmLKn3IsbMoQHIauLfn/mQBPmQH7sNIgklw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa12nkrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 17:40:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UHeXbi026288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 17:40:33 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Sep 2024 10:40:31 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Support AST and Puncture Stats
Date: Mon, 30 Sep 2024 23:10:08 +0530
Message-ID: <20240930174010.617123-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eUqKVDv0v1eIwzZ0hev91MclX48K2blI
X-Proofpoint-GUID: eUqKVDv0v1eIwzZ0hev91MclX48K2blI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=563
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_104036_041024_FB77B98E 
X-CRM114-Status: UNSURE (   7.20  )
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

Add support to request HTT stats type 41 and 46 from firmware. These
stats give Address Search Table(AST) entries stats and pdev puncture
stats, respectively.

Depends-on:
[PATCH] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
Link: https://lore.kernel.org/linux-wireless/20240730035154.3723773-1-quic_rdevanat@quicinc.com/

[PATCH 0/4] wifi: ath12k: Support Ring, SFM, Transmit MU, SelfGen stats, CCA stats
Link: https://lore.kernel.org/linux-wireless/20240913082949.573482-4-quic_rdevanat@quicinc.com/T/

[PATCH] wifi: ath12k: Support Pdev OBSS Stats
Link: https://lore.kernel.org/linux-wireless/20240919101812.941145-1-quic_rdevanat@quicinc.com/

[PATCH] wifi: ath12k: Support DMAC Reset Stats
Link: https://lore.kernel.org/linux-wireless/20240926051110.2477814-1-quic_rdevanat@quicinc.com/

[PATCH 0/2] wifi: ath12k: Support pdev Rate, Scheduled Algorithm Stats
Link: https://lore.kernel.org/linux-wireless/20240930171705.596703-1-quic_rdevanat@quicinc.com/

Dinesh Karthikeyan (1):
  wifi: ath12k: Support AST Entry Stats

Rajat Soni (1):
  wifi: ath12k: Support pdev Puncture Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 194 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  56 +++++
 drivers/net/wireless/ath/ath12k/dp.h          |  12 ++
 3 files changed, 262 insertions(+)


base-commit: ced1f8bd64cda4e0c1df0890d1041cc6b18d5c77
prerequisite-patch-id: 970109034faa25a7630720c0da29c875e821f9ec
prerequisite-patch-id: 0bda913781a634c055869a033aa9b34d10825a20
prerequisite-patch-id: 4d37990775694f110ce3e87096231fe8855f09f5
prerequisite-patch-id: 121409543edef60c5f6144dd7ae3a615a78520f7
prerequisite-patch-id: ecac67f6fce1dd4d5089dbc3da840e311f6a7218
prerequisite-patch-id: 0537ae604d2617e42bef13bfb791aad4d11bf6e1
prerequisite-patch-id: da5a4e5cc3097994bfcba4b37680c90b0675ccf9
prerequisite-patch-id: fcd0ce1adcc63e80c95e4636bd4614bd5b732ffa
prerequisite-patch-id: 13cdebd7e2d7d35eb1da839c5b94edb9c83f868f
-- 
2.25.1


