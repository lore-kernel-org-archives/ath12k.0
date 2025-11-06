Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BD6CCFA05
	for <ath12k@archiver.kernel.org>; Thu,  6 Nov 2025 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqxjaHTpe4VK+QTHaTKoDB5Cp5IvAuOvPPRr4D6XufA=; b=wtnBtpRVtvEvILrTWyAtmYlzN2
	LAJCHKduQi1Izq2vK9XqPpxJakE+Ym4h8G3aK++UlwlKa6D9lMRwKH6jNHzGSxhohROeI44Phekzj
	dKaC+kFbmmKJDCVNgHnqzE3kGZNeP5ZUbaF0zC3NET4z7uclI9+vf/TFFAzziiHaMh3OT2tSjJZ3p
	5IlXQrIvnlNJXqAv5/5PQDRYRP4k0mB6N0e83V+8/YttVZWaQPO0VvbmIZ6Ue4skneWGmU0cWKaVQ
	WwYlNgmOKa8Pf7gFax3G5GbcwGvMhNGtXhdVRe7ZzNZVIKfxthAdkWTTuLgtlfV/lI8UqQLp8ir6i
	iNb71zKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH20A-0000000FpHT-2jm4;
	Thu, 06 Nov 2025 15:34:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH207-0000000FpGp-2vGH
	for ath12k@lists.infradead.org;
	Thu, 06 Nov 2025 15:34:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6Bl9nU4131320
	for <ath12k@lists.infradead.org>; Thu, 6 Nov 2025 15:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqxjaHTpe4VK+QTHaTKoDB5Cp5IvAuOvPPRr4D6XufA=; b=fTjW0GyufQjJtTWE
	4Ur1e2Nc5g0InqaOLSRU0pO+VAxkun+S57avNjm70n7REUUbdUf6qAo0uxbIYP7r
	FwYvl7NZdbcu2UqfD1z0MW5hVpPmtBjiHDMPGT+uyb/bQPaVG+YMDqtJoJpClfPp
	RUEJ6Qz3nmyb5ByVQJigqmOHgxhU0e79eYzKuygwb6Y8HKO3AwNJgEFUMfffhaY6
	n6Lj+5Z27uvfwTrJcmD4MQjQ9B2akJ5EEfQRqDR0LR+fBhh0iy58oDmOaPt/gz+t
	ELfW8JBwJcMIlIPw2o6D8h9j6N9AdXxi3r/JJObfMj4dgfcdgYibwsdtRbVTRxt2
	CsWF1Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x0nw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Nov 2025 15:34:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b3eso744329a12.1
        for <ath12k@lists.infradead.org>; Thu, 06 Nov 2025 07:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762443254; x=1763048054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqxjaHTpe4VK+QTHaTKoDB5Cp5IvAuOvPPRr4D6XufA=;
        b=AKN4gtXVhHFF4Q7vexGOqDcrDNYyrFeR/WH3fztgLH5aPzZ6Ry3usQnXQ6PG9hSmkt
         LIUUmh5YDu2ziNGvdykKCN/8Auvat7iNII2+d9GH3MPRY2clr31WbNORd+PGmSosBoB/
         CAfbSxfk9YGy6jrDIA+gzkXB0giaONLW38TMsPDIRU5hHGRUceYnewpdZ/9hpJT/aB9I
         07zJ9uStsTbzzNadb9x4wWhq1nlhXADOj30lutj6A+OOORfCqxhN+Imn3Xa4pGFJAJ5o
         VI7TBGlzAo5yYMuydtmGkCJVX2RlkZ3SXIlwvGC8sXyVirm8LJ50eI5q2gh7eP0Hq8ZF
         OdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762443254; x=1763048054;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqxjaHTpe4VK+QTHaTKoDB5Cp5IvAuOvPPRr4D6XufA=;
        b=LTHR8S+pZmJhbDfEujrl96JrMay48tJDUbPjhKW+BxuEwKD2S4V0nql7f+1L1SXYju
         CkKxp4iLMavgzg7+6rt3fJDc2DsCKfjkwfQ8TNbswKTcF2xqIXBPIkvNPTYqh3V3mUFG
         np4KYjWPtyV4SAe83KOevlmb9lRypaqF2IAgdVFkBn+GDbCQbVuP9F7+RryLFW0k7mwi
         0Uh4N5tKX801DKdejSOyP7XB9W76P1RpIv1krw0euJc9ofv/puaX72GSy7D5lpQz9kXe
         Gq+H56/scMyLRszj3EwU3EHV1IAMwcTmIAg4MJ0zMszftdoOoQ4rJHKHC0K4WidcjeT8
         cC2w==
