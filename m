Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC6EC54E58
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7kXL+a40eAx0IhBFrh2WRCAOiRuFpj3lSiUYKEdKz8=; b=pWXL2Gc909NqX79jFMKs+zf/sR
	XUw/WQ2Atc/hmWkkvKtx67WE1xth5SF/g6zFo7T5XYevyQ+jSbYjQeqKopdfyS8f6AuVz617HVPyG
	U3sjskTOnqaQhhCk9+P0knlJrFSD5LoMBizePyTYnb9aSA7yKedWxWF9X6TUzUPtD8t6fFtlxqTEK
	c+2s/DYKvB1bIGpJEXqE+Laqw+KSC1k6tw23zC6XfQX4yk50Aq7FCCRXj2ufI68Ykcs10TS6Qj8gr
	YL4att+qfdSkiRkrFFC0BLAhzwyIhbTV74jg4RKxBqjL/nqM2E7UQiMO545lUthsNGGiVk2L0fQ5B
	KTy/baGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzVE-00000000Rej-0Zxl
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 17:13:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzVB-00000000ReA-1tsW
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 17:13:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KEjcfX004878;
	Wed, 20 Mar 2024 17:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=K7kXL+a40eAx0IhBFrh2
	WRCAOiRuFpj3lSiUYKEdKz8=; b=SOzVXRsXQUVzu+9K+ILKFIZQSJqYk3W4VM0I
	kHXtdurNgbM0DKY9ywVNSe7GhgV1ukVqBDg6cy0hCRw6KpROM69GXTOeyWtcoGYZ
	HyDrZfkgWbCxRCn6LbaVW8ss8vPNcQj4hpkHLwX1zbg535GePEA7bzLxz1lCn9bY
	sPm5qwPzg0h2n8eHR2wyAfDUG39K5S+M2cmGqq4mzoaDpEE9ALUDjP/8PPq5eBgk
	VTYeBtZY3nU64XYrS+VktYOtpDnBkd4+Gg0WCmGSgwfvhQ6cZX20KAv0t3TxCzo0
	lLxhJom5R9EMvLx92zEZuBo7fLUIcT7sqlG2u8AI5EusPZ8Cew==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wypxq1u1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 17:13:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42KHDFB2028158;
	Wed, 20 Mar 2024 17:13:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ww4gm7nu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 17:13:15 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42KHDFjQ028152;
	Wed, 20 Mar 2024 17:13:15 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42KHDFGB028151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 17:13:15 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id A3E2341111; Wed, 20 Mar 2024 22:43:14 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Add initial debugfs support in ath12k
Date: Wed, 20 Mar 2024 22:43:03 +0530
Message-Id: <20240320171305.655288-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hY1ttI-sIiqqKk71V8lfj57DYvcLQ9ET
X-Proofpoint-GUID: hY1ttI-sIiqqKk71V8lfj57DYvcLQ9ET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 mlxlogscore=793 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403140001 definitions=main-2403200138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_101321_722408_5D3C495A 
X-CRM114-Status: GOOD (  10.39  )
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

The initial debugfs infra support in ath12k driver and create the
ath12k debugfs and soc-specific directories in /sys/kernel/debug/

Add support to simulate RADAR interference through debugfs 

ath12k
`-- pci-0000:06:00.0
    |-- mac0
        `-- dfs_simulate_radar

Ramasamy Kaliappan (1):
  wifi: ath12k: Add initial debugfs support in ath12k

Ramya Gnanasekar (1):
  wifi: ath12k: Add radar simulation debugfs support

 drivers/net/wireless/ath/ath12k/Kconfig   |  9 +++
 drivers/net/wireless/ath/ath12k/Makefile  |  1 +
 drivers/net/wireless/ath/ath12k/core.c    |  5 ++
 drivers/net/wireless/ath/ath12k/core.h    | 10 +++
 drivers/net/wireless/ath/ath12k/debugfs.c | 89 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/debugfs.h | 30 ++++++++
 drivers/net/wireless/ath/ath12k/mac.c     |  3 +
 7 files changed, 147 insertions(+)
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs.c
 create mode 100644 drivers/net/wireless/ath/ath12k/debugfs.h

-- 
2.17.1

