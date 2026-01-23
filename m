Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EEDD6261A
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6PnQLq9PaS7ZKq7XGf5qtmHF2xrsJ7aabMtm9juP8oA=; b=UcCJkHN/MarYSgKNLnHE9ZiTax
	a0jamclcb0K0KYWRIOfIXAlj/sk3dl6QUpPTtdZVS0isTMGTf601OdKF0LBjg5ezsw1d0WFGPzRb/
	qEAcLFGeJzXDWqis4EpMAN29B124bISSQNi/1m3FW3vh00qT+dKKGK+y2VBC6AEgR3kyStmZlWsBi
	BpSY1RQWR90oe9Hwk+U87Jl2BPwk51tkLCDKh6d5BLNNmxWlpSg1FryFjvtdwuF/ParTrVgbX6vN+
	jZfyQ7mSu21XjNLJwnxeEcttV7fRL8GB5TwmSZCeKwo2b/zc6TtTEmXOunurJSLtoLBkY7EmpJ/00
	w6/FF2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBLx-00000008Lxv-35pM;
	Fri, 23 Jan 2026 07:13:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBLv-00000008LxX-1avX
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 07:13:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N56RiP3656645
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6PnQLq9PaS7ZKq7XGf5qtmHF2xrsJ7aabMt
	m9juP8oA=; b=nQ9W5NuKQO8Txp+39KBQMEcCf3apDL+OnQsybESdWfjOxZJG4Wx
	2Kk7ezZvJbb0DVgGhi4tk/thmIKjIImP0dL+lciEJBd40wkRKHWoBOCYhHBK1JQA
	zJUcUofYPuASPXyGqwtOKbKq7AxIPHUaAsqW3KMfgjyJb/6ZHp579t7myLYB1H4D
	naX7gl7Fb8lnRSeG6U1ExcE3D6B8ICzRpyx0SQueY+obuMacHNWVuRmSecY+glCb
	wz460yRSfgObDLozzVW4Kf9CrGSSGbT0c6VqRrC5aETCk7RsaTmvIB7/gybYYixR
	WtUuvXdF2L0VPsOhiTyFc+SJJX8EMsFMFlQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv2hw8cxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:13:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so3325811a91.1
        for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 23:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152384; x=1769757184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6PnQLq9PaS7ZKq7XGf5qtmHF2xrsJ7aabMtm9juP8oA=;
        b=erIleSw92GRJr9l38KYV59iNRWMep6HXAjYKoeqNnVrDW0USl5ae+AnpNCxx9XgKG+
         rV5wU7QDFsPz/z7VYqOBKHuP8ah1NWfWUQstzA9LQQlTi1gPDiL5mvOvT4LtQWmrYFO1
         VXwEEEGej6+ILsZ5i/he32QA+duzHwpYwfkqa7ExlmfAZEqyanzRvpcJtQoX1nf4zDNf
         pnO2wKHL1mQM+Ee+8EDVqqHS2tiBUPio7rHO4bWuIC/y4cTrxOqUosIRi2JDMTdW4yHY
         rU+XXlpRwPRxJarIjfCyVt//nzIhJ9AFM5fOKdGO2FcPA7GZuGOprcOLNPeK0qRYUa+f
         GQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152384; x=1769757184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PnQLq9PaS7ZKq7XGf5qtmHF2xrsJ7aabMtm9juP8oA=;
        b=ZB9Urj7IrKnM+NjU2iqSs1XDxnHMWKRuE+l9VPWtWUCYy/F8048bI1uFcbPssllcDf
         rPGCvYJsbkLi+0d2qmpSrmuhsXmm5yrEAevfVbiszGBBbbgnSaXgSJZ+jAMzFBaObHHS
         tUnmfu9XtSHFfEQrlUSHsCzHl6c31ZgfNWG84V+yEAgKEMhO8+T0n5erYNnDi3oENOWo
         B9Hl/EvVffSj9DsOxtqZr1mqSaYsmqmb0XU6Q6FrFjuf0e51xLvGgZ4ihbzabhS1fhnn
         EMNcn1jTi/ApfGkDmZOpqFW0Mtei859tOawyJmtfHQCe2NpENCnSq/wIGAvl7n+ZdupH
         Kh5Q==