X-Gm-Message-State: AOJu0Yx47JbhWZijEaizc8QM2Ng9dLf8VPwgSLt7ISnfh1F8JrGT+/BC
	ZUpXO37R4Qcz5Bhdg5y/SGVT5REErq9kARLXLi2DU2RU+67hP68yTmsAa4dps34QYgs26nu4Lu7
	mgcAGoVCzOiRFQwu28iXWteacIsaGXLaw+VssThj968yA+sw+ybR71fuIRWj0pMoM
X-Gm-Gg: ASbGncs4lUBHiK1/t7u4gu9m7cpWwMWMJoHQtazEZLIwniUawYO1x1gYaF995IrcCYi
	dXTOT2rta9OijAl6GPBdlbVy62rHcLMxeg7y+KGgh8jNzfC5rVYuX3vjfmhd/8Fp07zFe2bnRHv
	oym2K0VenboK0lICeO7W0pkDc+C8LVS5TIry6QFRT2D5pjktoSfLu3bAN/7pdW9HQnIMMc6Lfja
	r2dGTky7092TMY0MXg1FKa80dThVGqVUZ48GZnwAHfV3VkUsbEoM3PxE7roRuVFpQZde8FKSsKl
	dUcZlDwgYIlA1HqZNxzdT0ecpjyIvEEVEDg6v9FPSb27JCdXY1Ahk/FUnT3ECVC3znGoNhXRgVg
	wHsVFXg7pY4xo0uJcCViVdBoCoLSGpKficdI=
X-Received: by 2002:a05:6a20:549d:b0:341:8e52:4be with SMTP id adf61e73a8af0-35227d6e1d5mr7708637.6.1762443254317;
        Thu, 06 Nov 2025 07:34:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCj36n+Q5SurmQpG593kSmZIdLE+nEKuCfluWpwGoAjzJO18NF4Rn0ZSbl4e9YApuVZ50s5Q==
X-Received: by 2002:a05:6a20:549d:b0:341:8e52:4be with SMTP id adf61e73a8af0-35227d6e1d5mr7664637.6.1762443253867;
        Thu, 06 Nov 2025 07:34:13 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d0593cb1sm2945865a91.15.2025.11.06.07.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:34:13 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
References: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Address issues during
 beacon stats retrieval
Message-Id: <176244325323.1820628.921013394397437129.b4-ty@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 07:34:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEyMyBTYWx0ZWRfX/cn6iDVlgel5
 C0x8aAaeaHBQin1xvWR9CYQQDw1LNB+812gTYA0kZ930AMAdVTw0kUUq5IbTxQmmEjzy6teTZay
 hbVs4q8TJd5pCpxkm5t0g7b7zgtuEaQIXYUSbgQ1r78lQD2u46AUKt/ZYNiiPffcL7ixv2aVIwr
 3YB49YOuEarhKrYPh21XHZL1QNpNREiusDRSlO88NTHdnazM+T1ntJm0ALMRdj1DK/FVeqQtmUQ
 eQSjBbhtgHKLeVJiAU1UszIGAyAFeiTb6JqA7l+PDSrwMVNI+PvmfO97iLiJvcrd+rDOntqt4TQ
 dhyVCbWOJ66Q9IEcpMknOexSMD6QKJinUhiURbT7KVMhhTplSuEZtgP+lxw4Hbe6SLJxEZfy6uh
 gY/r9iERttM/VMlh8ArAteU96QUX6w==
X-Proofpoint-ORIG-GUID: GYZRdqkDd5osYGaH3xOBEFIN8Is20H-U
X-Proofpoint-GUID: GYZRdqkDd5osYGaH3xOBEFIN8Is20H-U
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690cbff7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IN4UVXusT1ehFvA6WGYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_073415_767369_3FAFEFFF 
X-CRM114-Status: UNSURE (   9.72  )
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


On Fri, 31 Oct 2025 08:37:44 +0530, Manish Dharanenthiran wrote:
> Currently, retrieving beacon stats is getting failed with timed out error
> when multiple BSSes are enabled. This patch series tries to address the
> mentioned issue by the following,
> 
> #1: Reset the firmware stats only after retrieving the complete stats
>  #2: Remove the wait timeout to get stats for all enabled BSSes during
>  beacon stats retrieval.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Make firmware stats reset caller-driven
      commit: bd6ec8111e6546d01f16bb113aee1fcada6e86a9
[2/2] wifi: ath12k: Fix timeout error during beacon stats retrieval
      commit: 2977567b244f056d86658160659f06cd6c78ba3d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


