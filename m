Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BC2606A331
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lgkewOMq;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSPJ+txu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZecgK5YJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=noZYc7vxnKjinKNp/93BUTzOMAsCoQ35KTQDuXl4JGQ=; b=lgkewOMqE0JRB+C7fJXTErb2O4
	DktvX3+72/VwiniQkZ56d5k/B0jTTTRcqK7CxSrhStzF0HOvlmUhGRvd4tAFY25KiN5COx7FP8CJx
	pi8o4J+MeYha1tLz/ZhQXqBL0wtYRRzh/1LrxW5BaBpKPu3QwCeim9cbAR/o3MSg5HhIV0YfEDVxx
	ydIz2Rgz8vOdrfgnRW5Y6nr+FsQZ9Ot+6GB5+2SKgSjgiUeDEwpsBPieh2C1qaNWdZtB4z7MJuM2N
	DMDIrMr8wel3tmEC+RemYiB8ZfHeV+YDCvw01IwAYXS2YbeRdpipl1OEZk1DBSQ2ndD61gOHtDwln
	Fiki5/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHqG-0000000C64f-3y9S;
	Fri, 06 Nov 2026 11:10:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHqD-0000000C63x-3XJL
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 11:10:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APIMn2593288
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=noZYc7vxnKjinKNp/93BUTzOMAsCoQ35KTQ
	DuXl4JGQ=; b=jSPJ+txudhIL37ctoBK3zh32x101mDjm9t+hpHQkaDBXxhseRS1
	REScyu2rs+WkXPN/pzWABgfeL4mQtWo3+d8h3w43rgXqXZNRXar2Ab/VisfKe+XO
	gGj4+cWeppnzd+dcgDvDzmlzkijwn90UsKxW1X2zIdotJ+PEnyZs2exuUftZ7H6L
	sABKWIT+hp+id6aB16zqcYTstDizp0ErUPyb7o5miof0ALxIuDqfhZrgXXaOdTW4
	hAT+1OszjczvMb5HRZsHqK6l/SeNyxrVaOyVoip+QdyY9pM4q/FENAmS27XAC9uo
	GAlhUzesmAXa2uLcHGzGQXCHV8Q3BLceV/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paafg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 11:10:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so594877a91.1
        for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 03:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793963439; x=1794568239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=noZYc7vxnKjinKNp/93BUTzOMAsCoQ35KTQDuXl4JGQ=;
        b=ZecgK5YJHek+5peh4SD8MFAGrAulytm3qMpCi5dI/SdpbBeeU0CrjZqnhvfoKd9pMD
         vE/oZsax8B3i/zktvvXwkVO1nnbbooOfoBgfPurXpty1gu157+YejRpNN6RqHXz/kRs6
         bhqsEJwSzWOMmMaXljW5e5ADJoah+1hHnEfGCs2TQXQoC3pPliz5szRymBWVzwJxLbbv
         4T20toLjaEzV6Qy7AMyRqIBNCDwbHgcKuW6HrgIBisM7Od3HAt2AQrH/ijsKhr9nysOP
         WnBkmkaLTJsqC5YSwveTryylDU1RElQdYU+6TljYyVHmgW+Wf0RNEKYfV/x0ACJbkFrh
         UJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963439; x=1794568239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noZYc7vxnKjinKNp/93BUTzOMAsCoQ35KTQDuXl4JGQ=;
        b=f3YXWza0U4DWOLxc4G5a+qj2FUKt/FdLA8RqxaJtQMNbYq/rAO0j3s9xjpf+HLLpl6
         6CRZKLa64KkT/d3OIYSNUgQ9er8nXfbN8UxYog7OPpUBlJI+SvVFHv2PxfjgDJX6dmhT
         AFBdPfRtHFGFc+1a+8jkJvnzSjpllVpwwdOBaRwcmH5aLm78Scr4L46XewPd3E610dXw
         JU0zG+Q1tqLXEKswzwhdbl7grwSfi8kwSYvM9Z/MNrTCSK3yAkOBBOkOsMOp6NdM0eup
         Uxol3lUr8io2fikFaj6j02FQ+uQPzY/RlvHEMDuql77t0q8TSAK2H07k4URlY6iR0DFg
         3bzw==
X-Gm-Message-State: APuU4Z8cmAyrduOCKe4vJ5WLqlTZ+egkAelti8F7TdmVunSXtbKb3+o6
	nBQC6vyXDUXWu/C6hMPWuxDNI/LPjyvmrubj7qA0G5AGQpOzq3Dy+LWaFaT1IWcdsH8kuqLt7LP
	BH/QiylWgPDcq6/FMIUaW3NSKysIQVjSkysltpqu+glTLvAgJTVSwQmo5yoOb1IEKCxPSbHpV
