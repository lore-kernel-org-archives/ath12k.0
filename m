Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A1606A32D
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gCu0x/8U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jBfCvarK;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=HFQ2YSqC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fk4tWvtlQqWKIFqJ5KSuzG0MEcWeW6IEPLtAR2pn3Ag=; b=gCu0x/8U+CYVmM
	4fK4Dyokz3GhVBcd/FNKaE1GavL6rEIul7AtZKPyH6k9NCOFUkFEad/GQH6Wl/WCmXwIJmXoTkA5U
	7Q/bgeNLtL/Hn3rfCHt3LfsDAbmx2ufFfSzm2o0oYIeA5lf2/CORkxNK+ViShVa80tJ+VPccAbX1b
	nt6B6vj3aFcPi9BF/Nc9hq2MLyoEJ1vtQGnDXXc5gbN7SqtEyN356GsGn7xn5Sm404dPF7mbzl40T
	/8Ra8YI/w6IGhl5FRidrbW1FCAG5v26a8yzKpj+6xQtnW/pwmvddpRzpGUh+/kiuY9Z29GfoO2Z2Q
	91yfutYBXiNIQYNwSQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgc9-00000004h4o-3ep3;
	Tue, 27 Oct 2026 12:49:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgc8-00000004h4g-2BQn
	for ath12k@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Fk4tWvtlQqWKIFqJ5KSuzG0MEcWeW6IEPLtAR2pn3Ag=; b=jBfCvarK2TsC4pDqo6gi15cUTJ
	K7z7hrvztIIe4uz87fFq2nbW6aWMr8il/GKZvagjW2lkCeeDRWnFWYudSxgjQGTmFMUJ2g69zTEWp
	p0qjWCuCi/iAPCUdRoKirte9d5egcluuuAc784BOyowFBalqKrsaEgDlqTtR2Pm8MXFNbBsyIIueh
	jZs5FEB8bLVMcG8w4o8cFRSPWEHzoZLPCDLZBgjzjn7cPRPxJSyT1QixiifNv1WGucs8zBRNk1mZa
	qB/htkBhogsgSCYs8y/VAePIAnQKXh/fCnPY+KYhpRZ2mPyn9JbG2PpO+hpGCE3Lu1sLTph4R5CU6
	SLg8d+Lg==;
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgc2-0000000ExkO-3SZP
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 12:49:15 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-93f36c18b75so211416685a.1
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 05:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793105348; x=1793710148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fk4tWvtlQqWKIFqJ5KSuzG0MEcWeW6IEPLtAR2pn3Ag=;
        b=HFQ2YSqC83VYIdklUu303v8Ane3oKInnUr52nAM/wriZHytJ9aLY0v4R5vaM6wCzBG
         8B8sbRkPFsrDp+f2ntsSxvTiXqThk+AHhNaZTXCXx0yz/VbZMReHbDtIVnH+vy62Lubq
         qo8p0n9hoegep5U7wQNUb0tuZVhOooJGAgXbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105348; x=1793710148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fk4tWvtlQqWKIFqJ5KSuzG0MEcWeW6IEPLtAR2pn3Ag=;
        b=IjjANMiM1Cd6KxAC/yTz4oTOItiJMT3fXfv8yZ8SRuaUxIxJfmfxMx5QM+XQGt3M4L
         VX/tfhu9cYL5DSWip3geA2jlUGugqGgRhFTnqNX03m/VpdHTwLkRrraEKoaGWEqzz68A
         1OsZrCy1hozonyOOU/2ebxPbNXAaWCqivEPk3a4uo92SzcnBD059WFgFSefEt7penKz1
         Dl9rBU+7HOUKYNevfslHhKpb4BpGoZcPtE/2/tJctivxTVo1MvgToi3aumHz3ex/hktH
         /19clxv/U5j7Jw90mar4mGQ7kcV7M3j+LekO/0oEJVQp8zgVd3U2p0vFusO+xOfvj6EA
         4XJA==
X-Forwarded-Encrypted: i=1; AKwUvBxLNj7PEDPe+phjkEqYA9smXHO2r4RPkTo4aghbefygS7As54pwXbE+gYmz1xNBOk3xTFNPQ9k=@lists.infradead.org
X-Gm-Message-State: AFq9FYJNr2eeMcgfjEWRkkWhmuLgOWYVB6KF1pWd48W9W4uI5mibGnsK
	Aom5BRKLLaUMx2rwaigqYAF2cInkGNuvJsMakhA6tNdaK8I9XvG9g1nBvyLE/JU4rA==
