Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66201C369C2
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 03:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjNtsLjl1MhP4VJ4DgWpdYaRCGJ6qNprYXb4Lhoqtl0=; b=5FnzEzBi56/rzvio7xnzqhlpIP
	pEup0j0YeBbuvttPPDvP5xaVQcNzMrS/MgRrnwZBTAIdb72V8Uf7GNwyzHwj80pEU3jLvvrM1Rhz5
	g7EGxeV5v0OM/YUUet++OY/u9psqlzfkSGIvi5FKPcqhARvsFjZn3kxTzf4SZvMboEWFQAlLDn/D0
	BNzezYwMaszmI6vaDHah5Rps0nRhj3EAEZ2F+jlgCzQqldUo0xEjF24WaihEU9cPKY6xMlLEZ0Qkj
	jAErnfya2fIFuJ0foV9VQBNTLKe62ck//fybU1RMYT/pmPpdTCCfbp4NDqSohgQ9teE0iOEDc6Kde
	MyXi30Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cF1-0000000Exxo-0b3b;
	Fri, 18 Apr 2025 03:18:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cEv-0000000ExxK-1YFy
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 03:18:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2ewrg013073
	for <ath12k@lists.infradead.org>; Fri, 18 Apr 2025 03:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjNtsLjl1MhP4VJ4DgWpdYaRCGJ6qNprYXb4Lhoqtl0=; b=csZoymucQRtxdO7W
	wocwxbUiKv0Y877RAeEPght3UU18nywM9azD6bVR93JEEhyT97VgUxoEeoe3UU6H
	yuKDG8MjumSvmZu46mHxjr8C13bKxtJwJQ1B7Q9tUPwPdaxaTMgNoSoAbS5wb9Ry
	fbV+Rm9ccz/cQ/9AMBaPe+MCocptMu4rlp75u+pHMWcbMHzRh6KnbJHfbW3ICbdu
	Rs7cpJvova1sj/GeClJYCvZhXxIAdzGwyqdYEtkAU4Vf2RU755RiA3N1L1KU93MO
	CEZB4Ske+sboL15gA1GWu6pVrlPXKgOjXuw9oV7xEuUBdF5Oih0j0SNJYBhsDF/w
	ozOwnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjrr9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Apr 2025 03:18:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254e500a73so11348465ad.0
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 20:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744946283; x=1745551083;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjNtsLjl1MhP4VJ4DgWpdYaRCGJ6qNprYXb4Lhoqtl0=;
        b=wI9lQ6Kg9UaGLbxgsvbgQosGty4QE5QPG+n717+etXMIFZCl9uoO0PVuemDnVLAp4X
         LRx8ABijc90XxRClQMeKs77n7gU9wxiL8ktUxV0ydiYaEzMR25T4Ql0LoYy+wapN+14m
         dfFOwrIEgSdx9bsD5T/Ub+FrEyBzil+85ZDxwu32Y6PrdW1GhrTQmYM2Q4yfgkR03eX6
         JOJ5uv8M95jvEH0cHfad17ezFk5YtpGtwCm+8zaGFvT/H3QtXm5g681XgdUU+0powHr8
         bTK7bitKo7xQ/MxhwarsJtnG+NMOeEwANZX076OOO4Wjmv86t2fGW7pgJdNpmmVeE4o7
         eViQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJNRyVBTWFplCnSBHN9iIUUv9yK9ovxH0Ad6B0OeUSg7VplXY0dUdMrsVo3qnrX3mJjFHsQ8s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgSngVMS3jvAwfUCSZPrc6qOUxQXg1gUJw4ATcSnCBMSbmYUrJ
	N7+5WEGzu7EolL7HKRCVBIUvdabil6A0blIKWDgpw73cvbbgqsBJAplgh2o2Lw0pOl8tOC+IX42
	aghjxwMnEZCppc3tiqHhdtCZK6OVrN/O3xew7WG2HZAehGM/A+0fpmVUQTr2G
