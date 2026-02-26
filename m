Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4216BFD9E0C
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U5pXIcIslbl6Ne+zn0yErk+KnfBMPX5eU0lqTp45dg=; b=4zZQdtshfI6HjT+2FP2wL72b4T
	TOqnc6W8Nk9KzMK+iraPRM4IQh4oa3yCQEQ6BuwGdWEQ1pgo9T6lgw21MEiXMG24Yy4I9FepiYP4V
	7FUXTs1s4tGV32fKffjqhV9r6xIgQKxAgSMpD7QfV9qJYAj45At/ZlhBAD5MokmJ6j/8xz77XE1Ng
	MOEg39o07B+s9JCJLoOKGeYmtJElB/lWpUBAb6zFSJID11IZ4AmT33DWyoYsE0twnNA98kzRvgcUD
	3OlH8InWG7nlvs6z9CvGi++R9kfi3UCTjmOv5HLkwy0QxdT2/bPLIm8xUslIZZNmltwX+27pV64vZ
	L2J5n4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhLC-000000076YK-3c9w;
	Thu, 26 Feb 2026 19:48:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhL9-000000076Xi-3QD2
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 19:48:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4398f9e3b40so1198926f8f.1
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 11:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1772135281; x=1772740081; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9U5pXIcIslbl6Ne+zn0yErk+KnfBMPX5eU0lqTp45dg=;
        b=mjLJ5/I8HHs/BEE/xuwqJRDWa+lkbsZU0SfDkCoimxFn4YK4ZN93sTafCG1KLnS7SV
         McUvNiOgvtuMEfE8AhSdlBjzsW4wHtVQE7XI6+NrOFv1KGcwEnPUEhPQwip9NtDaAFcW
         yOd67iT6xutTkbRvp3iBRor0uLspZbnVx80OlZLMAz3cCy3EY2ObElgwWycWz1E7WFk4
         9LOuS+rfwC4TDC5RHSAXTn+mqVu5b+Uh7qUmmnfC+ptLahTpL9ARnEcIWTiT+86fPpvm
         KyDCe1aZcp5rIkmkST+twKeWuaI/apK1p/2S6K7w8FR13IgkTeMFxhYeS3tQRmiM+y6G
         YkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772135281; x=1772740081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9U5pXIcIslbl6Ne+zn0yErk+KnfBMPX5eU0lqTp45dg=;
        b=WKCVRYHVic3kEPSOc1o3DpGeBS9RULagtrFPqJu6mdIjHMVwMZHSXh+NVGst30uI5J
         zcy2LbMPnTGVCbm0ezwg2ba1MMAHFjqUDvTz5aoyCaD8p0QfYPJWstzt2UGnleJb17k2
         aY2EelkuEuIsYPmGZUz+MjdswNYJTzwi3rocF3Wu89ihl8VkCvnJkjtE/Fj+urBXYjQz
         Vj64AkMimzd0XJ4sSclu8c5Ymt5HEGFR294XK3dJ9xnqqt3ZRRt2R2FceqZqi3xLxp1e
         dW/MwN6WwvBJ6brbi6abMtl5T+CLd5Obyd+M7l80eBB/y7P5Ue3us/9abx5NIZ+Gv7te
         rgZg==
X-Forwarded-Encrypted: i=1; AJvYcCWuhvMITuJA761kaKDnTyVoh+b3sTjmFo1brQs7oe8tB7lmgj3uufP+EESieihawAK8YHLLrMc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwP3FtNFBoWAEDeJjaggxwuXYUg6BLWS4xIIjnRi43g+1oH/CQ
	kTkh2N8Cg0p8wiGS3HycZ+vWMhjlZepjZP0z8ukflHj4Om9kwGZACqA/mUxOwLApA3w=