X-Gm-Message-State: AOJu0YxjdrYmT6HJI6EjJDye0sLF8tpusIdaoo0uxaVKD/OyglyKclpW
	FkdmcDp//3d81yggM/hSlx685rk9m+bAQH3T6Cid6sll4n6j1pw1Qjsm/PknqDe72fxUQVZChFp
	VKMVqCqEfNA0FWguPOi6O7HKW7844H9+8ny1Xos/eEaftn7AkHG63R83RRoab/WEImrgWz77Y
X-Gm-Gg: AZuq6aJdu5xnz68rQgvYei9M1aynSkDCTb4eecQSwTYx7lAZhWOw0KTx7ndpFUK84k+
	ueveFqN1UnlvAJd5wKrB8jZfv2gvjyA9GM+7HYmkVGri2N7ABekDhDZNSrZ9Q8jpRLOC7MngaNp
	Q+gSj7YiyjsQMYmmSHf+A1JQnAMMYelS5CiPjtPU5ogGULOAWXjDmBRgYAGcEO3CX0C1soSu8bQ
	7kl+oxN5KXCn26wBglUPG4W4/Dtp+iSXDzD7U6Ia0ivyjKE/GF3LwQ4ZjAcNGH7ZqSsmjugUxy/
	KhLeT0ow4y+qJRQJs9WE6I4g+mtdIk5wkOLMy4QP6p1UCVpBPlbC3ixjKzcTmjXh2bpiqA5Dp6P
	ZH0vIcmUXAKk79SB2qHekhjHeAF5zz4MAS3Y0WqwpZPjNVOby+Xa6aHrEGEGFKfeP1STq9Q2wBN
	o2LMn6w6SPyrETqhPA7TwGb7f1e8uLbi6m
X-Received: by 2002:a17:902:ce92:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2a7fe441e0cmr19341585ad.12.1769152384372;
        Thu, 22 Jan 2026 23:13:04 -0800 (PST)
X-Received: by 2002:a17:902:ce92:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2a7fe441e0cmr19341405ad.12.1769152383914;
        Thu, 22 Jan 2026 23:13:03 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa654sm11319165ad.11.2026.01.22.23.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:13:03 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: Add support for RX pdev TX hardware queue stats via HTT debugfs
Date: Fri, 23 Jan 2026 12:42:50 +0530
Message-Id: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: erRj7WVDpK0vhjFUr6DF_UZhmKMMOcqu
X-Proofpoint-ORIG-GUID: erRj7WVDpK0vhjFUr6DF_UZhmKMMOcqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX1Cgq0nN9VTle
 Jcb1cruTA1k6wKDNnWiVCyRSwgbfRPL5NMgG3j9Lytf8uGxQEzawBfuTN8P4Nvio306tnpIehBN
 2RzVL/I/j8oqE+N2QsXI2TJp6HjDIH9a+KtYirZKXK1bb/h2s/NCBDC2kfw4FfvYv3H7V/6S/fx
 Fkr7yHTAAx0k6W0V52ze7TpXrSxGkaydfI/GCYn5lPuo8DgHUEiz18/vAeRvdaGOt8VwGKbf0Y3
 b4eIqhyT0/CjPw1b3SrHnaSOom24SHTkF9tVi8xzEnSRp4HO9ofZmHCAmLolFnjJ2XYRRKaM0+r
 QEhoURdYofOMMvVxOdvAEsBJib8MZ5QMIj70/tZ6CehETPPTaD12wvPgKVQ9x5c7/B+5J/h1jos
 yFWrujgcL+DaUEN0U04Hc9HmSQLgnjl3WYxWerxtmOIHrycyKgZ2T0NMMIw9wKLnKkkbwyuaZLy
 6fd6aHjKenT3EHhVynQ==
X-Authority-Analysis: v=2.4 cv=A4Rh/qWG c=1 sm=1 tr=0 ts=69731f81 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mjs7rqhY_IP6agJ2i2UA:9 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_231307_534031_F18ED7A3 
X-CRM114-Status: UNSURE (   7.88  )
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

Add support for HTT stats type 2 to report RX pdev firmware and HTT stats
type 3 to report TX hardware queue stats. Also fix invalid buffer access.

Aaradhana Sahu (3):
  wifi: ath12k: Fix index decrement when array_len is zero
  wifi: ath12k: Add support RX PDEV stats
  wifi: ath12k: Add support TX hardware queue stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 197 +++++++++++++++++-
 .../wireless/ath/ath12k/debugfs_htt_stats.h   |  81 +++++++
 2 files changed, 275 insertions(+), 3 deletions(-)


base-commit: 758064145fe77e06d07661b27dfa9c24fe0309a3
-- 
2.34.1


