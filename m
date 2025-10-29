Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2A4CCF9E9
	for <ath12k@archiver.kernel.org>; Wed, 29 Oct 2025 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmAbIa2HLXGYbY6ZAbrAI3G+RXNbdEwalIvBalCKji4=; b=4YkC4BJZ0JqjaZgnaI4s/ZT2+1
	k/PkUMDE/XuZI20qVQjVA3jUQzmHseGWxzil0VsdXzgfZqCiA2jKUR//HJGrQqGd2r5uxqJXjTfPM
	DOfUwpKI7iSBEmD1xEdimDlB10Un3tGbgJBGaXQ2ODYVfSxEEYQpVUOGZYLxTEE+YCWWsxbnMxfJL
	UrunGZsu7hlICQL7Llad7KB95EpBc+yh6yJ7+6Upz9dQRLSUYokiic9t7IB7VTAjkikOIRjuFgmsy
	SjMpf8PFyCHLicKPJ5gSoddLqRpoR0B35zZlK9Op2UULTbJvMEmW1rXIx6MTdoo2hcHxjQxW+K64b
	AywP0oMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDz4p-0000000HNOX-3UsU;
	Wed, 29 Oct 2025 05:50:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDz4m-0000000HNNR-2XY8
	for ath12k@lists.infradead.org;
	Wed, 29 Oct 2025 05:50:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4ur4v3642861
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 05:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmAbIa2HLXGYbY6ZAbrAI3G+RXNbdEwalIvBalCKji4=; b=LoAUlbno80vuob69
	4XmkeXz5/TSlanqqv8vvBmc6XesLnrOD2VotMcYOzHhYp5Q2eba3ssaoMZ034cBz
	5vtdZ6mdB2a+9QLuERnqChFlaP+Z8ZjOB4YxJug7yYPPPBl6mXNtiAguzQ1/lC3i
	uk8suQ8tHLMCCJECHt28zYFhWTGYpHHWWBhrcCvpujnQ9q88a6RLzrfLsYxmwlLb
	HSybs3Idlak16TVxaXEMeywc9lT77IKFL9lKnLdDZIB09MR/cD6ZnA+1XN/B45zD
	zfAYCckvMuil/Bjus0ZCAa3FvA+3Tsnd8Zd/zQ1+M8OE8+1NayAOIPaZPjfvBEE7
	TzkvFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hb6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 05:50:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26e4fcc744dso38913125ad.3
        for <ath12k@lists.infradead.org>; Tue, 28 Oct 2025 22:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761717026; x=1762321826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WmAbIa2HLXGYbY6ZAbrAI3G+RXNbdEwalIvBalCKji4=;
        b=eZhAlBadcnwdWhlGNGfyWPowip3kMPZ5yV7prMpHfSm/e+kOD03KHy0x3xGBTMOq2S
         y1EsXuLefhdLjgS1uhDKeYCsbbYONAl/pQK2qBu0i/OgD6amIAPdvgd7/N/pzErfCeKZ
         vJelU21l2YwLstxbLtF+gCjQAGWPPio/hxs5Ix83xnanbxz1JQ95emRL0XlZHJDQCD5v
         6kFaHCq/oR3YNGohbcCz6z9RBlPW95Q9v2tZz2kDnp+4x/TpnH0Kktey9IOikZIPoj8I
         f2sCLaBddCC+Hd/1j3xxYgNrqBXs+H8d4EJKkyLlKoiY3eFfxYp5PSvqySUBZEUKFmmF
         myEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761717026; x=1762321826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WmAbIa2HLXGYbY6ZAbrAI3G+RXNbdEwalIvBalCKji4=;
        b=JV+Q0BQPXDt7zQ2naFiq7DNZeFV4g1jySU0QwiVany0j9ENH/0OBqOmwnYhnI/PzdI
         K+rEHkyHU90UWTxMogwzCf+2gCWAFFqQV5W/0uWfHQcBhuhY275y6zgDC5T6l+qcd+Kf
         PuWmnzx67+T4Ymz0f+dSb7VE9SwCr07yz+rKtREd8EZdV/7SajhMxdoIcKiCsmAZewkq
         5NiuHGTBwL9bpDNRbXfxil/UyyHqls2JXZMecZCXesXID/i2vbuyrr00txt7zXKX2fA2
         QfoJzCP5ZgJWbrFCXNxOZOhov1UP0kZEqU5Yza9/8nAZds9J81VI49apq/UUxhKtEmvB
         0GGg==
X-Gm-Message-State: AOJu0Yw2sE54x6SFatkeXfYn2oDiiqQo7dJ0+gvJD1tIbWMFTf9YreuU
	SGQYjYDyGVW2OohAGADOBEThH7JDjsO33IZlEffble6yGxSXqRk6hI80dNLQfckZQ/zZSwex0dd
	Xgw0roS/Ge+tE3x0ULtVBdHqI85aH4N0TT7JKmw9sx0Znb311ho0PcnFUA09vxYMw
