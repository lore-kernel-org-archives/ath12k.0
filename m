Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70C5FD4609
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 01:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMgNABMClazAKP8Gmu/DAP8KsivDNJ19jCLyf5xAcXo=; b=olmtihvKudUnNglzXNmXQJZxzp
	jYAwLps5Ab5wbaYCr25gWfwt/+PA/kP3KfE+OD5luhbSR71y7eylppPO9HpAcv1MKpH3cH/AlooJO
	TrTooQrJ/pdsz3H1I/o8IU6RIiosQs9YcKYzqOTUMMNQGHRSs95FOW37/U5MVkuHOh3MRXyJflMfp
	geeJQ74YTGXO6yqEXJAThbd9xWUh31PVpuGS03K5LN91Zx+dmsM5hVqrrQNTs2iIzAGGVtoEZwbW7
	gTqQ0H2gY8MM2M4V2D8cSwY9X9OldcKBv0apHY008E4oL5+FjZtBWQ6wXf3xenrOd+3qK1Nit6jW7
	ftkACnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQWP-00000005CrE-1m26;
	Thu, 26 Feb 2026 01:50:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQWN-00000005Cqj-2y4N
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 01:50:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH4iuT2561167
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 01:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMgNABMClazAKP8Gmu/DAP8KsivDNJ19jCLyf5xAcXo=; b=U95bGc8Mvty1NG/K
	CZTWWvG+VRWlhTV6C0VMTsNezId1z78Wv4WHNmx3u8sb6S+8sgpg1T5aCISUlPLU
	H0hi0FSdElu8FpmvEq7shckpXqyxoXoUSZoQruAOlfjgWO/hRsxOEssKocJpTlkD
	v+QEz2e3OCst28VWZ1j/pwGQn40IP3DNp5Yj9TF/xJtHJxIfuDE7CCDTcwdHjnNV
	YfvllzzI+ELBpsE3lP9Y8g6/Y17AhGqcqqtibV85lAW2I+1Aepy/YgbsgRbHmGMS
	6WEjRhE4Lk1W70nEW8bulmv7DaQPOaHJtpT93+R8Vufdwu3UE/uXo22ZL+SBRzZq
	We608w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj55ssanx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 01:50:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adaa9c4b89so15058035ad.0
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 17:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772070630; x=1772675430; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMgNABMClazAKP8Gmu/DAP8KsivDNJ19jCLyf5xAcXo=;
        b=bj6qwRZTsPrP5Pn0iuOtgw7PBvFII/jmN/mh1JuJewYRh4t5aJyze0wSEj16etGNlr
         30FTWqZQswifbXk6QHw3PaTF1KZm+bvLRHbyDfhOKkCBbQpnbZuG5pikL1dK9zOy0XRU
         5ojr2n3XyX7XAA1kKAzC7lpBKorSAxmbiiiTl6n+FDh2kpKftLspASO0PMX2cz1OJSxY
         +82nhoyKcJqyhxn64wAoEe7BwMjBKwu+ybil+PjADxY7aSLJ6+Rs7G2VkAaAcdpktIeM
         Hxz96vQUxAAVGlc0kG5XPSGtSsChzrr4kDfccUxUAhWo9LWG3psxyRX3BmmdmulCQzeB
         I4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772070630; x=1772675430;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMgNABMClazAKP8Gmu/DAP8KsivDNJ19jCLyf5xAcXo=;
        b=LCqpuRC/EMe8lXvDflO+CAEXX157LS6FgDqXA6snsQx/1Pp1nmmFZtYK0Uo9GdUy6K
         QEK3/FIUGGGkNGL+GD0cGDnxIBsCYJwNOhpwCoXySszn8VUIN4TRTZgAH8WQLH+afvV7
         17sTLpsMpeYOcr562Y990UafyovwD+rcKLoyVdDgwxSYJlhp48PIeFhorvzUe64xNF7Z
         oayzuMAH6O3ZwgnsLrsLjTI+rMvQzzPC4TQ0vrXlV8I14FYAv7OWxTnlOLC3qwSxIbIe
         9bceugWbgij9LpsNjpAKPAAwGoCfnVG0bsDTAwhMqKmvON83fp9Dj1ET+AvAqEEkEd1y
         hoMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXht43HoD5FXFJ6ddxEAEhtHDSe0SmBlqsF8SFVxlZVijhFvnokgvd1F/PO+yGW+f/NiFHIr8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfin9fpHr04ohEUil9IRQU8sINxtCxgRJXvs+P91fkioxswptr
	z16KGP0R5/VXoiBOM4h2NA1rZOwN8nt3Q90w4l4WyjGYD/OSifjwdD2sv/N/ZkscQGnDMPYsnJD
	ppjPjT8aFz/OUnxaXPB+oWNRcEdla8BYgzkYgDsqb3SmtkL7BwBGMs3fUJ7JvBbqpNBxIUxnR
