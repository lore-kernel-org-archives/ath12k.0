Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C9DCAC5BB
	for <ath12k@archiver.kernel.org>; Wed,  8 Oct 2025 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT4qN5wiw/obLfm5ycH7/scKXzGS50BShMeNqi9Ne5U=; b=0Ex5pSfCB+efqPLVZwXCBJDMKq
	vuG0ml67b0uUHS54BUN8cDqth/MzEB2JCrH1W1Mad4u4T7Xy+TvpmnpHeet64eeOxlIORonvVg7xP
	9WB7wCXRcxEWTyzSEJ1cAUlbUDdUZDyZ37vhFmzNuSbV2PpKgTb9rBiYeJkdJEQgAxNFcsAIAezyA
	RoEoky05lykQNGZ057PqtKJLwsxVJcRSWUIb9XK24lDR9lCSJgbDX0enTnvhfP0v0W+UWU6yMn0zO
	CvYooLZa0CO8prCZmdQKPS/IbBegdpkc8i5f9mSu5U3NtCJUa6tX7kXwkBX5OEQWAm/7eSX1zy8Hs
	G8XVbPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PH6-00000003PxH-22Sz;
	Wed, 08 Oct 2025 08:11:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PH4-00000003PwU-0ni8
	for ath12k@lists.infradead.org;
	Wed, 08 Oct 2025 08:11:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aWqm013795
	for <ath12k@lists.infradead.org>; Wed, 8 Oct 2025 08:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT4qN5wiw/obLfm5ycH7/scKXzGS50BShMeNqi9Ne5U=; b=XnM0OleOFQ/36zij
	+rTq6C/7QGYMZA1eERe+4kp7tS7SJaO8Kif1b+3xmGf0WW4WwznY2SPtLjoQXTqR
	mojHcYkVfjy7+duwqI0/NKjrFCETHMqgsEN5Ag5W224dd4fXeYgY/Aa3hUssrTpb
	PY4A7A81HvvOfBUK/RYijevjBtxbzctgjxvu1dH2LpOkf6muv2HWnOPzXYbZLa3v
	BHctcqH4t1YjsgcrfrFoonk27CUZsYSXaI6v1NYw2CJ7RoA8o8Vnx/pMibeiJT30
	P1bM6D/drRBewiK6rFe+QOoNJqH8F4Y8fYg/se2aa2X4xAjZhZX3lCKD8eA7zEWC
	8c1AVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpvkhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 08:11:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-332560b7171so1012100a91.0
        for <ath12k@lists.infradead.org>; Wed, 08 Oct 2025 01:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911105; x=1760515905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT4qN5wiw/obLfm5ycH7/scKXzGS50BShMeNqi9Ne5U=;
        b=EYtn2pVXMFST2f0y8lMXIBkLya6NnrqtXOYxNgt6+fp4fnKw7sNtSZNT7fAPwj4aIY
         2407q8xDQwZVrrgWQfe1cHFARKBPJyoBtKTnBXxemeRsMJz22cYtMGRuFw6MVfAALEaz
         6MWHk4gisVapYV2eLRE8XKai6aRHitIg8RWXb+NyJj+lVVDKV5MMiwnhY1tRcTPwcX8O
         cVQS9TP+cMINYpy1v+1ujIYYMpQzvKnAL+MsTN2NKwjSRS/Jm7yJxSNGkDKQaueavGEu
         y6Gu4VGp/YSE5Qgh1l8txTAJuPfyk4JOkc9AbfyUt9a5cR6Ph50KJdqfmaT5TrK9ANwD
         rNYw==
X-Forwarded-Encrypted: i=1; AJvYcCWZP7zLWV8zWXtfXHDaKq+/ByHfAcz2tbjsq3ax3/hkLHK7LqJhnPNM83H10WmVzbohtsM+Mio=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7vaZrAcl6F+ooc88GwPud8mL5Tc0X7AHmx/Nex0MjcJGO4c0+
	dy1i/tDyfzP6EGJWkFNvmnfoBFIw54QKN2cDnBBCnnaEsC9+wpOhlxAc67oGGW4Jw9v79hytHWl
	SDqtdXD3DOXv8Q9xShWKyH1Ks5H961BLHCQr140x9TE36Z8etuDt0F4FYl62YP+xR
