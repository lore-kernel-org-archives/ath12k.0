Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B36B606A323
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sjODGCwH;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dYLXbItm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DsmECa4UbyOBE4GDhhVOLgqJgjolNzm5wjMb+eK0DuM=; b=sjODGCwH0JVUaZ9zqvkWEo9Tcr
	Osiupql8cZJtwx6HJimgG5QgCQK28qbifS9mgcRKq+AwLXps8RZUYDLkwO4EofJxIICF9P/Q74MeJ
	mBxPb4y6F7Rmw+WaaZ/tZ5GDPgygO2RRHkFpXexX56a5z1QIz8qVAemMVw3kUk7u/WkL/VLHRZEpR
	yOLZicPK99Kcr3G6qB/28AVkUUaCoVAkEf7oW2P9R+ily099EjYGekmSCZ+KdRnRKc6U0Y55LP9zf
	ArbZzq2XDX/QBaOCQMBEuhEUaQlwfZfeHv0Y6pRN5rvh5RvUHGde6u+a1qZl08rFODoao/UHMyizR
	oJ25RGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSswM-00000001l5t-1mLT;
	Mon, 16 Nov 2026 09:23:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSswJ-00000001l5D-42MA
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 09:23:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enZF1109769
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 09:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DsmECa4UbyOBE4GDhhVOLgqJgjolNzm5wjM
	b+eK0DuM=; b=dYLXbItmMzMT1LgOgEyufSb4NShHJDaRpcNxGUzkFrMLrEVKJo2
	cyCcw038vizVKam+ZdswWSP5l4iUPKlfoiYYmeT9rTAJAfCQ+I7207cvSe8h9Xv+
	qTnNq7eh3csPA+8RwlTIIb/T6rmhVV2u2SsKD+YAqQbojIwnQ9uCrGsFASvFn6HK
	xqKhQySWs5AzzJXA56G38yuEdV4Fm1HNrrP821DU9NwLLwNkTtAsVWf7h7+KXIrZ
	XzJtFZbagi77/lye12wWgdf67mZLT0/Djd+2f+wsNxHygbWrh2g2rDfk9iITMjyd
	gaAoLF7Yf2X83Ah1hIn1qTJxLnWewnuQs0g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc1fdw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 09:23:50 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG9Nlss2293526;
	Mon, 16 Nov 2026 09:23:47 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-tamizhr-blr.qualcomm.com [10.190.110.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AG9NlkJ2293520
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 09:23:47 +0000 (GMT)
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 380741)
	id C6D6241957; Mon, 16 Nov 2026 14:53:46 +0530 (+0530)
From: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Tamizh Chelvam Raja
Date: Mon, 16 Nov 2026 14:53:35 +0530
Message-Id: <20261116092335.34440-1-tamizh.raja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNyBTYWx0ZWRfXyVFzYjdrKBt5
 gENLpbKfcMO9heLUTiKiCQGYWI0EzzgpbvigpNkDf4zWXroQrU91H6Nv4+Jtl3Fq3MjknhzuLnn
 +Z1OGs0/jEc8VpU5LjTm0XXU6AqUHIY=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afacba6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=7YfXLusrAAAA:8 a=yC-0_ovQAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8
 a=1XWaLZrsAAAA:8 a=NDWGkDbJY0O178J7V24A:9 a=SLz71HocmBbuEhFRYD3r:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: 75CLMJhwAlFTkZhiMp0SmUnf4lnDCYFE
X-Proofpoint-GUID: 75CLMJhwAlFTkZhiMp0SmUnf4lnDCYFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNyBTYWx0ZWRfXxM0NHDQ92hqo
 MSdjDMaszkMNNeopY+4WP2/DccsP5LUyocnFERiAbGRHegSMlnnon6kWB/4PYa3ZIw1xFF77tky
 y8q4rHPPYGFmTSzaJ+XLBFdrjmRBNMsOdaROD1J7gDSLid4cUEsKNrLi98WcAyN1Pj8K+Zbuvw8
 v5t65xc6FfsuvwEpLk5kAOAdjqs76XELwQenMnmPaX2O9u1YEcbjkMD2Me2bnOKR/Ta/SvwWVMV
 hPD7xye6wmzl3Qk3zB8U9K9lg+Ikgt1IZiZJSE1EkpCp13iWbg05D8WZwIWSofNnMIdzbXXHEFV
 nhn6uwUu5b0vqfR6IceXgRvmYsX9ATpzOH5GG64MwhLSkhi63PbecDxNjTN40WiaLccW3swxCJ5
 aDMvf7LMqfsEuii1DONs7wp8j5O/iEzocy+E4x7uU71AXf4jTcu07woHxSVZ8N3DMGNWAUBInL3
 siGEQaTcHTL3GHagjiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_012352_002122_63424668 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.7 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index d73ec73e5ba9..f6ddd9dd7356 100644
--- a/.mailmap
+++ b/.mailmap
@@ -911,7 +911,8 @@ Sven Peter <sven@kernel.org> <sven@svenpeter.dev>
 Szymon Wilczek <swilczek.lx@gmail.com> <szymonwilczek@gmx.com>
 Takashi YOSHII <takashi.yoshii.zj@renesas.com>
 Tamir Duberstein <tamird@kernel.org> <tamird@gmail.com>
-Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> <tamizhr@codeaurora.org>
+Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com> <tamizhr@codeaurora.org>
+Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com> <quic_tamizhr@quicinc.com>
 Taniya Das <taniya.das@oss.qualcomm.com> <quic_tdas@quicinc.com>
 Taniya Das <taniya.das@oss.qualcomm.com> <tdas@codeaurora.org>
 Tanzir Hasan <tanzhasanwork@gmail.com> <tanzirh@google.com>

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.34.1


