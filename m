Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3888CD4A5E8
	for <ath12k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuLJNLpxrpKRcQQOT12hSAWbkuI06W11486MDDYJ4E8=; b=Rxm56p45V8jfG3azSKe/U532+p
	EiToY/lic3v5u8CQwLWfsopOfSfbf2mktuGL15vdI2DPZQ20/Aiqq01SpJElmYugk0c9ZHVnYHNRC
	c9cZliyZw4qqT09l5wNyf09cZFIeUjZWWMIbGpG9AnV/xH3Qh3RS4xUZlly16SP2Y9w+Pg+1MFiCX
	7QWssJe+PL3XwTv8pmRILXA4n8YudBs3vYh+6v705pSReEuC6EP6d6SnGk8/vd7B7SOdsOjsf9IGJ
	TItaeYaKr3xr13Vrnbg0N68/A22CcSlqqq8yQai08aDscaM0wub21mOX5Ykw/E5z7tfI+JgK6p+SO
	fuZKrT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcI-0000000DQ3X-43DG;
	Fri, 16 Jan 2026 01:27:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcG-0000000DQ1j-2m8g
	for ath12k@bombadil.infradead.org;
	Fri, 16 Jan 2026 01:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iuLJNLpxrpKRcQQOT12hSAWbkuI06W11486MDDYJ4E8=; b=S3n1C4LGSp3pevNZrlEST3UvCj
	EDb7RYgQ25YBGt0UdC/jdN3n5KSxfyBYm4AGKmIAt1pV2hnJioIad+HR77w+Z2/ohkqLA9I11cpDA
	fX01ADsTndgPz3x51grBtV9ZxuIFewamW6o03s1x68xbVdORG828HhM62X17yszWCE43oxHFrQOpS
	W+gICkHcHN1aqlrD68M0Z2UBNgjpv3JEbgj8VRoaU6hgxuxtGghGdNW1xxgvFMYVBntFkG/XWO1oP
	7GK3INSkuDacPPnwMKR4zo2NC1DvJ8ffkFoPb7Ko9Zz8oGDBXohyFERyaZrvck+f14Wjxeq5j8Glc
	TxRVs/lQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYc5-00000007tYG-2buk
	for ath12k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMd20C4101603
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuLJNLpxrpKRcQQOT12hSAWbkuI06W11486MDDYJ4E8=; b=X01cMpR5TThEyvbB
	xvGpt/JXRW6sY10c/kFCc4v2yvMMRKten/ac/Y6oVtgexWG40/8H3wNuVUQ2sY2j
	an4STo0Ykvd9lqgavveM3xn6mQh3KxdWwyeoEYrDKtC9zSSUNs+p9njoFb9d5Fzz
	IY3plKLzXLqTx82eOcrWaa9gM19q0yR9080prPUPfCQZkEz3gytSd1ZBcH9HJ84c
	t8yCXV99Lbn/EeHbxCPqF0j+AQ/Dy9mTYlN5rg8t7fNimdyPU7tyKN5ySmML032S
	fozWq5R/zbzDWMa2fiOP5dvaqrCuO9Eull01lf9Z+Ss2r0iRSMXpaP+eUikDO5p0
	zcnZHg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9750au7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae25c02e7bso6532058eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526814; x=1769131614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuLJNLpxrpKRcQQOT12hSAWbkuI06W11486MDDYJ4E8=;
        b=er4jzx+CUX1fhNJYciHnn7s7bUQE4+Z7kwCO9GHfbf0qUMv0NdMcyGopidnNoFDfXh
         UYttwImK6FAO5amVR1WIXCQUOO8rer9g0+zU15WimYKZiddnq8u4RLJ0EQoyE07au7HV
         cWKCG0VARQ6gKw/535h0S33iz3Gf/szZtJY1ooqLd685qE6eMeBQHadIxNfwt/ZmsXFL
         IJfQMfOiD9B3WKCMc6BGYVCs1iYqa+No259fjMohCdWFkwOVYsluhWylv6/MOf7qIGES
         tmFuHTXGTFlteIpocJ5mwMhXENu2mgQN+dn52IsWT5GTOUiWKzIj/J2tsWAqt9HWk3Vh
         NyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526814; x=1769131614;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iuLJNLpxrpKRcQQOT12hSAWbkuI06W11486MDDYJ4E8=;
        b=Rq+EGluPSpnQ+GL/H4I5lroNyEwXHdf6XW2CriuclrN7LyMv3v/Les0UH10Xc1E5tY
         4IjV2UMePADp/qNww89YZmQ9J6HCVL2c+ZtCDrXt2ClhRbU8txC7wxrYqDkrtvrM/XA1
         XKRWMnFT9CEbZt60kX2y8YeW7mhnkD1F3UTshqUPu6TXyVtFdHDzh74fRiIWFmf/cheT
         w7rLk4vIirW4GYJ9PGS1yMMMfJo4uUjCT5t9rgxV7vhEeqTYMgBQqQApW/szFSCDpWuC
         Ms8edulViErACZpgiSRuvvmEgEiAeD59InFfRQt3GQ2mwRQHfCnCivfbl+0cu1N5klrK
         Vwsw==
