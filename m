Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0723EA3F05
	for <ath12k@archiver.kernel.org>; Tue, 10 Feb 2026 05:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuX88TmKTlybTx4SXCqbtswQPc4muScB6Wf5dRVF0+A=; b=xAcwmfKIMAal9p4sE20Fx52AhU
	+85/tYjDi3iKMb8GGeYIwErGZ9Mq5SYjlUoL7dpQDYllbLWZQwwyga5v0wgdXCp7WTTWIFZQI9A56
	IrzJQJ/NtQSx78NSaCTqNeuxrnOhvZWClGpagcmYsWoHX5vV2MMM8zO4T2ju9kvcsFopJFK+YKoXm
	SeOfIfkGVGLtl5cXxIYBK7hG5KbUjEhf8RrOPew13tQShRj1K592IYe08IdSSe8czyoUqWfxo5e/q
	M7aY6XnCKIIRMo08APVhhe/sOX/nydyb8cSwl54+fXceUJF8uPpZVFzhilMbkxMZ0+cOC4iUL43Zo
	8yD09sRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgLE-0000000GTZy-2673;
	Tue, 10 Feb 2026 05:31:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgLB-0000000GTZY-0C3e
	for ath12k@lists.infradead.org;
	Tue, 10 Feb 2026 05:31:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3aQ8x4102209
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 05:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuX88TmKTlybTx4SXCqbtswQPc4muScB6Wf5dRVF0+A=; b=ce+gIzrD5RMB/eya
	SIChmwwA+xZzloGXMfBZfHt0W0NHqX8PtBFPHKqa4laTBwGnIVn8uiiIFNTLRgP+
	5mFu3g2CL9niTIXw6NgF4qaEBMoC4qiEUYxSvNXKr4fRg3td9PuxV4tJU0JltJRl
	Ya9GUUlgTRiGLcFgneuEpDRtIfKP1zcNq2zdleDe+C5Bo2f1PA+03pPSLvLc94kQ
	6EN8KPu2SE3rORPM+EXp6AwzsflT6/jIa1IjU5jEDbCf74ntccFcWLWs5sRAz+EL
	enr1hlxu5gpUJu51f2AL5xQahD8FxmnfK69Gzzt4TL/TzQtyJP4juNx9o+W8063b
	XD0mEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7k61j76q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 05:31:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so61639705ad.1
        for <ath12k@lists.infradead.org>; Mon, 09 Feb 2026 21:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770701471; x=1771306271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YuX88TmKTlybTx4SXCqbtswQPc4muScB6Wf5dRVF0+A=;
        b=EW/3Y+i0GaFFPIKpY6LCfZmiuJFPor7gF+y0JcsdDozZgfTSkDG+oqkWmyNS4gIChD
         D208XSI7Jc4tePR1+k8l98KeY9PdQk7VFgWBp9pxVq7KpZThyrYAC2lT8qRODh+CrZwi
         VXop3O9VbLpRMTz8OxuBEwWs/Mkonny91YYtelQPtUcA6h0LW9aVozHI8F79KzbONZ/Q
         4vcgb1w08DchxM4Z2I/lFRnq4EhnfsnbEsF7pJZWW+9yS2tBZm4lpOc/5G0XJ5nK/gHK
         5zCAyDo1g7CBsDdyxWptwF+5tbVciVWdPuGIT2Sqejx9D33Kas3aGU3DDFE4857KlPIU
         Qapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701471; x=1771306271;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuX88TmKTlybTx4SXCqbtswQPc4muScB6Wf5dRVF0+A=;
        b=l7G6tuoPdXceifC6Lk6mtFWD8YBJbRh8MUPmvKKD6u00PgPQoWnWb3J3uYPQp5hoCh
         bk4/VAgJXcxCEmYJR3fnviNoYtkfMQDWZVq3TiusgXNB+mZ598/uGNfQvh7+KAJF8/uZ
         MCo58vJeZmbGlLhrQkrYVn1RsvP4lBGYPGSzG6bI5eEkiehQjku/+0eSBsrfMLd1zXiI
         gV5j1pLdVq/hZYQxz/d6UhpkBI0RzUCDN2Gkqk82kz5hznaoHKiyzzOJc9sPNkqPuOj3
         XRFlT6tjDaN+R/PRhkk2B+HjzvARp9gC9MGvUix/ohhL1rs4jp4IbOMGtiJV4OhWxKDj
         wvJg==
