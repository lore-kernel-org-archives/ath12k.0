Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65467E77198
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 02:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7422LiGs/2ri8COxM9gw5CJrFel6qJL6pq8nSBXz4a0=; b=mw5JGaWNWaCI6QnBWp3ILTMUSD
	icYeCtgnc0Po3Sr5/aPHAS/KFCaz2EEZNJBVO71qcS+74h4pr7YBpBq4YfmaBULk8tps3kY62r908
	4C/ERJZ578jmIXt4nrlxfpWuO/Nq5/sR2a1uO4w1XLqW3HmlwzY/YvR4JzR9mFuMsYGd0R9bMSDqq
	jlZPJCDKzHCF03v1UsbSbN/t0k4UJ+Q1I+LHmStdq1HH/yixpjd0SxuvWvuEL9UEZf5slYuYP7Fao
	8cRZlzgQAR1fatlNarVgrq8at5J8T2SHBtJYvdmeKhhJqbAkVuJx7bzF620t4L6+b8cbykhEUx3Lf
	2YXFjKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUzm0-00000003GA1-0BNx
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 02:56:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUzlv-00000003G8X-0VD2
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 02:56:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506E4XhB018151;
	Tue, 7 Jan 2025 02:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7422LiGs/2ri8COxM9gw5C
	JrFel6qJL6pq8nSBXz4a0=; b=kVgPL0pkjkdzdJKbDfTsrZ5JRM3JycDsMlUjvD
	R4r9apeC0PyPhlXyQk9hgEpBePDG/EVXKEgIWX6DcXn30AwT5oA5jn6iQTGOx3/v
	mdvAIms5OQW06BiUhcZCjXKxSJb0LtnX8p5Gla0kzJMx0w2ZTYuHmiQ5KbWf1BOe
	IKtRFJTTAvdEqUc8X4yviqSYjUJIHr4HdzIkIROGGLhHBNwnhHiSUU/pzMtdUbxD
	B05pMoaecM0sv+qSdRxu2MnU37NmYOzwNlHCblxMGQeCWHEqW6DVdrDNLNMp1ZPp
	KX/y/POd2zzSeweaBvuZgp/3KB4GJ3M1dELMxH5w9QIGfnxg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440gmc1hm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 02:56:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5072uiCi018071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 02:56:44 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 6 Jan 2025 18:56:43 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 0/3] wifi: ath12k: monitor mode cleanup and state handling
Date: Tue, 7 Jan 2025 10:56:18 +0800
Message-ID: <20250107025621.1907-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8xjrnX3weohD4csZ5w3y5aAnE6eGMkv8
X-Proofpoint-ORIG-GUID: 8xjrnX3weohD4csZ5w3y5aAnE6eGMkv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=621 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_185647_279072_0071E2C0 
X-CRM114-Status: UNSURE (   8.51  )
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

This patch-set do some cleanup and handle state variables correctly for
monitor mode.

Note: The quantity of this patch set was 11 in the previous version. 8
of them were merged:
https://patchwork.kernel.org/project/linux-wireless/cover/20241022110831.974-1-quic_kangyang@quicinc.com/

v6: update copyright for each patch.
v5: rebase on tag: ath/main(ath-202412191756).
v4: rebase on tag: ath/main(ath-202410161539).
v3: rebase on tag: ath/main(ath-202410111606).
v2: rebase on tag: ath-202410072115.

Kang Yang (3):
  wifi: ath12k: optimize storage size for struct ath12k
  wifi: ath12k: properly handling the state variables of monitor mode
  wifi: ath12k: delete mon reap timer

 drivers/net/wireless/ath/ath12k/core.c |  7 +++++-
 drivers/net/wireless/ath/ath12k/core.h | 27 +++++++++++------------
 drivers/net/wireless/ath/ath12k/dp.c   | 30 +-------------------------
 drivers/net/wireless/ath/ath12k/mac.c  | 13 ++++++++++-
 4 files changed, 32 insertions(+), 45 deletions(-)


base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
-- 
2.34.1


