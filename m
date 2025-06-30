Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F195EC83000
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2j0Vz830TXfxfsJ6fPnk25Dk7G+zaR8xCj6k5ShWMzg=; b=FyAXRnz1MSrhme41T93OmJfTvp
	gCI+yP8E0RMqW2Exczsxv9XdQdLQN/NVv6VPY53NzfGPonjuxzopjF6+aIAFKLAMKYG9wGETgChdp
	bZniyIgBHj3DLuLEOFuuQFgl+TzV7dI+Qq1AxIdwXEVNXNxzdB5NgSxmT5COOMowfqlECuGTK98uJ
	tp7ridxp5e9JeV/pvlS/5/7pkAXpNhUB2sgDCtngrKlM7FCEv7rhsZ/Z2w0aN3qmSfTOY7MdL+mfL
	9zMvo9Ei0oJIrOOu+upFhYw5m+pQW9kEtiFiYtnlHQGl0WacslF8ecMvxyGlWrdaSIzCstYjIcLzG
	PD90B7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8gg-00000001Q79-326g;
	Mon, 30 Jun 2025 07:12:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8gd-00000001Q5P-2KYa
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 07:12:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U6GIxp002572;
	Mon, 30 Jun 2025 07:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2j0Vz830TXfxfsJ6fPnk25
	Dk7G+zaR8xCj6k5ShWMzg=; b=GX/Z9DsSSexokn2IDSrJDCCkNzrounE0lEa6LM
	5/2qKA0petXnyT4vNXc/xa1GRO1s/LLWUIJXYSxENPbfmUGlwFMoZLxtVLyIeH5N
	vniVrqBFH2MK2DWwcew6zv/Dgw+sw2VxKHxuivf1NrEdHBh/qLiOo+nkrPnwdJjx
	J+Uc5746psFTarP4uyUKREVPLzWbfnvb07W5zDVjYJet5rx3LeSFqcXY0907fQs2
	wytzybvBVGopPDuUMqMipueSi4blCdr8mduUAMOAyq2KgMFiF80dT+O7YEs/GaWZ
	tF/ziiHehcpm6u2NkA76LDZwJmOQow/PRhJicAEoz5uB0TBg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5j84er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 07:12:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U7CIlD009585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 07:12:18 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Jun 2025 00:12:16 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v7 0/5] wifi: ath12k: add support to fill link statistics of multi-link station
Date: Mon, 30 Jun 2025 12:41:09 +0530
Message-ID: <20250630071114.3474672-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=686238d2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=kYzkSp3CTHGy5h0v6O0A:9
X-Proofpoint-ORIG-GUID: CDSM5BFTbNGfqeDQ350UQ0PxGL-Wn8I9
X-Proofpoint-GUID: CDSM5BFTbNGfqeDQ350UQ0PxGL-Wn8I9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1OCBTYWx0ZWRfX6i3yRahT6Wy9
 wxd2cjV2Z054FMH+FUJke9dJAwZUOywNlsNdqj07/Km2QBxU97rgihdSb15pFME3Ef3++YrpGIP
 18gbv9DWFMGjsXNNueG4f9A3HgAb8zvf0je+vzldwrAdiP0Exs+z7MxgbTG6LUKdjwQJ4jju7m8
 MezQx6v5htnKerO5IomyL/P/IfdVuPaQzlCwHr+Zjev3ydmyJt40n5P9kEJm0ZfnkOyXzffDPiW
 X0YD82+wrXJmXBYWoIxojDWDWTA/Aaa3Xe8Pnf/VbmecwaBCaTZwXILF8OKmcTKHObxa26ZT8c2
 yNJjq0uU0CcDM/OqrHZBezIHoFbcCWt8gOljvZVuIJ7wI57qI1MZeHw1XJdSqQac6iq8Qc6PbdF
 JsYn1wUlwG8c1WfsD49bmEtoMQJKpJp58I9ovmksP/D8HHkes/UjqrthFslEj8LfjqkRsnr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=620 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_001219_595973_45307107 
X-CRM114-Status: UNSURE (   9.27  )
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

Currently, station statistics are filled at deflink for both non-ML and
multi-link(ML) station.

Hence, add support to fill station statistics for the corresponding
link of station.

V7:
 - Rebased to latest.

V6:
 - Remove dependent cfg80211 patch- as merged.
 - Change the code according to  design change of cfg80211 patch series.

V5:
 - Removed mac80211 patch from this series and included in dependent series.

V4:
 - Removed driver patches.
 - Added branch tree tag.
 
V3:
 - Fix kernel test robot build error

v2:
 - Convert RFC patch to actual PATCH with each patch bisectable.
 - Add new patch to update bw for ofdma packets.
 - Add new patch to fetch tx_retry and tx_failed packets.

Sarika Sharma (5):
  wifi: ath12k: fill link station statistics for MLO
  wifi: ath12k: add link support for multi-link in arsta
  wifi: ath12k: add EHT support for TX rate
  wifi: ath12k: correctly update bw for ofdma packets
  wifi: ath12k: fetch tx_retry and tx_failed from
    htt_ppdu_stats_user_cmpltn_common_tlv

 drivers/net/wireless/ath/ath12k/core.h   |  2 +
 drivers/net/wireless/ath/ath12k/dp.h     |  2 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 22 ++++--
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 48 ++++++++++---
 drivers/net/wireless/ath/ath12k/mac.c    | 88 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/peer.h   | 26 +++++++
 6 files changed, 173 insertions(+), 15 deletions(-)


base-commit: 391a83d0c8ebb1e476cba73bf4c010af73993111
-- 
2.34.1


