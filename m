Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487060A2603
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 19:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+f/j9aY;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=GBHIEB1u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8DhktJUUGysUbtfb0tmJTo5XW0cehShNaBR9ivWue5A=; b=w+f/j9aYhbjxP1
	0y37pOD/JbZtgakTZ2mbysOCC2tmM1lXvXJrF7jDh3Iq4Plp3/CfJoUpVVuIRXZiVHuLnJzdoWGY+
	v3gvw2v9kjbh13hJ/CTRQF4Jviron17lY7TJeedh//fQC1+/BX59MxFK45H74MsZONOdcG8qG3l7J
	1qM8ra/qjTagJer98czGmbutgpE4Iz1ztLnkjJxR8FuVuoFw+TD//gCQzu0WJILrT38l/1sexonPy
	K9YTPhni+66BmrGbX+4ewtoHGS+w7Gy0NTwyVGnL/odtE3zJxzZ14Y69+0V9TB9GbF5QHy8hhopUj
	5ecdenDZoy+ZjDrUg4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwZ5-0000000E4ms-1ESy;
	Fri, 13 Nov 2026 19:03:59 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwZ1-0000000E4ls-3JSn
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 19:03:58 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67bf3c6654fso1503531d50.1
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 11:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794596634; x=1795201434; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DhktJUUGysUbtfb0tmJTo5XW0cehShNaBR9ivWue5A=;
        b=GBHIEB1upcbzmWydLJBPXvGUUw8gZSoYfx448wXcEo8McJ2lEUFbVE4JwiGHQHF4Aa
         6S2RJ3F/o8DBnY1Yn/1Jy60Rp5BKPCaL8ew9NSO/5FQowDHKJ28hO8invdlc341q603/
         fRZUoNLedK6lFAtL2Ams7G2rTreYPeuJobOcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596634; x=1795201434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DhktJUUGysUbtfb0tmJTo5XW0cehShNaBR9ivWue5A=;
        b=XmigmEMDBRtAPSXDvo9AFTZYzhz7HoJ2NcfineMMWAXn0KBuHeQQasKxOP7tzB5zPx
         TcriN3JHBT5JB4vPAm6YMZ1YwzddiJIpts49N0HWy6FwIaW7AsxzZr6JNLPCzrq6iBzr
         tAfpFWrEhyxd3t5SIxydSjtuNInx7U58f39W5nW9YUoG69saaXBD7Zgzkp2KMAHNgrkx
         Hx8grZX3MWGKbYaz9OsZg1zp26Tdlg8zsSh6nvRe12HlOV2yXaA7R5wGKhhmk8AEUGfw
         1jaqlTVt1t+6CuWPspw4+0MfKM6J/yu/R6l/MYxNM4KraIc8/mFGe7MaOD6x8mxmj7k7
         VvvA==
X-Forwarded-Encrypted: i=1; AL+hErE4im4B0ecpbnyJNkkHeWGR6dCEBKany4qVteMSvChX6+8oNneJCMQ8j1tHaIo/quHFabPg6lY=@lists.infradead.org
X-Gm-Message-State: APuU4Z8krpW36iwUE5HVJSl/RNwS/uMShoy/gvztobukOS6cshr6MbP0
	abuz3hDIjKizHlgsEKMbTkdsahkjerD6M9tIsOaaGNSMWFx1qK/udtyiPhCQQqNLFg==
X-Gm-Gg: AYBFou33Yvwywv5pmOGW/onnDjeQZuUGHidbUKjnb9d2Ol59RZMBaXO8ueDUTeMpnUA
	hXc71Wr6LZnWouEK7KOejYrUFQg/N6Wh6BOQD1/5VSPqX+ov6Lm+TxQ22T2KNAiwaZ6x9djDzdw
	8L3qiA8RZMNX0bUgnO1S1awZe+N+5mfZU7cCumxJaEkMyyqhoG3k+Mo9LHChGTetbnQm7SmHHew
	+/7LSnR+317muyAZJ4aaZLKT9/GtzF3WD8jsaRaX002fGYwYOMKH642a5Rvwnm2m8+AAOJPCNDp
	eJxCd1v6Ap85z27NdOX4lGoQwloTzDfoTj84O3veNhJgv2eVzA/d+JlgRrnAvjbxtbhV2pi19MW
	9YjSQAWTaOf1CNrBcthNyGbc+9d/0hUGej+wv6clO3X3DGN+FKkLiYAV+wQmcBXy4hnP/reSku3
	iu1FhE3Afm5S97Y0Bmk/FfyptBSL/0XBWU/1uHKUdwJdRiOxReL/3XFF1AUHliJ8xwWHzYakj5b
	dMpFZdxC2WEn5T9YfgR0lhME7t4pK2i2tt3l0dnVGqlETe3WmxvdyGflTSLVY+HuXo1on0BxEL9
	ETlPuiR7jXlm4otzxvVGyB2E
