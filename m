Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E09BC02181
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 02:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sum5fgR6OpNWoyvX8DEoAFERZAA1eFid0RKeK/7stKY=; b=lBg/KfyXJ8iIn2MNHPbCJu4aL3
	xutVhoQAnHjuptjOWrSlBl2rgL5j6MbWmRGeLz9eiLzFGfTqKemlWFUSKEuXQmbn2ZW6Xd7vXoSWs
	y97YOb7L+JxbEkj+eES/+A5lNxVEARwOvjQ+2POxaUyfSQo3KQjxGY+5Xnet9GQxWzMHgZDNkgfJw
	2rKazZSXB0gVZ/HRRw6EMRcFC34p6VTauuyZHfG2Hsvduej4D0lqU72dPQ0moGMmBrfbs8bPmRdWb
	FFX8HtgAT6y5Hr/YuOk7VEPcLWiQtXiyoKQlbuM9DqLZzG3xar1sUU5GoNm/Gzp4V69he97sWniWx
	wyowSYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tamYJ-0000000BYnL-47tp
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 02:02:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tamYI-0000000BYmw-04St
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 02:02:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N1rsxP027350
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 02:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sum5fgR6OpNWoyvX8DEoAFERZAA1eFid0RKeK/7stKY=; b=CH+Z1dLlxWYYjDYk
	BmDiZahL75ZU+vTv86D1lLiUbeifzb/IsDlA22OSW2nsrKXTwHb0ptBSRHZ8q1Ol
	qZJw8oPgNQ1YyuX2BrQRFiIrW6CYwnRKRJIXoMW9btN7efqGkUtxmqM839N78o1e
	an6fRnhEE5ApkLMmGxSxPtYMDwQng7wmV1oDe9j0kaKf23iwMmNiyyVjk31m/Htp
	Z02PbFfkU12EFx4fHpK0uQDj3X9wmHn5dFfb8nEDcLqiCXbYbSFkOHzG+LxzZxrn
	GFbRbkUbiEVmNzVJpVdoKFs6WBJ9KT68F2dKaWCnF4F/neM6IVAX3JA4lksk0q02
	QXREoA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bcgrg0ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jan 2025 02:02:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so1343723a91.3
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 18:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737597753; x=1738202553;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sum5fgR6OpNWoyvX8DEoAFERZAA1eFid0RKeK/7stKY=;
        b=U3u5gSjZFRhhNqJqskQqDnORgxQd4QbbT3hWhVQ4Wiqeo7fQmlbaSb2cO55Lv9jr+P
         l5ciJhR4+yG75wgXbRZ6/wXrDgD4Ddht+N8v058snCNFSgTCgnYPuQJUOj9S9sFTwSzr
         erVKyvKIZZEKZPH+rOLcfyxv8kO5PVP0XSqq84VPTWN5IesP7F6fvw2iaz6vYK6wFi7P
         2ZZ0tchPZdhmSGetyGkIFrOKno1RcgXdKOgEdJ7gZSVXAzYw7CEw6KUF4rbIudSHYJkY
         NDHLmKk451PIFG8BjiyBIxUraYfEwQk0VGpwNdZVeWAU9Md4+pnCVckpvEltn+vxJCY5
         idgA==
X-Forwarded-Encrypted: i=1; AJvYcCXs6iBvWUu63jaHf0URMSOa+qRc4vxpfahD/RzOe12KXzqGGzdUyze5hbxAPmJG4gXiAUNgnJ4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKJuUKUsiawOF+q8vrUYyofcGZrRirotw6nkU4rCDSLDwJsaYS
	fBezKKjg8Nt+iNHyspNOHgeyfm3mJyK/9Jt+gDQGUC9k7EE3WEWYvte5Rhj6zXGNkQESLgyw+3B
	4Ym7IDVEr1X9d7qcspgXlbzENuKrS1V9N97y8qj8QaisqV/cQTOeJ4PGsRWKp
X-Gm-Gg: ASbGncu9yPh+0xOf1g86L2dT/csh6pZTpnyXp6VraVctln1HSWDmXSkDIemvhJokXZl
	huH9mkvhtr+gda06rlXYC8p13KlVKSNnx1DcegKL2GtE8gEhYarSbCqaTH+SYqi+RO6LTxtr6dk
	PIBfwMtZ5LrOIu2PB01S9MnB4RVBnsu9my4VW87/wWnpvQAC7I+Ayxto+rBmGryalMhZ1PhuURY
	q+uk8u13FhMiF1WE296TiuKzBOTez005d/shIpCe4BwlBC9GbcQALzdT3uyJzuKJu5h9vvufaH7
	G5d0W/kwEVzfk9Im4CTqxwSHHMaP7g==
X-Received: by 2002:a05:6a00:2914:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72dafa00359mr31853697b3a.6.1737597753155;
        Wed, 22 Jan 2025 18:02:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgGU1iRGLTErvAyBaR1wlc4UEidp0zwgMDhEU+8PpT9dNMb4yjR4dH5UP+IOSgM/NizIjeOA==
X-Received: by 2002:a05:6a00:2914:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72dafa00359mr31853659b3a.6.1737597752756;
        Wed, 22 Jan 2025 18:02:32 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab845d25sm11718420b3a.77.2025.01.22.18.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 18:02:32 -0800 (PST)
Message-ID: <dc9eafbb-1891-4e88-b9ad-0ed40342db6a@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 07:32:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx error
 path
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250122160112.3234558-1-nico.escande@gmail.com>
 <101c0824-1c0d-4e5f-bb4c-7d6ef65f1698@oss.qualcomm.com>
 <d0dfce80-3e57-4efe-8552-b18bae9e9437@oss.qualcomm.com>
 <c6b65bee-3680-4e54-9d7a-2b582461cc73@oss.qualcomm.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c6b65bee-3680-4e54-9d7a-2b582461cc73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1UqsRKQABslfFwx_fcC8nPUXHW2buat1
X-Proofpoint-ORIG-GUID: 1UqsRKQABslfFwx_fcC8nPUXHW2buat1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_11,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=935
 suspectscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501230014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_180238_199430_A5A3A526 
X-CRM114-Status: UNSURE (   9.73  )
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

On 1/23/25 01:49, Jeff Johnson wrote:
> On 1/22/2025 10:20 AM, Jeff Johnson wrote:
>> On 1/22/2025 8:46 AM, Aditya Kumar Singh wrote:
>>> On 1/22/25 21:31, Nicolas Escande wrote:
>>>> When vlan support was added, we missed that when
>>>> ath12k_dp_prepare_htt_metadata returns an error we also need to free the
>>>
>>> nit: Always refer function name with () for clarity.
>>>
>>>> skb holding the metadata before going on with the cleanup process.
>>>> Compile tested only.
>>>>
>>>> Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
>>>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>>>> ---
>>>
>>> If there's going to be a new version please take care of above nit
>>> comment. Otherwise -
>>>
>>> Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
>>>
>>>
>>
>> I'll fixup () in both subject and description
> 
> fixup in pending:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=29d6569f323a88ccb3239abea562f6e691cfd9e4

Looks good.

-- 
Aditya

