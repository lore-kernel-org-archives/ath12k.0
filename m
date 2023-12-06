Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B528C4167B
	for <ath12k@archiver.kernel.org>; Wed,  6 Dec 2023 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kWQ9vh5Oolddv24J/mlNbuH3YsWFHczIn/9y2YYavDc=; b=KAptRAdaCDxBSW6Cgvri3uA9HK
	njRwSP45s6lLSkV8GsuGUHaLQ8i/SWOueACAT7wGRCgGmmqKEvgoaO7pmrTC3WxVbViQQ2TFazOVY
	2+q+AQwEy9bmuPzdHyGY8nItsqWhAWt6cxqL5CcsrLFkBfa1jQMcbRHtDXBhql62Z7p/m8ROJal1/
	JSgLjiaHYIH13Nlp6H81I2Qf3Je1l8T8TIxcrD5rdaB2EPmNwxqp8iYxb19ZFrIvQoUQoukSZkx7t
	UX/CSWelYqmSfGsCRoDexFPGDBisaDNyrE6y2BWbAjgCHC92wGRSS+U8bTf9O+7Iy6x9I7C0TwzXP
	PGAH208Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAiuz-008zZw-06
	for ath12k@archiver.kernel.org;
	Wed, 06 Dec 2023 03:49:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAiuu-008zYh-1C
	for ath12k@lists.infradead.org;
	Wed, 06 Dec 2023 03:49:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B60r3Ma029407;
	Wed, 6 Dec 2023 03:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=kWQ9vh5Oolddv24J/mlNbuH3YsWFHczIn/9y2YYavDc=;
 b=bXhaAgTSDSsDFM4/Y0GGk86FALX4EML9jrggRo3wgE4qME2d+83ABNYQVaC3nQk218T5
 SRHZ4iw3Q5EHMx07NX0dH65QOfzQL0ViAReW56g3AsLZHW1aAcpynh5EkjG0QI4fS3MJ
 LyBXCZ0Oy0XT4TYI/TyTnhGCdOwYmM+6e78ocN53lsw/6lM/B99MZOzvo3a9vj7US3Kw
 Twf1n6iwdLEjVBImdPLjSbqDZNUUKZKo3YRz8BjecR58lrNoR9E5OilI5WGhITTDOmHv
 fZztgzu8/9/rpfRG+WF4K7zT8jkebDXnau/oM8pFpc7yr/mrg6fjA7WM8hvBudkm3qH1 Xw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utdadre7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 03:49:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B63neh3024939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 03:49:41 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 5 Dec 2023 19:49:39 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: Refactor MAC alloc/destroy/un/register helper functions
Date: Wed, 6 Dec 2023 09:19:16 +0530
Message-ID: <20231206034920.1037449-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T0kaEHC1QG4IDEAf-Z0u-t0IR4rMalUo
X-Proofpoint-ORIG-GUID: T0kaEHC1QG4IDEAf-Z0u-t0IR4rMalUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=463 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312060030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_194944_561162_2B4CCC93 
X-CRM114-Status: GOOD (  12.63  )
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

Currently, the driver does not support single/multi link operation in 11be
mode. Also, each link/radio gets registered as a separate wiphy through
mac80211. In order to support multi link operation (MLO), the current
separate wiphy registration approach brings a lot of complexity in cfg80211
and mac80211, such as synchronization across the multiple wiphy/hw.
Determining the compatibility of the hw across multiple wiphy/hw is another
challenge for userspace. To reduce these complexities in
userspace/cfg80211/mac80211, need to move from the multi wiphy model to a
single wiphy model. To support the single wiphy registration, we have to
decouple the wiphy/mac80211 hw data from the link/radio (ar) structure. So
refactor the MAC helper functions.

			Current Multi wiphy Model

+---------------+            +---------------+            +-------------+
|  Mac80211 hw  |            | Mac80211 hw   |            |Mac80211 hw  |
|  private data |            | private data  |            |private data |
|               |            |               |            |             |
|               |            |               |            |             |
|               |            |               |            |             |
|   ar (2GHz)   |            |   ar (5GHz)   |            |  ar (6GHz)  |
|               |            |               |            |             |
|               |            |               |            |             |
|               |            |               |            |             |
+---------------+            +---------------+            +-------------+




			  Single wiphy Model

                           +--------------+
                           | Mac80211 hw  |
                           | private data |
                           |              |
                           |ath12k hw (ah)|
                           | +----------+ |
                           | |ar (2GHz) | |
                           | +----------+ |
                           | |          | |
                           | |ar (5GHz) | |
                           | +----------+ |
                           | |          | |
                           | |ar (6GHz) | |
                           | |          | |
                           | +----------+ |
                           +--------------+

Karthikeyan Periyasamy (4):
  wifi: ath12k: Refactor the DP pdev pre alloc call sequence
  wifi: ath12k: Refactor the MAC allocation and destroy
  wifi: ath12k: Refactor MAC setup channel helper function
  wifi: ath12k: Refactor MAC un/register helper function

 drivers/net/wireless/ath/ath12k/core.c |  96 +++++++++--
 drivers/net/wireless/ath/ath12k/mac.c  | 216 +++++++++++--------------
 drivers/net/wireless/ath/ath12k/mac.h  |   8 +-
 3 files changed, 184 insertions(+), 136 deletions(-)


base-commit: 22d737065b8c4fbb29a3a818adcf88004ea7d5bb
-- 
2.34.1