X-Gm-Gg: ATEYQzwK7DOORonu8ZlTkLFh8gD1mHu3JMh2f+xMZgZoEY1glfrsVoka+RBCUInrFsU
	yVxoTUgtv7njSnlF/ao4HQI1bvuZ+hOlvDGbligr+9FtKH+7IhnI3az1ubSVQuAiI8+dn6EOxDR
	0mgqMhWrcqXDtmFnMBv0AacgQmfzCvRSmSZR2+gwEdl7Qg7vadQtYKsrLZLxEFllAHerXG4E0RD
	vrnllMXw6uCF+qgTBHUs0zh3uHoG1OIS0nz96FTvpHkAFHv/pdRLfaawfqTu8pzVzg6mgFC3Jbc
	hbNsMZfMzKiHK4tFKNVAWevB2rHDamL0FZdypRSXK2Vv2a9OzSqKs5VKQOEG9vHwVDZyC2vooi3
	7q8zm0rsSEf6zJ0FNzoaxmAG2ciA5T7Udt2CVJBIc/ovQtF0hchK2SyyHJgFXDNDbPyOvhMV5iD
	KdZNE17X1hWTrCDKTJD6VE+80YQvAMWH/YZQb0olL7yjFVifWQFdCefg==
X-Received: by 2002:a05:6000:2008:b0:439:8580:181 with SMTP id ffacd0b85a97d-4399de55ab0mr21730f8f.52.1772135280986;
        Thu, 26 Feb 2026 11:48:00 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70f8casm3082124f8f.14.2026.02.26.11.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 11:48:00 -0800 (PST)
Message-ID: <f8b98f6f-5e52-4968-8270-6ffe2e381ae2@freebox.fr>
Date: Thu, 26 Feb 2026 20:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
References: <20260226165517.1899045-1-nico.escande@gmail.com>
 <20260226165517.1899045-2-nico.escande@gmail.com>
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
Content-Language: en-US
In-Reply-To: <20260226165517.1899045-2-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_114804_132898_EDCA552F 
X-CRM114-Status: GOOD (  18.51  )
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

Hello,

On 26/02/2026 17:55, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time
> 
> So instead lets move to a per cpu allocated array, stored in the struct
> ath12k_base, that is reused accros calls. The ath12k_wmi_tlv_parse_alloc()
> is also renamed into / merged with ath12k_wmi_tlv_parse() as it no longer
> allocs memory but returns the existing per-cpu one.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c |   7 +
>  drivers/net/wireless/ath/ath12k/core.h |   2 +
>  drivers/net/wireless/ath/ath12k/wmi.c  | 170 ++++++-------------------
>  3 files changed, 49 insertions(+), 130 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 9d6c50a94e64..961c9df69aa1 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -2237,6 +2237,7 @@ void ath12k_core_free(struct ath12k_base *ab)
>  	timer_delete_sync(&ab->rx_replenish_retry);
>  	destroy_workqueue(ab->workqueue_aux);
>  	destroy_workqueue(ab->workqueue);
> +	free_percpu(ab->wmi_tb);
>  	kfree(ab);
>  }
>  
> @@ -2249,6 +2250,11 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  	if (!ab)
>  		return NULL;
>  
> +	ab->wmi_tb = __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
> +				    __alignof__(void *));
> +	if (!ab->wmi_tb)
> +		goto err_sc_free;
If `!ab->wmi_tb`, you're going to `free_percpu(ab->wmi_tb)`; it works but it's not super pretty.
> +
>  	init_completion(&ab->driver_recovery);
>  
>  	ab->workqueue = create_singlethread_workqueue("ath12k_wq");
> @@ -2296,6 +2302,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  err_free_wq:
>  	destroy_workqueue(ab->workqueue);
>  err_sc_free:
> +	free_percpu(ab->wmi_tb);
>  	kfree(ab);
>  	return NULL;
>  }
[...]
> @@ -6795,11 +6749,9 @@ ath12k_pull_pdev_temp_ev(struct ath12k_base *ab, struct sk_buff *skb,
>  	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
>  	if (!ev) {
>  		ath12k_warn(ab, "failed to fetch pdev temp ev");
> -		kfree(tb);
>  		return -EPROTO;
>  	}
>  
> -	kfree(tb);
>  	return 0;
>  }
You're missing a change on `ath12k_reg_11d_new_cc_event` (was added by 591de41d7008585f2e7c35dbcf5922fcb4d79e39)

[...]

Best regards,
Pablo MG


