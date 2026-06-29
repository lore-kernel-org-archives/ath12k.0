Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D2EC43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 02:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4abkKu4sQ1tJMRV3hdHTPzc0XMo2rKt10nW0yQvRv0=; b=15AjXwM/TzPSyZ+Ve28iDY2CG2
	uub54HBVANErIBL5tcGj7zjzG4jHVRt0G/jAewfquo5ue4qwC8gVm2lVcR8lkoso/eOk7q1U4GaGy
	svZFWosBmAormBAMAH3ecb5RkA3GJZw06ypFG+80OHi2aD1tU6zlT0tOO0dVA4/ZCVwyalwwrBfsj
	KhUoCZMcUgzSgTOLjfxWv7fOtRQZMR6u90G2YWwaDbUhOHVsBrWm++odHBTE5njZ0PvEYF+CpUt2a
	cQhZjE/XPpTwxNApCaGjZKES06cr01pl3+rXrvzrqZAYvwOAwgL5ND26b5yZT8p79oy0NtS1Jj3Ws
	SextYGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1Nc-0000000DYuv-3Fen;
	Mon, 29 Jun 2026 02:05:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1NY-0000000DYuY-1dUk
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 02:05:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SNwVGC1177727
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4abkKu4sQ1tJMRV3hdHTPzc0XMo2rKt10nW0yQvRv0=; b=CM7dw1USBOC8za5M
	8WHQ8e6WowdkgPjdF9gKRyeNvqhXitHg4AAbS6OJwqfbbQ4XirCjipZfmhZ3yZTW
	UOVIv2x4yDDCM+wBL1ZqfTT6oXMpfr93d3WKyqgme0h//21gRp/yqiPwNS91Ov+a
	/WESK//t1tMWHi3TjtmZijtNdlXp8QGUSYoVkDCh8CM9bKu0AOTPIgAmQw/MOIid
	YEzGt45CQWAVnh3Axv+rb8YoxVqqL14oE2Z2nxFKeLG4WqjylJfPYsU8JJv+epRG
	sRkY88lupqV1r1+9XXRyRQlfoIPtbwKXCf32kvl0X5wdhF4wQwqWNivxmCBS6IXk
	46fXkg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734c3u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:05:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fd28eaf13so755587a91.3
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 19:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782698742; x=1783303542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4abkKu4sQ1tJMRV3hdHTPzc0XMo2rKt10nW0yQvRv0=;
        b=IyCQ32w5yzdazBx3z8qAn7l/zrYnRo2IvNnMqnAxl0s0zdBFBZ9pc6/E2mS9EiVX7L
         LB08iwpXE9rWg0FfR+zQP/G9bq3eyTPqA4aC/Wnk1ddTHI4zdZP3bBj0cvkWmWx+7qrW
         wuDMk/tptrpRyxV5AYWBLz+Z9q5MYxhVNbA9GcfrT/n8qJI5ycOB3G1XDbtoEAy4kk9X
         X11U8l/r7NEbjqzclkHnT8A8zFwZTfvqHr6/e3bnMYkzSATZJLB43LDFiE6s1PJ0P3Sa
         72N5eKuToCU3JQFpGSSofbiGFWbsQIT8XSLjSqgwrGafnyYWhasKcFKwyCLlZ634dHvD
         zHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782698742; x=1783303542;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4abkKu4sQ1tJMRV3hdHTPzc0XMo2rKt10nW0yQvRv0=;
        b=W9l3lAGkNZgN3IuWXiEjBCS6cBnNYRyGQBuASTSFuHPBlCoVEMaJpbNV73yHixcUHe
         0FSDfvqTGHSkYbFaO0cxN5aWhWZEpCFaebzlyxvpen7SRv6UxuMMmFfIig0hvBpes2PP
         tvIDQAZi2qQKBYH15qVH4INWhRXGkhDrMnwrqOE8BTF0CQpwP8KoutJx+j6F+Ju/1MnH
         6mZ+q5lJezKAeowEmafLV7JTCQKX1Yui4W85CgVK6D+TzgzE1Yr8djerdHzp+aO6tizr
         uRjzJOA+sK8umZXYUnN0NBvbPVnvtVG5f0LcRCrgqhy2CTo7me/wcmKe45iJqRuxf8ef
         7B3g==
X-Forwarded-Encrypted: i=1; AHgh+Rr4W73Rdh3tZJlfMSwc1DyqmJFeyYTBw7XLM7xkhsQ9E3ZimxBeFYyL3+CZ0xPa890lz3xzrYg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqSOjDRaxGLX82Va5aRFlMI+THTn9uZJBrOGOYtTAHy9Y/NCBs
	HkT7uGlH8kvU/AtE8lxk5xgyLpT8wGw5jH1Dh1ZNL0mCDH8k+fQacgcPAo1UJQQUCwjD5jXizfa
	l+Bx9Fd6Gg3gE95ip9oyJ5UOJFW4vnmzc2CdJm6ECp338F7yBzIWDqVfl1Zu23rA9
