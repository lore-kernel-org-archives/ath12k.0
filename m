Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57FFFF885E
	for <ath12k@archiver.kernel.org>; Mon, 27 Apr 2026 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pe/DYnEm2mcAswh5FsvRHLeUipg98o7FWABSmF7Ql4E=; b=Ehsqjo/OcA8bRfUZhphSo5si0r
	BMGNfixK28OKxtopqb9u7Eid8aJGDSapFFgVMqxNf7Ery7hKIR6I3HHaJuH2dWYxncWWEc4C/5AnU
	YaPs0WQ3p3Tn2LdlxbhO/pLmnm8xmYFGl857S2qKQI8O9MfCQJBkFyGys0cZZzUOlsQlq8+Z9HnUZ
	HwK5b1RrdH9GgATRKofoem4LnyA8B7At/hizQ+yP9HTtt67cyqXjr+utLyxJge+3KzPJyL+SKrSFK
	fDdyh7BFXTg6tYrn9/Pkm62BZcMI2lrBcfHESdeUFbUxGtDcPyto6zkwzgZj4BoFVA4wW2SfDvsij
	Fp9xjt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKa0-0000000Gpw4-1Wnu;
	Mon, 27 Apr 2026 11:56:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKZv-0000000Gpuv-3ZhW
	for ath12k@lists.infradead.org;
	Mon, 27 Apr 2026 11:56:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TGWg3639834
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 11:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pe/DYnEm2mcAswh5FsvRHLeUipg98o7FWABSmF7Ql4E=; b=ffNeDWbD3B2JluA8
	aOAeSV22qwO52bl3m7HhFr8iDNLcsw/0K8uy85nK9q22R0yBnSGi1ovbKbXVjAWd
	AvKDoyXiiVwGmG4tRBvcNlNZkhwKxKQqgT2bvz7FBJ/vpl55e2p9J7z8ZG+K5B5h
	YAi8XfTHc8+XMwr6Tz7ECjOywZG8/4ZnA3Mp+k9e0A02eG46PtSljh4zURauxA07
	QVhurX3nYz00DMjEsT5RR8+z+RZAGyZ9ebkzICFXm4WCrAgs49ho2UiOOEDUAnjS
	oO8pu6fAeCSCoXrRC0i++RZ75nmr5ofVOw8Ga+94SLIsONBZaTn50dHVfeGk0Hpl
	uB7pZA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsya01ww6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 11:56:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso11398392b3a.1
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777291000; x=1777895800; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pe/DYnEm2mcAswh5FsvRHLeUipg98o7FWABSmF7Ql4E=;
        b=a2kljwWoz4f/3For+7qYs13BCP5i7eInjFv8PgZmZINiLyfgVM0iQr6ieJfgy4MirB
         MheiWySaKwy2X8njJ+kWiZ4iJ46lI15U0CsWx+FWDFPG6wCgZlvzdB8gGmLKcDWi+FhQ
         V6EoWME420vXyIW3eN7MICrZVvrfiNBmMF3HClCmHC58TxrF0K9ymmHRZB7thDAwYgHc
         7N9RWYGqtRmXuaCBEO4cYutgCgqBR/h9IgkZ0Ych1xPQFrt3VqEjHyxhG82s0b2wd60r
         mfWjc/fVsKW7s+YvZbBcx0CjFJ1XdlRD8kws5emLgMoCYMbcOsNin1YVoSwLsxDQJ/Dj
         5iIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777291000; x=1777895800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pe/DYnEm2mcAswh5FsvRHLeUipg98o7FWABSmF7Ql4E=;
        b=YVRdcGYSpg6UT3xbkYw/7FscgxvR/KTwp6W9Zya5GyS+0Z+WaZWrwTBK22BzN8ih7J
         cumnJvxyFGDOeCuosrxx75PbwQR7nmN4niYkECE2A2zyt5CcRJZz/na+m86SkKdZT6OE
         TFkvPCrVaZLlZ4ka9VnlOxj2K0M0lqkx8Sz4Ps9kgOOmswPxnVqCPFtgT6VdNS47j+Da
         zh3DWDqo562a1rL9TtDRWYlLPeJOvRNbCXLs9WvHpY/FDYXrcajY3uyMOnCVpVeocWat
         TIrJ5MDOetDiV4lVp8CexrFO0pkwDD3CPSr518KwklfQurGs2fdxnoElwGX1RPy5X7Rj
         NepA==
