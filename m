Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D69C71130
	for <ath12k@archiver.kernel.org>; Mon,  7 Jul 2025 22:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dg+Hw0ROdGKV4nVLMkPOMGgTA6Rwtxjku8ZqhgD0kE0=; b=D1MIb/5tUvOr+nY1uoQoaZrb/e
	YdD1/m89MAGkvKIQwN0j8Yn2pDDn8WjpF10uyJoZwD/7KW3wQiNVCmMfjtPc38LcT+UoHUoJu9gG2
	l6Ji4czG75QFGilWRsMcwMwHjBX6GiBrhWc8jbmjtCdnODr5wVszGMHF3Z4eh461NR4I+XgNa/ZgV
	oicxXSoZFbgtnhhVWjytjTGOODPgPKEutuZIUPnXuW0ooBixaF6NhZ2HwmXhBcplagcPkWoVA8axS
	CeW0GC6yeIKp9QDpiod9+F3/AiqY2+bYHbWp5y06FnEuYNXUHAqq10ZsQAXsJ7gB2W1ggDcwHMUjT
	8+OJey4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRp-00000003ih7-3P6v;
	Mon, 07 Jul 2025 22:36:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRm-00000003if2-2pLT
	for ath12k@lists.infradead.org;
	Mon, 07 Jul 2025 22:36:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567Cuxux014403
	for <ath12k@lists.infradead.org>; Mon, 7 Jul 2025 22:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg+Hw0ROdGKV4nVLMkPOMGgTA6Rwtxjku8ZqhgD0kE0=; b=QtBukzoe94hikFj7
	ukY/9Leu5iEb2NpBppi7efmrQmGJCvNK+vQxosyCFXj8U7iOF/mhGuGozyl0/T0p
	c+Ph+i/0sqIh2IM0alJgXVI2cHnAk0O0uvxov7NQ2FfI5iD0yqpVtcm/h/LY2P2g
	Hwb35w1enj9GQytWbYnGnf/WLlfnMRMR7pf8vc1gFFcfzuy7O37eGvmBRkGAMBbd
	7UQDdr1uAEUvArDRzLZhlssTs2vQJ02QQH3l8slf7WztvxkNoDky6x2PyQ4Dizwx
	gsX/NoDbe6PGpgWbciQYUy1T0F9yAaB0F92gUFCCQp7JcbHiGnngv3EQA+miXWR1
	p/VbDQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0pgrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 22:36:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74928291bc3so2702484b3a.0
        for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 15:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751927785; x=1752532585;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dg+Hw0ROdGKV4nVLMkPOMGgTA6Rwtxjku8ZqhgD0kE0=;
        b=oP4xKrct8XMO0xp7Yp/W2LrGGNHCUO69P7QE9OTRNuH1ETT7TRT9dxz1fiRgMvHkg6
         WdVs2F6zenRbwtvKmsNxS0d5vBm2LEXNAN2OCB00viRXiN7lheqTYGLOGx4q5yOZ92Vn
         WUwodZzuZkz6FPYejE+l13j2Vicef4rVjxPA6wOOwT7FHNgNaBu9HotuLRrJMaaZOyaq
         rzR3JHf/RP3L0ZcfBO7cq+agT7vyOD0nAdO7gUDj66bLqI75AO70x8OTvf4QweMQYs4f
         cVvbtFspojBobNKvrfUzzK3aVrGwBc9RfN/4bU5mF3pUoVa46Pi0fIhWRbxIbd4GVGmj
         tpyg==
X-Gm-Message-State: AOJu0YxYnI8TpTAuqTUmGkWCq+YmNOMBcbp0oyW+n8utlUvSNFePBrq3
	AWJTwYxc5YTPBqokT7wKgutRyEtyViyy9L1+DoySF6JjsDus7VC9IySV78z7wm9ciguLAJDlfJf
	Qjy/Iq+delR/o6JD8Gx8DFtZidi6Ndyxsfn2/kpGYdx1oi64EHWpF4q3AjpphvlPX
