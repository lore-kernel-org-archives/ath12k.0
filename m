Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25846C54E64
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2F9+rTOr85Y6kfNpqc/U/01dplHTDZDc2oP0tuEEHI=; b=rczcSv7MqbJlMUzJYsvh1WGq4T
	Fu0tUrR1TEFjiagcSwYgraVNngkpBvHXnwN2S5kLs4tsPRs4QNk9q1UODuc52+fU9gWMZlxTehlUz
	fgb+CHeticbwD+lPZtIyDJm5wjIA3VwlT1St2Igm+aut6d1oV0aG+Hs4hkt0r6iirVReCVhx7n5c3
	r88Lnf23McgxqFhUupQrcGC8ZjYxqXyUKOAOnEpZyczO7Pcl2RDahEpa1TfaA8Ztd5OITEDO7jwMS
	JxYxW48rkrofUIdEGhp5pkQyW5QVHQL1ZQVrVcBgm7vi6aIXfoeeNUjuaYifiXq0P3bXmx+Z9D7Tw
	AN6L3Q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rormt-0000000218K-31Ay
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 21:23:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rormp-0000000215O-2Ekq
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 21:23:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42PLB5aC032232;
	Mon, 25 Mar 2024 21:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=F2F9+rTOr85Y6kfNpqc/U/01dplHTDZDc2oP0tuEEHI=; b=pW
	9JxoT/0jLWTkegNBEpdJZ7Bot1hhyZVcOreiP48zShNysVzzxkqwqAz5ClssnDtf
	AQDIDVVnsvS7CuW9V7JCoaSLW2/I+GlzAjmAnYsniO+bR/ngEd32Sc1eWzMvS5Vv
	V/O6i/ZN8ty8fXPpuSEk6j7HLfvzcqQmJV46wrrfSlcUqCr/mxg0k3KvKht6dcpk
	XXzysH39okIrVAy0YA6Lrw2U1OiB1WJ1eDCnInpuWq2NkF+pocX9F8YVgiobj+y7
	F+ylUV9FYqnvGdoHv3vuqhWRqbRtqJ54+f+Bd6w/vBFze5kL9ui0nlps4lj7cyGE
	TmIRouCUIjbKUEPDCXjA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x34hssv8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 21:23:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PLNGtu022707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 21:23:16 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 25 Mar 2024 14:23:16 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH 0/6] bug fixes and enhancements to 6 GHz band support
Date: Mon, 25 Mar 2024 14:22:58 -0700
Message-ID: <20240325212304.28241-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CoQn5izX0YTcOa1mvc6s65Yrvc2J9p8O
X-Proofpoint-GUID: CoQn5izX0YTcOa1mvc6s65Yrvc2J9p8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_21,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_142319_750585_B489A793 
X-CRM114-Status: UNSURE (   9.10  )
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

In 6 GHz band, add support for
1. channel 2.
2. Fix packet drop issues.
3. AMPDU aggregation
4. SMPS configuration

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Pradeep Kumar Chitrapu (6):
  wifi: ath12k: add channel 2 into 6 GHz channel list
  wifi: ath12k: Correct 6 GHz frequency value in rx status
  wifi: ath12k: fix survey dump collection in 6 GHz
  wifi: ath12k: add 6 GHz params in peer assoc command
  wifi: ath12k: refactor smps configuration
  wifi: ath12k: support SMPS configuration for 6 GHz

 drivers/net/wireless/ath/ath12k/core.h  |   2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c |   9 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 115 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.c   |  10 ++-
 4 files changed, 111 insertions(+), 25 deletions(-)


base-commit: fe7e1b830cf3c0272aa4eaf367c4c7b29c169c3d
-- 
2.17.1


