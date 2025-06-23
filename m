Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65013C7115B
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 05:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJaUpKWaloU/fOL7e/dgz5PF5xRAJF3ZohSH7tC3q8o=; b=wBp1+Gvq3/Te5YQk1PSswK/l5y
	VUDYHGJazvBOnqFnjgiJ2W1eA6cIu5VremcHb+bTntOD+JILF8+S7QvXxnx7SGXsC1Hvpy2VdTIn+
	eaTiyF1poaW7P86x3eSmjW4IfPdX9iFbWibI3klhFp4uKQEveAZu1mzGetjqIJ66kFoR2an4lz7ON
	FBu/Bo0YmwSkCUZjKm4OOfyN4YfZaoGQ7v7nm1WTxVyqK+7CI9xtugeqOY+AKLlKPx+zXqRJ4rh3f
	NjTAyRtC3GCkWkoKQc6q46nx6DrObxRTni1AmYH1l6miTQMIulEdk5cud9HmPSLYEWE4vhwD9hKwL
	orcAG9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZcM-00000001bfB-0Xvn;
	Mon, 23 Jun 2025 05:21:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZcJ-00000001beE-49Y5
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 05:21:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNFXF2010397
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJaUpKWaloU/fOL7e/dgz5PF5xRAJF3ZohSH7tC3q8o=; b=TownxR+uzJuqqY22
	KoYUnXvx8s+YZ/yUUriG9339Eb3p/1eyAHQVikqRlU7uZRzzW44XI732s2ouzWw2
	tYWef19edun8URilL1g2xE0izHw4DsA1jjjwKRwcAv/z2fBTkH6VWOFSiYhWglb9
	Pzo5zBurDSCljsmldDyb2OjoinnGpmeH/VywkkHmMwTDlwGO9OiCfkTKdAWcohNM
	SFbEOqf9z9ucvXefHh/SZM/5lahrAvJX31VSaI80ZD1HrtTRjORs6n/S1QTWQpVV
	HrUjB6apVTGDGd6AelslDd68uv2rVtARtF55Wu10+xibS3p/bQFwGirPo2TOcZGJ
	nofbyg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmh08p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:21:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b00e4358a34so2272634a12.0
        for <ath12k@lists.infradead.org>; Sun, 22 Jun 2025 22:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656074; x=1751260874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJaUpKWaloU/fOL7e/dgz5PF5xRAJF3ZohSH7tC3q8o=;
        b=e+lwkVk/J/iQLgzWanVL/uislERWM4MIdaEjG2Hn4JubBNpCoeCYbUUTLdaTHJg77T
         qNhoHGzzxKgRtV69DLj7mdAb/8h7l8fN+idlhQdA3v6HAe/ce8SqATx3o74kmrld+Lf6
         J1QCGZ1JtXwSyyFsKJUlxfpBpJooV8AyWMxIBfqgoDtTyV9H/YpSd6MKX4aSjcWqte6g
         g1aRNHTTwXN5Edk/Af51Wzku0XlC5Jh/C1St7ni1rYqpvjTo7SjMpRLCTCj8609u1sQJ
         EWK5N/qD8erUmDROkm6LjSUBWeawKKRDFkxQrEyM6mUwSLjsDT6sBmCE0mYo3NJRzoDD
         I5CA==
X-Forwarded-Encrypted: i=1; AJvYcCVx0kFkeK16GDYhQgZDBAuPH2HDMXZGgql3o9h1IQUgonZpMXc6BQnlBY91pgOlDEzvxFUL3qM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyV1fL/xT6GaMnHZUPtYVGOCrmjoyKw433ywwWXOvQ6An8BDsJ/
	w3HEQV6ejA6Z08x/S3czGezsnUoesoJg0hNDaYu/H53aiv9rq60h3Fc8EP7iER55YEbtfLnYEsQ
	t8KiVxrJovgNMcwGZ68sDXfDfDzR23xAhyB7phNQDVX47szKBZOKcIrpwTTgthmI4ih+Spurk
X-Gm-Gg: ASbGncstW/kHXelycj8/dTo5miKNOO+A6CAFJI0v0qqrKsQopV/N55qCaDKTAo0JGIf
	G26ZbjH0NSIpWK3me6sIpaqYFujp1BW/5prH0hdafd5bxjXD1bKsrrPqX2d124i04D3cM2Yhlzm
	rZlLuzT6BQZ7v74uJfOWKQhMX9qimYJjpqQhDRMgUw0ehwPYAEBP2SIew1u/gRvBetVAvs3wJtE
	o+dTe8GAxzMHnLHJkeoEU/yfUAlAnytEq1Fwn98LLiHDLKfUBCgX4o5f3iUFzFSIaBNOhBP3teH
	YF8UaPKSkPoxL7UhnKnqnUEJhMNe9ah+OVQuEwzErcD23cBLD8NOUkYRYKRHi6Hc
X-Received: by 2002:a05:6a20:438c:b0:21f:62e7:cd08 with SMTP id adf61e73a8af0-22026d62492mr16734647637.8.1750656074022;
        Sun, 22 Jun 2025 22:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN6sXlv3E9PXQKKHrhj7infmrUZxL1XGkkL3NJcuzzaEVBliA6CDYcfDWdSI/EDBJMpScx2g==
X-Received: by 2002:a05:6a20:438c:b0:21f:62e7:cd08 with SMTP id adf61e73a8af0-22026d62492mr16734626637.8.1750656073657;
        Sun, 22 Jun 2025 22:21:13 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b32075895f6sm4116924a12.21.2025.06.22.22.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:21:13 -0700 (PDT)
Message-ID: <aa9c4dfc-5b70-3893-73d8-ef590189f937@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:51:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 3/5] wifi: ath10k: Add missing include of
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
 <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ysexYBKJxryVpFf91M8lxw-mDfWGeV-5
X-Proofpoint-ORIG-GUID: ysexYBKJxryVpFf91M8lxw-mDfWGeV-5
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=6858e44b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U89tM0JWt6iRefauG40A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX6rsfxOQ+DsrT
 kITjCyxk/skOQKWzIFsWQwlwKnOBXXruKMB6EHg3IqPy3sv1Mdm1Wca3e0grClSWUGV/RTfZrcf
 aGsR0PZ4+9cOPaBj5B20cjtQFr8dHuLFOGvttkymrQANUvrR0vDWXcm2IBZsoItafjPB6tzv8Ec
 JH2MSUvS687kdbiN/uH+C3x874lchJ6RB3fHPhrtDmamgdzyJAyGNgHeQLFcxEtWcD85+zOE7NR
 vScvAkxUgudZj5X8AGJVFiKV2OKfdozcvYNS2L1TrplQE4fI1EPIG85wZOYZ3/LsPSRSlO8JQrD
 dd4Q74BdZCKQGocF0SqqoW4uCuUvTqzjzxkmBwhSBGqpqjv7b+PTL0Ga24uG4KuJ7BAhNDcS81/
 4V/XtjUcDG3bHUXNrBd1EoDm6r4dJAZVJa7L8/2RHcRz7KjvsdIdsoTOzcZ7GGF05Mu44CUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=977 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222116_039589_DFD17AC8 
X-CRM114-Status: UNSURE (   8.83  )
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
> drivers/net/wireless/ath/ath10k/bmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htt_rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/htt_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/mac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath10k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