X-Gm-Gg: AYBFou3iuLQQKeMrDdxXcbsuMEXvVklxb/c0SMWbxdsBquxlEU6V7GMgHHtoOFky9B2
	4YMHcw11+V/Jnzh4Fi3rh7TgCfgco/bPHXbZaAWTKjcz9hgor7/pp8dM1/IZgBOsroL0hH/fVmb
	40hjJ1r9+Pbf24US2fZvLl4AnI36isUuAQDChn4DqM/Wefy77pqlgQXbkqD64zn0hYFbp5NQ3Tm
	WJSW/hfw60pZb3kpC4caXiYWukodMjevgpIlesEutbnp4aa+g4J0hr0AKCC0inK3U62ur0YUSvJ
	OFOPcn8JOeO+S144M00YKYCgB8WHJSBrLY819xzlhocmidSFuI8i0kewKadVknQdCv9fam3XzV6
	JvBFzuZ0DLeXcEnhSZdIw6gh/sdGAPJqTTya5ov5yxk5rtAJ4iSNClQNu/eiE6nq7iL8c1XFtDQ
	zMYSaZWrcUVjap3HDOJZxg1g/zBw24rXPuSAlWc+8R0ZLCRHF4kh40GFXIvTW5ng+RVWJd5I09X
	3j2xPaJ6zTu33dBthu6NYkFtgM5hTp1Va/nqNqn/NL6HcVOl1c=
X-Received: by 2002:a05:620a:801c:b0:93e:7944:b874 with SMTP id af79cd13be357-940ef93a596mr1396495185a.33.1793105347945;
        Tue, 27 Oct 2026 05:49:07 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-940f0a8549fsm956941085a.39.2026.10.27.05.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:49:06 -0700 (PDT)
Message-ID: <ccf0300c-80e8-41a5-a394-6ec55fddc913@ieee.org>
Date: Tue, 27 Oct 2026 07:49:03 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] net: ipa: migrate firmware loading to
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
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_124911_279729_F1CE1F0E 
X-CRM114-Status: GOOD (  21.67  )
X-Spam-Score: -0.5 (/)
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/25/26 10:57 AM, Mukesh Ojha wrote:
> ipa_firmware_load() calls qcom_mdt_load() which bundles metadata init,
> memory setup, and segment loading with no PAS context, then calls
> qcom_pas_auth_and_reset() which skips the shmbridge prepare step required
> before TrustZone authentication.
> 
> Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
> with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
> the same context to qcom_pas_prepare_and_auth_reset().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

I think this does the right thing, however the IPA driver does
not use resource-managed (devm) interfaces, and this would be
a first.

Why does "qcom_pas.c" not offer an interface that can be used
without devm_kzalloc()?  What if someone wanted to pass in a
preallocated structure to be initialized with the (publicly
defined) PAS context?

I was going to suggest that you just rework the code to use
gotos and the cleanup path as used everywhere else in this
driver, but it looks like that's not easy.

I'm willing to ack this but I would have preferred to preserve
consistency.

Reluctantly:

Acked-by: Alex Elder <elder@riscstar.com>


> ---
>   drivers/net/ipa/ipa_main.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 14ac2d2faf7c..6964395caedd 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
>   
>   static int ipa_firmware_load(struct device *dev)
>   {
> +	struct qcom_pas_context *ctx;
>   	const struct firmware *fw;
>   	struct resource res;
>   	phys_addr_t phys;
>   	const char *path;
> -	ssize_t size;
> -	void *virt;
>   	int ret;
>   
>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> @@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
>   	}
>   
>   	phys = res.start;
> -	size = (size_t)resource_size(&res);
> -	virt = memremap(phys, size, MEMREMAP_WC);
> -	if (!virt) {
> -		dev_err(dev, "unable to remap firmware memory\n");
> -		ret = -ENOMEM;
> +	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
> +					  resource_size(&res));
> +	if (IS_ERR(ctx)) {
> +		ret = PTR_ERR(ctx);
>   		goto out_release_firmware;
>   	}
>   
> -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> +	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
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
> +	ret = qcom_pas_prepare_and_auth_reset(ctx);
> +	if (ret)
> +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +
>   out_release_firmware:
>   	release_firmware(fw);
>   


