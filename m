Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C7FF5A8D9
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 02:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL9xUfvTkwQZncAFS6niHvBtOoZf0aD/RZbBCfCG6WA=; b=W8k8ERxXMSaScfLhRs1eAuA+Gh
	AXDcXbQ2Fqjvtg1qoDnPWhDfgQ6aqlaw2ZrrYzm++x1N4LFIpZeSf16FerTMkvDjOTQ3rGjEMoKot
	wKemMjD516s5tclvWLf7lrozhWF5FejLlK2I0Xd9oy1H4Z1rWequ2wlhkIdmhiik+XPPQS6Ywj3na
	rFDsNwYapJt3Z58lYXzUry1+KT+/cRi1nlZ47V0fZrR00ZKULwhjWioaRPXZZxaW5yvKpt+R3R11f
	yHJUsoC0EVt6cNZKRGHw4kJUMnKZ68MIcVRVw8/XsQwpNzXTc09J5oFdKHbF0tjWfYQAUWpFEz9P1
	oXOa6MNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1Eo-00000007xlJ-12Zi;
	Tue, 21 Apr 2026 02:53:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1El-00000007xkv-3PzA
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 02:53:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KJOci71014344
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 02:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nL9xUfvTkwQZncAFS6niHvBtOoZf0aD/RZbBCfCG6WA=; b=GXamZDbuUaHABGfK
	aJuurbG23e5ntre5qvoQEd+XkZ6jN1novvAz6fn9kGhVfdwgOt0fg/AndDyiLUC+
	EOjqyufcHc/iXz5ULKQXVelzdAgd7UfpZlqqs3A0KlLs8qOTGx8nJEdhRDegC8Ro
	L5KHd7GfTcnjB4vrSr0GvGDcCzDl5Rq2PFIHLEbr5I+sBy2y1Sq1yemu8dWKMVYl
	g0w2+sTkWrzdZG0KcspgI/d9J+eaqG2uynUVmSU9aU2hODtJlOLSKG6mB17vqUQt
	RNsOWiWgoCpedwSIozAu7y/19o7enEd8rPfW5xmqQbERM4xiisQ/StbjIBgOMTFj
	6DO4YA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt90145x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 02:53:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249541063so33019185ad.3
        for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 19:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776739998; x=1777344798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nL9xUfvTkwQZncAFS6niHvBtOoZf0aD/RZbBCfCG6WA=;
        b=OSpEk3RlTFIs0sOFlaSvVm/6W6dnYe/GN251nBLNUoTR/G3FaEpvjNDgu2CXVmRNik
         sVOPkhecP70XP9gNoEfblEz1a/Ttap3qJ17D8ZGXybivYz83bdV/4SlBKv4yx0Smja2i
         r83UFofrpwcI8rvJyRxBklw4BhOcC2IxbpU2NN1wPrU17sSvsZGTJ4YK37zhpchCROpC
         qV0gkid462dMptqlrF5Esz3qLJtXrMHm7JPpg2+D6Zhil3q9KNsW1bqbRXR+n/LsCy3/
         JV6TFqxc5C6NYAyjsTQzIRGd0MSxgtNMOEenGvNSDmx7IVyEM/eHenKwj5lw9QtIjjC7
         km+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776739998; x=1777344798;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL9xUfvTkwQZncAFS6niHvBtOoZf0aD/RZbBCfCG6WA=;
        b=LnkxDadDKcsEV9Dluk6tfO4/b0pK7sTawcBjT8IcayaiuP/YP06D5kDH0zjru6/OUy
         OST5gKESGq8cLrdhigeIhE94rwbHrQHHMrKU8PYIsU7nU/w7UhtJlT6MigtM4LMC+oNM
         cV8KpsNJ6aQP0jEOHBgCgBGOGA42re0GfzM+mHewVqDyJ43zK3g+tbdce1OLfawOZjoJ
         K8z7qtctwVkbPvh9By0CInzhHJKwFNNt4v77cg5zPjX/lQjhRooopPWqpSFC/dsRDOAc
         WVdfOVkSuaK/0joz/GBnhVWMYjVkG653RytZZ66EgutkQMPzWsMfrwl01OMwawH7JwMa
         DoJg==