X-Gm-Gg: ASbGnctXGoTx46hyE5/NfLCigUqK7QyPxGtQOMMdOjMwdjFVG2Vs0oKsfmOPdjunbtz
	jtt5DpKCw4Na9V/CB6wHcMKmJ67IBEyUzwKD2nIxzNiaewbI6C+t4QgHj/JUc6BZhW/1LIxkZYj
	iSB6MjQSad9E6S0z1h+RJsx/qbize+kL5oLWSPMrFE/c828dkqAQi+yzXeNS6SU5Na8vsNndGQa
	B8goJWWus0aGVFQY9JP/omPqZ6lgUEtJtqvgRErx0GA6y6JX+PeR0tdRGM8ZS02fLf77Zvc7mgK
	bVe+qq3cEswUBJNcRf+oy5BDQy663KsfOb6nXnM8e/3JYXIYhnBnmwrY/xIB4oDcZk8w2mWlRt7
	npkJYSwOo64uOpjcNO4aUVs0qqcHkMfciliATMZtM8wWqMqI5cbxyGzFvfhSx
X-Received: by 2002:a17:902:e5ce:b0:290:c3ad:8432 with SMTP id d9443c01a7336-294deef9a95mr22435875ad.46.1761717026486;
        Tue, 28 Oct 2025 22:50:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3oGqY6JtnY6s9TE+mNpoQ7oW8tW3Vrva1KS/4zSSUMofam04Zi+J5i3WgpjvLhwaCJSaxcA==
X-Received: by 2002:a17:902:e5ce:b0:290:c3ad:8432 with SMTP id d9443c01a7336-294deef9a95mr22435595ad.46.1761717026005;
        Tue, 28 Oct 2025 22:50:26 -0700 (PDT)
Received: from [10.133.33.233] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0c414sm137576335ad.44.2025.10.28.22.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 22:50:25 -0700 (PDT)
Message-ID: <7d389aa2-5e5d-4b0c-8603-60bbcbce7015@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 13:50:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] Revert "wifi: ath12k: Fix missing station
 power save configuration"
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ross Brown <true.robot.ross@gmail.com>
References: <20251028060744.897198-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251028060744.897198-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901ab23 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=dJ2fJ0zB95bh057hNQsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: UwcqsU3NiR30vj0LXnuuhh8Rx1SyUeig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MSBTYWx0ZWRfX6LckGfZqBVFG
 XrOPeu5X6CtF/NVhqXl4HgUDnkm/4pFTXY3rKDRP5Ku79uMaSFYUbsRe8fWUfEFlSNaXkC/u1VN
 pTeC9VKrbpGGS4LoXG3gJkiTNQzAEGxFHoK5unh7U//D97y/v077F2qZ9kmhM5PLk+Bgva2oSOz
 1SQwYtuQyZyGXjfJ5xnRHOazhkkBoAhNqaTw0UP4pRqixg0rqzTbImSE3aJ9T9taSGI7BvGVSiy
 lQ4/T5t/ejpLiuDJJIcpIbtq4WfXFCZZoAVzamaTi9vs+FUjp6yYLeidr10762vu9fmO4TeZp9O
 dpORuyafwOTmuqMDflfA5XWYbix04Wushyk3KwGyJOAj/N4PtZSDqVMGFt7rSC12X2KvhMqrp1h
 jXgsRZLjiksv8CS0NGczOAc9XkT53A==
X-Proofpoint-GUID: UwcqsU3NiR30vj0LXnuuhh8Rx1SyUeig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_225028_775383_4D6F6515 
X-CRM114-Status: GOOD (  22.87  )
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



