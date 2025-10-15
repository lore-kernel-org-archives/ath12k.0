Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5552CCD19F
	for <ath12k@archiver.kernel.org>; Wed, 15 Oct 2025 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSE2K1a4SBjYDOYBslaV3vSVYb8UkzKK2A+Dox9Xje4=; b=1nNnce8TP3ThBu0/dNE0pviXRX
	rmrpKr/fDsvnyE7KY9tMfRrTDsjPjdWoHw+y2vg88LrJGQpgfWDi/jdhmA1jF+CxIaHQY2N9MD/9L
	MSCoSFoISKpH6vMiDOGBMorCvClrPvbG4fzM7WO+OHStY7HypsBP7aUymMxyxGwFHN9yYN1nzrl9l
	XjbayoMNmyzwD5FQzFuU/6ZwXlHCKTjxQfLm+RBeYeQ54uO0mkopkQ88kXsTMslYiBcsLI9xyY+zC
	u5Mn7ijm4BN21d2xV3HPyxntRtI92L6+G+NUubNBHkNqLc91h//OKBLcW30NEtbMn+rjdg0bx0Ccb
	+slsy5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6h-000000035lM-2sIS;
	Wed, 15 Oct 2025 23:40:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6f-000000035ho-0rKN
	for ath12k@lists.infradead.org;
	Wed, 15 Oct 2025 23:40:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJVQWV003797
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSE2K1a4SBjYDOYBslaV3vSVYb8UkzKK2A+Dox9Xje4=; b=RO4EPSdUDMqvf7qc
	/Y4Qsy5Mf5HQmWzDsMmYR77ovgMxBt5TfjqvurYYMDCNhzzYZanoCRTvOnAsXIZl
	U2SktDlqib6c4yiIbQl1KBhIGG4u/kCRBu6zRKMoYlUTvsY734D4Qni0L+Hhekk+
	Ac6RL0EiktwXKW9xTzEjrEOTRo9aYIThPvBRwEiel8p8Zge1y4l2h9TfIvLhgaFO
	EpDTW7hYiGL/ykc+jkSNWvELMRc0RgOKAQ0I7Ioo8Js1Tz7zpRy8KMZ0cS3g9s3Y
	7HCjZRveWzneM1blv41cj5KP/sbrurNOax1BKUiVoXv0JY7c33xyms+ii3EsioRO
	rW00QQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8eatv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2909a67aed4so707945ad.1
        for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 16:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571631; x=1761176431;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSE2K1a4SBjYDOYBslaV3vSVYb8UkzKK2A+Dox9Xje4=;
        b=FDSONyPNSkMwlC85RyBXWDsZN0rbiHtuMd5bsa4ygCi/rUNq9VwHzePgiPamk77Sf4
         6jEEGHw3TWJJt3wdIklmge8NrphqtOyqa4dvZ8+YCL50F95X8biRmpxfCZXMr03KE9G/
         bMPgx1ZVi0zuMeaq8tsgbk8aiQRjXoNJ/ZfeMFSB9lNcolIRQSZRAppHDR6U964XM6c9
         ElrqOH6Q/JgalOExjidnH+tPQPCWemPD+F0YFPhjuhWvSSkglNwXrBIzBNghY8bkZdza
         dSYmosIiXuwXzwir0vI1lAf8eeq2NM2hoAiV+zJxVVMeool0IeszMPBd/25gDCw3gGAE
         laHg==
X-Gm-Message-State: AOJu0Yw2cIPRMUISKGIO/arY6f94TnthN1AlXvxEru19xKGJLzPnS1pd
	n+1sJ9NQute+KXSpUKIGenNWGC+68DEDf31Z9bh0sr79t6JmPN/BzXAU5mmJg3e17YHRD289n0b
	FbP3iKSgd+biZ6ReMzgBPMLTfZehn5sO6I0Pm3EkD2UIPRwaTQV3WrRXrcXj8NvLuHmagSqoj
