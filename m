Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D2FC4451B
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Qt1djWNsoZvxOfSlqVXOUPZ0wf3R2BBKcU7CUAFuzA=; b=zcQKAXo1//yfsw/4f5U76Sqgwp
	cEbU286v14r8fWl1CBkWIE0trZ5koA/wP0XE/otFXEbX7XNDffVtT5p2+9fL6xK7cTBe0oahZx3i4
	WCcAPWCmHunvf5kZ6A/LDZy0+UJfFuv7R9Pz2CaUbMoje+aG+ushSdW3ZsRX4QzaUpqcy+PTP2CU2
	OVPvHh1XdXyUf+WbmkDYEInOSgOSJPpGtD0zJSNLVebLqsn2A7MMDGRD/lj5nHPcNro57x+UVY6Jw
	OBRfbg22KVikOKfwMPbajPaSrKX/93+0BrsqqnLVBQJI9gNJNqvzCIEyeCobfot/rmDnC1uMEaftZ
	g6FkFsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjjk-00000002Usi-3Fxj;
	Fri, 17 Jul 2026 14:40:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjjg-00000002Us8-49dO
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 14:40:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7v4i2106293
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 14:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Qt1djWNsoZvxOfSlqVXOUPZ0wf3R2BBKcU7CUAFuzA=; b=Txmp1rsdZoSWW1/Y
	KW6n54vVyz6pydNVVY/UB74nBC8QG0A8gnkGuyLeQWoOLXZZQin8e3nbZ884kQuH
	9IC7dqH9n+rDvIIOFXLgrdvgg5mqQNCFsEawF09fNIjc2ZV18z3Y0cirDDCDa+X8
	d9aqe2QA4u9IqgHzIji3XeNh7WQTQVeztDQ3k0OrgqyL7wd8uBQRJLoVb/G7LIfE
	AIl29CQTAjtjYUJgpi6ZF0u/fa9fJCoL9pycf58dVmULT4DKkXzUtC6zyiZlqdGa
	Zfh5teKAhn83goIA1F2UY5VH+sRiuEiNI+HeXhhSNtkeeq/cnDiMUF0wfuHWWFJl
	6H5yJw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfh5sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 14:40:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so1390699a12.3
        for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299218; x=1784904018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Qt1djWNsoZvxOfSlqVXOUPZ0wf3R2BBKcU7CUAFuzA=;
        b=g3SIM68SL/iJgply99owuAshdr1xsn0cdwtpk9jw2tK831kd33m/Bc8RSbiYtny2Ug
         gHqpvUrYNaSp6CGDh4q025nGARsN+bBUcUXVooEKuZKdXtfatbNRPUgQqVl/FO4D5dWz
         NeSte/bJYVSKApQzSxvYxuEdCCuBg331f2RVt1ajAUD0PgDyWCSxrYOdVz2HezSvo6Ak
         aiTXlHdj4ZoiricHvAFnX7BInKysIYztgmwX6FZVhkpTd1IxB8NoKpCYsvPG+ceI3+h0
         UZ3jet66TLdAhXcexkBLbUa1iZBjsjf/3PaVlu8i1qUDKtFMXmuWccbvUC89Pb53iahs
         omuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299218; x=1784904018;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Qt1djWNsoZvxOfSlqVXOUPZ0wf3R2BBKcU7CUAFuzA=;
        b=oPMHDc4jZ0EsgAdiQkgZVJ1aNf+0X9UjtdqloIZmh6E5eJ0CivbkAvqkEYmM3LU087
         VQtNYyjhROI69ZegA8SyRvwDvGZDetUMhY7wrrtI9wgDevqnUMJT83fbft/NhZ9ALMW2
         J7+onLzBMA8HbfDIsits0XhngXRgacEVdj20ul3qQ1Jqz9NgWmfuiL+gh80YPf5GfpZD
         t7O6QG/z4meSCnPjwCG5y1/EVI6G8fM7Mfv0AUVxS9G1+gcKugfJ9hJy1gpUa1CpZLEb
         q4TXqAQF78j2fZoOK7bp0WUf6Pq4YcsVuBISq+pnRyaeBG5NoVw5liL51+RxyeHendz/
         i7dg==
