Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4481C55ABA
	for <ath12k@archiver.kernel.org>; Wed,  5 Aug 2026 11:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz5YDsnH4EYX0ARoOKNjKE7qWp0mFP8PTuIplLeGj6w=; b=uIseFxxzCqmn9DDMha4NNUzyuE
	WvM7SOputEm7LaQAwsp/qF5iXKmBvKewDt2hw4Uxq1Zj77NwhPgkSylfUAaiuPoXxEpLllKipIxxS
	6h5qnngZZQxQIE+b6SDNgI/ed5wiPZwhGJ6NmZCrAA0eJlQ7hI1qaTmv+Uwspk4LX4ud8aIpwaC7P
	MZOgmcZrHKOP7MdwcefH+6KdGAYJHsKVIPB6kXl+5WWCwtSzlbX2iO9bFCVggbE3hrKX1TVadViqv
	Iy0wacH4BFAXVFWsu+2uV0tHNzxjWbNjvR2xkahvlyUPq1AdVGDuV/utXlU7C0n1h3K551fIB9pn7
	IzGPrvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZcn-00000003nsh-2GYi;
	Wed, 05 Aug 2026 11:17:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZcl-00000003ns2-2Wps
	for ath12k@lists.infradead.org;
	Wed, 05 Aug 2026 11:17:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dE492912038
	for <ath12k@lists.infradead.org>; Wed, 5 Aug 2026 11:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zz5YDsnH4EYX0ARoOKNjKE7qWp0mFP8PTuIplLeGj6w=; b=PCTCTYR0gpIIVkjG
	YiCetGZYW9IEKiKCoJdOsSLoXMDpAb8n9T6A47TlYTMpm3E4fo6WNrZuRvnmsmoq
	NM4Oz5xifPMvXvKrk9f3mdt/9Jt9pmYPOhKSOc5+s+6vG8TAFlioC78jqu0I3Atc
	PF3wMSGVoR/QitRCgcWamiyK75AC5L5hfkctg684exdkBomorhn3uNmYmOcIBQ3I
	sSlsYWB5q8+ADYecQ2N/oZCz0eYY6eaValvrWB6HDydKOdESg6vgIQavOBILqoPu
	WXhE8BiNlXDCgTi9diMLWWByPCUkx8uNo3CMCs8VB39uiSqVdaU/2hboeejuOwyC
	XVEaPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku34dce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Aug 2026 11:17:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so12737465ad.1
        for <ath12k@lists.infradead.org>; Wed, 05 Aug 2026 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785928646; x=1786533446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zz5YDsnH4EYX0ARoOKNjKE7qWp0mFP8PTuIplLeGj6w=;
        b=IH4JR35lNdtxTL1cVdfwrP1VsSA4jGu5DACOoRoXA3BYUFM0sz4QzbH0AXhA8qEEgo
         V4emgM3NJx93Lbh49rDYOwn55OuPY8XMfHQ+fTzM/HWktoPaaMNl4QxkEZZzrtK56yxn
         Vo/PEnp4M+EYONUEX78o9l5VcAvDj7XcnC+Eq5jhQToAmNY5O4TW/feRHyaeXRwNH5sq
         nbIHZ08Tgs4FRqxK97qSLqymEniMplxZaK0hbs0/o1E+GE3vrz2z+9NlNhCMxZ0nbpSy
         sje54jzK4UPoxC7C/NVK8bQGXI4sxqUE/SSUJZta6mPvfMnPZoOZJHvNh66ZLiZOg08v
         bCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785928646; x=1786533446;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zz5YDsnH4EYX0ARoOKNjKE7qWp0mFP8PTuIplLeGj6w=;
        b=ar4GNnddfy3ztIPQvF/skim1xo2cNW+z8L6PMsFUhPTMJ3EjfvUphShpJ3+3AnI3bu
         zPz54c8k1Ijz6IdtHxLOxJr8VhIwN6m9qPiNYpfLjEvtYpzIoXlIGXhaWFEjGBvuJPHm
         bXv4nvAzFymNOQguUuvrwFChjfMGzENeHgJ6ElvfjIySIAqtkB3Giub6Jt6mvf3LMVMe
         +NP1Vhae1vLto0FnOYRtAmDcZ7Z+Jd1kX379Ga9+chy2nFJhK9glfSQJ9oXYQWPmoQLE
         Rk3HwrcMcVTsr9QC3LkQYdzJuvQPQ7zxN11pEnlCOfvYDmXGo/GEb/Way7nnSk0qnXNr
         huHA==
