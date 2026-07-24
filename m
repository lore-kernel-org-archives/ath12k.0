Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D01C531F9
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 06:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4lo6fyaz1U6++WuUAn8IYQA5d5uVJklp9nQ+t8eM4M=; b=lXfShB0zWADKByFO7Fdmw9AWx4
	FYiUYs42GPYoiJJ7jFqtIGKHKzTCwWCHWbQGS6mUOuuu06MSjm35Y/9H+K9oLQz7OvsSSRp+nKVqG
	FFVxU5V0y7AzpmI06VsG0PkbKhkt8acPMQJjrX/DcNvDkfWkvv7kbzCxB9+yh2HtKvjwVrYJ3igIy
	yyH0BQjNKtJYqTutrsqvKa05wj6A/mzCtCIYd2Sb/xNd2PfP4QbD/bIyuVb7UzJU5XhpqiXVzWFnG
	JdtHbvJJFnd2FIVMopKBD/3fbWy/kUtB1DbUV3bnaXOS/bzGOOc33HE2ZfXEI8LmeNXg9K1ad/JIM
	me1Wsf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9aO-0000000FcWJ-2j9W;
	Fri, 24 Jul 2026 06:40:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9aM-0000000FcVA-0cgm
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 06:40:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lCo92275931
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 06:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4lo6fyaz1U6++WuUAn8IYQA5d5uVJklp9nQ+t8eM4M=; b=HARW3d9DPm1jfzdc
	U9u6KsVpWbwJ0fpt3Z/uqiInWi7hrUE+CnvmLvz6D2Yty6CUhXwtIzM913G7fvfT
	I00rvc6ezVXTLRWQREv5X546GGPF2NSpEzq5e9M9on2/YAyHDgSCTqpzduch8Gsd
	Gi9dRI9Extm2iMV2wsqkCuXoV5gp7dL1BerOXWJZanTLHw9+GEPUdhVvmIydfM1J
	QZUvT6Cjxx+GoqTEPw3QM6p0Tc5Ybg4MOzqYregzFuF6EPk+o/ORVT7RLvQHK3yT
	msIMw/d6gT3Kiab/3JrvhWHqEv3yQyfojGc5MrvsWXL8GPbFq720XDdZ100z8wyC
	QQeKYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0aec3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 06:40:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso145737a12.2
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 23:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784875241; x=1785480041; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4lo6fyaz1U6++WuUAn8IYQA5d5uVJklp9nQ+t8eM4M=;
        b=CBpxo+6qfucVWDXw7pNz+DPOzWSUuPs/8AKmw0d09lK4OCAodCmNP3o6yrYvvkwua8
         GyVESkAcPLE84Hu2dK85AMer1AJBK2IFCV6YUgXbEC0z7nKI5FzR0ElYfrGImAHvjSrx
         6zN75Nz/XLsQeKFIDx21Gs0vVKyf5X7F9W4JSebOFvBm5wojjdhLQAHaKoqIFAQMIKJq
         1Qs7n+Ukk4nOL7c1hI6uwctq45IlL6QSAtgTfQaw7mLiqfN/yRv+i1/jJ5YmzFM+7nJ5
         gJ8n0NK5cjaEwhg21LZiKz1RxiTeFY+HF9g7ozvQL0ANaX7VnsshhKiNbMQ6H9f5jtn0
         89IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784875241; x=1785480041;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4lo6fyaz1U6++WuUAn8IYQA5d5uVJklp9nQ+t8eM4M=;
        b=BXFMaStc7URWu4QodxqNnPxxRkrr7JeGIN0fh7zLRG3PgVYdqCX2yJfkrft5NdMPMc
         eDK8AQ43qIIdQn8FTlprQm6Ji39O9jUwyuQAVYpRPNtCEPCc+epD87Bi9xkyhhrQ/4sy
         S+x+b3IPtm4TpcJWpz7KtnKfOQzOa/SO0p1BOGFYQjgLa1ONLTQs1QZg2V9l/nvHCsJs
         n2U01EcIPO2CJzYtix0qJ1O5AHsBn+XcrtMOcPV1snd0YUaCmQZUiE5ULPxBrXPT/xMO
         VLr5G4iX2vc7DqWfluc9PnuCtHr6UEKL3CGi4y4RbzXVQWUrkI2je7GKLgx2HoxIZoAf
         PQ2w==
