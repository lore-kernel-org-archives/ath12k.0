Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532CDC5AD55
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 20:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toBUUDgSdBywAEmMdTmfJJb0x6y3q4edP6m+xebqlBA=; b=Ui529YzLB1VOjlqbtUNTeZTP3V
	YE5dcuuv34L5523KfzfUA3/H+TOQlZEDKLeN9rO5Gq10rpPoLMkimjXAAcci8ItVzkLkqVWlzMTZc
	0zpZrz4rhplN8lnDDIBhlMztRUISPSGG+HyGPyExAnim+Xhr4i/uExOeWkELXXGGG5HfCq7mZoqT3
	4ubIu5MSxqur1KRrKhyXMa1Ish75GqxC8GzeOSBTikvjeVF8z+sFbRQjKhgs+GbTZl61K0kmz4GFR
	OS4sYKkbU7/REWRMgocVm0Di9UXx/KyC4KvgAQrSACHaRSh0m1X1srSaOIFleyhCEjx5lzbxyTEoR
	G1MI1Pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWMk-0000000CoVH-49Vj;
	Mon, 10 Aug 2026 20:12:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWMi-0000000CoUj-1U1r
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 20:12:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AJmFEu2547773
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 20:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toBUUDgSdBywAEmMdTmfJJb0x6y3q4edP6m+xebqlBA=; b=B9G890gPk8ih2zrv
	GTQPrM9AIj/TjgCeHgWtwGogYej5sRnjsxHMGnahICBZJ1OFLw+mMuhU1RHb/Zes
	qWoNGMS1WzyiNI9kEfXwVya3Ass9osgOcjDuW4ajzOV2tSV/nBgDV7SMrltm5iCd
	1zg2DGXfZ/Vu/7Jw7HHHSrWq39XqODPl9jvAinmonAqZcY34i0zEqvs4yPwnaS+F
	oZz9Km14UbkaYcoCUCcrazaN/JRE6YIMG45c13b6sY4fIDum1YW0cB4FayvI0kwl
	i+jwcovu9MOa+qfQtkditB2BkSLvZJPQcODjlIkLV/WmxvNE32NTLFNZ6KRxIcZ8
	mMebfw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv0tn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 20:12:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso2560815ad.0
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 13:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786392774; x=1786997574; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=toBUUDgSdBywAEmMdTmfJJb0x6y3q4edP6m+xebqlBA=;
        b=RgA29j/3WA7XF+jErxHYJbq9eUhkz6VZU0kaXqA4yTTzSAaO8aV3eMubyvnpxlDFW4
         3/NvF1VnFtC4uVYiF6G1UeJJZPk1/DW57J/31tFXFPuC84yQeDoccEKTfFrna2/U9gBc
         W3Fmd6p1yMqEARDpB1FsuedG02wD/PpaJM0Prh0eHObpyzhuzDL06aIVB5TKoYJRXsft
         RDhURNCJr0LlI+Y9iDW0M9EPvPARx28yVD511vS8gVG889X7NYXWdP9BnnmdT5e78b4k
         vHknRTEEVZigjZpKAIAhBAepqFfSV2cejoUHSYpycRcxsBSl0eb/VOEApb+jNiohHO3R
         IXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786392774; x=1786997574;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toBUUDgSdBywAEmMdTmfJJb0x6y3q4edP6m+xebqlBA=;
        b=Dyru611DO+Qi9lthaytR+oaXfRSDBX1aGzmQeP8NpRiyj3m87jcrM3bKhViLtiBXDu
         M2bxOfynhmswJyUoDXKKTQmMR4r55cab0lpQ+Fv/tbBzwfadKJ5WfsgglEaeFnyJ7fag
         43xMxOeDsfQVQw8no751fMtVRP8zHJ7VbiQYtYMmm9OFcDyh1KF4xnpr60ga77763PVu
         0iT5z9aKWUu8Ilqms0TZbGHVfGZ7KqSkRbcAd8z/uJyHTTFm7FfrkmXCI8Rop8rHF29h
         LxRCmo9NuFH7vgLa++w8787aK+VqdAnscYsMWLYJZAwgyOVj0sL3O+cWiwJwHA4jUz1F
         giPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8CjGdTTD1dz10XHukk1dGkpKZaFPSHVFWQI7VdQ57RTPrsE+W5/wJhnceVajKk2XK0cODo3g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuyU6owXaejfF9sowSncZf1aZ+BA5Gad8QhvGKrfJCeHK57NnG
	cL+zxfqzIfKDNsjRna49kOAPBwym+l0w2vTPmZ9RXkKhD5Oh/vNaFCVrF6IQxmt6tztNCGI++mF
	tO7rpGtGl9jo1AbiOQFO8bvWKkCIf408RLqFIVCecem7hpMpl6j5OS7i0S4B63UJ1
X-Gm-Gg: AR+sD13LUlijfFsefpaSPaPNcIxDdLYzPpeuIjl4gyKRuQjhayny1NQj8x/DNlucbVp
	iTvYi0W2yyXqyUBID+Uifp3dq0di+KeOmGP4un7PWBx4I3ci38VZvzlw2vnGwN9z8W3Zh+Ssv0L
	jS59DjAVk3GKjrrIg9uCHPYkc3UwrIZ1cXYKYPsryEJrynielRnuQOzL4K9VfhLZeHVMEsw3YRa
	JBzakJs339l5FNHyA86LVVlMI/PRA+aR2EOrxhNuCOUbA7ZZuojopLG7AMUZpOc0O/S60U5uwHr
	Lm2z33bNbTU/PFdcoLzZ5AqVElyiMdjrVcwaiAmEYWPUgPuDdX06cKnJfVGF044BbLfUR+v6VHG
	3WyMAidy9+12movTelx5tAhoUVvP00jEIQtGmia8+tvN60zVpxzWn+Yl0NRaz
