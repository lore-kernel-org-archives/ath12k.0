Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6948EC02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 22:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZvzfOvLKf+5Fzwa8q55gxMJ/U4kfYrn5TYho1uq/bY=; b=F1DMECKwjXsjWFG2c1AfX0jmOZ
	hjo1PHdQJ5U95Dt2cqVR9yVOTdI1cO55CYIXkwO1JJ6zyYVACyl61iCgeFPzXgefPOuIrPTZJBQW2
	+QdksyukiQvA8DWxmy3PdPwFa/054pYVYfmZGwW+RYwa3xGhE8rkJEhSXYYso2vLsXyx4ajhF2RGB
	rt1ZHVjDDgh2GlxYiht7okNeNeCyam75HBAYIiOgsH6gZI3JjjpNHQoK0eTCrw8JAABJUbcs/420V
	NzwxfpHos/Rr7c5NJjO+gl/iJJoJdjIzv2G5IcR/HtjRe9hxHZhr4Icd0DrjzYRwtxzpeI2glF7ch
	vTnTzQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXT4g-00000006rVE-0lHo
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 22:38:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXT4d-00000006rTg-28XN
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 22:38:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBlZOR006767
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 22:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZvzfOvLKf+5Fzwa8q55gxMJ/U4kfYrn5TYho1uq/bY=; b=P9Z5asUvKi2qM+Yx
	nPSPDK6YVJHlE9IiwhR19kAYHRJT5NYqDE27Ho2UDVSzN3CkjwvLWY6z5MTx4NnN
	WLOaVYCsWPXg01Kwn7e+VHEoi1Mlx+SUcXRzcAIRFffGiEN3gnwUY7vps7JENWBI
	8vfIACziT6XZPVsntPiFFBE0EcIefY7IueCgTypLCbq4080qo3hg3i42uP8Dx32Q
	KGrKofDQ6QmOtm7o7rSCgVCtEQAXnY3SZxIHh+rfjbL2Y7d6XjYwXE4awXvaYTXX
	eclm+G0H9mJ9Gpl2lq67GustfQBL6piKUnf9JgrZQA28Xn9ko+djjY8CdhzSVVOA
	WGLI2A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4452939pwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 22:38:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so8623617a91.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 14:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736807897; x=1737412697;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZvzfOvLKf+5Fzwa8q55gxMJ/U4kfYrn5TYho1uq/bY=;
        b=ICOzf2ogWTBuorH2d417GI+U+Q9idqo6ejBbdkNS0xGojqGrlpodViOlXue47UflQM
         36gHwZ9g7Cj443WXWPijrTec/TFMyO5IKS9qZd7onKtw98vzUjBvvLof3t77ZGJp9vi0
         1O0xkZSvNGYeGNeqNScT/+b1lJjvX3V38HIlRRs88BN1swqLMsuYBB0z1i/sS/uHFftv
         4fW5Y1tYB61lxDMnOROQ/mVQegOpl8e9xYJN3czyhMZMN0pecGFndbnpn17VOgCm0ZBR
         h1QXJra4obOERvnvzMrg9gdlI1T39TuXdsBP1gweDQez13YEzaFYRSVikRSbzj2i7TSC
         ExzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1S3IPGYvvzPFV9qRKbdbDxbtYrvpqSd+cCNBSezyeSGYHctLAb7D77WsyQjvy55ZFNqvg4/Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwS6ZPYrh91/52inf+Yh5qmW7Nq6Ox3PiQe3XENHVMq3HVDTWvG
	Dlp7dGqHxR4YTm/P25y4WAohCZ7GAt4jiM5+t7aO++oHr3gn1nOPPBcXVusuqomIRcv4VQNYy20
	av/S6B4SL9ZGP8/RRoyS94d3ZlVMKWkIcb7XHlqi/+Df8kCwVMhfPkIpDMnMp
X-Gm-Gg: ASbGnctS4AMggsRT51Ux8xojMmjlaHwuVYBN2eHWHkyXC6wJzNOjomwNPwBighag4U9
	j+PR4+ntmfMJZl/wUqtJuvxIxQmK/FYiyuxjB5rNNBo9oookwuFIGTvVYSMrI4fDFOJSVjtI0CZ
	m4Y+rfzfPArPtbTQc6BgTr3hAqc+qAFVRxLveKMpROp2lekwjGQPU/KVjhqPQxOYz6p/TNC3vRS
	yTCZo5sAlpq6wyZDUpru5JGqkUXgnHfBU9Fr/fwIx6HcoNdsIZQUnhw8IRMd+m/iqN4cqVi+z7c
	TRAAFaBNTtramj8G6C6nJn2dITAnNGq4+v57XkhjwYVkmO1+og==
X-Received: by 2002:a05:6a20:6a22:b0:1e0:cabf:4d99 with SMTP id adf61e73a8af0-1e88cfa6b76mr39138182637.14.1736807896726;
        Mon, 13 Jan 2025 14:38:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcl/jD+THM4UEXUS4sHdJMl3DOcM7PTeRnYg+SjC/mqeM1JaiM5rBz5NjNhDNK28rgJS71GQ==
X-Received: by 2002:a05:6a20:6a22:b0:1e0:cabf:4d99 with SMTP id adf61e73a8af0-1e88cfa6b76mr39138145637.14.1736807896287;
        Mon, 13 Jan 2025 14:38:16 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4054894esm6383542b3a.3.2025.01.13.14.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 14:38:15 -0800 (PST)
Message-ID: <3da0a9b4-f318-4a11-89b6-dd84e076633f@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 14:38:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: relocate
 ath12k_mac_ieee80211_sta_bw_to_wmi()
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
 <20250110-fix_link_sta_bandwidth_update-v1-1-61b6f3ef2ea3@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250110-fix_link_sta_bandwidth_update-v1-1-61b6f3ef2ea3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pYLd9HMlU5kLrJX6bmcAgiIyfUEr4hK_
X-Proofpoint-ORIG-GUID: pYLd9HMlU5kLrJX6bmcAgiIyfUEr4hK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=934 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_143819_682713_07BB9387 
X-CRM114-Status: UNSURE (   9.38  )
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

On 1/9/2025 10:43 AM, Aditya Kumar Singh wrote:
> An upcoming change will invoke ath12k_mac_ieee80211_sta_bw_to_wmi() from a
> line located above its current definition. Hence, relocate it to above
> so that it can be invoked later on.
> 
> No functionality changes. Compile tested only.
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