X-Gm-Gg: AfdE7clsVBaLta3q95UFYtmpLL3y+aiq/ZK4ku3hBrlRMcal5sBmqAiperY7pTiT4ZX
	+Ts2b+ypCt74QgQ76FnKBrg0uLTuvHSQFJr4tfvj/8/KW47AxEsDd8x2QlvIj9x5zZqVEKAOfUm
	UPbIQ7XlujD4Y749Ml2lD2EISMyhwlFiMxgtGSQ/U8wEGtW5OzJwzsIFhm0s0Hf8yK/4Tw1JRJS
	mRXd6JgOyMrveOjNeo65Pn4MTPyR1NFCWm7QiXCcTv5waU75pjpxmjj/c/uD3OeDIhxEh0BJ08x
	x8lCo85EmJcPJ4kYLnPkjCFAZq+ZzHusGSg7tNocl3wTnV+fcNtKi3efga1jdWDUIrJzrQ46q9c
	t7T9jGIJBW2jQp9d7ZWDu8n3hwz0Ssk6LFXnreb9WEchh15vodJ+n1H2maVnh2E+MOteBAfCBZR
	3r/P39XA==
X-Received: by 2002:a17:903:3b88:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c7fc75a973mr134086185ad.7.1782698741824;
        Sun, 28 Jun 2026 19:05:41 -0700 (PDT)
X-Received: by 2002:a17:903:3b88:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c7fc75a973mr134085915ad.7.1782698741312;
        Sun, 28 Jun 2026 19:05:41 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca0b454815sm5544705ad.2.2026.06.28.19.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:05:40 -0700 (PDT)
Message-ID: <67a43edd-2cff-487a-ae34-2129985bcba7@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:05:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: correct monitor-mode RX
 metadata handling
To: Sushant Butta <sushant.butta@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wWA4mpl7-clz4l1IPq6jPVX9td8DuPPR
X-Proofpoint-ORIG-GUID: wWA4mpl7-clz4l1IPq6jPVX9td8DuPPR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNSBTYWx0ZWRfX7yxjQSbeQQ+4
 bohJ6ZZIjNb0W+ZUfrEZykD/0qyZS34orSyG+Gn89z0bHv/ofGOpFeT2gfcj+d2rFiI9evbRpXF
 8ojvitSnz/aeNmAE94j47SLf2uNDcgM=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a41d2f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=k0c8v7JCAQ1gsNTydDoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNSBTYWx0ZWRfXwXooezza1WlP
 Jgde01EuO8RWYEKJjm59jWfZyY3XnmIatgWUJLOt7Dlh/CTrU4OoLlGtb++aJCDgaOGq+DjeAIZ
 fslrmLdjbjnJjHyvrjD05Ub94EUXEc4XZOwqRTtiEmsJ0axhx7ZkZmDG2M4R+ipcxM/el7nI9KL
 NANZ69LUO6kevgQSkgtOER9YAXh2eu19mlJUFEbHbYwQWwrEuLOvJky1YwADJe8OANMr2GXoEwW
 CuuhL7WSX1evO4hhheq8Vtl++8lSGdjLqzCd5xvf8lhJjuxiINifGqVVrdqtGrrt80HiL50nvjC
 XE4PEzb17m6a8qXBjl7hMGwZtC3VHuCxJJolSKa+lZfa8A5/gI0/by9R4KCu+qqunoh6OR//5Vb
 c7ascmCBqeXJVSss5eOaEoYmkYwmV3W7QeLNkJyE5S37sahPeMz6DCJveAHRZ+d2PvkCgcJjmT3
 Z9kI57Rr3jl2zsLWaGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_190545_409128_DB9FB1F5 
X-CRM114-Status: UNSURE (   9.28  )
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



On 6/9/2026 2:48 PM, Sushant Butta wrote:
> This series fixes monitor-mode meta data handling in ath12k and trims dead code:
> 
> Monitor mode delivers raw 802.11 frames should not set RX_FLAG_8023 flag,
> and populate peer/link metadata in ieee80211_rx_status for monitor MSDUs.
> 
> Sushant Butta (2):
>   wifi: ath12k: Skip setting RX_FLAG_8023 for Ethernet-II (DIX) frames
>     in monitor mode
>   wifi: ath12k: Skip peer link info update in rx_status for monitor
>     MSDUs
> 
>  drivers/net/wireless/ath/ath12k/dp_mon.c      | 70 +------------------
>  drivers/net/wireless/ath/ath12k/dp_mon.h      |  4 +-
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  7 +-
>  3 files changed, 4 insertions(+), 77 deletions(-)
> 
> 
> base-commit: 38b2fb7d2df16f5801f7d88a4739942b95a5f6aa

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