X-Forwarded-Encrypted: i=1; AHgh+Roz2mb7gvMrixukWnxHdYYiRXkuGihINBRYo4tw2D0JeZGLYXwdVQtfin8HScZP8jhZWMb5uKE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhiKA8cbJUY4JPH66DJgvOgcGOjjCxay76eENKEydSzR6vwSnm
	OnD6D0jQ8FJ76B8AlKy/DNDT6QjSRwzirDCFxoiGb6rKtz0OwcJrEP02uIS/Wrqf6Apui/x/KH0
	Smp25PFhN6JNcRhoC108jnFYjJtSJtqgv4NRbhzimNKHorI28KVPGPjXjZLjoBS1P
X-Gm-Gg: AR+sD11WRXhWvB6RKFKdkcA9OsACsSqHu1DV0vOsw8VFYlqpyGdk3HzzOj10JfEeShX
	YtSPoPSKRA1v9JgD/nAI7y3eXv2XQMlFKb3qqGnz9Ly4AajmvpDCYKKLNwF581o0fL2brOkg+3+
	eYVnlM7QX6Pw7odCo22ky6CclE993mK/dp+Xx7+0S9hAhtP+38THuTF3itruWA0bqT5Fe9Td0AF
	Mu2DRcUxmQEUvNSqBIiaJFP6HirNEEVoLZxDpGbAyjoWyxfda2OK/wemTf3yeSm0TZT8MwMr8vo
	ChCeohuGgE72JRr4ibP7Ky95Bylg4D/qCT/41p41K3V0A2pHfO2sUV8UmEtWxTI57WoVQ1ys2pD
	0Ae2arBeet/NEyIqVxKrUpi09ovvo69X/HrA+JIML
X-Received: by 2002:a05:6a21:710f:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3c44afb2743mr7222448637.3.1784875240945;
        Thu, 23 Jul 2026 23:40:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:710f:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3c44afb2743mr7222428637.3.1784875240556;
        Thu, 23 Jul 2026 23:40:40 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm27015380eec.15.2026.07.23.23.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 23:40:40 -0700 (PDT)
Message-ID: <9261324d-7139-42b7-95d5-f9623773eeb6@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:10:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Fix buffer overreads in CSA
 switch count event processing
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
References: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ly3KVqJrf35YKmJeLXxkatyWNuAzyLFE
X-Proofpoint-GUID: ly3KVqJrf35YKmJeLXxkatyWNuAzyLFE
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a6308e9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EEee_W5yMqs7HOlhk4gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA1OCBTYWx0ZWRfX5XU8AG7nvsoZ
 H3a33Aa0eoefpBAbkmZ7gvbPDMfKGq3chlOHiuri/+W1fJ22Ob/iOH296btrRNeBbOvb0B0a30X
 8GUB1uueQ03OeigzO7DwaLLp64OrwGox+RcKS7YdPDGSDQWXZrTORds4ZxwnX3dQc8zSlz/IMZi
 JuXCue14wv4LKbkwOzBE4zl0tbTbTGtyHh1ak7V0I9RXP1CC8HjeM64oMuzE8M2H7obVf0RBhZb
 UbQSwzadVvT/UbKYz6f8dztZahbV5kxYTwiHzKDsns4KlnJVxOV+aHcESjTWRLF43ST6RVevAjE
 3A6sc1N4lCk3H82mZ1o8qR6/uEYGSuMO0OyD4Q7gTI3h56zs2hUN073IC+UXUIthCFw1+yNLJeA
 U+xgSTStcqUrRt905Jjr4gygKZSIlOJYGfoKWZunqD627+/Elcpk4XSG5v4BqsimCjyrACP2Ctm
 VQV+HJ/aYl1ckt97CJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA1OCBTYWx0ZWRfXyMyaeiZcRsJ/
 voHf7dSXh8SDLfvL+puDElFPfjkjw1RaHUAvnu3/SPu0EMM0w6idP//NdzQ6ABBBMgyTISvfGrI
 LyBxXNi++77LsNL/BPq0nrojLHqWI/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_234042_200629_EC38C4EE 
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

On 7/24/2026 7:01 AM, Jeff Johnson wrote:
> Both ath11k and ath12k fail to properly sanitize the CSA switch count
> event.
> 
> ---
> Jeff Johnson (2):
>        wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
>        wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
> 
>   drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
>   drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
>   2 files changed, 35 insertions(+), 2 deletions(-)
> ---
> base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
> change-id: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

