Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BDFCA600D
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 16:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrPZf5SWpHn7JseCoewc3m7EX0hPPEz3Jrk1GAafdW4=; b=tfJMmGcxqsemt9vbHmuPAu7fzS
	2sORlw5OBSN/eQxvTBczCUxX9UWn3+P1wa3VUVbeD+jTTTsN7ijkxkb0YQY5DFfIWdDgta+i2/IiT
	D95iucADQL1hP9mkZAR4co79LAGgcSAoIX7u9Ar63zyhZR9c1Fd3SG9+BG2k71jG5a/pmVzkhD9za
	k/5t3a4qy0KXSKcIImsBgm2NeILyfBkIxtkQjk9v/qQsNKf79P0pNW+LV5LCKV5rPlv0wb/pBpkyV
	PZGDhD0f71bwFlvKVj5tgpA28RuaYNR0wvMZw4xhwAep/FAZUsW4c2HDhOyv+ukz8ba2rbTqzIb6t
	KdF1QV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqvk-00000004glH-2LhE;
	Thu, 08 Oct 2026 16:25:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqvi-00000004gjx-2QsX
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 16:25:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVmsm2124229
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 16:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrPZf5SWpHn7JseCoewc3m7EX0hPPEz3Jrk1GAafdW4=; b=hQKewCh+rxpwHiyJ
	rSwqE2PX3cd9T+3U53kvUEh5cblkjVgzW8qkVUenjMsD1hry9OjtWr9He1oF8uMP
	2XoB0464xFZ4iQ0EnFj8xIhR9A2qiPIMOVUH39jdTLP1fnuc782wZFBaRsQKjBvv
	0Q466bcdVWZKVCo3xJRtFYiDmBq/OXvAJha0rUttpX9g52Q+npw08+R9b8u2l9Il
	zsPomHgk6I5bhmdmH2FfoaraSV5cwl9qcfzpELR3yETBmX3hpKJ9awst9sa4RSYc
	qy8WqtyVIvc4XiT9THJPcMMtRdhM5oW4q/g9Aj5GbDhnSfvbu42D8RIQSnQFerPf
	7iu4yQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3bqd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 16:25:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so9371453a91.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791476704; x=1792081504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrPZf5SWpHn7JseCoewc3m7EX0hPPEz3Jrk1GAafdW4=;
        b=Mq0awDk5R5f7dlLPUwKxC67cYSK0S1j0ZJ5BnqNXS35EmRgizv7ZxkUz4B6f3nEVeV
         nLi3o6HPGMc+ZpwHA354w4VZ9yJqCoeD/B+1hqCAM2bJypWMzszilXpFj25wGp2vA/m8
         oV6Qx1hVhBZmJ1F+IISAtmww4cK6wYIaKlkFcIkwgJUDnRQtqhPRJfoiiUizV0mkEWBV
         XimnD1zlhyjnnzCWwvf+XQ13Z7kqPEGLVNxoFsat7BkvvmgA6CRa4l3E860uccaWRn5w
         O6rnhWHKrmvfjGdzzQ4DLIXAIRDgi7/Xp8ImFCLk+jEzYFft+9vaGai8VS6NOYXgapTX
         1yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791476704; x=1792081504;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrPZf5SWpHn7JseCoewc3m7EX0hPPEz3Jrk1GAafdW4=;
        b=kUBHeU9ganCjjVzdKvCXXb8T2gB8YVdPwDq+8F1Tz2y8lI51L6REPI9uDf3DVo5KHW
         9cETijPXtLe+xjzv8HYYmDPMAITzwakncrVVW/6dn4/qyWrBJ3YmhOiHTd2Co8SjWIVj
         EFzP5Gbm3gdvLFO3iLNUJK33T1pg5AnhvH7xJx+CESZXmBgxUngJ+WIVIA3Ry3zgQKr2
         wqTMRqCao4Fg6lw8OzErKaxuaJZmEbJNC6CJdT9U9xaZJpgkH9XUdt5VSKNFLat4Sp+V
         Lb7pLnJE7xMHLTL6ugxoa5I57Aa2qUeJMrf67DVQ3OgPN5Oqp4ets7HEYJ846cmiIkda
         Pskw==
X-Forwarded-Encrypted: i=1; AKwUvBzVs5k3LJ0oSqL/Dpn7LEPzmIgMS7rfXqHkgOmSkI0qYMIrWDVlb1ZZA9FJbEcn1AJu7CzLfXE=@lists.infradead.org
X-Gm-Message-State: AFq9FYLs9DfWoSgzGI9N5AzQPcSe7SoKoVeYFqCYMYyeUlneyhHLyOy8
	6JZFgu45Q1pJ/hdm4H33Q8YpeTwc5c/AdPzvHEDv8EUON7egfzNYweE+0W5eurxaDiAC5Fjxhoe
	onHJ859RrhE17WZRlrZ6EzlY39AiQszJrQ4YqihgqsL5youyFbZmu6RCDRe844Uo1
