Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169E6D3F281
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17H7VN6qnXXJuVQsrDHyc4u5oFUS85hKz7JjpkIBFxQ=; b=mf3nmMoX0k4o4D8pI0TD6HdjHe
	VhjAVKazeBdOM3o8YRimOFGx6dN1uOGdm78VNt29cWEYpIlOo2v2zMzxqbN+fqdPdDWSaW0WDJawH
	Fueze1rq0nolzuxU7CdJiKXxHcNqYZPgrJlRyp60gmIGDidqOeYHLSj2SRWg5mSv9NRzGYhYubA/a
	hr5O4qU8Gv8X/i/QWjn07GC6Tu+B0jhMhvE99qCp3d2wxZg+aZ57L4hh06EoiDZuFbcwnrx5qv9su
	zzJuVSdzBt+HO7Hny8P5wsPEGa7bUiCrWMJ5kg5EYXL+xI7skZxs0H4j/GV/g3PKcSJDCMjWPznVm
	S7Fk+a1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1t8P-00000001sjX-3BVb
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 19:59:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1t74-00000001sWL-09w1
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 19:58:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IF4Nc2029342
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 19:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17H7VN6qnXXJuVQsrDHyc4u5oFUS85hKz7JjpkIBFxQ=; b=enAOv2qVfFOqAZs3
	Hj+1SryuUMNEsrrYPma/Spi/PsFdLg8uYOHRd6yChn54ILaDQqs+HFjI6EhTbsz7
	7+r0PltmJrDPcGOyFJBcgGskMgL+6+CTVaqXL/oBpef2q2j9wYu97kfT73e1ZxDH
	SJk5XgYniFg2etwoCgSzXCgSp8pBKTnbx5jUn2XIIg2Lmq8Bg/mn+0OMS+PZ0YlK
	/bBUhtmRqoUaE1rf5Ya0K+zX4PQwvTleklv15D1w9L/h7Gbask/yZaFEkyiOwpAL
	GxbRjkecEZgX25ErYPk0uy8KlYj3b0e6LCqevfs5wCQhwb/RkUl+0wJRkDxKUHz/
	olydew==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bhbqadg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 19:58:17 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-83ab67710b5so28810339f.3
        for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 12:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729281496; x=1729886296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17H7VN6qnXXJuVQsrDHyc4u5oFUS85hKz7JjpkIBFxQ=;
        b=OWAdjyRX2SkA7nmpCzGySv59qp/zwLUlnHQzedWVHsuz6cX9+XnostRSwlO65hhpiN
         /Iu4dGXQEOUkkgUsV6nS0Vk5RtOAYRcZoZu5SmwhIOgEwpgFHeT4ayFleJ6TgRTLBpWL
         rANNL/V3wrZXLSdEKdInH73lt5KOaHb8KH+qypeolN9U0/X1sEPFwDe5sfVIM1ZfYvHn
         0yXuNkMV6/mQfXCRqag7G60rTOeF34p5JV5xMDIWvxJibDHVXaYBWiIhAE1uGtn9Ry1F
         EUVLjBbuM5H6j1m5ycnpt/i3K5NGzK+F4BuiVzoGddNJ+tPlUfFG0iRXmg52lbWwnVGb
         yStg==
X-Forwarded-Encrypted: i=1; AJvYcCUdleUq1QlJ/H91hESchs2e09bSpyyI7d36MD566OYpXIXtwPx+yVGI5sCU2lT1d4QDAR7JTLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyU82ITDlzt/9IO/72mQqjtl2GdhNzdhl8voFifiZtDlYUfrELf
	ONxpP1Jef0lcZg/ydgPw8X6KexpMunKMzCwqWaKZpP0vcmDtEPNaHaQBSy9fgciyAzT56ADbwp2
	ThS/EUEbrGh6AGwTFJwOi0PSpmW57fJFfRQamhxKR4b+xMbIQe7JQvLXePHDo
X-Received: by 2002:a05:6e02:1705:b0:39a:f126:9d86 with SMTP id e9e14a558f8ab-3a3f3fc94b4mr7183785ab.0.1729281496152;
        Fri, 18 Oct 2024 12:58:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqsPyEr/Lwj74Qskarn7NoA+u+1X8YWX9tKtJRLbScUlYeXVIFDyeC9CKm8mQ47T95ZjMwYg==
X-Received: by 2002:a05:6e02:1705:b0:39a:f126:9d86 with SMTP id e9e14a558f8ab-3a3f3fc94b4mr7183625ab.0.1729281495736;
        Fri, 18 Oct 2024 12:58:15 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ad506asm131676266b.57.2024.10.18.12.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 12:58:14 -0700 (PDT)
Message-ID: <940da07b-1286-4b88-8384-16ca2f996d90@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 21:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/22] wifi: ath12k: add ath12k_hw_regs for IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-6-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-6-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5DqeIUfGT9KguccuGRXvXqz2nRxesvx0
X-Proofpoint-GUID: 5DqeIUfGT9KguccuGRXvXqz2nRxesvx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_125818_123169_E6922A26 
X-CRM114-Status: GOOD (  11.14  )
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

On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Add register addresses (ath12k_hw_regs) for new ath12k AHB based
> WiFi device IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

[...]

> +	/* CE base address */
> +	.hal_umac_ce0_src_reg_base = 0x00740000,
> +	.hal_umac_ce0_dest_reg_base = 0x00741000,
> +	.hal_umac_ce1_src_reg_base = 0x00742000,
> +	.hal_umac_ce1_dest_reg_base = 0x00743000,
> +};
> +
>  static const struct ath12k_hw_regs wcn7850_regs = {
>  	/* SW2TCL(x) R0 ring configuration address */
>  	.hal_tcl1_ring_id = 0x00000908,
> @@ -1126,7 +1210,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>  		.internal_sleep_clock = false,
>  
>  		.hw_ops = &qcn9274_ops,
> -		.regs = NULL,
> +		.regs = &ipq5332_regs,

This makes me believe the patches should be reordered (or perhaps
this should be squashed with "add ath12k_hw_params for IPQ5332"?)

Konrad