X-Forwarded-Encrypted: i=1; AFNElJ868sZEgH11UeG0pUrJKEWNPAF9F2cd8Z/V2lGWIbc4JXXqwMkqOFROpa1Waofbx4MjSUdhRSc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdirMq8kDZgB44QCA1Rwi5tfTicIXc7utRcSaInMM/XLagH8w/
	WFh6M+WfNaTYCQfY0nCTTUVzdgH6y0nX2DGeAlqnMapYBh5jCS0olugF/jN0wvh9vwzSOaciUe9
	aSfFzZ645wp0WvEf/R2xxW2yCrbHjtT6/ckuzGp+8oNqfI8+PGVRl4EGalzkqObW0
X-Gm-Gg: AeBDievoTFLlrL3ggvP9GYXO0ZNu7RwBvHzSCJcFvFLJ4nZT/LNftO46UUMI4qPgFzL
	nxAeodRzrijtJP93HneleHBpLqTjlojhpUmyQ55RssTFxDxy9CsPfaB0X5FndO5KCEyxFjwrbYu
	cm/SsnkbeN4wdJXefVADpqu6fMnVBPCtJzubhEGlb85qyxZ2ebMwJOS3M9AyQhjjksPkhaAoDfN
	FQZqED/vvgMan1guipSn7YGh27pa/MSMWchBF7YBVptrHrj44vTVyFwJl3Ay1PBQgDY7k3hIKrq
	OAXxkxy8buWlxkUYd37t105wPsIf+B3z0awaTFKwtZaWP8pflIJRVA1qOUmx2Oq9g/sFBFTgIiL
	FoGElwok5PKmtqnTg82EegTeJyKOUGKXN3Dhw3DRrkYfZ1bim0Lh3v17SOf6RVGYCGYdjD1Bx3O
	rq0Dg6rAqIKH3BDhCfRQTwY4pS9RDaaA==
X-Received: by 2002:a17:902:6905:b0:2b2:49a7:a5bd with SMTP id d9443c01a7336-2b5f9e770c5mr113292095ad.1.1776739998391;
        Mon, 20 Apr 2026 19:53:18 -0700 (PDT)
X-Received: by 2002:a17:902:6905:b0:2b2:49a7:a5bd with SMTP id d9443c01a7336-2b5f9e770c5mr113291805ad.1.1776739997873;
        Mon, 20 Apr 2026 19:53:17 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa16e72sm117632635ad.19.2026.04.20.19.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:53:17 -0700 (PDT)
Message-ID: <a92cb332-b525-47f4-a529-a59080cb33dd@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:53:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM ATH12K WIRELESS DRIVER" <ath12k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260313001434.118010-1-rosenp@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260313001434.118010-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e6e69f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Axv3upY4dNLjRVsui8cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: -5oVCVoLd0B3dq_VOEBw_NZfVYTo9z89
X-Proofpoint-GUID: -5oVCVoLd0B3dq_VOEBw_NZfVYTo9z89
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAyNiBTYWx0ZWRfXwlEvKjokSsek
 LITtO/j5h929jV34WOE56ENLp8/NS0LmA6YXVn4WVuRUBFfGO6sJCBCTqcKEhTF6qYcnDrdr4Yn
 MINMo2UpIEI/Y4qacxAZV3j0SJNep1jLr+NBFeUvAxHWb3fsBP8TinRp3Ah6dp2ckCWjvES1sL1
 ex7yxpkep8T2p9JH2M/5bXWlzgbaQIn65UfSjgw7XGLRikD2f7mXIS/592SNKIdtORIkGBwzRCF
 4+yKPHbgPkETwWNXTD/Wor7KJXXR5AukvvJp/C3OXVFz8dHlo+c3dkaNMpWYwrwVGA89Jn294Rg
 ted0RwyaebKEU5DhhuWI2a+M5Wg0oJ6cKuYvP9c3Srjg0pvC375p1H/zIaEkAHqbVk8n+RlWdS7
 XDuhPttAyzqiTunt2b8W8sXxZPNucey0lGELT1SIQ3VJvip79UH7N9tNigYVMYuy76xglL8+1eY
 jFlzv/mq/GbJY2Je9kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_05,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_195319_868330_18B9C168 