X-Forwarded-Encrypted: i=1; AHgh+RrkMEEO4e6+Wj3ADnP+t6WHjXc3IkcEErmCGKWfoRu5AbJs/amxYTzv2FDS/9v8hwPe7mV0YZw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyG63ytktIdn71avE2OdR3+IkDubIqLJL3hywXsFcWpUgsnEtYR
	mMN/toxaD4iDD/aJ4WDf8Igc5oqDEdfTWmy7QXvVh4MupxjbdCbOZPeOqFLLK8BL7+vYo9p310q
	fV1qkPKxtyvM/WsDHD8CzSZG7txkrbTkiz+jTWi19dkY9BWixX4lrD82KUjzeuL8d
X-Gm-Gg: AfdE7cn5ZdEWneuxCUT4vLEAIFeYCZpSojNUEwtF4EWK0VVUdR/pHQwErwYcxkBUCH0
	TC5hAnVA7O5I4wtdBnqy3PPlY5YxfP3xBFD2GwRJTfxSuEhRGVB4BGbWd+8f+7aJVZe5jzQsjxE
	8leFZ47g4uF2NvezMBDboy9nHMvzBXjt81LyhbcMBJNQNg8FHX+RshEbyOPgfQIqbFnwhUT9VRf
	8Bua2whOPaWdz2qptHIvVDXyAzRHAvWZUhFDlgb3l/0vbPa6UfZOgbpB/OjMx7L+kKKPsGEHf3s
	/IrRCZEfZY/b0pVdoUAAiyhL4zc3YEUWZLh40U2yvAK+cNpwCn4u+vuIPX+TEmBuArQBsdBA9VH
	h5EDJy5h4Y32SbqzaJEkgFcShNnzMxH2P62AhBgIEYx+y1Xvy8PgTwsAW6A==
X-Received: by 2002:a05:6300:4047:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3c3ad795790mr3459117637.1.1784299217463;
        Fri, 17 Jul 2026 07:40:17 -0700 (PDT)
X-Received: by 2002:a05:6300:4047:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3c3ad795790mr3459059637.1.1784299216792;
        Fri, 17 Jul 2026 07:40:16 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm5852602c88.9.2026.07.17.07.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 07:40:16 -0700 (PDT)
Message-ID: <49600545-3e13-452c-8940-c3e775ac3856@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 07:40:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 ath-current] wifi: ath12k: convert scan timeout to
 wiphy delayed work
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Jianhao Xu <jianhao.xu@seu.edu.cn>, stable@vger.kernel.org
References: <20260717025602.262916-1-runyu.xiao@seu.edu.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260717025602.262916-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0OSBTYWx0ZWRfX4rRIWwYhncO7
 DTWbF/DS3ctYf3UC1fpky75USZg8u8dCIrvyGxjxi0fQT6LvdSZ0lO7jiY8i+dQQyn42ZeOkcDp
 Un4CUs8QJYW98n1WkeUiH6vDlxAjz57P+/YpsSTaT4Z670rAVgsC5EJaYrB1G0t0EbNgzJrVjrO
 5DNvIONuNhhtBi4bFoJMCEq7McR9UcA8JyVFMMbtoTx8TdPfODqMzdnGXXCUJHToKjR2rULLZg+
 feTwtkqjM3b+yG2n0pMOOF0mq1MhdxQ6q2KMgHXg6HeHDj6sCnomwugMN64wopeMjmh6K9UeGVR
 Xmy3JF0YXItYnxF8X+APzJKR1hghzuvLqj5r32vwM+sEvkDG2bNMqoi7LxrS2A3D4T5CKXxoW2e
 6p/ywAkFrrzvQyYVzmKIoPf1lXRgz1cgWc/T3rLjrGn0enncRj2M5eNeIuG260PUA8ive/vIBC4
 9Ao60WshTx/njNvoexA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0OSBTYWx0ZWRfX1FJO7CNigfoi
 x/S7jODoB+Vj1SV7u3d9bWBrrjsgRL4YpkuboxZrOyXKphdCLdwPcjxcbpUsGAuk/EilWD0OFr6
 tWuX8M3mWeM3mlsS0Vz8LHj5AjESv6w=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a3ed2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=stkexhm8AAAA:8 a=IGpawK0pLUKNoA5DvegA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-GUID: ukz-Lx7Gezn4IRXiSLIVSlm3Hqc-CRlU
X-Proofpoint-ORIG-GUID: ukz-Lx7Gezn4IRXiSLIVSlm3Hqc-CRlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074021_157418_D18F9C24 
X-CRM114-Status: GOOD (  36.36  )
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

On 7/16/2026 7:56 PM, Runyu Xiao wrote:
> ath12k_mac_op_stop() is called with the wiphy mutex held and calls
> ath12k_mac_stop(), which cancels ar->scan.timeout. The timeout worker