X-Received: by 2002:a05:690e:168d:b0:67b:eda0:b411 with SMTP id 956f58d0204a3-67d895e6290mr1728922d50.48.1794596633744;
        Fri, 13 Nov 2026 11:03:53 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm27000686d6.27.2026.11.13.11.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:03:52 -0800 (PST)
Message-ID: <bbadc472-655f-442f-86fd-9d56ff84abfc@ieee.org>
Date: Fri, 13 Nov 2026 13:03:49 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] firmware: qcom: pas: add qcom_pas_context_init()
 for pre-allocated context
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113185009.157893-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110355_957574_C8B30608 
X-CRM114-Status: GOOD (  25.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 12:50 PM, Mukesh Ojha wrote:
> devm_qcom_pas_context_alloc() allocates and initializes a struct
> qcom_pas_context using devres.  Several callers, however, either live
> entirely on the stack (short-lived helper functions) or embed the
> context in a larger structure that is already managed by other means.
> Forcing those callers through the devm allocation path is wasteful and,
> in the case of functions called on every power cycle, causes a devres
> entry to accumulate on every invocation.
> 
> Add qcom_pas_context_init() that initializes a caller-supplied struct
> qcom_pas_context in place using memset + field assignment, with no
> allocation at all.  Rework devm_qcom_pas_context_alloc() to delegate
> to qcom_pas_context_init() after the kzalloc, so both helpers share
> the same initialization logic.
> 
> Update the kernel-doc for qcom_mdt_pas_load() to reflect that the PAS
> context may now be initialized by either qcom_pas_context_init() or
> devm_qcom_pas_context_alloc().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

This looks good to me.  Thank you for implementing it.

Signed-off-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/firmware/qcom/qcom_pas.c       | 26 ++++++++++++++++++++++----
>   drivers/soc/qcom/mdt_loader.c          |  4 ++--
>   include/linux/firmware/qcom/qcom_pas.h |  2 ++
>   3 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
> index d74dd7b4f332..fdf62003fbf1 100644
> --- a/drivers/firmware/qcom/qcom_pas.c
> +++ b/drivers/firmware/qcom/qcom_pas.c
> @@ -14,6 +14,27 @@
>   
>   static struct qcom_pas_ops *ops_ptr;
>   
> +/**
> + * qcom_pas_context_init() - Initialize a peripheral authentication service
> + *			     context for a given peripheral
> + *
> + * @ctx:	  Caller-provided PAS context to initialize
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + */
> +void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
> +			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size)
> +{
> +	memset(ctx, 0, sizeof(*ctx));
> +	ctx->dev = dev;
> +	ctx->pas_id = pas_id;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_context_init);
> +
>   /**
>    * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
>    *				   context for a given peripheral
> @@ -39,10 +60,7 @@ struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
>   	if (!ctx)
>   		return ERR_PTR(-ENOMEM);
>   
> -	ctx->dev = dev;
> -	ctx->pas_id = pas_id;
> -	ctx->mem_phys = mem_phys;
> -	ctx->mem_size = mem_size;
> +	qcom_pas_context_init(ctx, dev, pas_id, mem_phys, mem_size);
>   
>   	return ctx;
>   }
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 0d55e9e0af3f..c6ec67e1da09 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -476,8 +476,8 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>    * firmware segments (e.g., .bXX files). Authentication of the segments done
>    * by a separate call.
>    *
> - * The PAS context must be initialized using devm_qcom_pas_context_alloc()
> - * prior to invoking this function.
> + * The PAS context must be initialized using qcom_pas_context_init() or
> + * devm_qcom_pas_context_alloc() prior to invoking this function.
>    *
>    * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
>    * @fw:         Firmware object representing the .mdt file
> diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
> index 1d132e89536e..458075868bf5 100644
> --- a/include/linux/firmware/qcom/qcom_pas.h
> +++ b/include/linux/firmware/qcom/qcom_pas.h
> @@ -36,6 +36,8 @@ static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
>   }
>   
>   bool qcom_pas_is_available(void);
> +void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
> +			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size);
>   struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
>   						     u32 pas_id,
>   						     phys_addr_t mem_phys,


