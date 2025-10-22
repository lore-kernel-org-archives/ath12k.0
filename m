Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BA1CCD1AB
	for <ath12k@archiver.kernel.org>; Wed, 22 Oct 2025 02:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1I5p2ZuKHZE1opVS3btm0ptuyLkWXCKsQ8tiIaD/ZrM=; b=VcMcZm6rFqe5aXqQAftSZc1gZB
	zN54VOI8YBN3kLcbpNzamSDVlh/Ao1poK/y7bc1cVjwId3M5NTVJeVokI4bDI2ytnF5TdHUUTDJmg
	FbR/rm7v1YwKSgHgMZUlpxOqCLxNRFL4cn/P4CUZe6J1aMNVaNxT8ChhfJzrI13gwV0FqjsTPBUPz
	ZRHorQAdaPYsl9WaJ5+x/s3g1G2XSFWZ6KUyfkA3/ZmXNtgaZ2+zw0Xqm+TfAYYqoid3FJr4015ZF
	p+RKIDbcCIL8pABwSnSFclXc1GyjZN7ps+ZfF/ZYoe/a4ZEKdtxzQaWdhe2rCRvsZaPbCJyhmXb/9
	xUkgCstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBOAr-00000001CMw-1W9P;
	Wed, 22 Oct 2025 02:02:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBOAp-00000001CMB-0NoJ
	for ath12k@lists.infradead.org;
	Wed, 22 Oct 2025 02:02:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LF1FX0031062
	for <ath12k@lists.infradead.org>; Wed, 22 Oct 2025 02:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1I5p2ZuKHZE1opVS3btm0ptuyLkWXCKsQ8tiIaD/ZrM=; b=fGHZTgmxqUcAM/J7
	zNM/1v+hrDmhG2F8o9WB/Mxo/UubKYEHgbIK+UufFH1WI9bP/JlkIzJSplLXtG6F
	qh/9Ry/SOBJeQoCDclLOvq+mmnOVY824U5lZKm+ihgTIVyTHqSoQdRS4fOHs2GyX
	vnkuhR2j8S6T0Mv6NiVMMFVL6pvd+LzkUZL9MmqAF+XyVDefVt6GDcfPQM22xDe0
	YckSLivmhBxnL4dK7drRi+PM5saYqOxPHItnjrqM+7ewsZHsjjVVJNHan3hVzlkQ
	9N4GBKzSkobtG+MM0Ma7KKoXut5z4q1xHA4OGwPikRKgNGNLQWve9g3BxvV+Etxl
	VyhYwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kann7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Oct 2025 02:01:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so6581112a91.3
        for <ath12k@lists.infradead.org>; Tue, 21 Oct 2025 19:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761098518; x=1761703318;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1I5p2ZuKHZE1opVS3btm0ptuyLkWXCKsQ8tiIaD/ZrM=;
        b=sVd1yxfcPg0aNgmS6kafeGZm/kszJwE12jZ2DtJgfRk8y44F8yj5LSel23Q8Hx2T5k
         IT/5GaPIS6Ni/ci4yYRMO9eYwWzYa3Ku1T/Ikvv9sjRNzXIUqUxQRCky1Bq1dY0eMsgY
         Fu3N4fQSTCWbf6PIAS5dj22PN3A9Xb+oBr28th6OcH5rHXNycGn9DY5AAq5ljysIW+hX
         9jzEVO7/Jc8Y6Ojqd9v9quCa0GBreP+0Bw96QP/Xwad9qepy6YZSaBL+OQka9gPSL9Gk
         xTUMOs1s+w6ZVRCxoZnpfpdthth8ANgM1wIhJ4Tiee7URBepjtaKDgDqcEd5ts9ENdN2
         USVw==
X-Forwarded-Encrypted: i=1; AJvYcCWFYSo72XavKjT+C7UfNlRlZ147hX5yuoAkWmMw3fic+subo9ifANKeT+oi7LJBd8mW8vlUEes=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDn9RnzFTZd9nrIaH85Gye0j5kKUMQjX8D/0U4DR6eI0o3XvQh
	8fS9eRGI8P1aMKq0/ou7wD8xL4Gyx0ADvqvrX0eLhHRRVk/XWMGv+V32jPjP7hBWz53OO4WedVq
	TXS7WP2717RW9XwaPLlmxOJ1q3WXc1ePFJ5UQyWBWJHIblxVdwphkHOWKAUZrPuA8