X-Gm-Gg: ASbGncuzOTdJ4qo9dMFGTKywWfH617IlMEgvj0rjIOdPgz+wdtlvqA3LqMIuTGJzwws
	eOf4rOOc4CT+cuwojFx323b5zyB0yu2p0I2A/fabTZJIBE8I9z0RvAyi+z62mWuz3D+68zvhKXA
	y6BunTxgioP1Vo2spGKg6qgoiTx/cph6Gn/ArHNSsEbda81SZrNxYEjMvsmZBtWmFrkfH9AZf/H
	4bKQxCT48tvYm0BxHw+PUHZV5xpuzxRfvDYqAKpOGKbYy8sOH0ZZZCLT2CoYDTF8znZCTVFv8kW
	cN9nMK0Wn56EAGVsiFDkqo0wZlHbGyqg+B4DecT16wdUOtyHxHz4wlVphuSXGkRPyv7QgNDU0dJ
	IydhQHEe200NKsjO0j0sG4H41hPIupuCBNpA=
X-Received: by 2002:a17:902:e790:b0:26c:4280:4860 with SMTP id d9443c01a7336-290919dadb8mr21704905ad.8.1760571630786;
        Wed, 15 Oct 2025 16:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKUJkqHBAbpG/W8Gx8wfdk4WHiUXIjfdxpJ40TxEArZAiTZw1GndAYMwia8Tl83feSPzOBAw==
X-Received: by 2002:a17:902:e790:b0:26c:4280:4860 with SMTP id d9443c01a7336-290919dadb8mr21704685ad.8.1760571630325;
        Wed, 15 Oct 2025 16:40:30 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm8055635ad.70.2025.10.15.16.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:40:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251007133332.1092178-1-thiraviyam.mariyappan@oss.qualcomm.com>
References: <20251007133332.1092178-1-thiraviyam.mariyappan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NSS value update in
 ext_rx_stats
Message-Id: <176057162971.260563.16262257561104304006.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:40:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 2Odfcs_exvTiz0YhVvRvc_69JAK4XUze
X-Proofpoint-ORIG-GUID: 2Odfcs_exvTiz0YhVvRvc_69JAK4XUze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXxX3Q/q+yqocU
 4BGsHYRZATQxsdMG0J+XhJ7Xj5C0KIdCjNN8UmjqI0Qmr0IP4DENjfsHwsbEdj4m7stWTBbNpBs
 8JicUcS110mVYq8p5U2/KTKzyev4UEp4GhZpV5pmhFILXSU9tABGSgiaCGe6kj6rosA+PSM8nSc
 Cmll7RSCY+5GY+JaDlWp/KXDWkGfldhETwVsms10scl23AuLcEx91Da8S8fz+b2ave367WRgL19
 j8REWjujuiPu1Sl6WY4f7GhEExR7eTUVNl6NVFVd0wYmtRBKt1qBPweUFfPUFRnKm3ehDKAVR1R
 h23hBMpfGvxrCTMp9VoRku9bqTRwbF7M7RrmFb1QiLZBNeSo03eSJG/uAmeliINV8aJBMJmrf3Y
 rkMqoReHqDXXhLmBTkJV8ELntgN6xg==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f030f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Zs9DEkr-8YzyMXDGHikA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164033_375776_4E53E291 
X-CRM114-Status: UNSURE (   9.93  )
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


On Tue, 07 Oct 2025 19:03:32 +0530, Thiraviyam Mariyappan wrote:
> Currently, in ext_rx_stats, the NSS value is taken directly from
> the firmware, which results in incorrect mapping:
>         4x4, 3x3, 2x2, 1x1 SS are incorrectly updated as 3x3, 2x2,
> 1x1, 0x0 SS respectively.
> 
> Fix the issue by incrementing the NSS value by 1 while updating
> the PPDU info to ensure accurate spatial stream statistics.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix NSS value update in ext_rx_stats
      commit: b94f523cc5a19108ff4687a4bce9e5d484f0f9c5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