you are missing a very important detail, namely it is a synchronous cancel

> also takes the wiphy mutex before aborting the scan, so synchronously
> cancelling it from the stop path can deadlock if the worker has started
> and is waiting for the same mutex.
> 
> Do not drop the wiphy mutex inside the mac80211 stop callback. Convert

What does this mean? Where are we currently dropping the wiphy mutex?

You should describe the patch in terms of the current code, not in terms of
any prior versions of your patch.

> ar->scan.timeout to wiphy_delayed_work instead, so the timeout callback
> runs in wiphy work context with the wiphy mutex held. This matches the
> locking model used by the scan vdev cleanup work and lets stop/cancel
> paths use wiphy_delayed_work_cancel() while they already hold the wiphy
> mutex.
> 
> The old scan-finish path could cancel the delayed work directly from WMI

what is "old"? There is the current code and the new proposed code.

> event context. With wiphy_delayed_work that cancellation must happen from
> wiphy context, so keep it in scan.vdev_clean_wk. Mark scans whose cleanup
> work has been queued so a timeout work item that was already queued before
> cleanup runs does not abort a scan that is already finishing.

My AI review agent thinks this logic is unnecessary, but I haven't looked at
this in detail.

"summary": "finish_queued flag is a redundant substitute for
wiphy_delayed_work_cancel: __ath12k_mac_scan_finish is always called under
wiphy lock, making direct cancellation safe",

"failure_scenario": "Every caller of __ath12k_mac_scan_finish holds the wiphy
lock (directly or via wiphy_work dispatch), so wiphy_delayed_work_cancel could
be called there directly — as the old cancel_delayed_work was. The new
finish_queued flag instead defers suppression to the timeout work itself.
Since ath12k_scan_abort already has an explicit ATH12K_SCAN_IDLE bail-out path
(line 5232) with a comment covering the timeout-vs-completion race, the
finish_queued guard in ath12k_scan_timeout_work provides no additional safety.
The cost is 8 reset sites (lines 5337, 5624, 5681, 5775, 10971, 13969, 14012,
15061) where a future error path that forgets the reset leaves
finish_queued=true, silently suppressing the next legitimate timeout abort and
leaving the driver wedged in SCAN_RUNNING with no recovery."
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Suggested-by: Johannes Berg <johannes@sipsolutions.net>
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
> Changes in v3:
>   - Convert scan.timeout to wiphy_delayed_work instead of dropping the
>     mac80211-owned wiphy lock in ath12k_mac_op_stop().
>   - Cancel the timeout from scan.vdev_clean_wk to preserve the
>     scan-finish cancellation from wiphy context.
>   - Add scan.finish_queued so an already queued timeout work item does not
>     abort a scan that has already queued its cleanup work.
> 
> Changes in v2:
>   - Rebase on ath.git ath-current.
>   - Use ath-current subject tag as requested.
>   - Move the synchronous scan timeout drain out of the locked stop path
>     instead of adding it in the wrong start-path context.
>   - Update Fixes to the ath12k commit that introduced the stop-time
>     scan.timeout drain.

FWIW I'd suggest looking into using the 'b4' tool for future contributions.
It will help you with patch history, including providing links to the prior
versions

https://b4.docs.kernel.org/en/latest/#for-developers