X-Gm-Gg: AYBFou37QWwSQLqwuLhob9OJVP2f504A1U0nKdpA6dHFhH23itNlh4s1xC87IbuS7f0
	aRjeElzRHttu292wdQCakr8A0RxPrDvve/dVgmbKso4+NKtsd+G8R5eBQyxF2xvMxCuKlP/KaaL
	fbDuG2aUOs5sxGBTfOJw0GguBRpwWtRtb1jlDU7wY+bTZbTUnCcZ1Q8bVs+km3FNnOilgf1eEXy
	zPfOyFso/GUOg2mC7Uv4L+5PtZs6+ucM7IwpNOK3A/N7Wa6sh6n3HGiSDAqOP+P1xxrynWWihhW
	+B9KFlqp/uHRib2NO/lGrHZ13etC/hXod7II/OeX+nggxR+Oy2mMKKD3XgkBE2XPnbEH91NFW1j
	DrAMUlkNNJpy3Io0hJVz2kMK8LRJ13BqezU7xOmj8Ji0=
X-Received: by 2002:a17:90b:164d:b0:3ab:413:49af with SMTP id 98e67ed59e1d1-3ab04134fcdmr2005941a91.49.1791476704213;
        Thu, 08 Oct 2026 09:25:04 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:3ab:413:49af with SMTP id 98e67ed59e1d1-3ab04134fcdmr2005742a91.49.1791476698950;
        Thu, 08 Oct 2026 09:24:58 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff8669eesm4665613a91.10.2026.10.08.09.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 09:24:58 -0700 (PDT)
Message-ID: <b792c43c-1b59-40c9-9ddc-0ed263104aa3@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 21:54:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Configure RXDMA buffer ring
 size per memory profile
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TBVzo50CVXZEsG7D7hAZbUSqQDOUzj7Q
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac7c3e1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xhaovxbADAV7QXi6LY8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2NSBTYWx0ZWRfX88XbqUfZU6Vr
 ydHJc5ZU6kxMn5ehvHQ59rSwNK2nyYhGvQ0bQGJoxArAnv972g2n6NsfuSofLtE+ahVqIFoq51p
 YcteJaHohdjCiZIeTAYpLk1uuTmHcYc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2NSBTYWx0ZWRfXyHyaJkmW/8xH
 z+cxnWx2041IfFspncmHxYQahzbg3XAZ1nTyHqPkwRgFzJcwdv0nFhLnuPYccD1/B0hNUGAcu21
 cVqN9zA551vDslbYiNqwEloUB1sFWsl11eWESX+/A6nMVgrIFKEPcrBDc6As8/GVTCfgvYExQn4
 sIqRQSZIqdC26Vi/lYXe+8PtU0A0u8VAbRctvd/vwJ556HI0GgHFNJmEYtiA1wBSjQtLf4dfevN
 OrDDmK5mggsr9YXsa3SFcIK9kVMTCYNUV0XtbHJ++sUo/JWDmYOCVtaJDvIhNVE8bGN/jN6GVkF
 Uvzwsuzk81hqPpAMFYdAuAEpKvCayFnM77C3rOwwiJY2s6X8uOKZXfBMhP09DZIxHCedCm7hFVt
 1ZF0As8CHcG8HqlxVzp9LDzajnrj5fUe+8GTcusYuqY3Zk47QhEwpueDmheBpG+QdQ7Kxnex/M4
 s/hUt2Vr0xOJ1ET0LLw==
X-Proofpoint-ORIG-GUID: TBVzo50CVXZEsG7D7hAZbUSqQDOUzj7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_092514_764940_466245A9 
X-CRM114-Status: GOOD (  12.31  )
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

On 10/7/2026 2:53 PM, Aaradhana Sahu wrote:
> The RXDMA buffer ring size is currently hardcoded and shared across all
> memory profiles. This makes it difficult to tune the ring size based on
> the requirements of individual profiles.
> 
> This series first makes the RXDMA buffer ring size configurable through
> the memory profile configuration and then increases the ring size for
> the default profile to improve RX traffic handling.
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
> Aaradhana Sahu (1):
>        wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile
> 
> Pavankumar Nandeshwar (1):
>        wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
>   
>   drivers/net/wireless/ath/ath12k/core.c  | 2 ++
>   drivers/net/wireless/ath/ath12k/dp.h    | 8 +++++++-
>   drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>   3 files changed, 10 insertions(+), 2 deletions(-)
> ---
> base-commit: a90ebf2176db07c5d91e0a62e15ded1fd50710a0
> change-id: 20261007-mpp_ws-a041d5cfac9a
> 

Other than a commit text nit in 1/2

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>



