Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C91DCD8CAE
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0o/Dwk5pYGi/rWQXSmQRzZfxUpMbhm6UghH6rGHnabU=; b=zGJQuYdyKYAHyOH6OENGLXS6w/
	NEfLf107zLLPT1k2xv8mdvpu4gNVRNjb70BDdzLst4cN+3NBOgFR1K93KajVM4eA+egdT7gvnkdu/
	FAMfUfoaGFxp6rCkvdO7HHxqEtDQK5k5XXl/LanfuXlCA+jaFmEXZL3suqCXHyBAliz+KlcOATyvm
	eUVNFeVg6q2VFEHOwwpJqbr2qJn0jawo0O9jah+YBIAsUR9W5G1qpMJNFQAOH5CHZuMU3okmhj3MX
	2oZbpCDcN+wETbZPKKakn4xEuILlCdceEcKdx9RUcNr4hVm3gr8lIW0IQUNIi3DKS0bfPy2HJV2SN
	XMPEUKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqGp-00000004uPG-1MmG;
	Tue, 09 Jun 2026 06:49:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqGm-00000004uNq-3Fpv
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 06:49:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596HcJ41364848;
	Tue, 9 Jun 2026 06:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0o/Dwk5pYGi/rWQXSmQRzZfxUpMbhm6UghH
	6rGHnabU=; b=GvS+AjLJjcyaOpMH1o+F2Cu80UDLXmIjexSlznpcqvJ3rwxbTHq
	Ca0cZn/cSZqVkR9fgdPt+wsDVCEY4yxyHwck6qyEI7TNsIXc/vNBvqAryi1Qcna5
	16Vom7sW5Z6TqNPZszmusYfIh43acP0CEhD5Zzeg5Jp3O1CCO5P4Ok+Angz8YXAr
	YLC2eoIYYsmOSafHQq3kyZG0i3ywXqOAq0qGJc+ecH9OU+IKAanI/ApfrWnSIpXP
	Y8SiTPLGqxfFqwG+AxXVvX0R8mBzWPfEzh0Bl9Y8WQELhxGGarptVlQ9NyLprF7W
	kl6deNfFTKbs4Vx5ne8eqDCxF0p1kyBmRaw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeer49f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:49:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6596mxRt031243;
	Tue, 9 Jun 2026 06:48:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4emcmj9c12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:48:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6596mxYw031229;
	Tue, 9 Jun 2026 06:48:59 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-sbutta-blr.qualcomm.com [10.190.109.146])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6596mxkr031224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 06:48:59 +0000 (GMT)
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4181700)
	id 5CE49413AA; Tue,  9 Jun 2026 12:18:58 +0530 (+0530)
From: Sushant Butta <sushant.butta@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sushant Butta <sushant.butta@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: correct monitor-mode RX metadata handling
Date: Tue,  9 Jun 2026 12:18:54 +0530
Message-Id: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27b75f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=J-3CPfT0p-nbuL7Fw-EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MiBTYWx0ZWRfX94dnhKIcEW65
 WP/gxbhq/VtrV2dJi6d1dcifKqRJNXbqWMl+nGginI+pqXagWsxYcbPPlfo6cbfQhTOc7ickzvK
 zc9kIj8b2wzip6ul3gDdg+Dy/NtXvZglNVoEQuCObVW/iSp2JF9L26wu6I7oqMaw4wDlt+9s+yX
 gkvOTyfHyMNg/JPRMdq88svdqUFKDRA6kij4PBxWz32dVx/DsymMoZgYuOhetyeRpb8w/6uiXy5
 jZdhS90UR3KKVa0LHI48nwY+EEIfe2AWB0hoSd/XTVVGK9/yUSdZa8pK40hgh9TPSspqhJNzp1V
 jjVCUf+JphbGyo1TlyG8d61RbJgm18UlfNbLVWd23848p4udt6soYwJPf5sBaLzr87QrxBrDuy9
 3VJS3k92j9/Mm708fWxAnaif2JGTyRUNvFAjMCb+XRj3awC/RDJ/kW2kCM8g2FC01wbT7MPd/Ea
 RSDgbQJohG1MSKvgVhw==
X-Proofpoint-ORIG-GUID: MAAN9InCCX7J-lBs219VLGBVUGCywhzg
X-Proofpoint-GUID: MAAN9InCCX7J-lBs219VLGBVUGCywhzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_234904_821987_A987E19C 
X-CRM114-Status: UNSURE (   7.11  )
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

This series fixes monitor-mode meta data handling in ath12k and trims dead code:

Monitor mode delivers raw 802.11 frames should not set RX_FLAG_8023 flag,
and populate peer/link metadata in ieee80211_rx_status for monitor MSDUs.

Sushant Butta (2):
  wifi: ath12k: Skip setting RX_FLAG_8023 for Ethernet-II (DIX) frames
    in monitor mode
  wifi: ath12k: Skip peer link info update in rx_status for monitor
    MSDUs

 drivers/net/wireless/ath/ath12k/dp_mon.c      | 70 +------------------
 drivers/net/wireless/ath/ath12k/dp_mon.h      |  4 +-
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  7 +-
 3 files changed, 4 insertions(+), 77 deletions(-)


base-commit: 38b2fb7d2df16f5801f7d88a4739942b95a5f6aa
-- 
2.34.1


