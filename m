Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF2FC02192
	for <ath12k@archiver.kernel.org>; Wed,  5 Feb 2025 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7w3JP/cVcIEQr/swGtrAUB5rPEohaiFbEvSqpR+lohc=; b=cW6LbqZgIm/RxuGVU/B2kai3tt
	UVuCHQwBxWqwduJ/09b1elXqx3h1ByZ64ael8O8OKht8W0lH3b8nyiQEcMQJTKKgwB8WU4Uzr+GcG
	r0QMjuSXdqcxrEc5odbb4bywtCkjmAbZYyZoYZfB4kcAr52awffaOyUkktYOwwui3EicV9RRBMRpv
	6j9hRk5NtDswSAMIY7g3GZNmBHwg0UX9h/J/PRvT2JnLBHsmX5Pl6/rYJh/wI6j+gvGONtOuwm1qs
	sUHQPVqt7kuaZBUkgK8GlxO+S3/jdmvcjIlbTCyQynQXnQe1cGV7MRtqUeFU8iF0xZ1ioAKtpOeWy
	8QoLkHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg6I-00000003UwA-2RpE
	for ath12k@archiver.kernel.org;
	Wed, 05 Feb 2025 14:09:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg6F-00000003Uvf-3mwR
	for ath12k@lists.infradead.org;
	Wed, 05 Feb 2025 14:09:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515AghAA024346
	for <ath12k@lists.infradead.org>; Wed, 5 Feb 2025 14:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7w3JP/cVcIEQr/swGtrAUB5rPEohaiFbEvSqpR+lohc=; b=XsbWZ5t7gLN1iOlh
	zhpC7Yl5Hxox1Raeoi1jS+a8dhUYhNxMqrWby2kBtItE73Ex/WW87zxRt/WdDehR
	BrwKvEkQsvOND4QtHgGNDvmFcbHYkLVfLgt9hGCO7002aN5Ml4mJ7+tZunJFP0cV
	XGC06RFYtfZfeWXemjX2U4dHw4Kh/pAJkfUS8BzzpxlFagODOX6q///MvZY8GT0z
	P6McwJPzyiaZo6hotZhiqmvJhYLXOFx8VvbbAnJn3EUhzMhpOH9YoxQbW2JgewNy
	7VhtItGQSdVdu+rlJcCML3v5Wi43ffZf1/NZW7cT9vWb5JAGLj957qObufjRj3up
	0yuZPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m6fqrg51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 14:09:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f20211df2so9006755ad.1
        for <ath12k@lists.infradead.org>; Wed, 05 Feb 2025 06:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764593; x=1739369393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7w3JP/cVcIEQr/swGtrAUB5rPEohaiFbEvSqpR+lohc=;
        b=GCCy4QX9B3d4dakZ6Bqv4oWu8gGucEfMSJPcZ772xD/0rXE3/a0GGcPYogCejMqcsO
         3ZOcMOYir24Skmnjd7zcnw94IJ+1U7pTkAgakPqz6JRezdENxGYRl4cGgd+BQCWHc1Pe
         7H04SD5iDAlvvnDvj07X5FGBn49clcx+MCCQ/j+wPWwF/gN95HHtiLju13TZ3yrvp6Dn
         kZ6Y4Iasb50K6ab5mX1VW2jiv59di9Gb+9a+bKrtd1ZdRPG7Q9VT09LXmMfZD26pYAZJ
         0Fd9JPpDFNbE4cUHNyoZlipd7Dt4H8Bb67Zbur1DteWx/kmrrIon9rMZdE8e/U+RvqmX
         FaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCURvJURJ4y5v3Gm1Wk17yhfBISkiJ5MITjBBAd6o46C7ZcAoOlZ9flizYDwtZrDtOEFEJhPE1g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjbMmLXeOwFWoPfk1EyMOTv1a21aVJ4Utps3Yz2uBSmXdCofWM
	3kT/H51sgaI7Jd83rEX4dd9HUGrtgddUZFQEabLDrPbIUiRnzGQ9fSY8dr2nQFwuaNkoAa2faV8
	P1x/lbqro2Re1DUv6KwOzsLV01JFqVeND5UGOG5mmkOsywHVkWlmETXvdrK45
X-Gm-Gg: ASbGnct31X7QCV7VqOCgpOgJo/zGh/HbMp5Nvcnffb+l6RUgPyrIUGLMwBlldH+eri0
	WigJcEFCB32KCLcvBYD/9aXdrfwn/WxoWnXMCYrePnUM/lGIHyRaHZvGkEjDe6ySdgDJRrhhGn2
	RoL0kdpj2utfJ42kE563qWeeLE9eFYO5tVeNbbF+J7LFQO0Xt1XV8NzRh4ZEtI7Ze7sgLpuK89C
	499r6IIaZwEkXpbL+UB32U9TstjcdGxcnJbgpKerziR8kCzVF+19ooI7H56PgDC1cT0e5+EInS8
	XbUxSWvvRQD2PXsMU3mKFQseWEM6WuTjOwlSkOIYt2qovNBLo3X0
X-Received: by 2002:a17:903:1cd:b0:21f:1521:42f with SMTP id d9443c01a7336-21f17f2a696mr48122835ad.53.1738764593466;
        Wed, 05 Feb 2025 06:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbeFDdmyITBvXL2yRLiW9RtO0gymcSkv40yDdn04oMY3HCR8afEkO7vTit6UHSub9bSjzYTQ==
X-Received: by 2002:a17:903:1cd:b0:21f:1521:42f with SMTP id d9443c01a7336-21f17f2a696mr48122475ad.53.1738764593072;
        Wed, 05 Feb 2025 06:09:53 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f052bc69csm33220165ad.183.2025.02.05.06.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:09:52 -0800 (PST)
Message-ID: <c1a8143f-4b5c-e6a7-c1a8-b294b369ce39@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 19:39:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 6/8] wifi: ath12k: relocate a few functions in mac.c
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v2-6-764fb5973c1a@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-6-764fb5973c1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gW38Ar7wg_Fi1Is6wlls-LVIC4QQnCwA
X-Proofpoint-ORIG-GUID: gW38Ar7wg_Fi1Is6wlls-LVIC4QQnCwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=703 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_060956_064109_D5AD3FF6 
X-CRM114-Status: UNSURE (   8.94  )
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



On 2/4/2025 10:35 PM, Aditya Kumar Singh wrote:
> An upcoming change will invoke ath12k_mac_init_arvif(),
> ath12k_mac_assign_link_vif(), ath12k_mac_unassign_link_vif(), and
> ath12k_mac_remove_link_interface() from a line located above their current
> definition. Hence, relocate these functions to above so that these can be
> invoked later on.
> 
> No functionality changes. Compile tested only.
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

