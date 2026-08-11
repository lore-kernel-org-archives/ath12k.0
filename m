Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AD3C5AD55
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 02:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7bWfU9OcPL3SCb4TRXGcsCsHePl/fLg8SdLe4htIgc=; b=XL85LJKX0pj8OFK81PMjpRlvgI
	sJM1Nqd9mxz/d/y6yMK88qcnHMEQwCZJRspYHyuRc8tcG0GDIuKx0ATFaz3bFUHJUYN1uQ7LCkVj6
	WlbFIUyvx00lFBSYD+2EBCIl7rBcthFYVSicWu8B2f6GXSHpAdAqg+y7A9lT3O0GWCbQfvkTIq21X
	oXWANrTNpVqvqdYpxYYjlN0cC+KOgboeq23VzWrGKG92HMHlyfC0wYYeYuYpQIDw/8n+ww4SjNNHp
	cmANLCOyCfbI0tYMejgAXxXWT+BZpiaUiHVRDhIGCPgewK8Vg7/A6lr5ELSMWekSFxseqc6nCQp11
	Jg9y5JDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcHk-0000000DAc0-0PdE;
	Tue, 11 Aug 2026 02:32:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcHh-0000000DAba-1lAU
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 02:32:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMq1EK3047861
	for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 02:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C7bWfU9OcPL3SCb4TRXGcsCsHePl/fLg8SdLe4htIgc=; b=hwqGvKLX5Ord9dO9
	aA+WLQfBJgNa7NxXJILgQpxOv+PevzHAxiMt4y/SBLtlaM0Ad2+B0qT4SzPiEIXx
	mIeaDEE9HK6eS8Iqrd8cNtE5f0SRvz+2X3+Bu8XmBljoqV0a1Dph/Ubl3dT/d/Nc
	PgZXfY7xY4Qu74nxQKc1c+UWkklXbJcpE8ZwQwzlCdsZELU6r+DsH+BSfdqPhG8D
	Wg5f2H7wSFZpTobVoXWjaB4hqlLQ7/ea2dd52EKBxeqEQLV5u98JMBx70eT7ZW10
	pigRsD7A2Ok/9e+Ds+ILt099S/VDU6pX9vEmh58L50SUy6cFn1/WFOim0k2wTUvG
	DTfzpA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk221mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 02:32:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so472112a91.0
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 19:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786415528; x=1787020328; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7bWfU9OcPL3SCb4TRXGcsCsHePl/fLg8SdLe4htIgc=;
        b=cye81nIIevsa1w71Bj3XYIL+tMwfFOWJh6ocIph1aev+w1blEZKJizTq7j7xR1VQPo
         YjNxpqXoksBYvo0nVjrsqfmtAge50v4urbpxNDlVWImS0szzDVnp9hs6Y0KaM5krO0Fu
         RK4KKKt6E8fLpuuP8JlbdJPW0m3bcNes58AEbkTqPEM4FOxz6sO9LgOjhj/RXCKrVWXv
         r5a3IBbKKf3uQDNoPkCD6HwUidDfBN/1tw4f7iLTCzMjy8VXl2worGhnyEwRO26di0cQ
         jsJta26SGU8L7/uGoBsajIISNZeFKrUmpAMnTaxNZ6HXwaO+r+X3LVPGu083VxElcUY6
         GpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415528; x=1787020328;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7bWfU9OcPL3SCb4TRXGcsCsHePl/fLg8SdLe4htIgc=;
        b=LPWdx4n75Qgv+aS/plj6x9XhDsfJBZvbhfQGNoqeHqIyL7prgAyzLVpRVo3/ZwXWTE
         d8YPDSMtLZS/CPbvezi7rXntc1jv9gftOwdvLj5uijPXT7ZroBFtV2b7svJXaWdGBatT
         PR0AwsstqAqR1DpzXRz0gCKwbz1gi5dsE8UnRYtbnqDKINR6NcDNX/9t4vQUHpO6Rb9o
         +aIlA22/kp1L1fQ7ABxjm1pHgyZzFxYb224ulBM1Y+Vd/kRUTZyLCm48QgIjuz8jjmN3
         9YHx+V9ada6UNmW2haZlglEKgz8yHFAX9ObAOQYNbyyxDTNAAsnEdBLYbeWhXmVLvRMv
         zJpA==
