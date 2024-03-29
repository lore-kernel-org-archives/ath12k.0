Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E4CCD1283
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E8oQRDGuEcy6xgDLO33ZcwMy8LosrJKiqrkozrYurEs=; b=s9wyyzNkcl5wsHgbY6u4+sTdRj
	4Pp3eiwZEusyEs0T8TA5JLnUnNdDE3Px3D64CvJrW0XjS/0SlI8CuzCQzMNUSOB7UeaZQa3Bt4OND
	GcUEHVfj1kB6YixnqTwWo8ObjIAH9ZF4V7AEIMEOKguC5O4j923re8G2uf/dlKNsjhGMcQ/EsxjF3
	6+tcPWiPZ1vgcrML0/9uvC1ZD+I7eR0ZDq+19x3t0bhps3xEuFOOetUe9469Y9+LkamPVMCfvZj+v
	rxDZtpkG2n/5yFWbRww36USHey0I3EiHhELeAHu9i96Sn4e9fjnvF1FtXsk44TzhBHtD4/jJw3oEs
	Y8bwREDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGCn-00000001Vu4-4Bvm
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 17:39:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGCl-00000001Vte-3U7s
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 17:39:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42TFrICk000705;
	Fri, 29 Mar 2024 17:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=E8oQRDGuEcy6xgDLO33ZcwMy8LosrJKiqrkozrYurEs=; b=Hy
	xsCn0CYXFrBwTu4K63LNZ4KmJN1CFi4h/dbyA9fA8ohp8RpF6DrQcte65j9B8jSg
	NTmQQjZdoOariSDg//MKi9HNDpSJH7/dA8vIdKOnHYXylOZZVQxCHRMqxr4XOfwb
	G2d2SxzLYDuXSt//IJNRFUbLq7HF+IXHVOHfLJl3b22+BIOxeqgibcgBVRVD/Jb4
	hqc/FGCUSeOhPT4CH4HG9LNQBYY1gR6lNPoRjfoq0skyKDI/bVDfVUUJkmrqHbAo
	T8uR0qW9ZhEjFEI6BbHMyUeL34nUiJd5Yzo1OEnRmyvnWI+L/YqnE0pc2jugtnmr
	1C9ztAqqsvLgY4A/la6g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5dkyk1vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:39:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42THdb8V007399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:39:37 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 10:39:36 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH v2 0/6] bug fixes and enhancements to 6 GHz band support
Date: Fri, 29 Mar 2024 10:39:20 -0700
Message-ID: <20240329173926.17741-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: snszDSUWHmk6YveMmSHbmbsjN30zHoQo
X-Proofpoint-GUID: snszDSUWHmk6YveMmSHbmbsjN30zHoQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_103952_033504_6DB22480 
X-CRM114-Status: UNSURE (   9.42  )
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
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

changes in v2:
 - Disable smps for WCN7850 after review comment from Boachen
 - Added Tested-on tag for WCN7850

Pradeep Kumar Chitrapu (6):
  wifi: ath12k: add channel 2 into 6 GHz channel list
  wifi: ath12k: Correct 6 GHz frequency value in rx status
  wifi: ath12k: fix survey dump collection in 6 GHz
  wifi: ath12k: add 6 GHz params in peer assoc command
  wifi: ath12k: refactor smps configuration
  wifi: ath12k: support SMPS configuration for 6 GHz

 drivers/net/wireless/ath/ath12k/core.h  |   2 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c |   9 +-
 drivers/net/wireless/ath/ath12k/hw.c    |   3 +
 drivers/net/wireless/ath/ath12k/hw.h    |   1 +
 drivers/net/wireless/ath/ath12k/mac.c   | 116 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.c   |  10 +-
 6 files changed, 116 insertions(+), 25 deletions(-)


base-commit: fe7e1b830cf3c0272aa4eaf367c4c7b29c169c3d
-- 
2.17.1