X-Gm-Gg: AYBFou0bygaWZ4gGF04PxtNVNPbvGIwrnKM0nZNLQge4F4DiNlojBjC5FuLpHBBYPlN
	BClwacHWpEXlqLmCxlIzwEVzZEp64Y6tmt0U1efm1UMn2eX9Ha2v4SSzrvzQoh8kb5hHncBIiDI
	tuU8VxG5zvDIB3C+dpnlF4g91FVuqS4L9M4P3pio1ZPYEFbtBdmTNeO7YeHOwG4Lhkjk9yK5xTT
	TBZOkUoQ2SVYlSx3aJLPmLMZAs4Xhbd9naUnA38rn+TDtf7oDZ3mptZUZRNHheiaaaCsUj41GIf
	FMVJMt415SE2TvGtDbDkGwS5K1H5PEj/6eOdtJ5JzETHE+jdyOn6+21moOraogMOkT+rso1Lkqw
	iGAhcMO3Em1ZN8vLot1D7KzpXBJjd8kYFgElmflmzIDpSQqYt4VVwDowculVA5QrjWqqZpcF3Fq
	IHRMB53eQNsm3CxjuHjOBPJRB3My/g2eT3NnmNH6oxIJ/YVrSrfbyiMUlZ+TG66A==
X-Received: by 2002:a17:90b:58e3:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3b0db7282afmr2213098a91.67.1793963439490;
        Fri, 06 Nov 2026 03:10:39 -0800 (PST)
X-Received: by 2002:a17:90b:58e3:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3b0db7282afmr2213077a91.67.1793963439009;
        Fri, 06 Nov 2026 03:10:39 -0800 (PST)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70526658sm481422a12.4.2026.11.06.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:10:38 -0800 (PST)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: remove duplicate ucast_ra_only assignment in dp_peer_create
Date: Fri,  6 Nov 2026 16:40:32 +0530
Message-Id: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IoiT0zYup1aAKtsIS9-OfU8RTGhDEJIM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfXx7qzfG55N7iQ
 2eyDRH/mLBYPrcabFOsD90Dp3LjImbCwPd+MZXzbnZIhr1tPJJp/xAQrADkJgG/CH2AOun87+7q
 fi5MwPftLO18N8+Y6VygOHZZS7q2hMFzGasBxKzS1zYC2wN7ys4zn6qxRzPW+n9G7EBHMYxTmxm
 HVpSLalBEMgh/srIbdbM+qwJKG8RV5i3mrlq0t7atnknXmCjyoTvKrNWNqQdxxb9gS7q2hHZWZr
 d9bcwAPT0W2ubtsfUFHiGh5OKTniHOy11HGQyH7ahxHyLbjEG0OaJVRXxbuw+7hWqHvM/x7HAG/
 pXQ4ZoPrbc6Zmro019IOqqPNAu8omJL2Agbp2Ty3gK4lUZJpagwIJg1/c36UmPT2er6rQ9PrHzQ
 m9cf2sGTJjBWNFFoY60HkJCl+t+sEgZdg+Vb0XWz/KighoOKVz4OXFm4ddi6zaA8596g3WJ1sw1
 r8uoY3kEVKnZQvMuhZA==
X-Proofpoint-ORIG-GUID: IoiT0zYup1aAKtsIS9-OfU8RTGhDEJIM
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedb5b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pUlQ19MHUesLrffGXrAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX3qKZs5aApRY7
 Eg3pqPLFu2LEP6BHWKAwMgRI3uKQyePiuSzhlYuaoIoNsZi1+HeS3ThUmVjKt/Tc1XRTLrCVhhn
 i4Wlf7CSjF4aZvzyIFTBX+qATSHoz/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_031042_019225_15476B03 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dp_peer->ucast_ra_only is assigned twice from params->ucast_ra_only
in ath12k_dp_peer_create(). Remove the redundant second assignment.

No functional change.

Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index bb5341b4251a..c9075883f976 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -486,7 +486,6 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 
 	dp_peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
 	dp_peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
-	dp_peer->ucast_ra_only = params->ucast_ra_only;
 
 	spin_lock_bh(&dp_hw->peer_lock);

base-commit: b9acb873d035fccc8824164246535ea6fc95c71a 
-- 
2.34.1


