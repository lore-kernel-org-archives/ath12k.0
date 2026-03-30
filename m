Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0741061B1B
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uB7eB9kR1LYcji31gD2yBzuADC6j70gibl6FfhtVnUA=; b=qkeFhwO1tG64B88Q70BS1JFaRp
	mCvAo18GC/uwLhOg+coGp5ujvga8YK5oIrn9Q96Dk7QcpMwliGAq6kmybqJzOy+E42pZEeHgicXok
	f40rjEJFrAGvJj41Z6ZazCeIWkTrOUOROOJjJZsmiHjQNwTFa2JuPQ8cmJRQhTaNPC6jlfiJ7iWc8
	LMQmlDqF5FXLSNpdMoJmkWNTnqgqEdI0Fs8q9dTSVZtt3w9IeEfshGsur0SkdWOgLF6036sJXCEnr
	y4AAS2oa+WQrV+WnGEAalIuF+iVE6E6RriYALSIsV+3nYZpW0Hi74orqHXKJnKm3+V8MNEzdTOkDv
	vN3ZkW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7IRP-0000000BnUZ-3oHL;
	Mon, 30 Mar 2026 19:38:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7IRN-0000000BnUB-2ae2
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 19:38:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFI54G3174192
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 19:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uB7eB9kR1LYcji31gD2yBzuADC6j70gibl6FfhtVnUA=; b=I9t9xDszy7GuTtL7
	Ldp7s5z4wVrA+k4I01HlsJhunPp+ttN1FWkiy+iL+bGgJTVlN5K0X8zSZaDmoD8i
	VPyioQO1GeNcy0/HW6jKZ5GXD7enRk9GBJb8hUqvF6tV5S2TQS1pue2YAnQvdG5t
	reYtZJsJBkNe6wWZRiZka4pS2SxX5JpomTvPN8ZvCtAw6hDxDKdLHx6InYLJrqI0
	oYEIKmI4BP3+8HoA0or84O824venxans32lPYjrPdjGyYK+QrY5WUVQ/aRjbASnC
	EdMT6hh7M0q83jVUWW1uVZrKwL/xLlVMMB7sSc5cPRL6TDT4xA6KBU+SgG52eLeq
	5NihZw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h26k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 19:38:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5081863eec.0
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 12:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774899503; x=1775504303; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uB7eB9kR1LYcji31gD2yBzuADC6j70gibl6FfhtVnUA=;
        b=CZHDg5fjnLAEZDm07FanKY7dmbQJPIl+Vwa8GcgdzkKZvPZDsy+ADB5diM2gE+eLTh
         kCcApJPmMbGuGGIO/J3r2vkQexpCU3LFm4NWNG//M3jdFKGdyQGlU7gVyH1ADBduK/Qg
         mTvZdRBpiczP4jmFt4psSpbGIiLAnW8RIm4nEt2W0u7VzrnSzbk2TfsnJIz3Qh0kjHPn
         diOsjfJNkEdN/w1Vn08iqrS4epl6JbHzKSmvFeArXpRX2dK9th3JKnmGrpue/T/3Y4zU
         BIsuC/PebUVDZUUazil0dC66EjuEk9hgvzZ/oEjugHqi4RiMt3sccFeDAdEiSRy44quc
         5xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899503; x=1775504303;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uB7eB9kR1LYcji31gD2yBzuADC6j70gibl6FfhtVnUA=;
        b=paU+3ivYdATHY3W4KbbGRnM7KtwEE98EfUAolWOzpzkWiciBQQjLoKtyabD6slrJGT
         QQNu7B/lOvwDwpRfig4CXYOBHD9pnck1VKQbWSgs7P6vDYvVWicI/+wWXuAHPLZvTMqo
         whapixIeE2ty+SfGmORae3f6FiDcGetuvcpJgH3m0HSmyX1Rfa/B7SK3cjnYpzpY8Ybv
         TNTa/B8s7I204JoF3fAk2p7VIPBSXAuNOP9kn+qqQxePTF7M126q8pu2JBfL0hl/gJPx
         mJoGuE58nt6F0n//MFj0A471Ot6O8xaZnVPOhoY6WmOBi6pU5PLEb1jFsDQLVJ8bet+7
         X1dw==
