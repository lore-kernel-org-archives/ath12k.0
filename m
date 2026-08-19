Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BA2C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 07:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNnwH1hGX8rEgkp3J32YIZzjmBJxbYypVuzgelon71E=; b=nDt/pp57XYnc47tvDsmBjqE3GT
	oYwiL7Nhb68bifLC/kj1+dApY5FG02VTKUjAWV4xT5FqZCRL0YJ96DNmyXehGrk+4uCOh6hMNjOrT
	HJ5gU9KtNXCbHmx/pkC3FHw/kRQjSd8jET61+aIF/o0fOlq0tjllvp9pTlZklEsib+lYrVke8SFY8
	p6W8KEzq8eQuO2Da5p96r09DgtBrOkblhAeKAqP+RKH2Tfl7sdIxuMeH0rc9ujsrTkUBpGIGNyEJh
	tbQquK6ZWTzOvPx0kLLyedR8bf9/n3BrekowR3CyC3VYYxPlASHPAmVoi6tfuh53UDqJv1P1A+tnw
	bVNbacWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaQU-00000009A74-1ffJ;
	Wed, 19 Aug 2026 07:09:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaQR-00000009A6K-2lZx
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 07:09:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z98P4012518
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 07:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNnwH1hGX8rEgkp3J32YIZzjmBJxbYypVuzgelon71E=; b=l9u9jB3i04i6UueJ
	kZGBuiuKogkjSwVpsiOjfU6ukRu+2H1jn59SuuGJ+5h6YX1/5LvNiRrNxxeYH8PO
	5DOYuOl+3JgAw5eIXJhf4uDDq8ka33xv36/7yB1NO8gvNY/S+AhNe2wnwOQwg4Bt
	BYjzfcu92gmJZmS2kgbJXddZSwBUX9XulRVl1DOD7rN0bmG8PqeAiZD9r4sHB5hj
	wWHNCzMvBs6HIXnHgZIPAOWKWOy/imYjoK+Qny/5lspGwX0fr2zwd+6eMi1h9+x+
	GufZazKzJ4Qgu0wLCLxLdOvU2F8uJUGFoObSezwnwH4CZNfpAbRqwHdnZd/OIzQV
	oMDMQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm9ubc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 07:09:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so748942a12.3
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 00:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787123365; x=1787728165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNnwH1hGX8rEgkp3J32YIZzjmBJxbYypVuzgelon71E=;
        b=Cn+UiBFZSI4yh4N6IzF1NdNMa66q7gEMcrw0a6z7uYk51i9g0Pys4FqM3yYC5csF5z
         NJbGkPl04b3h2QqSoFlhRLn8kIgdC2iMLoPFYJ26yHKmiuH2JMfyQ/QbMC8SRAKagMCi
         hNzsMXuwE30rIZOVfM2xk5NWHkd3F1b22/I7LkMQEPnatu4CKpEAgnxgyKkpT8Mz0643
         iEnLbMoShBpi4sz2p5cLom6AID3OgrNqJpvRdbWY6I3oqAy95fQJ+7LEmNU+r+SDHqLk
         SEJW69RxDg+s11492yfdLLQqNVjAmM33uEaeK+ICt0lJ6x3NFp/lPwFaFtcLzSucD6/S
         JKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123365; x=1787728165;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNnwH1hGX8rEgkp3J32YIZzjmBJxbYypVuzgelon71E=;
        b=HRb0kvwfeO/hyzCRTHwVNEzMAYy1Y4ze0bNvbwgSXniEzJ1y2jdtOlVbucfXrLIip5
         7Lzp8S16bTTIlehe1FzS5AVtBR6esCHRJMiTs4N9qsY5bZZw+iKj8U1sn5C9sJBGB5lJ
         qDvb3Kahq2fTHcNVfyqoLQWkpciogwsN2aU5oBhSi6wpuyGyt03QJTSrGz+yQCxugaSK
         7r4dyhn52tVBRPUECh7eI+oOWKNlq9RwKef+aZ7Cn96kmWgAzDYdogqnn8uTmamIbs7q
         hfZxJ5Y/gCpJsVeEx8eL4sbxWF/a5hf/E5doB+QlWPb1Hxr1R+HjLvKU/XV0EUVXkQJJ
         Focw==
X-Forwarded-Encrypted: i=1; AHgh+RpbLZVHdEYrmAA6WV20uYNi8FssmkiiDRgKutJUQcaxMJMVs/3rARqrmqkoBkLPjVTdN3iEsIU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKQU3ay+LjaluMa4kQ1Rgup9I2Unnb6ezppVLtT5ZT5KxiY3YY
	ffbeg1paWl3kikp5X9VFAL96IcS5h7t588Q9duGC09SAWZt7wwiADgPJoGTQyQikijgvOVRE/nh
	roPrtKhG8Ibf+WZOC9YfXZXFxOHZ3s2Bpo1KgHxWr1w09MF7WblUchwjpTPvhc1Hf
