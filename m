Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06465E77188
	for <ath12k@archiver.kernel.org>; Tue, 24 Dec 2024 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pZt4+FN6WJwRQLIdr0HirIDOXlHPflQ3XebmXHdBgUM=; b=3kcTazV9btZK/7WfeBnjCxncz5
	x1t8Iw6w4WVVFKOB4mEk2fBt8wtNAYPc14nXmlA5y0DFgmHG7nkf0yUZ763cF9KzfQ9VSYVDoDvcj
	Cm7RIJf9ky+zt5XNBx/6J3qg8SCcIw+oKjidSy4O9BZX3BIpJsVSfJLf+RYSc6I9ukguQiJDVc9UP
	qOk1goEPJzIf88MjsRVAhCJ5AqFTqru3U5v5VLzbsPJor6ZiBhjb0FlXJEMI1I7qNwUft0lVlUxMl
	7OZxI9gPUr8RvznEvCJoIYzGYwbA8bdzJLZKzXlFi+x47jLEma3c/eW+S9eQavaIKe9LpQCo/K1XW
	KodjqozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ61Q-0000000C9X3-3Bro
	for ath12k@archiver.kernel.org;
	Tue, 24 Dec 2024 14:36:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ61O-0000000C9WP-1gBt
	for ath12k@lists.infradead.org;
	Tue, 24 Dec 2024 14:36:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BOAIJ0C028368;
	Tue, 24 Dec 2024 14:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pZt4+FN6WJwRQLIdr0HirI
	DOXlHPflQ3XebmXHdBgUM=; b=Zjt9AckVArz84CEvakV8QNLq5gKtLwQRBdAU8v
	GwoZOOgpFaqdKmHmPijJbcsFCir1OWqVM+DCjwl7s0x7oso9oC57WtWDTqB1QTWy
	KCCRKbpOt1yo4LAuSIkJi0BMJ9DjEibk/Swi7FyGB0VCLZdr/bGs+rdILLzZsGJZ
	pU/xyGAtJhXTFiYzAHeLIuCX7QnZzal+jL9f9e6kDHKe4jlBVSp6Fibp0PiAzCjo
	dLLQFltXOWeBGs6XWuAJA4M3luK4jhe+fBj1hQshiPvsizk8X0Zo+WR7++yUn1cI
	O+sNTRxVOVGTAhY4z+rfvasUJJpqGIZ5VwZQmZmr427/59sA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qjqvkjp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 14:36:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BOEaSKY015182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 14:36:28 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Dec 2024 06:36:26 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 0/3] wifi: ath12k: Refactor monitor Rx handler
Date: Tue, 24 Dec 2024 20:06:10 +0530
Message-ID: <20241224143613.164921-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cWyxDFCURiO_QaKdAPer3Mh1JmWKWmoq
X-Proofpoint-GUID: cWyxDFCURiO_QaKdAPer3Mh1JmWKWmoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=548 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_063630_561231_BD1A8DFC 
X-CRM114-Status: UNSURE (   8.38  )
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

Currently, monitor support is not added. However, in the future, the
monitor will be enabled. Therefore, refactor the monitor handler, which
help to add monitor support in the future.

v3:
 - Remove the Acked-by tag
v2:
 wifi: ath12k: Refactor Rx status TLV parsing procedure argument
  - Updated more details in the commit message

Karthikeyan Periyasamy (3):
  wifi: ath12k: Refactor the monitor Rx parser handler argument
  wifi: ath12k: Refactor the monitor Tx/RX handler procedure arguments
  wifi: ath12k: Refactor Rx status TLV parsing procedure argument

 drivers/net/wireless/ath/ath12k/dp_mon.c | 60 ++++++++++++------------
 drivers/net/wireless/ath/ath12k/dp_mon.h |  7 ++-
 2 files changed, 33 insertions(+), 34 deletions(-)


base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
-- 
2.34.1


