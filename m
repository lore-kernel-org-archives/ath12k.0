Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D4DC0219C
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8RfoObTtv22jTxsPrb+FzOHyCOeZeKvNt6O/uYbWHa4=; b=gWn1d/Mz/Mtvz0qnMjTc1fICUv
	shL8/a6WUmLM3uVNBuTtb3Ec7A0NulyC3dbnW5hYNOjMl5FXY+BmNCXM1Se8Dj2vVABC1pyQ/CxiY
	HfIUkFaIBho1UbPA8NsTPKrwHfLKqGszGQAsMlHRyXflON57w5QRezS/sKgcsdzCfHhSQg7OuJCPs
	npsVDSglFIpCTDOq3IQrqigS4gNVVWY3myBeCILiJMFwmfeFi4WlN/UlYrTh62ThJUdN022dst1Xh
	m8jVC7gzphQMDKu8QSx9XMR5FPU2ZHRjV0eCSEarJ1kRos9YojyNCxlcEYSZsU1wxdPY2joyjC4nz
	c6ZnJLAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRr3-0000000AQwe-2ebC
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 17:09:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRW2-0000000ALln-3pDK
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 16:47:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517FSt5o007278;
	Fri, 7 Feb 2025 16:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=8RfoObTtv22jTxsPrb+FzOHyCOeZeKvNt6O/uYbWHa4=; b=UB
	Pq2lX1nJc7JM4jbOTmpP5PCDd0z8pSf9xcY13/Twnb8gGiJah3Wlg64dbdSD7IMi
	j1X9CJewCinisKCfFkMtuJGFxeMM2GuvHq8R8AwG9LVB0AWnyH8S4d8oV6wy7VXH
	Ei1pBbnkZvClBw559OiLB/JGHWjOrjZ0+H5wWVqYbMkiApT4ExWdMwgBzM/IU1qD
	BqubiJUe11Q9qf5PahqOP37x8NdbVXbh4fyVZ5xOddn96IiJwCMergbI26cNdNfW
	Q8PUt3ZWKCGkkTWBirBbFXy/w8Qugh8xNZp+2n0Ht4cMM+XQh02hyojRW3pUv2NY
	33LqVMumKYGgF9i8L7Yw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nmuqr6n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 16:47:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517Glds9001346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 16:47:39 GMT
Received: from hu-nithp-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 08:47:37 -0800
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nithyanantham Paramasivam
	<quic_nithp@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: Enable REO queue lookup table on QCN9274
Date: Fri, 7 Feb 2025 22:17:00 +0530
Message-ID: <20250207164703.3818135-1-quic_nithp@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FkZHr5SyIlnLmjF0KisvZQKnd7so-VEp
X-Proofpoint-GUID: FkZHr5SyIlnLmjF0KisvZQKnd7so-VEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=760 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_084743_067965_CB4A69ED 
X-CRM114-Status: GOOD (  10.92  )
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

Instead of storing the REO queue address inside peer entries, REO
hardware module prefers them to be stored in SRAM which could be
directly accessed by REO using peer_ID/TID based Lookup table(LUT)
mechanism. This feature is expected to improve stability by reduced
interaction between host and firmware during both MLO and non-MLO
operations.This feature is enabled only for the QCN9274, so it does
not impact the WCN7850.

v9:
- Rebased to latest TOT
- refactored the common code to function
- reolut size variable added
- moved ab to front

v8:
- Addressed baochen comments
- For this, added changes for paddr/vaddr alignment

v7:
- updated copyrights
- removed memset

v6:
- commit subject change patch (1/3)
- tested latest FW

v5:
- Rebased to latest TOT
- updated the changes for ml peers

v4:
- Changed Read Address Name
- reo lut support check added for qref service flag
- Instead of [PATCH V4 0/3], had [PATCH V4 0/2]

v3:
- Added new patchset(patch-3) to enable the reo lut
- Edited patch names

v2:
- Rebased on ToT
- Addressed review comments

Balamurugan S (1):
  wifi: ath12k: Add support to clear qdesc array in REO cache

Nithyanantham Paramasivam (1):
  wifi: ath12k: Enable REO queue lookup table feature on QCN9274

Sriram R (1):
  wifi: ath12k: Fix the enabling of REO queue lookup table feature

 drivers/net/wireless/ath/ath12k/dp.c     | 79 ++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h     |  7 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 11 +++-
 drivers/net/wireless/ath/ath12k/hal.h    | 10 ++-
 drivers/net/wireless/ath/ath12k/hal_rx.c | 19 +++++-
 drivers/net/wireless/ath/ath12k/hw.c     |  6 +-
 drivers/net/wireless/ath/ath12k/hw.h     |  5 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  8 ++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  1 +
 9 files changed, 110 insertions(+), 36 deletions(-)


base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
-- 
2.17.1