X-Gm-Gg: ATEYQzy6LC66HTS1pr6YqM5fvtCnx3B9atYpl7DWxtWB+m10eOTQpZCQJB+U1TZS9Jd
	5kpZWUiTTJyvxqQHvIXHhD13UgeEojGcSGqi6fHfM1pvjSu04uueZs/qyQ9N8357sDNerPUTWJF
	1doSxKMZAzEaIpyzoDreCBKAmXZVDPvN5roktC2r+pLM23e9/G2GpbQAqN+iwxbGitxWwz49jiy
	NA9Gl2nvGU8vibalPKb/b9hoa+JpzSE+pT3NxR4uhue7EcIELCKqMWTlgZUDO2OezNREjYUfCr/
	DbdgvnG9lzlzztfVrotGp0+IppOvNeLvGO3WZAyHMyCKwOfJpb2QoR0+ycgGdZ5JrXYaDVWWAZ+
	QeEL3GknrR+QNgTQVOmFYvBD+4PUA7iX/DBm0A+dbpnjw9q/esDl68OFa6qGuwYGObvZAiUhQXO
	gqjw9OQNeWjof1ScnVxac=
X-Received: by 2002:a17:902:d541:b0:2aa:e55b:22c4 with SMTP id d9443c01a7336-2adf78fd098mr9996815ad.9.1772070629932;
        Wed, 25 Feb 2026 17:50:29 -0800 (PST)
X-Received: by 2002:a17:902:d541:b0:2aa:e55b:22c4 with SMTP id d9443c01a7336-2adf78fd098mr9996465ad.9.1772070629397;
        Wed, 25 Feb 2026 17:50:29 -0800 (PST)
Received: from [10.133.33.106] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c1976sm5861215ad.22.2026.02.25.17.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 17:50:29 -0800 (PST)
Message-ID: <34363bc5-2439-4579-8999-67dedded39d0@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 09:50:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/4] wifi: ath12k: avoid long fw_stats waits
 on vdev stats hot path
To: m.limarencko@yandex.ru, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260212121746.329619-1-m.limarencko@yandex.ru>
 <20260212121746.329619-3-m.limarencko@yandex.ru>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260212121746.329619-3-m.limarencko@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNCBTYWx0ZWRfX6c7pDU0i9Y4q
 kkAJsq09eN2QqXWCXVGROaOVeSMlrCOvMCXX4XdQp/nHcd8tolEnZNJ3WaLC1M1HIN+aAAVmTh6
 KDDJGOpSY2FWoQF80SuoR1iW4RXfuALiqcMxebEDSeSSjzXxvR3nNBJg2v+cnEwbb0CFLmAdGSG
 Drdz0APXmu1CdPLUR+OHc/g5F/yfoOo7nYDKHLsMs/SxHoCkUWYo5vTg7hQPAKxAu6FAoyi69Or
 7AaGNKBZeMk72kzAGiskaozoCBCK3vfAiYEx8gaAqhVFSKh1f51YZmFcbRXesWzBErwfQ/E/nWH
 D9Sco5nXERkeVyd9QPvapKkqfV+8yTqvOms7CvklusP939kIrtzJ1R9MA6WspaVM8363fbdXkyN
 wT32mlBM9nCoIqIIjACtydnvGA2HWoBO7HsbLc8XIDc6r8jZvrbUr/kK9JX7SfPOZeSCtyy6Hnp
 hbDDOT0Lvb15cns2Fzw==
X-Proofpoint-GUID: Td7H33tIe15a7Nys2bcELBwzw0AG023N
X-Authority-Analysis: v=2.4 cv=JfGxbEKV c=1 sm=1 tr=0 ts=699fa6e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vaJtXVxTAAAA:8 a=w32g7tGSt65Kz2FTHNQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Td7H33tIe15a7Nys2bcELBwzw0AG023N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_175031_758750_1B557918 
X-CRM114-Status: GOOD (  21.17  )
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



On 2/12/2026 8:17 PM, m.limarencko@yandex.ru wrote:
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

once again, can you please try

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


