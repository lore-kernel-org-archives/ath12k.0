Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7BAC25B10
	for <ath12k@archiver.kernel.org>; Sat,  4 May 2024 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YKR/TREcDCkkxSIHj35FFn4VXxtfKPyhd2S5bG1e1SU=; b=OI5EUAJtY97vyt
	DlINtCgf7luZZ3JrVnGd1zgKU5wMGWuLlL8f1x36kJGhuQQZgg2j0hOusY2Pil1EFhRaN19qsSDUt
	//VAyiQwc814xywisGPd/ivCdwb5v4FfeBnsz/Ax+JkrfWAkydiMpTb2pK9vkBbY5ofIJZpsMid1z
	CVGDJVG+8+wovhhL5YkofsU2rPWTNSdQXctnzYdXwQhZcKqssAhiOvjvJYBI0h9JszhAg52Q9JkZB
	zQ2F/mMAHKwCSLQhQOSnK7y/p92MTdIjtbSSGubsbc2qn/V65pBi/qszQErdHIoiuptqw47qHXzGS
	PoDdHecR/izxETdJY5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3NCJ-00000002vKw-1oer
	for ath12k@archiver.kernel.org;
	Sat, 04 May 2024 21:45:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3NCA-00000002vJ9-2jgn
	for ath12k@lists.infradead.org;
	Sat, 04 May 2024 21:45:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 444LhEre014028;
	Sat, 4 May 2024 21:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=YKR/TREcDCkkxS
	IHj35FFn4VXxtfKPyhd2S5bG1e1SU=; b=X1u6qQZb6rWCioR4gmBnyhgadVz5Ka
	RNYMewk+GG/zyPaguiQveD4tJq2lcbxZSFDxHwyzc+FfrBLGBpePx1zc41SJ6Gzp
	ldRBoO0Bkc+Dgw6CyIkVIGaN5M7nZ83wc/KpemJVLx98tudC3WJUQQBRGX43vEPi
	OWuQeMxRyAzvyE1pPubbMCOGWy0N3wIgNK0IQjIRsRvapxMrXx4MaUnqc7Jju11l
	mDZF2HIKxnemU3VY4r+CvwvebfzDbL6NCb3qzTzDbsFPJ3SB+nY4vFdUSD4/REBN
	wgHwOP1NbUFd2Dnm7somR5tjmA3pKV+OwjhnccIdd1YYQZNXBKJrqCvQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwddc11tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 May 2024 21:45:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 444LjLYD001237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 May 2024 21:45:21 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 4 May 2024
 14:45:18 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Fix spelling and smatch issues
Date: Sat, 4 May 2024 14:45:16 -0700
Message-ID: <20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-0-44d2843a2857@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGysNmYC/x3NQQrDIBBA0auEWVdQiU3pVUoRoxMd2pgwShoIu
 Xttl2/z/wEFmbDAvTuAcaNCS25Qlw58cjmioNAMWupeGqmEq0nplw2r5T3MzjLlaAu+rV/yRNF
 +fB5uRgrGKozy/WiCvppBQyuujBPt/9vj2Ty6gmJkl336PWZXKjKc5xebOtWAlgAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5d-T7qCA7Rdi9KgQpfb3i1LTA64HVsal
X-Proofpoint-GUID: 5d-T7qCA7Rdi9KgQpfb3i1LTA64HVsal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-04_17,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=779
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_144526_859653_A2E8B225 
X-CRM114-Status: UNSURE (   8.20  )
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

The original goal was to fix the smatch issue:

drivers/net/wireless/ath/ath12k/dp_rx.c:4065 ath12k_dp_rxdma_ring_sel_config_wcn7850() error: uninitialized symbol 'ret'.

But in the process I discovered a misspelling in a struct member name,
so fix that first.

---
Jeff Johnson (2):
      wifi: ath12k: fix misspelling of "dma" in num_rxmda_per_pdev
      wifi: ath12k: initialize 'ret' in ath12k_dp_rxdma_ring_sel_config_wcn7850()

 drivers/net/wireless/ath/ath12k/dp.c    | 10 +++++-----
 drivers/net/wireless/ath/ath12k/dp_rx.c | 16 ++++++++--------
 drivers/net/wireless/ath/ath12k/dp_tx.c |  2 +-
 drivers/net/wireless/ath/ath12k/hw.c    |  6 +++---
 drivers/net/wireless/ath/ath12k/hw.h    |  2 +-
 drivers/net/wireless/ath/ath12k/wmi.c   |  2 +-
 6 files changed, 19 insertions(+), 19 deletions(-)
---
base-commit: 50971dc6694c0845fcddfe337ea39c5b723d5a92
change-id: 20240501-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-51c4b5d26572