X-Gm-Gg: ASbGncsYb/cTRZ7XyorjoxoLSCaJVfcR1Wim5CGm+NGiXPmYBFVBuzG102/eORGKzN0
	d25HkupFUVqKZWKuWO182Oo11pbUX6exp9vKw5n2jyS5yTIXP2gB8P0raIXTmC84sMHXo3r0Up+
	RgDcPCetLcE5CM9nT9JzmrHNMzBDM9R31DKhFQdtiEvo/okmY7oVBSLRPadbf13JgvT1tpjrEd7
	3ICDXHbDNPbCNbhU2wdrxDnb23ZloCAFc4/iXX5QWuhpibFaxsCK5gKSV9DVt56cAA/WOOwyda4
	xvDwz/KKpXCpLL+a3PcyqE7F242abZocL9pmTH/t7vgF2ZV9hRmT5gUWlWvzsaxpfiteKxfhJ+0
	hnSVb
X-Received: by 2002:a17:902:f706:b0:224:1c41:a4cd with SMTP id d9443c01a7336-22c5356dfbbmr17162775ad.3.1744946282785;
        Thu, 17 Apr 2025 20:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3PYD+Pg4UGB6Ij/R2YPtoD3eHZJXj0rk7RfPp1Oe6quZyohjPzMA5w0TZdD794X1F60+Wrw==
X-Received: by 2002:a17:902:f706:b0:224:1c41:a4cd with SMTP id d9443c01a7336-22c5356dfbbmr17162555ad.3.1744946282334;
        Thu, 17 Apr 2025 20:18:02 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf3dsm677237b3a.134.2025.04.17.20.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 20:18:02 -0700 (PDT)
Message-ID: <83e417e5-31d8-4fe5-9774-fd97fb51f663@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 20:18:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5] wifi: ath12k: read country code from SMBIOS
 for WCN7850
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
References: <20250417024227.1712-1-kang.yang@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250417024227.1712-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n183PKU7mwPDdGSKEZYe3pEjQUjbOGP0
X-Proofpoint-ORIG-GUID: n183PKU7mwPDdGSKEZYe3pEjQUjbOGP0
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=6801c46c cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0wfVUD6UvdP1dahPgv4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_201808_396971_C0103222 
X-CRM114-Status: GOOD (  26.53  )
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