X-Gm-Gg: AR+sD12tfYcX7uXMXMWO8KYamJ8Gs0OORs0ZIQpYJFew7/2fwSPhm6l+IrBy/GpI35b
	OTcooLSkVCej28bcfu/5t9rBPkh+hV8jDnFjeYLtq3KLoFz3NXCwWy4r0JGBoAz0ovGOtKEsLGS
	DWbuLkjv697SB4lgNEkt52QdUGwsXgK5yo8s0qAZpA3FoRfXzG4J9182JmiccojJBmo02Zx8hpM
	F5wCd1hW4Ze6LzwNs2257vqGhE8b9xU8u1aG53n64yGomtjNxdcUZ+VLl3C02VUTCRgWTS0wPKF
	Y2YwbrpkwDkmTwgvkTUcynRp96qoxkOQdlKwmQk2onpGIzsZrWE7AoHWb1W1y7PEmJ8I5rJ8c4E
	+tU2WF7VFCM74M5BZ+NFST3rYquJ67T6HMKUb7GDe
X-Received: by 2002:a05:6a21:e8c:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3cd00db9bf9mr5658496637.2.1787123364764;
        Wed, 19 Aug 2026 00:09:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8c:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3cd00db9bf9mr5658423637.2.1787123364343;
        Wed, 19 Aug 2026 00:09:24 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf1970e4sm3692560eec.30.2026.08.19.00.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 00:09:24 -0700 (PDT)
Message-ID: <65b0de31-7bce-4ef7-af43-7f298d867bc9@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:39:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: align QMI memory to 64 KB
 boundary
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xvqc6-eRoXvO1bdBJftQWwfoBWHzYj9J
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MiBTYWx0ZWRfX16pRTV21Ccv6
 JASRiz0YX5i5+zXkzfV6nY1u3yQSl0LKWttq6OQnpXAr2GlL0A/wjE566jHim0+UmDps/T7bMQ2
 kQdBbTaN4vcjPPztB4VHy1187f/jg7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MiBTYWx0ZWRfX2dLOZM5Ayn35
 zDuU00Dn70yVUBKl4Svf7mpqqzAA3iWWhOoJDwV4VjVA/hGIOhYb6SSXOiI39Dm+karmfyzyX0y
 PTicE+49tTWa+zmaourClZFTdjkrT3pdUy/qbfnnD0w2JdD56BoRwOZc/zIb0IyBgA2HAOkxw4V
 F47SpTvykzyDubvsrt0n0MdnHqn0Z938v5fnpccygB9J7jx/lMmzSrHEM/GfeDGewqqPE9n5ZVE
 KIacwyX9MhhC5pLq+JZ4L91zgbIjiN5xrYNM1g9u8ny9ITT/gdjNlbKHeF4NcgYlO+Xo0ObscyN
 sh9907wmHdw4PzP8qmtNHJuS/A5nINJPW6is4hssC7mljaoZKv0lq+lnzp8Br/ZMYVbieAPuBXK
 Pdx9RhG9EoaWLm6PPLwZoB3xDQgrKqeJplbJRKFsSdICFOMXH92JgnkfPT6En/AJ/zatgm++SIO
 /WNwPBydVYcdTygO1Dw==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a8556a5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Cs6eFApatLD2xG4hVi0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xvqc6-eRoXvO1bdBJftQWwfoBWHzYj9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_000927_826081_8613B3DB 
X-CRM114-Status: GOOD (  10.11  )
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

On 7/30/2026 11:47 AM, Baochen Qiang wrote:
> Firmware requests the QMI memory to be 64 KB aligned, or crash
> may happen. Fix it by manually aligning to that boundary.
> 
> ---
> Baochen Qiang (3):
>        wifi: ath12k: use per-device max QMI chunk size
>        wifi: ath12k: clear chunk paddr and size in ath12k_qmi_free_target_mem_chunk()
>        wifi: ath12k: align QMI target memory to 64 KB
> 
>   drivers/net/wireless/ath/ath12k/hw.h       |   1 +
>   drivers/net/wireless/ath/ath12k/qmi.c      | 102 +++++++++++++++++++++--------
>   drivers/net/wireless/ath/ath12k/qmi.h      |   4 ++
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c |   7 ++
>   4 files changed, 87 insertions(+), 27 deletions(-)
> ---
> base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
> change-id: 20260710-ath12k-align-qmi-memory-a7c87d626ef4
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