X-Forwarded-Encrypted: i=1; AJvYcCWnVZ2a9/Iv5ryZqUNZvQLEOOYsg16FVQOLENSfAFoWhAJRjrYSbyzY3U+F8wgSbgkxAUnTzMA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3agY6a6gr0y5ZOD/pnsIymGp4lhnttbXBUW8RGaP3nt7h/uUI
	RUZ6u4OGQ1Wb1VznmymvSri1X90Okb+HAbBog5A4W8nESnx47jM+dLfa24Ou0cce3CQ09xwoA6d
	/pAfrOEmyt6Lg0ALe8aM5PLWfHfw4OTgsJ1gfdrdun0qBZltZ/kqF11pk4c5E/8Kkd5Pb5wXc
X-Gm-Gg: ATEYQzzUlNz5kGTgKahdxCLPVpesvbs2IjFdl7RC4Y1eopoSsaX5GQW/dE5yhhvG4r/
	/MhgIWMNu3o6MGSgETlA4dWo8pfnTIBMpY02XxLokVn2i0vM5Oc6SRUpVE4hNjVK7aX24fliMKf
	hsonCbDMhP5AuUO57CAo6Pa0dT7mdtJcS4m+LSyqawwJLGc9Quvr3mteOToN0FwBncq+S6NfS0b
	yOmq+exmzullYgYlwTsUFuN45BY4dMXHExch3kptgJaICBc2/tujSAjVPiV5VOyuD+CZY0O7ZJ7
	xtR+4GeCZrZHvEgGQ45xvRSrXwzZXO0tcLdVAPbQ0IEFWI8Yn1j5OX9ZcnEb1tfqzITkTo1KhIg
	EGAMds79djiuV1NRyXcFcKLl2CrZepwwy8Oz8cVTYeyKkkdxYwlFVbKLPfe8xiUIrXSiogrV2t6
	hPyeZPR9kYMg4fRg==
X-Received: by 2002:a05:693c:3008:b0:2c1:6cfd:73d4 with SMTP id 5a478bee46e88-2c185e8e172mr6729079eec.23.1774899503113;
        Mon, 30 Mar 2026 12:38:23 -0700 (PDT)
X-Received: by 2002:a05:693c:3008:b0:2c1:6cfd:73d4 with SMTP id 5a478bee46e88-2c185e8e172mr6729061eec.23.1774899502528;
        Mon, 30 Mar 2026 12:38:22 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c747e410sm7978573eec.25.2026.03.30.12.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 12:38:22 -0700 (PDT)
Message-ID: <a124d5d0-ef46-448b-b226-8642da61e0cd@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:38:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260330102434.13136-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260330102434.13136-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2MyBTYWx0ZWRfX1TviU8PE55aV
 MHg8h5I0LyTzjIhTA4aHFh2BJOYg7vDebUWK8UQzHIYcFmgOyEPnz2VL9GRDGW6T9nPhciCIIrX
 z7HA6xXq0Hsy3LHg18ZBk1i3x0tEKejO/ocgo4FfbWjR1c77PwLchopl/Qc/Pp8MQyBbsLfmed9
 jt9Fr2MczDNvalE/pJNFMxykyooch8JptZsXpQ79Mg99w6uRjB1uDU6OwP2WhxbSqByPVkE5suy
 WuutpN1Ng5aSaX8wFVdCR2IwAj2H/+7Snfc8pokGKYfVk0FcbwYtPCCfYyEkToWn1dVqcWSiNqZ
 rFyMercbODGq2M57JXTXLuHDuQghmd+iLj+Vlyy7oSuPY+Jcj5Y82XUUW/XxiENunCugD4mWgfP
 cfc+vyy0S7Zucf4fMJEpxZGTKbWZn46J39Z+gecQsxIuFBT0YRg7BgowhElsOScStjRuNWIHrh/
 yI4XqKlXFDMc2JR1yWg==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cad130 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3dl2j7VrEyBlj6byImkA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: x75h921JIwasFUuS8cMlB3P3QUE4K-0Y
X-Proofpoint-ORIG-GUID: x75h921JIwasFUuS8cMlB3P3QUE4K-0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_123825_799759_6F17996E 
X-CRM114-Status: GOOD (  10.70  )
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

On 3/30/2026 3:24 AM, Nicolas Escande wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index c31c47fb5a73..76060d448920 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2258,6 +2258,7 @@ void ath12k_core_free(struct ath12k_base *ab)
>  	timer_delete_sync(&ab->rx_replenish_retry);
>  	destroy_workqueue(ab->workqueue_aux);
>  	destroy_workqueue(ab->workqueue);
> +	ath12k_wmi_free();

nit:
the order of init is ab, wq, wq_aux, wmi
the order of free should be reversed: wmi, wq_aux, wq, ab
which matches the init error path

>  	kfree(ab);
>  }
>  

other than that, this looks good to me