X-Forwarded-Encrypted: i=1; AJvYcCX1fgHWHk0aF7tfXBbR7vZISD5ASX4dfUYfb/wof+p1DnbgblO+fox8kntUkVlRLZ87QKwnIpU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdSPLfFxAFYzbWJTsr9tQ/t1JXgL9pMg1kK2WJ0FB0WyaGhOJb
	bv5AYAYlZftm6kRUnwHVItF49O8JORAUiceI5FxfAeGiyO3FBOLOvMhKAxuV7V0sLbequP6Ur11
	2bJ8BLjnypIBGNMBuIfa4ybIdxTZuOo17DHRQHTcLhZ3aVQFhLEtxzYpguDSmTixR
X-Gm-Gg: AZuq6aIsZ/yiAPaqHi/XL29hfHKjTpJMeOWs4s9tZQGWDhgUhScgX/52tzQq7kJqvN4
	E6kh+s1P3Yg3VoY37suKrWy4mk0kBJpwbx+xF9GZlHyhRylZFlHmA3r3TA+t3zXhgAtd0085sWG
	NdNnsC/C2wvEDrg1nrlBVvwJkW+sdVSEhCikr8xnCONVOkVxcUeFWS1N+fjFJru9ZZgMzoHclqz
	LO7fMUKI6jckn7iu3OnBTD0gXcsj2QF1GMwFf4uT+edG8MzSFSAOvZG1bxItfM3oV+PJWxV5ay9
	80onMHmzFZTpls4QodXmKrkC93npPNT4PdjPjJDOQaxRKHweycxlQ+2Vn0S5bg03CAafbbDl5y1
	S68kv7VB40L8V5r4DlqCl6/P3Av3JUCSgOgJ4MO99Oe+PnEzWYB1LO8KC4uHdbICK3OLnY6RK79
	jJwqhVpQzljK2W5d4xoA==
X-Received: by 2002:a17:903:11cc:b0:2a7:90f2:2ded with SMTP id d9443c01a7336-2ab100b947emr13754065ad.16.1770701470647;
        Mon, 09 Feb 2026 21:31:10 -0800 (PST)
X-Received: by 2002:a17:903:11cc:b0:2a7:90f2:2ded with SMTP id d9443c01a7336-2ab100b947emr13753475ad.16.1770701470115;
        Mon, 09 Feb 2026 21:31:10 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c50206sm118908485ad.19.2026.02.09.21.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 21:31:09 -0800 (PST)
Message-ID: <a434a83d-6f93-4103-a810-804caa4b7555@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 13:31:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/4] wifi: ath12k: avoid long fw_stats waits on
 vdev stats hot path
To: m.limarencko@yandex.ru, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260209030243.1530075-1-m.limarencko@yandex.ru>
 <20260209030243.1530075-3-m.limarencko@yandex.ru>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260209030243.1530075-3-m.limarencko@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M8lA6iws c=1 sm=1 tr=0 ts=698ac29f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vaJtXVxTAAAA:8 a=w32g7tGSt65Kz2FTHNQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA0NCBTYWx0ZWRfXwz59PW5Pchh6
 x6LZxUXOUS+/RdW3hEg1+3Jm0Q+cZcXPmXZuxaptYjFY1sAnlSpCrl1fD3IhzK1waG676F4o7tZ
 9jFNXoDiS+A92GGysz+beIb0zapygJ5N8kouMwwjzpny9UnX1f+gTYr8lytxXC9fg/IgbAKQFQx
 Zf9le3iR1cqBNwfB8oLU50OKeqwSnQ8iWdVGEqCVdWYW85y9utnu9i3XCCVzCgggWXQQfxEtD68
 XAqLTlJy9mhpw9swMT1HnH2gDxmqhwVnGYxEoetYBKRXyj+yy4fLQP/WrUFAF+yP/miPDXPcCXQ
 vMFRH2hp8o7V66DdMKUncxciGzJIQfTOyTVlG4FmfsYnKP2v2D6AQ5NmSEvLvzFuVnWaXIQ4jMQ
 4IdhdaXA+01wVEoGGaI5XeqZ4ZoId2zhL8yuGcmFtYE9+mb/aZq0hh/lImtmNQhlXS4UxUJm9AT
 NDrpWywOI8UbW9bt0Fg==