X-Forwarded-Encrypted: i=1; AJvYcCU4vgXIht7xyNAjAJsJeZB+xMvUX2mDKJa/m18k62HaTbHkgcwyi+5xIw5m79hdDrE54ByY9ng=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUPUcwgwaTFYKgbaIN/OuFEZgSsYwtlM9DOKCo+coWvkW913eO
	GViXQwfnsdDXAcu+ft23fFGhQwRX5MxhMQBydBPPSyYlRjS9jfTSgYAnX+syOO3whsSwZbCaDh8
	x5M15HP3Yxi20Kyf8yQpXLVTOs/DbgCeAqYn7v04fV+sUtr68b7Q18ve7tFjxpAxh
X-Gm-Gg: AY/fxX5FCmnBSvBocUgmeQ6LkrcOPsRM0mRzqdP8ohqGwWunXG+K96f7gOumeq+FGrb
	DvYyff+mixKR7jjbP+BKZe/aKv85baJDUI99h2XzJ5+3Rn+G1nrl2Zk1zka9I/ZwxqpoKgAz7jU
	qlMemu2m7KCCVo4JsA7EZVGiIWLJFfKlyRRRfyYo1EFR4QrTGIMMQUQ0t09oUOSpL4/07OoaN0J
	dOL/oh7ZuD4xm9LIZgnq06VD4UMezHcE2oZJxg0dwLISnjpQeOy9MoYdCYZfh1WMD+6SJJCJ5B1
	imQLjrNOihlcwRLFnmFz1nEMxuEB8AvNCeeIpn1uQTz6ozW7hkq3v79oH5kdvezv9ntkGRndJ38
	CcmbKUhL5SwBfOeWgrDxeFiyznsHl5AmKaUHUCQl9salBL9Kn9n1ttnze9IrsiNMU
X-Received: by 2002:a05:7301:7c0b:b0:2b0:5bbd:eab9 with SMTP id 5a478bee46e88-2b6b50024b1mr1315913eec.24.1768526813496;
        Thu, 15 Jan 2026 17:26:53 -0800 (PST)
X-Received: by 2002:a05:7301:7c0b:b0:2b0:5bbd:eab9 with SMTP id 5a478bee46e88-2b6b50024b1mr1315900eec.24.1768526812988;
        Thu, 15 Jan 2026 17:26:52 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:52 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20251103-ath12-primary-link-wow-v1-1-3cf523dc09f0@oss.qualcomm.com>
References: <20251103-ath12-primary-link-wow-v1-1-3cf523dc09f0@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: do WoW offloads only on primary
 link
Message-Id: <176852681226.1143034.9662809226271076709.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfXzQo10xq5sMqg
 4Fnt7CDDHwymLqjjwq47eCguD+qs/E2OZqLlMcx6pmZ8b9DusWgsslAZ4fQHgdAJiv8WgG+0fjh
 C8gLVNtc8xpzFcxHVXXEGoRFIRDOQ7fDQSrF6l0BOZnFEP8w0QGIW5jMg/uvccAdn0ZcW4mmiMV
 wTKxi49qPSyyghMFoQmkESS1+ZdtZTcZtLRX4a6zIckgIw9LsELbqpyeM63CdN6S2Ll0Ia9iN6m
 cB4jLwVHaQG4W9MwZerbqbMJVEP+JhZeNj74axz+RM7/BrLKKDvGMlV+SbiKmlV+GFnfUCTt6wl
 1jhT1arqtbBHLvcuuUKMR4rQrnbnbjOBdYztOkm7bjd40S1Q/+cGR5tDC9Ujp6GvRk0wnNdsv7s
 xg+c1SVUzD8e4PU1W6wZf8+ADW9eQ6QzCOla+lmgrGhiKwQtIBXuWg98rfr0OkytbfKLql84BrQ
 rweSn1oNaEvF2hBq1bQ==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696993de cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4lmNr4T_BIov7qbIXHMA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: KmAX1t1Wx1rEVMvt_LqQ9ee-hl3oZGnC
X-Proofpoint-ORIG-GUID: KmAX1t1Wx1rEVMvt_LqQ9ee-hl3oZGnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_012702_599346_B82BB1F1 
X-CRM114-Status: UNSURE (   8.16  )
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


On Mon, 03 Nov 2025 10:44:49 +0800, Baochen Qiang wrote:
> In case of multi-link connection, WCN7850 firmware crashes due to WoW
> offloads enabled on both primary and secondary links.
> 
> Change to do it only on primary link to fix it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: do WoW offloads only on primary link
      commit: e62102ac9b773bdb08475aa9ca24dea61ae98708

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