On 4/16/2025 7:42 PM, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Read the country code from SMBIOS and send it to the firmware. The
> firmware will then indicate the regulatory domain information for
> the country code, which ath12k will use.
> 
> dmesg:
> [ 1242.637253] ath12k_pci 0000:02:00.0: worldwide regdomain setting from SMBIOS
> [ 1242.637259] ath12k_pci 0000:02:00.0: bdf variant name not found.
> [ 1242.637261] ath12k_pci 0000:02:00.0: SMBIOS bdf variant name not set.
> [ 1242.927543] ath12k_pci 0000:02:00.0: set current country pdev id 0 alpha2 00
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-02582-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
> 
> Note: This patch is an old patch in public review written by
> Wen Gong. Just resend it for him.
> Link: https://lore.kernel.org/linux-wireless/20230913105156.17618-1-quic_wgong@quicinc.com/
> 
> v5:
>     1. fix "From" header.
>     2. rebase on tag: ath/main(ath-202504141512).
>     3. change quic email to oss email.
> v4:
>     1. fix assignment error for case ATH12K_SMBIOS_CC_ISO.
>     2. rebase on tag: ath/main(ath-202503251458).
> v3:
>     1. rebase on tag: ath-202503172347.
>     2. add branch tag.
>     3. add descripition for Wen Gong.
> v2:
>     1. rebase on tag: ath/main(ath-202502181756).
>     2. rewrite commit message.
> 
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 26 +++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/core.h | 27 +++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.c  | 11 +++++++++++
>  3 files changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 9b23329f1bf2..b5ade9c7530d 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -697,7 +697,7 @@ static void ath12k_core_stop(struct ath12k_base *ab)
>  	/* De-Init of components as needed */
>  }
>  
> -static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
> +static void ath12k_core_check_cc_code_bdfext(const struct dmi_header *hdr, void *data)
>  {
>  	struct ath12k_base *ab = data;
>  	const char *magic = ATH12K_SMBIOS_BDF_EXT_MAGIC;
> @@ -719,6 +719,28 @@ static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
>  		return;
>  	}
>  
> +	spin_lock_bh(&ab->base_lock);
> +
> +	switch (smbios->country_code_flag) {
> +	case ATH12K_SMBIOS_CC_ISO:
> +		ab->new_alpha2[0] = u16_get_bits(smbios->cc_code >> 8, 0xff);
> +		ab->new_alpha2[1] = u16_get_bits(smbios->cc_code, 0xff);
> +		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot smbios cc_code %c%c\n",
> +			   ab->new_alpha2[0], ab->new_alpha2[1]);
> +		break;
> +	case ATH12K_SMBIOS_CC_WW:
> +		ab->new_alpha2[0] = '0';
> +		ab->new_alpha2[1] = '0';
> +		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot smbios worldwide regdomain\n");
> +		break;
> +	default:
> +		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot ignore smbios country code setting %d\n",
> +			   smbios->country_code_flag);
> +		break;
> +	}
> +
> +	spin_unlock_bh(&ab->base_lock);
> +
>  	if (!smbios->bdf_enabled) {
>  		ath12k_dbg(ab, ATH12K_DBG_BOOT, "bdf variant name not found.\n");
>  		return;
> @@ -758,7 +780,7 @@ static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
>  int ath12k_core_check_smbios(struct ath12k_base *ab)
>  {
>  	ab->qmi.target.bdf_ext[0] = '\0';
> -	dmi_walk(ath12k_core_check_bdfext, ab);
> +	dmi_walk(ath12k_core_check_cc_code_bdfext, ab);
>  
>  	if (ab->qmi.target.bdf_ext[0] == '\0')
>  		return -ENODATA;
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 44e02ebb1071..3f9fcd4d6f20 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -175,9 +175,34 @@ struct ath12k_ext_irq_grp {
>  	struct net_device *napi_ndev;
>  };
>  
> +enum ath12k_smbios_cc_type {
> +	/* disable country code setting from SMBIOS */
> +	ATH12K_SMBIOS_CC_DISABLE = 0,
> +
> +	/* set country code by ANSI country name, based on ISO3166-1 alpha2 */
> +	ATH12K_SMBIOS_CC_ISO = 1,
> +
> +	/* worldwide regdomain */
> +	ATH12K_SMBIOS_CC_WW = 2,
> +};
> +
>  struct ath12k_smbios_bdf {
>  	struct dmi_header hdr;
> -	u32 padding;
> +	u8 features_disabled;
> +
> +	/* enum ath12k_smbios_cc_type */
> +	u8 country_code_flag;
> +
> +	/* To set specific country, you need to set country code
> +	 * flag=ATH12K_SMBIOS_CC_ISO first, then if country is United
> +	 * States, then country code value = 0x5553 ("US",'U' = 0x55, 'S'=
> +	 * 0x53). To set country to INDONESIA, then country code value =
> +	 * 0x4944 ("IN", 'I'=0x49, 'D'=0x44). If country code flag =
> +	 * ATH12K_SMBIOS_CC_WW, then you can use worldwide regulatory
> +	 * setting.
> +	 */
> +	u16 cc_code;
> +
>  	u8 bdf_enabled;
>  	u8 bdf_ext[];
>  } __packed;
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 7af12733a1ff..aee3080a934c 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -11550,6 +11550,17 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
>  			goto err_unregister_hw;
>  		}
>  
> +		if (ar->ab->hw_params->current_cc_support && ab->new_alpha2[0]) {
> +			struct wmi_set_current_country_arg current_cc = {};
> +
> +			memcpy(&current_cc.alpha2, ab->new_alpha2, 2);
> +			memcpy(&ar->alpha2, ab->new_alpha2, 2);
> +			ret = ath12k_wmi_send_set_current_country_cmd(ar, &current_cc);
> +			if (ret)
> +				ath12k_warn(ar->ab,
> +					    "failed set cc code for mac register: %d\n", ret);

FYI I split this line in pending to fix the ath12k-check:
drivers/net/wireless/ath/ath12k/mac.c:11648: line length of 94 exceeds 90 columns

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=2d2ccff4c0efa4cb55d0a21c75c6e7162788f9db

> +		}
> +
>  		ath12k_fw_stats_init(ar);
>  		ath12k_debugfs_register(ar);
>  	}
> 
> base-commit: b80c52642c1159c2596776b39b06eb1c2e36baff