On 10/28/2025 2:07 PM, Miaoqing Pan wrote:
> This reverts commit 4b66d18918f8e4d85e51974a9e3ce9abad5c7c3d.
> 
> In [1], Ross Brown reports poor performance of WCN7850 after enabling
> power save. Temporarily revert the fix; it will be re-enabled once
> the issue is resolved.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: 4b66d18918f8 ("wifi: ath12k: Fix missing station power save configuration")
> Reported-by: Ross Brown <true.robot.ross@gmail.com>
> Closes: https://lore.kernel.org/all/CAMn66qZENLhDOcVJuwUZ3ir89PVtVnQRq9DkV5xjJn1p6BKB9w@mail.gmail.com/ # [1]
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 122 ++++++++++++--------------
>  1 file changed, 55 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index eacab798630a..db351c922018 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4064,68 +4064,12 @@ static int ath12k_mac_fils_discovery(struct ath12k_link_vif *arvif,
>  	return ret;
>  }
>  
> -static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
> -{
> -	struct ath12k *ar = arvif->ar;
> -	struct ieee80211_vif *vif = arvif->ahvif->vif;
> -	struct ieee80211_conf *conf = &ath12k_ar_to_hw(ar)->conf;
> -	enum wmi_sta_powersave_param param;
> -	struct ieee80211_bss_conf *info;
> -	enum wmi_sta_ps_mode psmode;
> -	int ret;
> -	int timeout;
> -	bool enable_ps;
> -
> -	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
> -
> -	if (vif->type != NL80211_IFTYPE_STATION)
> -		return;
> -
> -	enable_ps = arvif->ahvif->ps;
> -	if (enable_ps) {
> -		psmode = WMI_STA_PS_MODE_ENABLED;
> -		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
> -
> -		timeout = conf->dynamic_ps_timeout;
> -		if (timeout == 0) {
> -			info = ath12k_mac_get_link_bss_conf(arvif);
> -			if (!info) {
> -				ath12k_warn(ar->ab, "unable to access bss link conf in setup ps for vif %pM link %u\n",
> -					    vif->addr, arvif->link_id);
> -				return;
> -			}
> -
> -			/* firmware doesn't like 0 */
> -			timeout = ieee80211_tu_to_usec(info->beacon_int) / 1000;
> -		}
> -
> -		ret = ath12k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
> -						  timeout);
> -		if (ret) {
> -			ath12k_warn(ar->ab, "failed to set inactivity time for vdev %d: %i\n",
> -				    arvif->vdev_id, ret);
> -			return;
> -		}
> -	} else {
> -		psmode = WMI_STA_PS_MODE_DISABLED;
> -	}
> -
> -	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
> -		   arvif->vdev_id, psmode ? "enable" : "disable");
> -
> -	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
> -	if (ret)
> -		ath12k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
> -			    psmode, arvif->vdev_id, ret);
> -}
> -
>  static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
>  					  struct ieee80211_vif *vif,
>  					  u64 changed)
>  {
>  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>  	unsigned long links = ahvif->links_map;
> -	struct ieee80211_vif_cfg *vif_cfg;
>  	struct ieee80211_bss_conf *info;
>  	struct ath12k_link_vif *arvif;
>  	struct ieee80211_sta *sta;
> @@ -4189,24 +4133,61 @@ static void ath12k_mac_op_vif_cfg_changed(struct ieee80211_hw *hw,
>  			}
>  		}
>  	}
> +}
>  
> -	if (changed & BSS_CHANGED_PS) {
> -		links = ahvif->links_map;
> -		vif_cfg = &vif->cfg;
> +static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
> +{
> +	struct ath12k *ar = arvif->ar;
> +	struct ieee80211_vif *vif = arvif->ahvif->vif;
> +	struct ieee80211_conf *conf = &ath12k_ar_to_hw(ar)->conf;
> +	enum wmi_sta_powersave_param param;
> +	struct ieee80211_bss_conf *info;
> +	enum wmi_sta_ps_mode psmode;
> +	int ret;
> +	int timeout;
> +	bool enable_ps;
>  
> -		for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> -			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> -			if (!arvif || !arvif->ar)
> -				continue;
> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>  
> -			ar = arvif->ar;
> +	if (vif->type != NL80211_IFTYPE_STATION)
> +		return;
> +
> +	enable_ps = arvif->ahvif->ps;
> +	if (enable_ps) {
> +		psmode = WMI_STA_PS_MODE_ENABLED;
> +		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
>  
> -			if (ar->ab->hw_params->supports_sta_ps) {
> -				ahvif->ps = vif_cfg->ps;
> -				ath12k_mac_vif_setup_ps(arvif);
> +		timeout = conf->dynamic_ps_timeout;
> +		if (timeout == 0) {
> +			info = ath12k_mac_get_link_bss_conf(arvif);
> +			if (!info) {
> +				ath12k_warn(ar->ab, "unable to access bss link conf in setup ps for vif %pM link %u\n",
> +					    vif->addr, arvif->link_id);
> +				return;
>  			}
> +
> +			/* firmware doesn't like 0 */
> +			timeout = ieee80211_tu_to_usec(info->beacon_int) / 1000;
>  		}
> +
> +		ret = ath12k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
> +						  timeout);
> +		if (ret) {
> +			ath12k_warn(ar->ab, "failed to set inactivity time for vdev %d: %i\n",
> +				    arvif->vdev_id, ret);
> +			return;
> +		}
> +	} else {
> +		psmode = WMI_STA_PS_MODE_DISABLED;
>  	}
> +
> +	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
> +		   arvif->vdev_id, psmode ? "enable" : "disable");
> +
> +	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
> +	if (ret)
> +		ath12k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
> +			    psmode, arvif->vdev_id, ret);
>  }
>  
>  static bool ath12k_mac_supports_tpc(struct ath12k *ar, struct ath12k_vif *ahvif,
> @@ -4228,6 +4209,7 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
>  {
>  	struct ath12k_vif *ahvif = arvif->ahvif;
>  	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
> +	struct ieee80211_vif_cfg *vif_cfg = &vif->cfg;
>  	struct cfg80211_chan_def def;
>  	u32 param_id, param_value;
>  	enum nl80211_band band;
> @@ -4514,6 +4496,12 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
>  	}
>  
>  	ath12k_mac_fils_discovery(arvif, info);
> +
> +	if (changed & BSS_CHANGED_PS &&
> +	    ar->ab->hw_params->supports_sta_ps) {
> +		ahvif->ps = vif_cfg->ps;
> +		ath12k_mac_vif_setup_ps(arvif);
> +	}
>  }
>  
>  static struct ath12k_vif_cache *ath12k_ahvif_get_link_cache(struct ath12k_vif *ahvif,
> 
> base-commit: 2469bb6a6af944755a7d7daf66be90f3b8decbf9

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


