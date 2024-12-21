Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7BEE77184
	for <ath12k@archiver.kernel.org>; Sat, 21 Dec 2024 04:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/SAQ866Iuwg43VSP1tuKkek5l1mj0sd2fx/CEkXcpnU=; b=Ni5MQvzdfsSJAKFlFRHVN14Snm
	hC0X+tvz31uBARBTRGNkWcn1YE/K0Kgzc6N7vittxo4bqoXDGMtt+o96SEAHfaYmDQ5hhZqf5hEeU
	l6EfzTC0NxM/A/h41ZI9iOFcg1vcPhgEXEtO2Iv+7r+Ia5A/Q7/2FS54XnQ76eMSLOw1y5ZG+TWHJ
	u7kq+nUKHczj4iDKriFuebN38JjK1I7V5R10sU2OT8w8r/Sx9Yw3YmyPMi9K9mOaVhz9gcg1BJn7A
	jrYymNd7Xs11jnQZjxSwH8ovPF1pQYpGhaqk0ZFfHF6dW9ZPge/2NRh/ZSBB3WioMR2q5ELVaNFG5
	UKdm6y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr8i-00000006XMl-1ze4
	for ath12k@archiver.kernel.org;
	Sat, 21 Dec 2024 04:30:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOr8f-00000006XMP-2dMS
	for ath12k@lists.infradead.org;
	Sat, 21 Dec 2024 04:30:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL2A6pW000422;
	Sat, 21 Dec 2024 04:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/SAQ866Iuwg43VSP1tuKke
	k5l1mj0sd2fx/CEkXcpnU=; b=BisA7/zHZQ5h3SDNlRdxV9+DbR9IjDXUjRZium
	wP1q70qJqAXRzSWSMuqzDCvFM23RZ8YUnFzcE7dGf7Z4aICGSsTLoc8o/nv8Zfh0
	eMqagIFIRZEEOuOgB0FZGVkDHnjI8/TjUJgWqAmNebUiV3gYL1zPWyp6yCl4M716
	xjvJlPx3F6z3Z5cCbb581xT0q05hm8AaLc37gNkksyO7tjk2spbF6TetY1B9d4Dt
	EO6HH37F9IGiypHV36viqQEa5P2kWHskhoStlALgAkllICFfUKkH7nJUm6egaf2i
	rZxcENRMAUuOJZszBKBK7b8asT6gks9uB84+2tqhRUaX+z+Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nmmqg9k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:30:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BL4UonZ007957
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 04:30:50 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 20:30:49 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH 00/14] wifi: ath12k: Enable monitor ring for updating station dump in QCN9274
Date: Sat, 21 Dec 2024 10:00:00 +0530
Message-ID: <20241221043014.1252841-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nNYZ1lmTL--dhcTml1O3DpEWrufB9C7E
X-Proofpoint-ORIG-GUID: nNYZ1lmTL--dhcTml1O3DpEWrufB9C7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=554 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412210035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_203053_696958_6367E294 
X-CRM114-Status: UNSURE (   8.79  )
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

This series enables the monitor related rings for the QCN9274 and
configures filters to collect statistics such as RSSI, which are
required for updating the station dump. Also, this series does
not impact WCN7850.

Depends-On:
	[PATCH 0/3] wifi: ath12k: Refactor monitor Rx handler
	https://lore.kernel.org/all/20241219001006.1036495-1-quic_periyasa@quicinc.com/

P Praneesh (14):
  wifi: ath12k: Add HTT source ring ID for monitor rings
  wifi: ath12k: Enable filter config for monitor destination ring
  wifi: ath12k: Avoid multiple times configuring monitor filter
  wifi: ath12k: Avoid code duplication in monitor ring processing
  wifi: ath12k: Restructure the code for monitor ring processing
  wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process
  wifi: ath12k: Fix end offset bit definition in monitor ring descriptor
  wifi: ath12k: Add drop descriptor handling for monitor ring
  wifi: ath12k: Handle end reason for the monitor destination ring
  wifi: ath12k: Optimize NAPI budget by adjusting PPDU processing
  wifi: ath12k: Handle PPDU spread across multiple buffers
  wifi: ath12k: Avoid memory leak while enabling statistics
  wifi: ath12k: Handle monitor drop TLVs scenario
  wifi: ath12k: Enable monitor ring mask for QCN9274

 drivers/net/wireless/ath/ath12k/core.h     |   1 +
 drivers/net/wireless/ath/ath12k/dp.h       |  55 +++-
 drivers/net/wireless/ath/ath12k/dp_mon.c   | 348 ++++++++-------------
 drivers/net/wireless/ath/ath12k/dp_mon.h   |   6 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c    |  79 ++++-
 drivers/net/wireless/ath/ath12k/hal_desc.h |   5 +-
 drivers/net/wireless/ath/ath12k/hal_rx.h   |   4 +
 drivers/net/wireless/ath/ath12k/hw.c       |   8 +-
 drivers/net/wireless/ath/ath12k/mac.c      |  55 ++--
 9 files changed, 282 insertions(+), 279 deletions(-)


base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
prerequisite-patch-id: 5f5721a4c9f1c26659fd8f09a8eda648d8ecccf5
prerequisite-patch-id: 59cc2121e734e4e1e7e461a3ae24f3f1f9d0fa02
prerequisite-patch-id: fdc512e43ea7cb6c097ba4c0d9c661a74c0c2a6f
-- 
2.34.1


