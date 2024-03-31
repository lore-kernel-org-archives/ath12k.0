Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219ACD1284
	for <ath12k@archiver.kernel.org>; Sun, 31 Mar 2024 18:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DdIGN8RBrw3P+/YncVg8FhGTkyaHmrwoXoL6ETJBzbk=; b=dEfGzJTHV0idT2dmJaS8RK3LRX
	uC0vbii0zQNpYAwjz4B6O82NYAku9Za7jJvyPURAlWZJ1ghI6YoKj1+iMZbEVSNzX325bxiMHUTxB
	66XPzhHAT9Oo+y7fJk1HPKAlDSBFGJM+lZ08GLpmv1iJDHFRa3S4bLWU1/zYl9S4eguByz/MsQUwq
	ft8e4BNzacXNCP4zZL8K0+Ee26mQmlKR1Wi4bWyyB+mCq+/1qkTSfJYyZu5eVkU6Mzw/MTUkhR7m3
	mmzYJe+BLiahFKU9gSSAaXBGvsbdgY6+rXA/Z4JofrGj1VepFtMpYrERfrb9nT9kV7iijLsxzgTMZ
	2da43n5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqzzE-0000000660x-3Pll
	for ath12k@archiver.kernel.org;
	Sun, 31 Mar 2024 18:32:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqzzB-000000065zl-3g1O
	for ath12k@lists.infradead.org;
	Sun, 31 Mar 2024 18:32:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42VHTltB021179;
	Sun, 31 Mar 2024 18:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=DdIGN8R
	Brw3P+/YncVg8FhGTkyaHmrwoXoL6ETJBzbk=; b=L5/MLGRzsGB95DheSkPwaXP
	PZEDiumXO4jixP3MZxIGgBJS5YzCnqno8z0SPq7yVHAGtq1tTpC3J8d2aiu5WWRD
	PNE5Kprmbc83j/gpOJX59KSys+P6h4RZtK7p35WHdv6VA7pxXvCNX3i4EEz1QDIY
	AoAdOK3zHhLg1yy7nN6w9yWxacEqBNHgTq5+f9j1iDz1nFGRQIv/ki8NezOoLhEx
	GLQ0E0YsDBAVzvl6mndvoX/DHE0PZHTXVi3hIgrDVfm3DdlxTCZHQZQOU1ilUCm/
	F7X6CWk6cj4rYvf/pCcyf5dsd+9xrD6o37VCBxIRaxQalyzrUYm3qMQ2H6vrc0Q=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x6ab3tecw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 18:32:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42VIWncA022043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 18:32:49 GMT
Received: from hu-kathirve-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 31 Mar 2024 11:32:47 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: fix BSS chan info request WMI command
Date: Mon, 1 Apr 2024 00:02:30 +0530
Message-ID: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lnIF6sKInrh2LrWcliHDYoJZmI0bjYCc
X-Proofpoint-GUID: lnIF6sKInrh2LrWcliHDYoJZmI0bjYCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-31_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=618 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403310142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_113254_062263_C262510F 
X-CRM114-Status: UNSURE (   8.25  )
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

This series includes the fix for the BSS channel information WMI
command and ensures matching structure between ath12k
wmi_pdev_bss_chan_info_event and its equivalent firmware
structure definition.

P Praneesh (2):
  wifi: ath12k: fix BSS chan info request WMI command
  wifi: ath12k: match WMI BSS chan info structure with firmware
    definition
---
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 drivers/net/wireless/ath/ath12k/wmi.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)


base-commit: 8027a466a77a288eccd2d11868f504e24231f3b7
-- 
2.34.1