X-Gm-Gg: ASbGnctqanKy1NCci8ZSuv2uoz9FQWOkYRQhmMwvQln3gXtqRxlNUgKT7mKaNkg14Oh
	8/QOKUkOnuMK6A+weiUQk1NvhdJE6+AOQZV7itaFpeheBw2af4lOo0K+5eO1ZtG2ISKzAmxLzJZ
	fRdWQuogE3LJWPdN8v1IzuYamy1LQxoQEiVqmBv11xfz0V5I0VChNOTczgb8XZP29PFSRRPCEU3
	ufShqwERtQLdCSVxkMvDALeiutKbgCpWVpyEI/8Tn2z9p7+D64DD+Aw0gF3XYcrwgZmqryjMUip
	x/ZMhIwxoEJy20orLbbzkl/E5hP+b73Fnt/GxH3KeBqw/3ERprBz2OjBG22aD/NcblUOOORvFWy
	l+ZkqVd7Y7G+M5Ryx1ymuPQ==
X-Received: by 2002:a17:90b:4acf:b0:32e:6111:40ab with SMTP id 98e67ed59e1d1-339eda4744dmr8176218a91.3.1759911105395;
        Wed, 08 Oct 2025 01:11:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwHDNuEaE+rLfTNBWLkilBQWefpmRZUNM+SfQTjfQNfl95ppg4VogY664yfD1KZU1/gQLQww==
X-Received: by 2002:a17:90b:4acf:b0:32e:6111:40ab with SMTP id 98e67ed59e1d1-339eda4744dmr8176195a91.3.1759911104882;
        Wed, 08 Oct 2025 01:11:44 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.106.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7932d06d3afsm2988365b3a.70.2025.10.08.01.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:11:44 -0700 (PDT)
Message-ID: <f1aaad21-1f09-491b-b0e3-974b65a57963@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:41:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Improve RX Error Handling and
 Debug Visibility
Content-Language: en-US
To: Sarika Sharma <sarika.sharma@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OGlgIiAlwPptZWlnTOyAviKTfpcPmgRV
X-Proofpoint-ORIG-GUID: OGlgIiAlwPptZWlnTOyAviKTfpcPmgRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX+4J4P1HPAQuS
 mw1aT8sTUg26AAksl00qqzPazzcfLHmMLnbc7Od6Z4sFG2HRxOblj7JvoPTEuLso231qi6dflX6
 9dLb7uqjqpY9beOPGWn4zmYbTAVekzLLg2U7fHWzd8N15G729ZhsPgHukEQweFoH1OP6hMqXYra
 0hxyoh9eIxe+2mpWPbzCL+Me2noer4Crrjaq+BM+zJ1PuOWANUZVaNOicOlXZL35tuNa8wMj7lg
 kur/a2tXfG0jQbsYzKe8xsS2RJ4xwLd7EkvpuRi2EjnFtFyM/SO1G/h3gy+/SQtUwdwyN8Se0uj
 BS7bk+MmppkPbcRYeuwDqJHwLQBTszmEKPBQIfzJ9eus4f5caV8cAGLoNtdw5xfah9EVqd5cKDv
 tpcmAkxZgNhG4sgmJwZAeWqzbkK0sg==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e61cc2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=z6xreaRxtU16OQ9bEhv1vw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=H_RQpMyiQRhNCIPQZMAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011150_257831_EF9F921A 
X-CRM114-Status: UNSURE (   9.66  )
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



On 9/30/2025 2:45 PM, Sarika Sharma wrote:
> Fix buffer leak and potential crash in RX error path. Drop MSDU
> buffer-type packets received on the REO exception ring from
> unassociated peers, as they are not parsed but their buffers are not
> freed. Add debug counter reo_excep_msdu_buf_type in
> ath12k_debugfs_dump_device_dp_stats() to track dropped packets
> and aid debugging.
> 
> Sarika Sharma (2):
>    wifi: ath12k: Fix MSDU buffer types handling in RX error path
>    wifi: ath12k: track dropped MSDU buffer type packets in REO exception
>      ring
> 
>   drivers/net/wireless/ath/ath12k/core.h    |  1 +
>   drivers/net/wireless/ath/ath12k/debugfs.c |  5 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.c   | 72 +++++++++++++++++++++--
>   drivers/net/wireless/ath/ath12k/hal_rx.c  | 10 +---
>   4 files changed, 73 insertions(+), 15 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

