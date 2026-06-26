Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964B3C43458
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctcxDsWWE5CsrZTwx1xGnbf39A7pUyPEOclo5R2hslQ=; b=bsmRVvA/wyqrDthsGpYixnASDw
	JfaCg9CETAG8U/r530j0x/60GPRjuAXWlgzRXASOV1Aqn3aMY3IAhr9+dyCJ4JgKiaCwnj4VrIkZi
	ABzWYgc9GHMBNj9MIVi533gE2iUocbfwHLE8p1hn1KTOF6FyF6hfAWjMlRrstrVoG2N/XGxbcGwPs
	HBLUt5mPSgWtQGbeYxYUBdnLT6LzRM1eOkRoQobRl3Tt6EOxWa94sP7A9JEEClM19CDXcjVwxfyAO
	iPheYiq/IdKqJyT1qEJzsw9tErfvIRp05idmoUa9Kf8eg84OPPS2ZbjsC46D7fhM4Ed+Ucda0ieTj
	MFef9+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdA0F-0000000Bg0A-1ITM;
	Fri, 26 Jun 2026 17:06:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdA09-0000000Bfxg-1E06
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 17:06:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so13851315e9.0
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782493559; x=1783098359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ctcxDsWWE5CsrZTwx1xGnbf39A7pUyPEOclo5R2hslQ=;
        b=kZcA4kzIpW4KXkhnvlEu3vNQQq6IZVoRpacvnyfiQVZ9tTWyOoCKqJrYKqHXXQuc7s
         D0Zf/jywTKdnsXfQ1NZ7z/OlkwAaNqre46vMTWo7Qt3aAVSAUkQGGl/qoAGBCUe78y3s
         Dyn2CigKaqjKkGulm+sNujnOzRxxYM8zgc2KWPPQaMdyN2L/Gc1tuTeTOj5Y9M4yBy7b
         lLjae/+TElDXHlg/jqHUnRqM3zZP3X5YtUuhLY0LI8bEjrQcJfsQO0RY6abalDvTmhay
         0E+sbkjxKNxCdIna0x1IDfB3gaQC1MlPTEgLEpzZf06XUcYcrdRLeObGhR2vMcF3wmUc
         1/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493559; x=1783098359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctcxDsWWE5CsrZTwx1xGnbf39A7pUyPEOclo5R2hslQ=;
        b=OYSKfzl+XHBey8jeUffj8qlZy7K6Y6jFbfZpp0wq5jfjDtpK809vw3mdu7K7aeFSdh
         30kslA6XeKuxuIX7t8AZPE/yqGiQbjwiBp+2poMBTsQtcDpzn070rPqFVO5jTCsJSyi9
         My5cseR264oLjw3pT6pwiMnoO4vRre8VcvY094SZlr1kNw4SEtn4IDi3OFoTaWCdeL4K
         F+DBeM9QRQwLx8uEj0o98C2j+dw+qLLytwUCluGw5xUVRNZ9/Z8EE2NgkjXXBjvwsc7e
         r9LByjHBWoIzKwF20fuXXgzQjWO834LN7fqwjQ+A2aWauMUhf7s4cgXO9Y/ieSmYL2JA
         cuGw==
X-Forwarded-Encrypted: i=1; AFNElJ/PVDd69IQpXB4vW85RmXiQYT0sm/NCmNbi9rtc9GWBYHW+YAKMJu7ePPkGh0BFkAc0Gnuog7g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yze2UIXsgK+U8CyKA86lrI1+QeEGuo/wWxIdvIvZSF39vr5HZrH
	hXZMeKGQPHgkgiHdzFClnXHi9ob+dX46B2ftAuB80AUjZ/BwSUGvwTod
X-Gm-Gg: AfdE7clHvl0zwkQq4hWSMfejpFCIEsi6XNmtrq8pgt/LYy1+AYrZvkf1CxHempql3s9
	I+cafpOWsNjqEZzetwZGdyoFIm+C+ImmrdrrBuHz3dnUuDLiktihfeJmHIZ0x5id6CMFz9Q33kl
	nE0/916J9wijpbloH4v2mqpJNDQnQakZShAzyAkrOmxzpAhCdEukNnmjW9rsu+K9+ovRyAEeeyQ
	wBAZHtLCRdD+Fw+YZmCU9lDli0ovic+JRI6AuCaWd4N061dDPr4ObvJHDDV/rCg6Jl9t6GfrEnM
	lzNBwaAzZQHsN6Km6Wxrbvxkr2g6L56G3ON4399Ga8bpr23HhaA/tCUSvedqMNJn/FYYUdsyVrd
	9qjZtlqWNEzRslXBnPeMnVTWCPCbkdU3sonGgx5E6X80T9P/wPOij7STWmBPC4iC2vYjD901Q5Z
	9qFj02PxiXB7cJ8gTUc7sk4L2DxB9XkgeXAtpxR5ZBoaHcVEOBHZeeboTqlQPiiHs0H5IEViPf8
	InixZVJ
X-Received: by 2002:a05:600d:864a:20b0:492:5bf9:d149 with SMTP id 5b1f17b1804b1-4925bf9d18amr186215685e9.5.1782493559068;
        Fri, 26 Jun 2026 10:05:59 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fe25429d5sm1694876f8f.7.2026.06.26.10.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 10:05:57 -0700 (PDT)
Message-ID: <ac8c92cb-21f2-4274-8fe6-f771fe48eec7@gmail.com>
Date: Fri, 26 Jun 2026 18:05:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/14] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, vikash.garodia@oss.qualcomm.com, bod@kernel.org,
 mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com, amirreza.zarrabi@oss.qualcomm.com,
 jens.wiklander@linaro.org, op-tee@lists.trustedfirmware.org,
 apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
 linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_100601_348488_4198E215 
X-CRM114-Status: UNSURE (   5.19  )
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

Hi Sumit,

On 6/26/26 14:34, Sumit Garg wrote:

>  config QCOM_SCM
> +	tristate "Qualcomm PAS SCM interface driver"
> +	select QCOM_PAS
>  	select QCOM_TZMEM
> -	tristate
I think QCOM_SCM is missing a 'select IRQ_DOMAIN'. Right now I get a
build error without it:

drivers/firmware/qcom/qcom_scm.c: In function ‘qcom_scm_get_waitq_irq’:
  drivers/firmware/qcom/qcom_scm.c:2512:16: error: implicit declaration
of function ‘irq_create_fwspec_mapping’; did you mean
‘irq_create_of_mapping’? [-Wimplicit-function-declaration]
   2512 |         return irq_create_fwspec_mapping(&fwspec);
        |                ^~~~~~~~~~~~~~~~~~~~~~~~~
        |                irq_create_of_mapping

- Julian Braha

