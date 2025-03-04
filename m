Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184FAC282D0
	for <ath12k@archiver.kernel.org>; Tue,  4 Mar 2025 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cFXuxOoeD/aNY+NV1GNLr+Ind1xjrs0J38k4BHbjCTY=; b=cb4J7ToCtWUYQmmkWvpmfi7DyV
	vU0PH6yfoHvWdg+X4uaAOn1Rd56jbc9p2JBmzQtYMPUY//OVcZ8JvmhIsXGAEWXFH1hwG2/tIVCDu
	I+eEBOIO6QfDvUGGLeuPETjwZ27uYYwe/U7RljEeo+l//LyJCJpniVfn5COhMGO08OEvVXIUI8wJA
	sNWoEctCOIdWlezKBYTXN1/huxaOUalHDeqVIA5137p708Qikt43wYPNOqiSo7bMNPb4EjbUkzQ8I
	Xfuqa2CKM1vc66pg1BbslNQOiGtH2TowCW7wzqJCwYj8ebU7/sJfYnBvhrbwsVDX1KLpSWurZXVT0
	WJUZe+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP0x-000000041TS-33FZ
	for ath12k@archiver.kernel.org;
	Tue, 04 Mar 2025 09:56:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOyY-000000040iK-25AZ
	for ath12k@lists.infradead.org;
	Tue, 04 Mar 2025 09:54:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NXJw3010211;
	Tue, 4 Mar 2025 09:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cFXuxOoeD/aNY+NV1GNLr+
	Ind1xjrs0J38k4BHbjCTY=; b=N78GgTNqtbc80yu6MjZqOoW6w0oSSi8lvrprsj
	kBtWiVmgq3WJAfTs57oBQI/D3vy57VIZPtyFBEm/0z4IfbwlwE+qIxhHgh1ReuNZ
	zy8phXYhd25FGBAjNVTG4GNA1zs9gnBSJMCvph2cJXNCIG4nZGKvL3s9Yi2nA3Eq
	kISUxt9VoVQxBTwip6uyjpVq4n/fQl5f3B+5W3clTdPfrN7CJrTqi67RnS44W1Yz
	IQft72zyQI7xxbtytRTKOqh2i9W2UWWEVoF2xC1T4nTJl87LuBrkeWAile/AnZXW
	cBsPvK7pHTyYzF+oZ4nYDrRbvuVuWyGVg50kKTRSXSLWqH9A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6whdwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 09:54:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5249s7b3027846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 09:54:07 GMT
Received: from hu-surapk-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 01:54:05 -0800
From: Suraj P Kizhakkethil <quic_surapk@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Suraj P Kizhakkethil
	<quic_surapk@quicinc.com>
Subject: [PATCH v2 0/2] wifi: ath12k: Pass correct channel frequency parameters
Date: Tue, 4 Mar 2025 15:23:13 +0530
Message-ID: <20250304095315.3050325-1-quic_surapk@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZcyQOmC c=1 sm=1 tr=0 ts=67c6cdc0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=wycfSnS5-3SXLsRzsT4A:9
X-Proofpoint-GUID: UOP9fjr9XBxO4pH1RGTbMpNAMO76PXr9
X-Proofpoint-ORIG-GUID: UOP9fjr9XBxO4pH1RGTbMpNAMO76PXr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=849 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_015410_646154_2193A6E8 
X-CRM114-Status: UNSURE (   7.54  )
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

For higher bandwidths, the channel frequency parameters passed to
the firmware are incorrect. Pass correct values of channel
frequency parameters.

v2:
 - Replaced arg->band_center_freq1 to local variable center_freq1,
   which is initialized to arg->band_center_freq1
 - Rebased on ToT

Sriram R (1):
  wifi: ath12k: Pass correct values of center freq1 and center freq2 for
    320 MHz

Suraj P Kizhakkethil (1):
  wifi: ath12k: Pass correct values of center freq1 and center freq2 for
    160 MHz

 drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)


base-commit: 3148fc3cf193dbbd2e14eee59468a510a38bf604
-- 
2.34.1


