Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6B7C77B7C
	for <ath12k@archiver.kernel.org>; Thu, 13 Apr 2023 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SAJ1bcSmPcCybVw3flP4/JWB1gHo1mTVDsXVaZKCCnA=; b=Rt/+QR3Zc8bvs+
	XXYiohTjBtJ78bxP8w1iKGEJLgPDq5FJV8GlSGaLM5260urc3OGkKf0lQTEWy9389tI3xQybgwoBB
	RKzNRfkgtMx8qr5EcP4McMpxuxT4gOKBtJNSIQ2hLxFp7gLYyPVU7rIyoDNlB+3pbDUnwJLLbPi9f
	aE+6D0UUxUDlxOXGS9/Zh5WEgVE0n/TC8PpBklnDMgJXknEglUmKVBnqDw+1vnY0hLeQr2yf+AIhM
	mpKd4UKVDRjubhpbmfJk0yVI1OWZgIFrFr6fUkW+50+AbkvrsNMjqjXir35/1mAWCTrdeqN2mIRSD
	janDm7VQ3+7Ih0t0XRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4rb-007DuH-08
	for ath12k@archiver.kernel.org;
	Thu, 13 Apr 2023 21:52:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4rU-007Don-2d
	for ath12k@lists.infradead.org;
	Thu, 13 Apr 2023 21:52:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DLonWl019481;
	Thu, 13 Apr 2023 21:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=JracBgEmfmTbSAt2eLnphphD6TvUF4us3O3mQkYErP4=;
 b=MnETVmIpMXawDEEKbZ3AVP5rkuS3i8p3yh89QEmsib9CeeJNjfExlagwqHyrkeW3MYaC
 VjFfqJcOntWBdfzlVq1CGgEqYr4muwJ4CmAGr5mz4zZbwh/il4+JsBD7fWN360Oti2Ao
 UxGhYBUJkWE+dJkwLVjFhrd4/YSPCkjpwhXAqnYO04CBNvw4QzXGyHBdS1JN5Yask7wD
 1uXNY6mACrOw5mbCCEfJBykVFB/ZL8r5gqXUur7La8NushX2srXQiwZ7ErKuwT6c6p4/
 5cfJfwh0o3JbfmaZC2OI234vP38MOyzIm2j1+8BTZuHsWsUrYb1dJhRN+zUO8kLyTX9Y Dg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3px5pkth5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 21:52:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33DLq81W006706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 21:52:08 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 13 Apr 2023 14:52:07 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH v3 00/11] wifi: ath12k: (v3) EHT support
Date: Thu, 13 Apr 2023 14:51:45 -0700
Message-ID: <20230413215156.2649-1-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lEw8M5iVf7ApQUXVEgXT8Cpj_E97UeLM
X-Proofpoint-GUID: lEw8M5iVf7ApQUXVEgXT8Cpj_E97UeLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_16,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304130194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_145212_999965_54641391 
X-CRM114-Status: GOOD (  12.46  )
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

Add driver support to bring AP up in EHT mode, configure a preamble
puncturing bitmap and associate with an EHT client.

v3: Modified patches 6 and 9 to fix some issues,
changelog included in the respective patches.
v2: This version modifies only few commit descriptions,
changelog included in the respective patches.

Following list gives the details for each patch.
1-4: Propagation of EHT capabilities from target to userspace.
Patches 1, 2 refactor the existing code to make EHT additions easier.
5: Addition of EHT phy modes.
6-9: EHT related additions in peer association.
10: Process the new WMI service ready ext2 event.
11: Preamble puncturing support.

Aloka Dixit (9):
  wifi: ath12k: rename HE capabilities setup/copy functions
  wifi: ath12k: move HE capabilities processing to a new function
  wifi: ath12k: process EHT capabilities
  wifi: ath12k: propagate EHT capabilities to userspace
  wifi: ath12k: prepare EHT peer assoc parameters
  wifi: ath12k: add WMI support for EHT peer
  wifi: ath12k: peer assoc for 320 MHz
  wifi: ath12k: parse WMI service ready ext2 event
  wifi: ath12k: configure puncturing bitmap

Muna Sinada (1):
  wifi: ath12k: add EHT PHY modes

Pradeep Kumar Chitrapu (1):
  wifi: ath12k: add MLO header in peer association

 drivers/net/wireless/ath/ath12k/core.h |   9 +
 drivers/net/wireless/ath/ath12k/mac.c  | 555 ++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h  |   2 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 218 +++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h  | 116 +++++-
 5 files changed, 790 insertions(+), 110 deletions(-)


base-commit: 177555b57ca0a0519c12a2bdb64309ddbb363e11
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
