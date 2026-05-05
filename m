Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C207FF8855
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtwhP1krw5gxzVdK24Ap272UMoM1xYvVLuOEy5jOM8k=; b=lVVjGaRopuhT8Gbwj/MIuhiwgg
	yZTxWOYNeqM3UlsK5EiSiE/ueBGDc0gGTrcVmm5uWuLn+1178kzVCOaDCrOojzpm9XIjEscjDN48g
	ysLugUCN/wMYpgBQgWKf/UfOsSv/jzLtumzPcMNqsArHs/AE418t7/83M/6TfJOcBF5v7YDV6NZJP
	lrIWw0JrN/6Hqsz9c6ToXLLUkwfK1qRsUTFxpv+tUeMllU0mKH37tYlRpfVt/7hsEMSdTpPVtifOB
	AjIPRhXV9vVCEPsnI0N96i6vKQXwqf77aSFaCkK6aVN7J6U94X94qFhf2J982dtMLVUFzePBjB4RN
	PdaelQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGbX-0000000GUDZ-49f7;
	Tue, 05 May 2026 14:18:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGbV-0000000GUCv-0Gcz
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 14:18:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458hxRa1346303
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 14:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtwhP1krw5gxzVdK24Ap272UMoM1xYvVLuOEy5jOM8k=; b=PoCpCyXzCO+39onc
	qloh9rPeS6tZ/mK00EgBsgowsIfvAFyrRThbO947bsp9AnhUN0ByXh8u1X5Q3xz9
	GjWViSINvvft9MnRHroBVTaHuHS7OwSZNiUD3jh/+Rf9xaXrZ0I4TBURo/1PHOAE
	qhI/4ScAMAC3p0+mArEHj56PAcjCkvbS1K39ncCSN2+9c7ewRUiv5VhtHsUvsTuE
	vPJYJ+VYN7QFo9SiC+bcJWRs9fE+pke3kZjmvEejY4w7/XDjcOX5JwH9a1QrR4F3
	37c+xLyGfFFpea1wWVo1+G1BHKG1aKzsbUFKxThqvNxtNUoI9+UhWjYF9l6CgXbk
	M2mDSA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xcf8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 14:18:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2eebb099efbso9724459eec.0
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777990707; x=1778595507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xtwhP1krw5gxzVdK24Ap272UMoM1xYvVLuOEy5jOM8k=;
        b=az66oJ3Cdgqq9vWxh3Ow3UdUW9AimliwKq4hadf4GuOMKjkUCW8vMI+Vw77VRjRB9G
         vta9ndiZoVrLqgeSjtLz15tZ6iVmYLUwbSZE7Z5ZxAAVeuCZFsdy7ddjrjZtK8Qk2NfW
         xZu9R9clK3VfxvTn+ZdMYWTgDc7LxHw1gyDY2aY+L3qpookyVhyCxp66xdGLO7D+Gs7C
         zX0FA40q7CYhbUtxsmmau5OAtXJbPEPX4za4QgU7VFWMck5ykIHOSFcndkyg6hrHxl2L
         fhvlscL+tdqcfXRecbkErvmbHFAiYBIshB4IqDGDsjOcJ8YBX8/YAQVw+/NYYSLus4Vb
         lxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990707; x=1778595507;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtwhP1krw5gxzVdK24Ap272UMoM1xYvVLuOEy5jOM8k=;
        b=bLcOuR/DO2+o0Ks3JW2a+rNFmn+I1WGtWaGOWD2PuD37BVM/CtdIQGXOjYEeikmPjf
         Sojyq8iuh4jmYa9XqGPMa2XRviEjtKlp5zIrR2DoSh2lFJcvCsossX1CaOOBxOtNODBb
         lVA6kyk4mds7l6GgrIMaGdKyn5Ovc5DFvwtn2kixLjcXmjDc2FLNAubjzNy+M3iOLmlt
         zB5rlaT/t/lJyGsJLE49xSvBkBhaB3WKGCqv3c7pzqBwcfqyRk1r4GVokuDDMxq77uoG
         s+iNpcTax9UOGA0F0CuY0wNSwA6dPgNjTjnVWUR5BRK/MEZkr3C+EO2VfRfB4+jARVV9
         9T5g==
X-Forwarded-Encrypted: i=1; AFNElJ8VwKEj8F23lWXPBnpHfzGF0TP2eNjfl0qfZBO8stXSP/Zou6j5JgGm9Up6JnxbNJ5xp0lddio=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3b4CsBTS9J3OyMDifzSegJMtmT9+zNVUlwaeBqfCwITfx5YLx
	50HqtM4el8tQfmd7LqvH7VWMzySx+lzB5i6Sk/qXe89/wOeM8Ta+ok1/5oXJ0youAqjWZpp1+Kx
	5oXO7HWlZ/Sm45OOWL9i0zCvI9iMGk99RlOOWwVTtttKeVPcH3Xwyumb5eRcDkwYjf0qy3b7g
