Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1C1C71155
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 05:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L510TQuzBIUrKtxm/KC4exEH3ybc39C++cWmw3do7uM=; b=gjPy8MyvcbpAGOT204AkS+62CS
	fPpLBvDEkmJyE6c8sD/7IGxq85Iq3vRlsYNukcivwNf6mKsBG1QkHfp4v0nrjOAqYX1a+tMNOEtOo
	Xc/WhhyqoB90k7FPw+HvEyFkqFImhfLEBNyVVwPIVST31vR+1zposGNO4baaV3Ns6Fqfmm4MbcjmQ
	OwL99NItlgaDmPI7+MoFhY/xVqaGoVfNYXP0t+5q7g7syV8GlhxdhFMp6bPazjDuweAIRsnijPNMT
	H+xT/26iEDVH9BRU4vPGrh60aXhiVj3Aw5PuHC6HqOpnNV1lzsa8+a2R7cd08ar09pBZKs2OB5XCa
	srXGhDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROcX-00000006Eoa-42UT;
	Tue, 17 Jun 2025 05:12:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROcW-00000006Eo2-0Ak5
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 05:12:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H1pQbT001757;
	Tue, 17 Jun 2025 05:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L510TQuzBIUrKtxm/KC4ex
	EH3ybc39C++cWmw3do7uM=; b=RUTgSIMJPkyvm7fXLl9sJHWAO22LLlARhpkLX2
	vvpfDhk44pdW2L5bdvxnSWywBERyEbdAriRltdbIaHmLACn7U67F4RcWAS+p8ZFz
	9PMx6gzXDi29eMpdNZpovuqkrRVhPbuuKsMBMCWgTnn3Y8VsffOY8eAe7krSk7dW
	DGIb5kJ0Gb3MfvASbbXgxtb+/OoIcOMGvXNwxiHA6InDzpFhenbfI8NUHGQIfnPd
	N03tuTJWR/Oh2hMhl8TDenahAmymhPiBgCsvM0xhMd6FHuPmzi/sm14qQYoStCYQ
	EYvY/hKeQvto3hHtrfFd8zYTWnFR+zA0php4Ch6MV7pnpPRQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuwaagd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 05:12:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55H5CQl6030467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 05:12:26 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 16 Jun 2025 22:12:25 -0700
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Support TDMA, MLO, RTT stats
Date: Tue, 17 Jun 2025 10:41:34 +0530
Message-ID: <20250617051136.264193-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kc15SquwV3BV6CRQ33JgL_6vbHA_xEX0
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=6850f93b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=grKnNh-ejgdd-aMNrFYA:9
X-Proofpoint-GUID: kc15SquwV3BV6CRQ33JgL_6vbHA_xEX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAzOSBTYWx0ZWRfX33ATHOgaf/qy
 C0IoGiYa9BMGJlkl4rHIWVRX/G0l8gEzWft/EuP6BZZ37uenmTGk7VWVTWzwVW7X2szo/FlT5nL
 dSwBMhaT2XWk24D55IFBKGYRjQPTa1QItWuk+UjzT17QsWOL7ilAM+g/WlIRydURd1fJSXWtx8E
 a8+/Zrih8SKf6bTmWAoiLGIb8dRh2aUTw4AuIIP3g/JkhGcjUyEQYx52k5sovHONJpJAX8Cd3fe
 qfqRfOxoknLINSv8e/6wQueWwm1oszOSV9R+crMT8wzJP8I3uu6o7SFZoAakxqwX6hMcGlNkwdY
 lxlLV/xaFksJcH+ElHTOQ9jvyOOLWArn0QP4pD+7RZkzbPep2B7GyJIunFe1lxP6i1q57kas/5i
 DQMqDSi++810+JLPuShq8fyUFQsjBc2mZlw3lx2h9+mUl1nEB/vj6HxSLha1Y+02/QpI4OKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=707 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_221228_145253_EFD178A7 
X-CRM114-Status: UNSURE (   5.31  )
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

Add support to request HTT stats type 57, 63, 64, 65 and 66 from
firmware. These stats give TDMA stats, MLO scheduled stats, MLO IPC
stats, RTT response stats and RTT initiator stats, respectively.

Maharaja Kennadyrajan (2):
  wifi: ath12k: Add support to TDMA and MLO stats
  wifi: ath12k: Add support to RTT stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 516 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 185 +++++++
 2 files changed, 701 insertions(+)


base-commit: 7fb79ce2693c94f8f74bf62ad25a97e4b61721b8
-- 
2.25.1