X-Gm-Gg: ASbGnctkLMjkt/AHnRryrClCIJWgagHYj7eus5I/vknXkkLmPo8afixBHOBReftscsm
	hLtGftnNIwNByAV+Al/L77NpNz3y4MRfDZ3Pdb9WxORJEoErOvk1ucXtx65UewIkgCm0IJRk/2v
	IiQLW6o2/rZUZutGqWWIKZuEZGESiI5ynIcht7xtO9ScdSdeUd6ophWVzFjBsQbdXvmiHI93CLH
	+K2QtDUh5b2WgQyqVrJaZWN1344rhS8HJL9BiHU8mxrCFtep84+MCCOOBJjxZADoTN5Tftr1Sis
	Pmt2AUod+eVXbkgzwAEt1/w2j822I1+Ndg5Aw+asU9eSnR4vR9kZcI5qPZI=
X-Received: by 2002:a05:6a00:14d3:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-74d2650ae3bmr671456b3a.3.1751927785388;
        Mon, 07 Jul 2025 15:36:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3B/oTaQPCw3zDRRXcnaTveyZPduDXY+7E1ad66TFZ+VD8PffhYo7MAieTL/tkjAT7Cc/CZA==
X-Received: by 2002:a05:6a00:14d3:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-74d2650ae3bmr671430b3a.3.1751927784951;
        Mon, 07 Jul 2025 15:36:24 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee6358edsm9668064a12.58.2025.07.07.15.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:36:24 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250630044531.3490058-1-quic_rdevanat@quicinc.com>
References: <20250630044531.3490058-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Add num_stations counter for
 each interface
Message-Id: <175192778423.314276.14086433447381611503.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Jul 2025 15:36:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686c4bea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1wtqsGCssgQoBpRYdnoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE1NiBTYWx0ZWRfXxC4IF7YxlmrF
 Q769g78uAp5GlvphloaQSzNDoqYsVisMgk2QYrXSJyFz+QJu3sHFOcpacLiHjO44qvi9TRHNEIw
 Le0uz7N3yyNrrMR72vyOeMQDZdXvwsI2r+cd5qQBWlroBCoJ2lNutR0hJ+8RYWVTANuxPlelqRf
 pIQsYkzHXhdIuA3abKDHk/CKDw2J3DnH/nX7Kqj+rgJBoUQApx1LAWRs+7tUgwQxXU4tx4EPysB
 UXmRg0tmyp7wDu9kSjoET/BQBRQXDfH92Js7qc1wBoLRxrNwYyXZAAnbB/YvDJlq9pGi28adQr2
 B/PO3EmIy3BbF6ynRSjFCi7LJfTffUd88jcYzFBcCOyfdHJjvVZLC13WY7+vYlqfZx/m0aBzJfj
 C93BN/StK1heNr0PXQrpHXG/mkN+BkfI2kiOczROJGMxZwXfeY8EGuN/GLJ4oyUeafBsXRYC
X-Proofpoint-GUID: MCAUe5YWQeTT5s90_46lu_HvaZVv9TxD
X-Proofpoint-ORIG-GUID: MCAUe5YWQeTT5s90_46lu_HvaZVv9TxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_06,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=757 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_153626_720583_44D37E6D 
X-CRM114-Status: GOOD (  11.55  )
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


On Mon, 30 Jun 2025 10:15:31 +0530, Roopni Devanathan wrote:
> Currently, ath12k driver maintains a counter to store the number of
> stations connected to each radio. However, at certain times like
> debugging, it is useful to know number of stations connected to any
> one of the interface in that radio.
> 
> Add support to maintain a counter for number of stations connected to
> each interface.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add num_stations counter for each interface
      commit: a1bff3d6cc454d65a3a654cd3fcd0c90f1fb45fb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