X-Gm-Gg: AeBDietVIeY7kJxvTqtYdyiukcZI0kPNHouBT1gpSoNPphpzPRJbwZkPJRMQ9CR5jSB
	EqoS8cY9xdNT0aJMISGbZvYpzieZcxxv6FYOCo+0smrVT4+/tdk+0LlsD0EbAGKXh8pxdDepGXW
	Qc+JJx0MJ6UGPplfr+GUVxR/HEmxlCdOieAmezJvNywofbrpT/L56D9ViI1WLZ+YUZ3l5IOaHlC
	TBj3Q9u1XbHAyO9bpBvMHIgkKHOhSlVd/cyRg6j7tw36/rff4jbb5016JB0/W0cvCU/LBKNO4D5
	tZZpKMQLRo6v6DOxyAX/8/wLmJmRcJdQlgfcviNmgKVUoWFl1M42v4SQP+1QpgSWMsdvL7sopua
	gOdfFC/LIjBY7nOZjTtFkQWI+ja0qMUK30Qv4tGDpfXV38H1iBeoTOUcj9mvDquSGbN4gNvBOHB
	wh7qMb8TrlYoYlt/0i
X-Received: by 2002:a05:7301:9f06:b0:2be:142f:d499 with SMTP id 5a478bee46e88-2efb99a10e1mr7221331eec.16.1777990707263;
        Tue, 05 May 2026 07:18:27 -0700 (PDT)
X-Received: by 2002:a05:7301:9f06:b0:2be:142f:d499 with SMTP id 5a478bee46e88-2efb99a10e1mr7221313eec.16.1777990706612;
        Tue, 05 May 2026 07:18:26 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f28f7ba26dsm9532600eec.10.2026.05.05.07.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:18:26 -0700 (PDT)
Message-ID: <dbec8e17-ec6c-4da0-b228-2cc005ccbf0c@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:18:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: The whole computer hard resets when trying to load ath12k driver
 in a KVM VM
To: Nazar Mokrynskyi <nazar@mokrynskyi.com>, ath12k@lists.infradead.org
References: <1bd351ec-1ed9-4a01-aae5-0ceb17fbffce@mokrynskyi.com>
 <71416eb9-d313-48de-86b1-40e8044b4076@mokrynskyi.com>
 <bfb8fb5c-ac92-4ebc-8cb6-c46ac2751418@oss.qualcomm.com>
 <2b0d5ae2-efaf-49c1-a748-724b13dfc94c@mokrynskyi.com>
 <711d7c74-eca5-40d6-b3df-278324982fb6@mokrynskyi.com>
 <02e40ced-21b5-46ef-a969-cc83e5160dce@mokrynskyi.com>
 <f137dcdf-2663-433a-b794-e4c43cd4dd2c@mokrynskyi.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f137dcdf-2663-433a-b794-e4c43cd4dd2c@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9fc34 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=pFaJOWOTKGEeXdac:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=PDr0NI_MQpMRwVj34swA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: tuWlmUnBzyM_zAC_7WI5s4fOFXWz_T-t
X-Proofpoint-GUID: tuWlmUnBzyM_zAC_7WI5s4fOFXWz_T-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzNiBTYWx0ZWRfX0TBLHtdogD2T
 +eKEyq8t71d/+Ujoh4N2lcXhQ3debhxLXL76T5YKrHWADN8JS8gMZyfjBzt1GGaF4UYkm6ZVbaP
 YEeViDnRmJ9p4F8wQcFzng5RCW//FBI1sMv9AxShA3HLwajQZlnZsxrGrKezu9eMNJwEf8vkeHq
 QQ2TPTa0EsB7RymTYukdtlEGhJDZjHQ69TCONQUNClNcJwH4ZzdOicpbLwApy06LKpb4ePhczeR
 HOTy+3vsAPwyHJL3Og+Bp8gJn/sc/pWoniynuUsWaeVfkkhFizpuWIBhxkK1ckfAZIYPon94bDv
 q+gyVICa+Hi24Kz0TG9KxXJzVoeK1misXYMrZR0Elr2akIQhqdTJmroY5aMnq7SjdjPEiHui+rM
 /90Q545TZ6XPwVG9bRzsUV8jo/TZUB3XzV3SMlvKOTEdKEYNs/AAnXTY0BVc15inEVbaCGmsvOZ
 nFdEWVa+AGvG1iOEcJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_071829_118719_5FFB97B2 
X-CRM114-Status: UNSURE (   8.40  )
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

On 5/5/2026 12:07 AM, Nazar Mokrynskyi wrote:
> Any feedback on the patches, is it upstreamable?

I only look at patches sent to the list.