X-Forwarded-Encrypted: i=1; AHgh+RrOqnOCZNDJjmVYzphmUj8k/eR8gwIiSylfjaEAQ7XqKNggR7qOSFstjhdBxRRbqnQ5fAouO40=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaK1khfP+lfeqo1d2/qc7KGWTTA8vLx86h4wQdqk0aadtLNY2x
	ff7eUc1v8ihk9bzU3x7J9zKBePM8hT4nF0yJ6qJTck5H4A1OsZ9mfMHwsNxTEQ+PPRumlKkeBQS
	nuvRB1N/RwCE4uZJXpnbgsgrRA+xxj/alGp3WLtTPWFmGmSxbk8eJl7wk7gCMrSyg
X-Gm-Gg: AR+sD13r/8XTVT977jKBKvJoNLUKLyHM1Amyun7HG/tTWDQmcqIBH7G9MOYbYYD5HqJ
	bX3QKG5woQ6ZReZwLkTAfdN6s1pY7hM5Xz/RNA6nNzsDtoIXVTnLve0F8BAju4uIk1nMKxFKyEl
	RZDBe1M6oDtQShfgndCRssVAaAx+REnYMTGUKl1I+Z6eCw7zFAiZj4HmBg9uLkjp0OM33n6bJW8
	c2Eghc0lsPepXwf5KjYKDWL1jVys/jDyJytGlMSocjvPsi6Mr2QnbZfHXiRzU3IkPOqWBgVH2GW
	VJSFSgpjmnTEKUiNj5vDH/9/WnuvhSTw25CCDwdS6RmI9LwvSiGw+MqMXOUXpavyF58gmq9HlW/
	yB6nnbTRj48/vOJgLdRTsAEoz0zOeUnWcq/D4/WBE
X-Received: by 2002:a05:6a20:43a9:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cb85f49477mr7067175637.25.1785928646398;
        Wed, 05 Aug 2026 04:17:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cb85f49477mr7067122637.25.1785928645982;
        Wed, 05 Aug 2026 04:17:25 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6576b7sm12059674c88.7.2026.08.05.04.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 04:17:25 -0700 (PDT)
Message-ID: <6cded053-d8d1-40c4-b3a5-753cd5482b6b@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:47:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove skb->data check in
 ath12k_wmi_process_tpc_stats()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WSY7GUeV9LCiYNM_KaOOWvo4XaMgUt38
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA5MCBTYWx0ZWRfX5DBLZPx+xPbk
 jeOyD6q3QteMz8wM1lGk/gBKK5fTdftQhU5Hs3/BFulVzHbVinkigz4YwdBMPlFaHVBLsfOVlFt
 +DAnBiyh0Y/2c5Wz96wkzwuV1J5V2cA=
X-Proofpoint-ORIG-GUID: WSY7GUeV9LCiYNM_KaOOWvo4XaMgUt38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA5MCBTYWx0ZWRfXxx8PsUk/Npo/
 6vdIGCALcI0FtMQiH9FcpPJrogO/MeY3TMZ/H991CLqt9ZDRn1nQP2rgv1OXQNtt7d4IzWXvRzY
 K1VwxGx3XIpu1QoTatm+VNfw/XjHepYw9FHVdxgIVa7mcv+E8rPbC8wXxUGhgu6V8rlHAr4uZoC
 oO2BTCXQ6+328TipNVwH68ivKS1bpKbX8DAS1s9H7RYgTVoLPmK7hc186XuOtm4mCE9rv0VJUYO
 +caVLG5hPAIRKRdh73n2+ae9hpIHcU50qrTuSB5qrJHnzCxPVWKwUNmJCS/fIcbx8W/EOy0LMMP
 3/227+F93xuwJ164uWIip1qDlibkA70da4k9z0Js0IG2ZIQASuzFfkv93n/6/gXKOPhs297lOhO
 szV+m4iQp18z4pKnvctdgLlA1U0U5UQRmAWNxt/2YjapsGlFE5pxkZ+4CNldht9pxsoOuaKacXR
 hZ47s6R3jUPHMIB0rwA==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a731bc7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xk6P7Knj3mn-WFlMDu8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_041727_668161_6CCDE408 
X-CRM114-Status: UNSURE (   9.50  )
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

On 7/29/2026 6:45 AM, Jeff Johnson wrote:
> Currently, ath12k_wmi_process_tpc_stats() has a !skb->data check.  This
> check is pointless since skb->data is accessed by ath12k_wmi_op_rx() in
> order to dispatch the message to this function, therefore it is always
> non-NULL.
> 
> Remove the pointless check and its associated warning message.
> 
> Compile tested only.
> 
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

