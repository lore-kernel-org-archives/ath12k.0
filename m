Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B046C7115B
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=; b=0cnSaINEqANeIrMDRqgXoyDKDY
	ng/15bRSKPjQKFyj0fVt2ohpar+Kw9PVOf9WHWHnuCvUFbOg3B3v09tzTLVJ288aco3NtZYHQDgpS
	8R6xWHf1mqf+M1v7a62DYZiZwSDMcgG5H9iqG85bdsIBo09Z83pSEQjuQjUldyGM4YQd5U/3fad+L
	oKZyBwfFUot8wEgKain3Wshg41EqqJOa87bROWiySwuNxsD6HOoW5MuqKRhAegcxpx+yTH1b1dK9Q
	qlblncGoxQkPd62pXIHzTUVdZVU2zIt0R8eUcKzhAyne6uRMmatnkFYmV63bc7cfxYiw47MZ/Yls2
	M03mPZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZch-00000001bq5-0XIG;
	Mon, 23 Jun 2025 05:21:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZce-00000001bo2-3agt
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 05:21:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3eavh029925
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=; b=k7r51ujpJXOuQlZ6
	COM0hvm2AuUmIXlK0QHRh1ZLaLNfpi1TQJb6m8Te4hiiotx5iDE0KgURTooRIDxr
	4uC2AkRRUT4gUana6dqki1XFAuLL1yRE2OnM+4+0GoACJpyjv+f9rw0yy57QrIOb
	JfGlalVp5hwb5t3oBk0zOKjjc/k0+ihYXw5swYhaqDj3qQPzQtgOCwxNExi2nzEa
	VQIuvgjW6FjROHXL3y9dGILPKMsRNklbpG+yHKQHgkuX6QQ+6OWqMJ5/hfyF+uQ+
	QaEiAX95hN3gUgmZ/mcGsEvJUkmfA1v/+T3qFOrU7leHUfAHm5XQlp1qaSMyiFFd
	dpDTVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k05yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31315427249so3769016a91.1
        for <ath12k@lists.infradead.org>; Sun, 22 Jun 2025 22:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656094; x=1751260894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=;
        b=cuj5D7BBsdp5Tv3Vl7T7T2OwFC14Taez1ICgYo/MmlzPDU6vdihDdGXvKPBNqpH7MN
         mrxrCGyAYed7+NjYPvOKVEXNMIeCvOuaGPqsSNpvYC3Ta5qDYZ2C6TY5KyEptHDzYkKJ
         AqWwbqDvk/Q4Zo0RPyEA0EbDa7cZTBQiiKmKeg32yyMvpiUuvZaQ1t82Yrmh3mQH9IAU
         voFc3VOiM4aSH8qh8z/SHLgoxEkPQ5QNAj9mVPuSWkUpubdYVYHcBiUGt97g9wDesfni
         GL3RJca3SrJxXgNybBsjgyZjT4zBI5P6a2w6mUcbkJKYuLced9DPTQIimZ0Tqbm0xLq3
         gPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoKsorI9lxWzjstL6xKSRBu6rjVBiVT7m8H0++pGOXynSyne6gdZHbRBHRJhYXhItRBrSVp5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCvQoCTjkbCAmecmsUDB6/1z81Q18WVEUp5FgzgmM1CvtclBq1
	cc18xtqKmDFEYZdfNIZ2wx059ZzGC79bakCB+hw4JFGuPuX2aohq6NvGRWbOOY28zYE1bFP4Dl1
	OOVtYn7VTEBsYZezaTvnEJqtHNdmp7CS9VF3Id+6WGUk45QOEEtCR6eccWPP8bopWfev1Iuc6
X-Gm-Gg: ASbGnctaiD+FpWMr4Qj1SyIsYrq0AlXM2br0D7xAZgXYfTYEljFS1Bb1bKRF9aM9qh7
	KB6lw+PFtZN3jlvcZR+mKpFzrKtHfNV8+M4sEifJfb7AwN20SmPdRQrHrWFBAEXivGd13E8vsqJ
	URkKVmQK8tlTjvO/qTbk2MrLpIwsYgEPqX+Lz9tC9ih7gOJ/lPPd2Q7JPrpxc2RkemEJFEgkBCW
	2q9FSJAVKH50w40V2czXloqJfEhNR7DTnNIf6LAdt5qChdmcWoGit68eboAxSVSQeKtKFvDAuuk
	escDBhyCD48E7QMb3ntXeFrJo0pWQdZRVZPPeqnaWk4etg3maMlOeF3j7GZRXpXg
X-Received: by 2002:a17:90b:268a:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-3159d646d0fmr19146371a91.12.1750656094583;
        Sun, 22 Jun 2025 22:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4lgU7KFjffMXbhjmtkB6X4i4vuMqMFcgqOcVorProC4mPzsKamEdzkFloaoYhhYFKhVV7Hg==
X-Received: by 2002:a17:90b:268a:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-3159d646d0fmr19146339a91.12.1750656094214;
        Sun, 22 Jun 2025 22:21:34 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a2f35e9sm9629365a91.24.2025.06.22.22.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:21:33 -0700 (PDT)
Message-ID: <f30000bb-cec7-bd07-3328-1f11578cd1c3@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:51:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 4/5] wifi: ath11k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=6858e460 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U89tM0JWt6iRefauG40A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: YYttmwcn7DR99MkxUalbjy9T2kHHFmxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX1g7m5y6PEGAq
 kG1Ggb8KwjR51e1xJlm/isKwFefXHx58d4yn0VZnrJo4NjltjDqIxSGZAApFEJJJdK8SfQR/wAt
 vmGaFHzd47pRAHE7PAYMSV+c1LEToIGm+RHa9B7GGnyfPO4ACAj/Un1tAeU+xqkhmKgd2RyKufK
 4oIQCAecnYCEjWLWXwXm4zSB6ebTSAJqlKYZt71AloXpfjZtQoDwq9aZbBWxP0KSl/7WnZbAyiA
 lKaMvTcG5bpJjDt8x93kcHaataMug3Kxagp/pf+ZAUVCWXL8SEfcalRxfwnFuRZ3yaQt5C3db3Y
 NkWyrzZayKFF09FhkPAwKGy0ZgJAMg1xxGlyPdFT+9nlnsrfAjQgW19cug/AadTPYI3VxJMhjYF
 bdBW0QmzIZL+s0w4MC4OdcYJ7KaTYFmPvec/ozJSA4eAqR/opqlKMrTQ2DyTbWUgS27LZAkb
X-Proofpoint-GUID: YYttmwcn7DR99MkxUalbjy9T2kHHFmxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222137_009789_76FE030C 
X-CRM114-Status: UNSURE (   9.04  )
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



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warnings:
> 
> drivers/net/wireless/ath/ath11k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/dp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/hal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/pcic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/qmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