X-Gm-Gg: ASbGnct+b/PjNkJbViijCGIZwVVBrWtfhIQwRmIym0NEmCP9W4jVq7yziKKk3Nr3JVA
	cisQS4+q8FYtp+Mun/9f7ezVe03h+6kOvSPTMxlIvNV/cWWwrZvbYFdQ6StULrnkmmR7CPq02Pz
	pzEPzQ2HnLIn6LKz5jbmRWM7RnokO+Z2sKHwwG0YkOt1EUi8VIIkh/3Jp7lxxXdjEX4utMPeLoT
	kSyHDpmvaJVq4E3lZUsBW9Fp9ibXl+BT4vSUxmKYe6Y4UyHcGcwtIinJOHT6aBTCz9BH2hH58aZ
	x6tAsdsJFN0IIb9Su2aU07KP2KNiq9LyC5AMrQTK1U2Vll8SG9IemhCOdUJeC3hjrqo/6800EVa
	koKKiPtz6LZzMq25bsZQCPSF13LR4Zv/HvCEJyrrgTR25RZFh6/1C2FoNY8RATwZpJgbAjjk6
X-Received: by 2002:a17:90b:3144:b0:335:2b86:f319 with SMTP id 98e67ed59e1d1-33bcf919094mr27154503a91.35.1761098517618;
        Tue, 21 Oct 2025 19:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyJap8BDy0ySxTYjdyFtOFYf07sWrLUb7sVpImSiLW49i3MvEvmF5sUPoiOz4B5dcTdP0HCQ==
X-Received: by 2002:a17:90b:3144:b0:335:2b86:f319 with SMTP id 98e67ed59e1d1-33bcf919094mr27154449a91.35.1761098517000;
        Tue, 21 Oct 2025 19:01:57 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34a94sm12829432b3a.23.2025.10.21.19.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 19:01:56 -0700 (PDT)
Message-ID: <306188de-8d08-4559-99d0-561ae85b45b2@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:01:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Assert base_lock is held before
 allocating REO update element
To: Sarika Sharma <sarika.sharma@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251021112204.323242-1-sarika.sharma@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251021112204.323242-1-sarika.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4mc3iFrgkxRMW33hzHZ18mdoiM8DR20x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX1FkJ1PQ+NftD
 fJlw18mVFzuWovgMOqdYItr47Ef7ScHFFtq14jBBz5NcNDPCVqZHhvIn2uGL68iMM2T0ueSvlsy
 Dt3nZIPV2pUfgKcyb5twg4SCV+Iliu+pmeLnpquexJgQYAvJpBaiWtYbiiy0kJTm4NdfzKZAmwr
 gPMbMV46ZgIdCBIi5yb/Xl90Od/8Quewm5s5y3JDygK0OsPoEOZwE3/JIxOJr+p/Su/2H3m7KyP
 MB7AAn+1+U6p5i0Emja90TqAM+V7/g+Yvx2VrgjJx9jWzD+4eUxZfUfICNSfH0UPksPZ8M0klPt
 42C5GedSrdNUDj6jyJDShZGGQc7zRAWkbJfiQuPwWNiM3GyyNkk79D98N9CGSLkwvWE/LmaSkUX
 qfKAvoqa2pm6ZL98J8u4iUxmsazDQA==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f83b16 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JwkovW8QCGnPCImCt90A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 4mc3iFrgkxRMW33hzHZ18mdoiM8DR20x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_190159_160372_ADCC27C3 
X-CRM114-Status: GOOD (  15.49  )
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



On 10/21/2025 7:22 PM, Sarika Sharma wrote:
> Add a lockdep assertion to verify that ab->base_lock is held prior to
> allocating a REO update element in ath12k_dp_prepare_reo_update_elem().
> This helps detect potential concurrency issues during development and
> improves code robustness.
> Compiled tested only.
> 
> Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 6c9f0839c83a..d28d8ffec0f8 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1089,6 +1089,8 @@ static int ath12k_dp_prepare_reo_update_elem(struct ath12k_dp *dp,
>  {
>  	struct dp_reo_update_rx_queue_elem *elem;
>  
> +	lockdep_assert_held(&dp->ab->base_lock);
> +
>  	elem = kzalloc(sizeof(*elem), GFP_ATOMIC);
>  	if (!elem)
>  		return -ENOMEM;
> 
> base-commit: 2b306fc6b1d00dfe85b3b80eb257256e2b5ba610

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

