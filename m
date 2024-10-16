Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C828D2069E
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 06:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nH9zU1xKm7V58WPec/ZmbzDY+qNbOSNWp3wH+4m9xZg=; b=KRqomT3CO7V+IACXLpI7hAhFjD
	FMB6q0BtsjurEH0uy1VnBWMpeqCkLX1yaDilizTa+OMfZQZHfQvJMNSrWYccN75pXTsrZ3JYDiS8x
	2Y7R45xzshdPWriez1kWUpc3XMCehY2JXUZsk+QMZmmaQeEGTntlIcmT8rNSun+jA5flYvinVu2Sn
	knnvpAbKr6ksLwfiSCoVsV4HK23XvRbkYeHRhoOeMu8zR4SvuQNoxVFRpj/P+r6ajFwba5eYOtwOu
	Amm47PzuOg+hYu0PXtcYWJAiKE/ZYjWTg8vExIDxmbP5IRJuGr+OPVl2e9mpIdKrS38dxZ7jiA+NZ
	ZLO5TNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xUc-0000000AgjD-0ciC
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 06:26:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xUY-0000000AgiQ-2JAL
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 06:26:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G60G5P007419;
	Wed, 16 Oct 2024 06:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nH9zU1xKm7V58WPec/Zmbz
	DY+qNbOSNWp3wH+4m9xZg=; b=iT1RMR+wz3eZcARwFXsZFYAIHAoH2FtaI08jzy
	Mi/8fDwMjc5+sU0JsSjY+9hjT/hCu9zH080RXKidhcf4OcDWh7CWlVxcHTgT17c2
	o+Wgajcy1DpDMxFUcvQxGzCbSg8HeIpUH5/gICrVm/38lV+WVKWTY3mbulC1qjKa
	WPthNARld7l368SrDgPhe/fhzcfx1wKOSZxvrCHgNJ4dnsYcT0ZAGxeA7RCY+t2K
	7lCGFnF+R/DjYr3MMqaRYG0MLNBp+ahNk5a+B2Wuz7JisYvIf2X6uk3jN8OHlsmH
	7WavBOHkql3kn68130qasGokPwgpLktw1Xkb9P4hAfE2pDhg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mh53erg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 06:26:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49G6Qd4L004891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 06:26:39 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 23:26:38 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: Support Pager, Counter, SoC, Transmit Rate Stats
Date: Wed, 16 Oct 2024 11:56:13 +0530
Message-ID: <20241016062617.2726252-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bDWXgOfvLzj3VryVQOYG8QRVe7Lli8ym
X-Proofpoint-ORIG-GUID: bDWXgOfvLzj3VryVQOYG8QRVe7Lli8ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=784
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_232642_728685_77A1DDB2 
X-CRM114-Status: UNSURE (   5.80  )
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

Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
These stat types give downlink pager stats, counter and TPC stats, SoC
common stats and Transmit PER rate stats, respectively.

Depends-on:
Depends-on:
[PATCH v3] wifi: ath12k: Support DMAC Reset Stats
Link: https://lore.kernel.org/ath12k/20241014065259.3968727-1-quic_rdevanat@quicinc.com/

[PATCH v3 0/2] wifi: ath12k: Support pdev Rate, Scheduled Algorithm Stats
Link: https://lore.kernel.org/ath12k/20241014070610.3982173-1-quic_rdevanat@quicinc.com/

[PATCH v3 0/2] wifi: ath12k: Support AST and Puncture Stats
Link: https://lore.kernel.org/ath12k/20241014071720.3991199-1-quic_rdevanat@quicinc.com/

[PATCH] wifi: ath12k: Support MBSSID Control Frame Stats
Link: https://lore.kernel.org/ath12k/20241005112651.3379404-1-quic_rdevanat@quicinc.com/

Dinesh Karthikeyan (4):
  wifi: ath12k: Support Downlink Pager Stats
  wifi: ath12k: Support phy counter and TPC stats
  wifi: ath12k: Support SoC Common Stats
  wifi: ath12k: Support Transmit PER Rate Stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 625 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 201 ++++++
 2 files changed, 826 insertions(+)


base-commit: 69eabe24843f238e79a6dbbd2b3fcc8eef39d6b8
prerequisite-patch-id: d2dd6093ab264e75918406abce52bb9ee8199b7e
prerequisite-patch-id: fcd0ce1adcc63e80c95e4636bd4614bd5b732ffa
prerequisite-patch-id: a6303524834f6e01b2ae1469ee437d586dd5d522
prerequisite-patch-id: 1b0f9e702388d0121427f42e7b6a2bc090b62c80
prerequisite-patch-id: 00097b59822c40089419d22b97f109c26b7f0a10
prerequisite-patch-id: d3c55f51a5dbb58d547fe1c6b8a3ce10313bae36
-- 
2.25.1


