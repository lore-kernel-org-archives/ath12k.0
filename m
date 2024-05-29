Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37953C25B7E
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 04:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yHgqGoN25zrVNCa+C/gtyFLsCc5jVlsAgHO0VVRQisQ=; b=URi9HfEI1HyKvpdNpPPPXk9DiY
	4lHqcAfubWm+K/fVL1LQFTwR9I8d+gJ+P5cc/7Dselc0J/ui4WSeEstNDmpmDkpjktcOXuemWYIbB
	vK10k2JRXNT9jmHMKUo2nIFizyem04v+rBprpkrUJayvPQY14AFcpF2ueFi+xH8PDe20wijsScV9z
	y/pdK1282aizj9hJbtr3tXwUyR6RIbYQfh4J//2x5zFwRZKWn07THLz/1W8zDZAtjjN6CVy05mxYt
	MA8neAIwGLEwiGqAPcTCRxvPeIvWU9sd8t2pmV9JHsLZZrcoaA0efeIHN3dWmk2kkYdAqYBKXOXFa
	K9NrVAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCAy5-00000002mnW-3jbz
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 04:31:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCAy0-00000002mlw-0yi3
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 04:31:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SMkTO2031447;
	Wed, 29 May 2024 04:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yHgqGoN25zrVNCa+C/gtyF
	LsCc5jVlsAgHO0VVRQisQ=; b=Eh6FXN+Fzz0D38VxDexD0LAJ8qehes7kFlX2nv
	e33yH0yB+MFWwVjEbGHwtLQbb14pjH1xuWcEjrEqCBISLcFU3BcgD9PV165dj4r1
	LUFm/DKp94akKbipij0IDs3L5tNM+fOJrZZB0ZPfpFv/YseUpBC1xj/iVvQmznoX
	FHxHb/5AsHu4EeExBKadR82Nb0Rt4KJ5k8GkmSvf7q5HQyKDOAsjPTd0ck+L6gKA
	4nHvZfdT3fay0aoMLm3G5j0HNe1QvxpP9wtgppcSqePiA5CCmwL8bgf3pdw3sAMg
	Ipy/8zmW8QRdXt8kr9p8TtuEnWBAJkHyU3uLvQc1eGOmm+Lg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0x7yxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:31:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44T4V7Lb024239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:31:07 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 21:31:04 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: fixes for per pdev debugfs
Date: Wed, 29 May 2024 10:00:40 +0530
Message-ID: <20240529043043.2488031-1-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D2L5rd_UpzSu7gNyb2Zoq9cBS2J0gRE2
X-Proofpoint-ORIG-GUID: D2L5rd_UpzSu7gNyb2Zoq9cBS2J0gRE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=531 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405290025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_213112_425141_FA65A95E 
X-CRM114-Status: UNSURE (   8.41  )
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

This series aims to fix a few minor issues in per pdev debugfs handling.
More details in each patch.

Aditya Kumar Singh (3):
  wifi: ath12k: fix per pdev debugfs registration
  wifi: ath12k: unregister per pdev debugfs
  wifi: ath12k: handle symlink cleanup for per pdev debugfs dentry
---
 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 16 +++++++++++++++-
 drivers/net/wireless/ath/ath12k/debugfs.h |  6 +++++-
 drivers/net/wireless/ath/ath12k/mac.c     | 11 ++++++++---
 4 files changed, 29 insertions(+), 5 deletions(-)


base-commit: 2580be9ee6f5d97d6763b5d4ae4f9c0383fdf130
-- 
2.34.1