X-Forwarded-Encrypted: i=1; AFNElJ9xUUykXDUgf+w7W/3ZpbB/zZezl1GyOP8FKzBRx4gbjm+EzQiIwRhYCAQ2cBouyPlJfyGasfM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxLSxKSbgqUFkb2ItY8v7KqpBqJ2eaUNwG9ja6BQL3vsrZQ0xB
	Yh6IaHdTuRaJQUcPj/7MVGXkx8dai4Qxj3UclOqQewxmv2KUltQ/6JTjgc9r7eq5rmL3pQ0wuUN
	v1aySoj1xcQPH2AROZdSb3As7yQq1wmW8WeEjg/fprcgizCSsWfm1ajycEenWNx4tNaeWk8Vg
X-Gm-Gg: AeBDieuSZbNJfNo20hFmc+zCniHO95UtHNTWu/toKxTLM1Bked+sgCa50rByAVKIBWU
	XSYHYeL9Bsh63dt+AeylQi+Dw9J3koxBoerNdQPCzCRa1pghfDTYErEGqRRC62rXqueHXt0KEjG
	CpPk1+vHI11UJZF4dP6HHHEDACd2h2z4ZgJVh2HgkcGaxmbv2l07pvy7fsbwNFdUbs466Zq8nBS
	vhheMbZciOmJx3vTuMjj1UZCQam3o8KE/Mffwgpczl6rBJasW7jGfvzdU0VGGtMj8IUGI3gD5xm
	z+aLYwGs87aFfhlJWYnbr/hkjIx+K5ZiVxfdgTfd1bQpVZX79VhmbfX9ina2H+07gBnqkcf8JWx
	6lJoV1aXLZJtWcmjMycQwz2ppNYO8NWz4qzPBrDTCLxlibkLMH8FMjvKhQ3iQOrTgo7O/lSsUSq
	wlmCTqQtEdwDG7QWRZ3FZYL6mePRj4hOKzxUl8RYnt8FY=
X-Received: by 2002:a05:6a00:2e15:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-82f8c9024bamr46192399b3a.32.1777291000305;
        Mon, 27 Apr 2026 04:56:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e15:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-82f8c9024bamr46192383b3a.32.1777290999805;
        Mon, 27 Apr 2026 04:56:39 -0700 (PDT)
Received: from ?IPV6:2401:4900:25e2:c02c:2171:a04a:44ce:a6ff? ([2401:4900:25e2:c02c:2171:a04a:44ce:a6ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm40211861b3a.48.2026.04.27.04.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:56:39 -0700 (PDT)
Message-ID: <4b5f20f3-f29e-471e-aace-48e9616deca6@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 17:26:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: unify error handling in some
 ath12k_wmi_xxx() functions
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260422163208.3013496-1-nico.escande@gmail.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260422163208.3013496-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: auHqivSHuVVFv50XlWVS2NPS0ykfINRg
X-Proofpoint-ORIG-GUID: auHqivSHuVVFv50XlWVS2NPS0ykfINRg
X-Authority-Analysis: v=2.4 cv=DZEnbPtW c=1 sm=1 tr=0 ts=69ef4ef9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=KE8VTcUQ_TpmJMKzUYYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNyBTYWx0ZWRfX2YEjXI1Eh57U
 CioRPa0iBxPLLZD8UXeY5ljPQ3XeYMc4kPpUOA+YvStwlttx0WO0GN5VxHXupifKRw4GP7sdmlH
 uwsl+tSFy4v5UEnMmhG/15Xsq55YfOLdxpA0GOS94WzjiH78+E6rg/2lS1A77MrsCjid8N6CuPh
 AFMhP0SqraiGIYUlz1siTw44RrDprHzOB09K//gnEALImOqROT0r6G+g+d5I8lPWjzbnPD0Ynbx
 BT+K58/3UxngZDehSOJXkoyqFksG4G1J+XJp6q4NkYzF0rAOKhg9HKm5/pJedr9kJbMygVYf8P0
 5MwBLC9VnlsYxVLcAEWe78K+ozFblTm35YubddD1FUUY7PB5/vgcDUoPAViIwQqc+O+nfiEFjYw
 ahGCwJe1okc4HRqj1bM6sMsl9Cu6TMnScG+85op1/mclNdRsDUq5cCQs3ycMz0QNf1L5dUtpX/n
 Mh7Heo6R8d4RL/9Nw8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_045644_014743_935A8196 
X-CRM114-Status: UNSURE (   8.41  )
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



On 4/22/2026 10:02 PM, Nicolas Escande wrote:
> This is purely cosmetic changes that simplifies & standardizes error
> handling for functions that ends with a ath12k_wmi_cmd_send() followed
> by trivial error handling. Saves a few lines of code too.
> 
> Compile tested only.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>   drivers/net/wireless/ath/ath12k/wmi.c | 32 +++++++--------------------

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

