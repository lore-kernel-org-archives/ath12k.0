Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04BBC4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 19:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vccEm5GZHn7/lUKe1XGobJEtL/5bQw8xLJ8nuKgzCCI=; b=Bm5IjfLGmKCm308stN7CCQQ2I1
	ni1kiddYQu9M/P5CxKRLsFarS0NSi6EUcemwZM48fzRkM5AeSGPCfLmx17nq59BytQ1Ida0gUGRvX
	Wb36SNOR2kvTpGwvrFXX4I+s8TITN6ByGYt9iWC43kAAJrowy6Z5jYK0i4hoIljXc22vNRpb2DXht
	1EKhowwVDw1OdbtGSjU4q0eGOU5SupJG5QDA1OwUbujh+ABEBSqKIuAM92eBQ8eDy9mkBcuBMXM59
	sirWRZ6g2cvalLhiwXLCGSzselTpSAsV/KklVUhVBSsNuOdFxfNd1sSbl+WBXyspl0HalQtela256
	OTbE+qUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzi2C-00000005b0w-1ldB
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 19:12:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzi28-00000005ayM-0SAL
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 19:11:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OImS2R025850;
	Wed, 24 Apr 2024 19:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=vccEm5GZHn7/lUKe1XGobJEtL/5bQw8xLJ8nuKgzCCI=; b=VB
	yxvOsgTgJQLQJDAeNFQ8/+Ig5hx04xJHVR1io6a6wczIR+pTR+XEDcEbVSXkLsHX
	VtF9xdbmAYIWH+6UCksRDA2vK4UzGTe+CEPkCxvdRbrMzQIT5YYSFXe+ojIE4X9B
	9IBEXAczIh3f/t/+1QSoqxrbnqBzfPwsrcfAc3X7nKkuXXG/zOnQ+EslK8OLgbrA
	p4DjSbeN/VOKUZ8Wz5jsgj9Ygij0cbWhQD54NAHRotn9mQ1NSRkthdT18h+MdjD/
	YB7CDmkt+ubgOhUeG8adxbgD4aa3RZ2jhr9wCfOGFjr5XrIPT2tOPQzHQV4/A/Yz
	ZwW2UKbg3ZFvLk07ahjw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9g9yup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 19:11:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43OJBp86017523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 19:11:51 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 24 Apr 2024 12:11:51 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V3 0/6] bug fixes and enhancements to 6 GHz band support
Date: Wed, 24 Apr 2024 12:11:35 -0700
Message-ID: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MtN1EHjcx7TfURAlRRdxxB5vpWJQyYqC
X-Proofpoint-GUID: MtN1EHjcx7TfURAlRRdxxB5vpWJQyYqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_16,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404240091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_121156_234547_8BECCC31 
X-CRM114-Status: UNSURE (   8.67  )
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

changes in v3:
 - address review comments for fixing ath12k-check issues.

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
 drivers/net/wireless/ath/ath12k/mac.c   | 121 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.c   |  10 +-
 4 files changed, 117 insertions(+), 25 deletions(-)


base-commit: 326f8f68f28b0b831233acfabffb486a5b0f4717
-- 
2.17.1


