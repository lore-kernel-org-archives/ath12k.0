Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5460A2610
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 19:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CUkVSsc2;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=VVjlEpqb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=; b=CUkVSsc2PR+JpA
	fdwyRrOB/Vdg07RCzE/7xx5YauFFWczqH4FVl9d1gqMt/lwnKX5vJJHlYS2VzCwOwX098IFKKjb7C
	cp4c3c+yCUCa2iEsqoqLGQ0Na1YzxSf6/pSrw42wICm2JirGk4uQ+kDYmPzwnpr+JZCGLHuPGL8mK
	HpHdWsmyTIVlRYs1F4BOoeSV7eCzY8QOPYPZ0Ga68k7D7M7sb0e/HVjbWo57N5KLQ/qVkNZ46C9ox
	V301Ozs2AoemaEc/TpqFcTuIJgfYhcFs6bfQBJ/xfHzSVCe1AN9MAdAh8SNFZNgfAJhyPYnGaVhDE
	EUSa5Rj5ZRLq7/LtsWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwZ9-0000000E4of-1dK2;
	Fri, 13 Nov 2026 19:04:03 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwZ6-0000000E4n0-3Ara
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 19:04:02 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-91ea16d8072so17902026d6.2
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 11:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794596639; x=1795201439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=VVjlEpqb06VxUdz9EzCuKzSKbqIK93Q39Wqxof84YREswUvwgIOZdytitmHCEM3rOJ
         QVWmJFR7gg5W0M9mmnR8PfKYDrxOLYfjBt9kbzr6LAf14VaC/Nv9fh34ipSXLtBj7hHd
         jCXqlaz9/TRQR9nPDh2zYl7F1GKRviojVMSbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596639; x=1795201439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=Z/l312caNQ59mBdZUvi9so/G1Ym8El7qy2Zlp2Su5lU4RFdcWNSMXFus8k9ySM/Vx9
         +hhFTMRbi8lR+r9fzUX7+xNCNG53fAkDUbsLb9uruaLXTz0blAiYgBTnq7sNZ7ozYn/8
         qaUt5q4blN+/AB/m8n3nkUGPG4UK9vYSE7Q8tfOLGWE3MjHYJNFBAMA6MtFogpbYn9su
         Hq5/IFy/w97aV6kxq9LJBwK9o4CCIp3fy3eqexTF4fyt7h2F6CY6RbDkGp2v5+eNPpOi
         4to/L01iV33XA8k/AQfPv6j8VK8Ny4uCY0zGjbZOCgtLJ9xpaTFt1tivIyBIF+ICN2hj
         Wtcw==
X-Forwarded-Encrypted: i=1; AL+hErHWiSTw5xc8584zKBjKuMHxpUkTS96ARYTIRv2xlKlunfj9XLEKu5+c4Ui4QnfhS15sjaswW+8=@lists.infradead.org
X-Gm-Message-State: APuU4Z+fp+Cahix8XDHLnV3sEwPr/KZkgL3GvdAvW2YWixAbdq7bjLk0
	TxhSsaOVp4Y4jKnl3N92PADsPWtMq03vYgSGx0xhkGhWbDX6fjxN3/cm/65BJfwvcw==
X-Gm-Gg: AYBFou1FfemAc9ndK/H+P7c3ArM0tlj8EDBGf7bSTlRLw5O6W6U9096cusacjTwq0i6
	Y1tVVXCQkPlN1j6/aQJEvTiYZCCYbygg1luDS4gRlYEWnbhPB4J/9gAQfl8F1/OYG7DLrNnnhxw
	N9u/V6mcWhZttJIGgQNZbCZflWo9ycTuVc123Luy7NfmR96jX3onMgR5Xr29XZuMg9UJPKAUH2F
	ZraVqycyBF7aQ2PcCBjN8f74E9Lx1IZXx6pTnrYAW9BcI6MCUY9w1FfQTIXN6/WrwTqb//mcYfd
	YOjoHrH78ZY8Klz9soxvE+X8kPJ/HC1u3Wa8Rz5qZZ8PsrnZlbB1wlmJdgkzmQlrfwizbxQ/0tC
	+Job5nbbVeNKBpLmnaGXoSf6bOZOPqU+/bkAMYDHVOZGf0HdR0HbneogSrqp4LQPLygw7xT3nh7
	r7lew+P5kH3/qY0RBAFBfOYZ6AbM8HYNS/fUWkvCxvv499R5DLqh19kZ7t7XUOBn6Jd77Lz0EQR
	J4t4pCCb14z6R+QtNvAwv7RREpLdXC/18UMLU33pI7DIs9Moc95Ur82xCXGeGp0wwkf9beOWEP7
	8kecZEjxzuT3RfaloeViCh3o
X-Received: by 2002:a05:6214:4409:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-91f241ddd3fmr55479136d6.46.1794596639018;
        Fri, 13 Nov 2026 11:03:59 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm27000686d6.27.2026.11.13.11.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:03:56 -0800 (PST)
Message-ID: <1b84bbe8-28b6-4a74-af0c-5b9cfdd8b394@ieee.org>
Date: Fri, 13 Nov 2026 13:03:53 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
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
 linux-remoteproc@vger.kernel.org, Alex Elder <elder@riscstar.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110400_869516_F094A512 
X-CRM114-Status: GOOD (  21.71  )
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
> ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
> TrustZone authentication, which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
> qcom_pas_context_init() and qcom_mdt_pas_load() and
> qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

I haven't reviewed the rest of what the PAS library does but
I trust it does the same thing as this did before.  So thanks
again for implementing the non-devm interface.  This looks
good to me.  My ack is already present, but I'll reiterate:

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 14ac2d2faf7c..0a37741c2285 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
>   
>   static int ipa_firmware_load(struct device *dev)
>   {
> +	struct qcom_pas_context ctx;
>   	const struct firmware *fw;
>   	struct resource res;
>   	phys_addr_t phys;
>   	const char *path;
> -	ssize_t size;
> -	void *virt;
>   	int ret;
>   
>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> @@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
>   	}
>   
>   	phys = res.start;
> -	size = (size_t)resource_size(&res);
> -	virt = memremap(phys, size, MEMREMAP_WC);
> -	if (!virt) {
> -		dev_err(dev, "unable to remap firmware memory\n");
> -		ret = -ENOMEM;
> -		goto out_release_firmware;
> -	}
> +	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
>   
> -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> +	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
>   	if (ret) {
>   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	} else {
> -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> -		if (ret)
> -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +		goto out_release_firmware;
>   	}
>   
> -	memunmap(virt);
> +	ret = qcom_pas_prepare_and_auth_reset(&ctx);
> +	if (ret)
> +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +
>   out_release_firmware:
>   	release_firmware(fw);
>   