X-CRM114-Status: GOOD (  18.97  )
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



On 3/13/2026 8:14 AM, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation as required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 29 +++++++--------------------
>  drivers/net/wireless/ath/ath12k/wmi.h |  2 +-
>  2 files changed, 8 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 553ec28b6aaa..b7c43a64e37b 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5611,12 +5611,14 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>  	if (ret)
>  		goto exit;
> 
> -	arg = kzalloc_obj(*arg);
> +	arg = kzalloc_flex(*arg, chan_list, n_channels);
>  	if (!arg) {
>  		ret = -ENOMEM;
>  		goto exit;
>  	}
> 
> +	arg->num_chan = n_channels;
> +
>  	ath12k_wmi_start_scan_init(ar, arg);
>  	arg->vdev_id = arvif->vdev_id;
>  	arg->scan_id = ATH12K_SCAN_ID;
> @@ -5638,18 +5640,8 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>  		arg->scan_f_passive = 1;
>  	}
> 
> -	if (n_channels) {
> -		arg->num_chan = n_channels;
> -		arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
> -					 GFP_KERNEL);
> -		if (!arg->chan_list) {
> -			ret = -ENOMEM;
> -			goto exit;
> -		}
> -
> -		for (i = 0; i < arg->num_chan; i++)
> -			arg->chan_list[i] = chan_list[i]->center_freq;
> -	}
> +	for (i = 0; i < arg->num_chan; i++)
> +		arg->chan_list[i] = chan_list[i]->center_freq;
> 
>  	ret = ath12k_start_scan(ar, arg);
>  	if (ret) {
> @@ -5674,7 +5666,6 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
> 
>  exit:
>  	if (arg) {
> -		kfree(arg->chan_list);
>  		kfree(arg->extraie.ptr);
>  		kfree(arg);
>  	}
> @@ -13735,19 +13726,13 @@ int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
>  	scan_time_msec = hw->wiphy->max_remain_on_channel_duration * 2;
> 
>  	struct ath12k_wmi_scan_req_arg *arg __free(kfree) =
> -					kzalloc_obj(*arg);
> +					kzalloc_flex(*arg, chan_list, 1);
>  	if (!arg)
>  		return -ENOMEM;
> 
> -	ath12k_wmi_start_scan_init(ar, arg);
>  	arg->num_chan = 1;
> +	ath12k_wmi_start_scan_init(ar, arg);
> 
> -	u32 *chan_list __free(kfree) = kcalloc(arg->num_chan, sizeof(*chan_list),
> -					       GFP_KERNEL);
> -	if (!chan_list)
> -		return -ENOMEM;
> -
> -	arg->chan_list = chan_list;
>  	arg->vdev_id = arvif->vdev_id;
>  	arg->scan_id = ATH12K_SCAN_ID;
>  	arg->chan_list[0] = chan->center_freq;
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 0bf0a7941cd3..190e7a4a92d0 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -3586,7 +3586,6 @@ struct ath12k_wmi_scan_req_arg {
>  	u32 num_bssid;
>  	u32 num_ssids;
>  	u32 n_probes;
> -	u32 *chan_list;
>  	u32 notify_scan_events;
>  	struct cfg80211_ssid ssid[WLAN_SCAN_MAX_NUM_SSID];
>  	struct ath12k_wmi_mac_addr_params bssid_list[WLAN_SCAN_MAX_NUM_BSSID];
> @@ -3595,6 +3594,7 @@ struct ath12k_wmi_scan_req_arg {
>  	u32 num_hint_bssid;
>  	struct ath12k_wmi_hint_short_ssid_arg hint_s_ssid[WLAN_SCAN_MAX_HINT_S_SSID];
>  	struct ath12k_wmi_hint_bssid_arg hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
> +	u32 chan_list[] __counted_by(num_chan);
>  };
> 
>  struct wmi_ssid_arg {
> --
> 2.53.0
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