X-Proofpoint-GUID: 81Idsufkj5Wcgpjq8wh5sgNWLzw9ZhSo
X-Proofpoint-ORIG-GUID: 81Idsufkj5Wcgpjq8wh5sgNWLzw9ZhSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_213113_236144_F69E6B4C 
X-CRM114-Status: GOOD (  21.22  )
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



On 2/9/2026 11:02 AM, m.limarencko@yandex.ru wrote:
> From: Mikhail Limarenko <m.limarencko@yandex.ru>
> 
> Station info requests can trigger frequent VDEV stat pulls from
> 
> user space (iw/NM polling).
> 
> On affected firmware, waiting 3 seconds for fw_stats_done causes
> 
> repeated stalls and visible hitches.
> 
> Use a short timeout for VDEV_STAT requests and skip unnecessary
> 
> waits for stats types that do not need completion
> 
> synchronization.


can you please try

https://lore.kernel.org/ath12k/20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com/


> 
> Tested-on: QCNFA765 (WCN785x), kernel 6.18.5+deb13-amd64
> Signed-off-by: Mikhail Limarenko <m.limarencko@yandex.ru>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 095b49a..1b550e9 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4829,6 +4829,7 @@ int ath12k_mac_get_fw_stats(struct ath12k *ar,
>  {
>  	struct ath12k_base *ab = ar->ab;
>  	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
> +	unsigned long done_timeout = 3 * HZ;
>  	unsigned long time_left;
>  	int ret;
>  
> @@ -4859,15 +4860,32 @@ int ath12k_mac_get_fw_stats(struct ath12k *ar,
>  		return -ETIMEDOUT;
>  	}
>  
> +	/* VDEV stats are queried frequently from station info paths (e.g. iw/NM).
> +	 * On buggy firmware this path can timeout repeatedly and block callers for
> +	 * multiple seconds; keep the hot path responsive while preserving behavior
> +	 * for other stats types.
> +	 */
> +	if (param->stats_id & WMI_REQUEST_VDEV_STAT)
> +		done_timeout = msecs_to_jiffies(200);
> +
> +	/* Non-vdev/bcn stats are handled in a single event. */
> +	if (!(param->stats_id & (WMI_REQUEST_VDEV_STAT | WMI_REQUEST_BCN_STAT)))
> +		return 0;
> +
>  	/* Firmware sends WMI_UPDATE_STATS_EVENTID back-to-back
>  	 * when stats data buffer limit is reached. fw_stats_complete
>  	 * is completed once host receives first event from firmware, but
>  	 * still there could be more events following. Below is to wait
>  	 * until firmware completes sending all the events.
>  	 */
> -	time_left = wait_for_completion_timeout(&ar->fw_stats_done, 3 * HZ);
> +	time_left = wait_for_completion_timeout(&ar->fw_stats_done, done_timeout);
>  	if (!time_left) {
> -		ath12k_warn(ab, "time out while waiting for fw stats done\n");
> +		if (param->stats_id & WMI_REQUEST_VDEV_STAT)
> +			ath12k_dbg(ab, ATH12K_DBG_WMI,
> +				   "time out while waiting for fw stats done (stats_id 0x%x)\n",
> +				   param->stats_id);
> +		else
> +			ath12k_warn(ab, "time out while waiting for fw stats done\n");
>  		return -ETIMEDOUT;
>  	}
>  