X-Forwarded-Encrypted: i=1; AHgh+Rrnn8YzwZswQyL/KXafiU9FuLj+yZEggLo/q8OBpLVi8cfmjqiDT2OsSgOk+FRMbR1p7pcp3tU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2l4i+rjpVTUSKWCpMggpq7BMITBQytlX1EW3oZhg4ohNmMmdr
	VqFziXRnn+cIq8sGcQU9abtgJs9JZ06xr5zBmpGgHEoclO0Fth857bmLjrwbeRvCl1CdS0O7Vxm
	MWKmHttL/OeMGTkRPJAOKZmDo3ubXI/4kMPFPboQmNpXPLMCqWvXpZJC0KxFaioc6
X-Gm-Gg: AR+sD10gO/BQOWXZUqZ0C12L6Sh750HO571fzx0VIaU5XshQN1bUDRXefMQMPHaphgQ
	FGv26y3m6shq4Cj1iYdvxj8g0YLMyvKoMjBbjsCTF09jksZWqi/9XKTbkZahD8Xa9uIMUyiIjpa
	LTfanaKuU1DvpgWIsSTjB2+zE5Fa6oF5j3pI6fqmE7Um2k5/4l136hpkwdXWOQA6o5gDGrYqA8J
	+Ul/pPZS+EIPgNgngkmJAut5hmjijhvFYxUaIr5GoCuCQCKRlRbEiHsj4tW/J59jwplt9lmjEZk
	jH4rU+TwDhY6PQfwnTQE8go6aP4/UK5SG2oacc0MIWBF0b0r0m0s9rRQP2XGTvhoQikT3pi/G3j
	UEmpvj8+81+1qGNBHh7n19AQ/wWzTV26QOF/S2P8iO1MP+FToBcSdKVb3P1/tZCeDvyJxXeAS
X-Received: by 2002:a17:90b:1d10:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-392d611213fmr857760a91.2.1786415528065;
        Mon, 10 Aug 2026 19:32:08 -0700 (PDT)
X-Received: by 2002:a17:90b:1d10:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-392d611213fmr857741a91.2.1786415527554;
        Mon, 10 Aug 2026 19:32:07 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d51be07dsm1581789a91.6.2026.08.10.19.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 19:32:07 -0700 (PDT)
Message-ID: <73f642ac-6be7-4287-89d6-d6afd9655efa@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 10:32:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: clear dangling channel pointers on error
 paths
To: Linkai Gong <gonglinkai@kylinos.cn>, jjohnson@kernel.org
Cc: vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260811020523.387433-1-gonglinkai@kylinos.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260811020523.387433-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAxOCBTYWx0ZWRfX0TmwF8xCpMn6
 FsY+XALedj67S1She6SOahtz3psPAqm3AwxG8YpWtsveUs6DJO7GNny5AGifcdnENfaicnhtALI
 wTDCqNWhfRtV8y9HQ2EV5QTT7yqc4qE=
X-Proofpoint-GUID: r_riNWzUHVika1IFaAoJlWbBVk3c2eX5
X-Proofpoint-ORIG-GUID: r_riNWzUHVika1IFaAoJlWbBVk3c2eX5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAxOCBTYWx0ZWRfX8qU/m3VSDHNl
 2L9UCelgc104oEbLgAnK910tXtOI3j496F7qsEIXh1/6GJgNjS2lKA8b0ocRYKsxojv/uWYj1u+
 HIE6NiwxSdnBYt1h3VaO4ofGRqz9/WZlVhgow0Yglw8sGdT5yTRQCfIPsuMGJVyQRvEBRYNY7np
 oRBcVA1upLetFsfTMVbctTjBWEnmO8lO+lDBg02mTdcb1wXQxO56OK7oNw5RrhE9bIL+yQ4sgji
 8ktRp9kuPjT/5yNN/hHAP6WuBvaH2caUW0f+0KX5pxUsHoZGSafomKYoUGSLkBKTeI2a5jPHrAA
 0NOju/adS3fVFOjSHFUj49fk8im1IAhg/pKqoUPWsqBWoS26mL0mpXetSUts2qvmtgXPsy4BkPl
 JKtU69ewwy9Ue2kxm/J9LwrRCBt81CLy0u7eHQkRso1q4L5hbBzuAus0K84SXpJIbaw8jQ/7IZ9
 lnN5d9IWwxsLQd7PdSg==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7a89a8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CpnD9HFvDKrr3bQfTTUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_193209_484902_C47294D1 
X-CRM114-Status: UNSURE (   7.69  )
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



On 8/11/2026 10:05 AM, Linkai Gong wrote:
> On failure, ath12k_mac_setup_channels_rates() frees band channel
> arrays but leaves the pointers set, or clears the wrong band after a
> copy-paste typo (6 GHz free paired with a 2 GHz NULL). Clear the
> matching sbands[].channels pointer after each kfree().
> 
> Compile tested only.
> 
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