> 
>  drivers/net/wireless/ath/ath12k/core.c |  2 +-
>  drivers/net/wireless/ath/ath12k/core.h |  3 +-
>  drivers/net/wireless/ath/ath12k/mac.c  | 50 ++++++++++++++++++--------
>  3 files changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 742d4fd1b598..95673d3be9da 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1463,7 +1463,7 @@ void ath12k_core_halt(struct ath12k *ar)
>  
>  	ath12k_mac_scan_finish(ar);
>  	ath12k_mac_peer_cleanup_all(ar);
> -	cancel_delayed_work_sync(&ar->scan.timeout);
> +	wiphy_delayed_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->scan.timeout);
>  	cancel_work_sync(&ar->regd_update_work);
>  	cancel_work_sync(&ar->regd_channel_update_work);
>  	cancel_work_sync(&ab->rfkill_work);
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index fc5127b5c1a3..b6fd5e9dfdb7 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -635,11 +635,12 @@ struct ath12k {
>  		struct completion started;
>  		struct completion completed;
>  		struct completion on_channel;
> -		struct delayed_work timeout;
> +		struct wiphy_delayed_work timeout;
>  		enum ath12k_scan_state state;
>  		bool is_roc;
>  		int roc_freq;
>  		bool roc_notify;
> +		bool finish_queued;
>  		struct wiphy_work vdev_clean_wk;
>  		struct ath12k_link_vif *arvif;
>  	} scan;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 51c4df32e716..f53df8d4c808 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5162,7 +5162,7 @@ void __ath12k_mac_scan_finish(struct ath12k *ar)
>  			ieee80211_remain_on_channel_expired(hw);
>  		fallthrough;
>  	case ATH12K_SCAN_STARTING:
> -		cancel_delayed_work(&ar->scan.timeout);
> +		ar->scan.finish_queued = true;
>  		complete_all(&ar->scan.completed);
>  		wiphy_work_queue(ar->ah->hw->wiphy, &ar->scan.vdev_clean_wk);
>  		break;
> @@ -5254,14 +5254,23 @@ static void ath12k_scan_abort(struct ath12k *ar)
>  	spin_unlock_bh(&ar->data_lock);
>  }
>  
> -static void ath12k_scan_timeout_work(struct work_struct *work)
> +static void ath12k_scan_timeout_work(struct wiphy *wiphy,
> +				     struct wiphy_work *work)
>  {
> -	struct ath12k *ar = container_of(work, struct ath12k,
> -					 scan.timeout.work);
> +	struct wiphy_delayed_work *dwork;
> +	struct ath12k *ar;
> +
> +	dwork = container_of(work, struct wiphy_delayed_work, work);
> +	ar = container_of(dwork, struct ath12k, scan.timeout);
> +
> +	spin_lock_bh(&ar->data_lock);
> +	if (ar->scan.finish_queued) {
> +		spin_unlock_bh(&ar->data_lock);
> +		return;
> +	}
> +	spin_unlock_bh(&ar->data_lock);

if the flag is necessary, all of that could become:
	scoped_guard(spinlock_bh, &ar->data_lock)
		if (ar->scan.finish_queued)
			return;

>  
> -	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
>  	ath12k_scan_abort(ar);
> -	wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
>  }
>  
>  static void ath12k_mac_scan_send_complete(struct ath12k *ar,
> @@ -5292,6 +5301,8 @@ static void ath12k_scan_vdev_clean_work(struct wiphy *wiphy, struct wiphy_work *
>  
>  	arvif = ar->scan.arvif;
>  
> +	wiphy_delayed_work_cancel(wiphy, &ar->scan.timeout);
> +
>  	/* The scan vdev has already been deleted. This can occur when a
>  	 * new scan request is made on the same vif with a different
>  	 * frequency, causing the scan arvif to move from one radio to
> @@ -5323,6 +5334,7 @@ static void ath12k_scan_vdev_clean_work(struct wiphy *wiphy, struct wiphy_work *
>  	}
>  
>  	ar->scan.state = ATH12K_SCAN_IDLE;
> +	ar->scan.finish_queued = false;
>  	ar->scan_channel = NULL;
>  	ar->scan.roc_freq = 0;
>  	spin_unlock_bh(&ar->data_lock);
> @@ -5609,6 +5621,7 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>  		reinit_completion(&ar->scan.completed);
>  		ar->scan.state = ATH12K_SCAN_STARTING;
>  		ar->scan.is_roc = false;
> +		ar->scan.finish_queued = false;
>  		ar->scan.arvif = arvif;
>  		ret = 0;
>  		break;
> @@ -5665,6 +5678,7 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>  
>  		spin_lock_bh(&ar->data_lock);
>  		ar->scan.state = ATH12K_SCAN_IDLE;
> +		ar->scan.finish_queued = false;
>  		spin_unlock_bh(&ar->data_lock);
>  		goto exit;
>  	}
> @@ -5672,9 +5686,10 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>  	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac scan started");
>  
>  	/* Add a margin to account for event/command processing */
> -	ieee80211_queue_delayed_work(ath12k_ar_to_hw(ar), &ar->scan.timeout,
> -				     msecs_to_jiffies(arg->max_scan_time +
> -						      ATH12K_MAC_SCAN_TIMEOUT_MSECS));
> +	wiphy_delayed_work_queue(ath12k_ar_to_hw(ar)->wiphy,
> +				 &ar->scan.timeout,
> +				 msecs_to_jiffies(arg->max_scan_time +
> +						  ATH12K_MAC_SCAN_TIMEOUT_MSECS));
>  
>  exit:
>  	if (arg) {
> @@ -5757,6 +5772,7 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
>  				spin_lock_bh(&ar->data_lock);
>  				ar->scan.arvif = NULL;
>  				ar->scan.state = ATH12K_SCAN_IDLE;
> +				ar->scan.finish_queued = false;
>  				ar->scan_channel = NULL;
>  				ar->scan.roc_freq = 0;
>  				spin_unlock_bh(&ar->data_lock);
> @@ -5792,7 +5808,7 @@ void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
>  
>  		ath12k_scan_abort(ar);
>  
> -		cancel_delayed_work_sync(&ar->scan.timeout);
> +		wiphy_delayed_work_cancel(hw->wiphy, &ar->scan.timeout);
>  	}
>  }
>  EXPORT_SYMBOL(ath12k_mac_op_cancel_hw_scan);
> @@ -9935,7 +9951,7 @@ static void ath12k_mac_stop(struct ath12k *ar)
>  
>  	clear_bit(ATH12K_FLAG_CAC_RUNNING, &ar->dev_flags);
>  
> -	cancel_delayed_work_sync(&ar->scan.timeout);
> +	wiphy_delayed_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->scan.timeout);
>  	wiphy_work_cancel(ath12k_ar_to_hw(ar)->wiphy, &ar->scan.vdev_clean_wk);
>  	cancel_work_sync(&ar->regd_channel_update_work);
>  	cancel_work_sync(&ar->regd_update_work);
> @@ -10962,6 +10978,7 @@ void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
>  			}
>  
>  			ar->scan.state = ATH12K_SCAN_IDLE;
> +			ar->scan.finish_queued = false;
>  			ar->scan_channel = NULL;
>  			ar->scan.roc_freq = 0;
>  			spin_unlock_bh(&ar->data_lock);
> @@ -13876,7 +13893,7 @@ int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
>  
>  	ath12k_scan_abort(ar);
>  
> -	cancel_delayed_work_sync(&ar->scan.timeout);
> +	wiphy_delayed_work_cancel(hw->wiphy, &ar->scan.timeout);
>  	wiphy_work_flush(hw->wiphy, &ar->scan.vdev_clean_wk);
>  
>  	return 0;
> @@ -13956,6 +13973,7 @@ int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
>  		reinit_completion(&ar->scan.on_channel);
>  		ar->scan.state = ATH12K_SCAN_STARTING;
>  		ar->scan.is_roc = true;
> +		ar->scan.finish_queued = false;
>  		ar->scan.arvif = arvif;
>  		ar->scan.roc_freq = chan->center_freq;
>  		ar->scan.roc_notify = true;
> @@ -13998,6 +14016,7 @@ int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
>  
>  		spin_lock_bh(&ar->data_lock);
>  		ar->scan.state = ATH12K_SCAN_IDLE;
> +		ar->scan.finish_queued = false;
>  		spin_unlock_bh(&ar->data_lock);
>  		return ret;
>  	}
> @@ -14011,8 +14030,8 @@ int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
>  		return -ETIMEDOUT;
>  	}
>  
> -	ieee80211_queue_delayed_work(hw, &ar->scan.timeout,
> -				     msecs_to_jiffies(duration));
> +	wiphy_delayed_work_queue(hw->wiphy, &ar->scan.timeout,
> +				 msecs_to_jiffies(duration));
>  
>  	return 0;
>  }
> @@ -15052,6 +15071,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
>  	ar->num_tx_chains = hweight32(pdev->cap.tx_chain_mask);
>  	ar->num_rx_chains = hweight32(pdev->cap.rx_chain_mask);
>  	ar->scan.arvif = NULL;
> +	ar->scan.finish_queued = false;
>  	ar->vdev_id_11d_scan = ATH12K_11D_INVALID_VDEV_ID;
>  
>  	spin_lock_init(&ar->data_lock);
> @@ -15077,7 +15097,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
>  	ar->thermal.temperature = 0;
>  	ar->thermal.hwmon_dev = NULL;
>  
> -	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
> +	wiphy_delayed_work_init(&ar->scan.timeout, ath12k_scan_timeout_work);
>  	wiphy_work_init(&ar->scan.vdev_clean_wk, ath12k_scan_vdev_clean_work);
>  	INIT_WORK(&ar->regd_channel_update_work, ath12k_regd_update_chan_list_work);
>  	INIT_LIST_HEAD(&ar->regd_channel_update_queue);