X-Received: by 2002:a05:6a20:2589:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cc22de56d4mr901230637.5.1786392774033;
        Mon, 10 Aug 2026 13:12:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:2589:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cc22de56d4mr901191637.5.1786392773514;
        Mon, 10 Aug 2026 13:12:53 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm46495518eec.4.2026.08.10.13.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 13:12:52 -0700 (PDT)
Message-ID: <98e79919-7463-4033-9396-315d09de771d@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 13:12:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 4/8] wifi: ath12k: add device DP stats reset
 support via debugfs
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
 <20260810144444.2033607-5-pardeep.kaur@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260810144444.2033607-5-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3MSBTYWx0ZWRfX6nNlPsyCIimg
 /oRcSPwATXwT5PzsveuCTeV5/k4r49ghESdxqWrBpu9QDdgP0u+cnRLN4w5jofSZkKNvRai+3Wz
 61HEQqGPqfb24AYcAgDcPZJZnkTV3QRnCIfo5J+Qxwi2w6p9C8smN3oelOw29mIecSASRwBUofL
 IRZ9bPCOYXrAD8lgX/afcGiaiEOBizSpdBbIhv/rP06J4yAz0WwAyT2pf6Wy6PlB2uti5mrFUoe
 pCieHoA2uZ0qzoXm3wfmdm8TS67EMeA6ewZndRySUfBaDskOwuuAYNfHUBUitOIQ6FAc0VZF393
 ZzsYjwrF5j9aDbzDjkFkmZ1l/fHayBP+ysNCLgwJixVjlL0IWsMuIgMBkmB9tqWMNkR+fM9t8y2
 fyC6bRd1QuXFPJtCC/1ZnSoUDtYZ5j/q8D0vCgJZYH1lvX8VtLUGFBwZdj3unGQfKAsMyFEHteZ
 VQOn+i5BUafLC4jJf8Q==
X-Proofpoint-ORIG-GUID: fMYESyIqFJd9Z-oNUTeZSewtZF-OwF1N
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7a30c7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fraSdVAxK4OO7KLyYRQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: fMYESyIqFJd9Z-oNUTeZSewtZF-OwF1N
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3MSBTYWx0ZWRfX/6Bhe8i4gXNt
 XKYmWjD71q0lbH6HV+E12KiS5GKHbkQfMnxJeuRPg2XU2xQlkRCrSmsB9bYli5KV5KRJP1d4KcR
 1U2ksjt6qmWPqn0AxEaaNUepsbWMIpE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_131256_516243_420FFAFB 
X-CRM114-Status: GOOD (  26.75  )
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

On 8/10/2026 7:44 AM, Pardeep Kaur wrote:
> From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
> 
> There is no way to reset device DP stats counters without reloading
> the driver, making it difficult to isolate issues to a specific time
> window during debugging.
> 
> Add a write handler to the device_dp_stats debugfs file so that
> writing 'reset' clears all device DP stats counters. Change the file
> mode from 0400 to 0600 to allow write access. Use
> simple_write_to_buffer() to correctly handle partial writes and
> non-zero ppos, consistent with ath12k_write_simulate_fw_crash() in
> the same file. Return -EINVAL on unrecognised input.
> 
> No lock is taken around the memset since the counters are updated
> locklessly in the datapath; taking dp_lock would be misleading as it
> does not protect device_stats updates.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
> Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs.c | 36 ++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index ec49692107a8..cbda754d8656 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1220,8 +1220,42 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
>  	return ret;
>  }
>  
> +static ssize_t
> +ath12k_debugfs_write_device_dp_stats(struct file *file,
> +				     const char __user *user_buf,
> +				     size_t count, loff_t *ppos)
> +{
> +	struct ath12k_base *ab = file->private_data;
> +	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
> +	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
> +	char buf[20] = {};
> +	int ret;
> +
> +	/* filter partial writes and invalid commands */
> +	if (*ppos != 0 || count >= sizeof(buf) || count == 0)
> +		return -EINVAL;
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* drop the possible '\n' from the end */
> +	if (buf[*ppos - 1] == '\n')
> +		buf[*ppos - 1] = '\0';
> +
> +	if (!strcmp(buf, "reset")) {
> +		memset(device_stats, 0, sizeof(*device_stats));
> +		return count;
> +	}
> +
> +	ath12k_warn(ab, "unsupported command: %s\n", buf);

drop this.

ath12k_warn() is used to warn about inconsistent state, not user input.
The -EINVAL return is already the correct user-facing mechanism for returning
status. Note all the other .write() functions silently return -EINVAL on an
invalid argument.
> +
> +	return -EINVAL;
> +}
> +
>  static const struct file_operations fops_device_dp_stats = {
>  	.read = ath12k_debugfs_dump_device_dp_stats,
> +	.write = ath12k_debugfs_write_device_dp_stats,
>  	.open = simple_open,
>  	.owner = THIS_MODULE,
>  	.llseek = default_llseek,
> @@ -1232,7 +1266,7 @@ void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
>  	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
>  			    &fops_simulate_fw_crash);
>  
> -	debugfs_create_file("device_dp_stats", 0400, ab->debugfs_soc, ab,
> +	debugfs_create_file("device_dp_stats", 0600, ab->debugfs_soc, ab,
>  			    &fops_device_dp_stats);
>  }
>  


