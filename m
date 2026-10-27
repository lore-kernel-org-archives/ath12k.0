Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E1606A330
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzjFPjKp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d18HWBTK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UYGo928o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tMas7QgfTczyZxXDj1TfoR+MSTG6n9DPxh649aqtWyg=; b=qzjFPjKpDP6VyB
	Ou+DtO9RP3MopmIJjSQ0KDv7pYHK4u2XmGd/Pio4rw24uj7rYXjLr/vxWwoCE43vWD/JY4ks09XRD
	UobRFM1W8hW4zSZ2BGya/iaVql5gIkOaXQ7v8+o1ZO7rO1FZZuiukNjg2WvnYPqSWhcy/K0knW+UW
	qBVrZlmMoWb5aU9SdhTZnorsgXEJOzjTwfqAHT9e/XLk9nqecNT4wily3XZi9bCMZ96Xowe1PXyWA
	kqyeiN49oynS7dTtU9vI9rWr7mVTXuE8jUR45z+Q5jxh4g5HDbrgtvl8hbB3qk96JRl1VBTN5NK9m
	w09BhuivSMHhs4Ri2+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdXE-00000004AFn-38ZK;
	Tue, 27 Oct 2026 09:32:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdXB-00000004ADy-29uG
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 09:31:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fuws2192743
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 09:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMas7QgfTczyZxXDj1TfoR+MSTG6n9DPxh649aqtWyg=; b=d18HWBTK5yk45lzr
	b74uArz3Zh8QM210ZHXY3jNxD1DCFe02CJCPjrPzNP/yrxbduO9Ow9Fq0JWhIPa1
	UYJ8yDexkkqlt/YNcxfPcug/zxVpK4fuewgkE/D0pI0HezeqNzXsiZV9SOYl/kg7
	MyDWAjvKwKTv4pI/uqLGGN7+uF5ncjUff0BjHqLmPJCF7r2Ej6rStwKuvQ9vYJQc
	WcUQYFdIGfUbA7pehc/5hfZ3/DM4tey/XlA9xXZwXpY7O9Pweu46EFGPRTzHrAv4
	1H5hC4OBkBBLOawipZ1X+GwKDkuYVt/++g+hgNdV5+GuMBuxXyvL1OQARwyb3prD
	1iknbA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9jne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 09:31:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so5654414a91.2
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 02:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093515; x=1793698315; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMas7QgfTczyZxXDj1TfoR+MSTG6n9DPxh649aqtWyg=;
        b=UYGo928oEQTOnlQmAnJHFyjyH9iawTwILkDT5e7VIzsgJGiFeRrcYbEekf51x5M2g0
         wAS9FCWX8kq7+5OHKTPn1E7rqWK2KaROuSc53Upzp9UyRlkcKVbWTaPJCDhMXdXAKLEA
         sMXsMWxQuvgvgj5nNAe/1FKhr+OiDwLVvOfkXjFY/cwYi4ZlWPhLpulL7wFE93zjwgTg
         8yhU4TeMsHcsSnMeIJAm3sIa2BJ3cn9563R1TdWC7LRE5QeimWsVrsq3M7SvA+jn8URj
         isRdlCyrBg9SBVp2qmE4GzJ/ufkf7zI1+3CboKbN0EQSobRJeUZlfRwUzdaH5W6U8ZJJ
         4xIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093515; x=1793698315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMas7QgfTczyZxXDj1TfoR+MSTG6n9DPxh649aqtWyg=;
        b=O4H4Ql91oRhPe7FSS2IQ/6t4QG1GCtpCFP1HLBspA3cTYV2yKxXAj6Dn8ToLiLzVzF
         KCNpJl/6HpUbtEHo/cufcpKwAkFzFkoS1DkwvQw6kSAMTgL9/PQTD9OQlvvDbp/1WpYI
         CI5QHGDkD+LStg65ka5QQnPQQKaC5d7+r9xc7A9INdb/oNFDKYHNkHi8WNxjnod1Cyg7
         YcT+dVotGel9g+ddK1aUJBaONKOUGmaPBq4wTfRoQw4EYXe0QE1huNBQzbldBAqIhGFb
         Frv2QR+aQjAVV2meaDnz3DZdJcS2KbsD9NA5thketAr8qaUtDp5CweL4ydVKAi26cusv
         qxCw==
X-Forwarded-Encrypted: i=1; AKwUvBy/d6rrlItthifjv7SXPz50MaOkVoJYK2TMbKgupXUOldp7/+AJF5iFwIfW+0HgTavRIPc92wY=@lists.infradead.org
X-Gm-Message-State: AFq9FYIzvjR0Gm0nT2hI5ctqIVFKVASQVmLBzjOdMhO/CZTFriGfympl
	trcDW5UEUFbZI29Cfmw4oZh7yZfMv1SpPFvDHc5nr1tKg4amCyHMPzzfoW2ONKHDPXMzi0zJKqe
	p50cnoZyAVk87dcS3tA7qoaZeh8oPV5YDMNGXA9fhYzOOLIG21pMpgOQtlCycvumy
X-Gm-Gg: AYBFou0FFVIhL+M5x97tms0HpJIfHv7TQy3qOo3IgWy7WpoFkBXKmgGQyLGy5wmRklR
	G3R34gQ+4hGdq7LGbudsATCcgVvjmELJzya/hNXI1MmQ+9CTgIZMfRoxDHcNPiFrsWgYUXjal4k
	yCPj+E0kfzVHCLFmX2mCexSGH76a5VHl0ALxhzLUAu564p/1TB3cWUbdLfLs3oFpE2s+MfSCmFp
	cHQFEByTwYNUMtp5yfxbQ9evRy6nEIYIkFJXLA37lzOfKcu3M+rGauPwTa9JttBSovtXP7MD8kF
	jCTaHDncKTe3oN5DF23xwSiK4BJYQZ4r5+qCbqKDWcUrg3V9eJCJ1lGTvOFtTcx/l40YADJqnl3
	ZTOExwEEvBfaBDUc9LW3JT5mSNoRQ4Vw=
X-Received: by 2002:a17:90b:164e:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ade9b2ee37mr8269750a91.8.1793093515014;
        Tue, 27 Oct 2026 02:31:55 -0700 (PDT)
X-Received: by 2002:a17:90b:164e:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ade9b2ee37mr8269724a91.8.1793093514545;
        Tue, 27 Oct 2026 02:31:54 -0700 (PDT)
Received: from [10.204.101.238] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba47266sm6423275a91.1.2026.10.27.02.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:31:53 -0700 (PDT)
Message-ID: <aa70a256-eba2-483f-8326-c3bd2ff3d33e@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:01:41 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
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
 <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNyBTYWx0ZWRfX+VBPxXWLQX7h
 EBZUNqXYASWS3dK/6vL8/SOurBI1QkuWIDkVmrtMBEs0tM3FTwTNy6SuTz6BnMR99o2pwDFYPxo
 228oUR4mM80Iv2SC9EJRl7Ogzon2r7g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNyBTYWx0ZWRfXwPYwhu5XlRm9
 /VZQ09xqxr2pWsjtKY6dMnRx73qdSWHhcDlvIyTqBn0zPtoegmkgmTQcBIkifqDxMD6Lj5dm5Qt
 31J/Fl+1PVYnuQoJPT2a4JfiT6wp2QgQLOLR+KdqMJH84CVawchEeooYmL9emPlm6fLOHf8QAWv
 HlVyC1/R4o0LE7EI1/4yGusRXfsnqUOVYqSHc6mEjfDeg6KJE7lNBz6HUhbfX1buERyQBQITBTr
 5A1uq8kF7L0EjYGH+bPuEwe/29VAp2o+g4Dt9Lj/3QZtHFLUPzWWeAyF8H82nXYgIMeGb4mHWhc
 SXenHQYUat5EA26auPWx2mGwQ6ytkt9x06LobqL5TBS+h9Vl1Z7H377TqFWER5fBLZQhY39eXDH
 L1YF7pz6q7vRHYHw0xYchryErmbyvF1YEIiNOV5BFpNPs7IYNLe9NsW+2lbmjjy9CvlIiIHnsns
 KEV+sDyN/S2gFYTQkWg==
X-Proofpoint-ORIG-GUID: vgXHK7p3qS-rj68tf5O7os4Ixe5A9WLX
X-Proofpoint-GUID: vgXHK7p3qS-rj68tf5O7os4Ixe5A9WLX
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae06f8c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nYfwElOfYSAnSMmgWPMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_023157_700082_7F34B78C 
X-CRM114-Status: GOOD (  26.46  )
X-Spam-Score: -2.8 (--)
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



On 9/25/2026 9:27 PM, Mukesh Ojha wrote:
> iris_load_fw_to_memory() calls qcom_mdt_load() which bundles metadata
> init, memory setup, and segment loading with no PAS context, and
> iris_fw_load() calls qcom_pas_auth_and_reset() which skips the shmbridge
> prepare step required before TrustZone authentication.
> 
> Since the auth call is in a different function from where the PAS context
> is allocated, add a pas_ctx pointer to struct iris_core so it can be
> threaded between the two call sites.  Replace qcom_mdt_load() with
> devm_qcom_pas_context_alloc() and qcom_mdt_pas_load() in
> iris_load_fw_to_memory(), storing the context in core->pas_ctx, then
> pass it to qcom_pas_prepare_and_auth_reset() in iris_fw_load().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
>  .../media/platform/qcom/iris/iris_firmware.c  | 20 ++++++++-----------
>  2 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 24da60448cf2..68e6adcc1dfd 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/pm_domain.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/v4l2-device.h>
>  
>  #include "iris_hfi_common.h"
> @@ -123,6 +124,7 @@ struct iris_core {
>  	/* encoder and decoder have overlapping caps, so two different arrays are required */
>  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
>  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> +	struct qcom_pas_context			*pas_ctx;
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21cdf1c39835..e73a5dd98b88 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -115,9 +115,7 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  	struct resource res;
>  	phys_addr_t mem_phys;
>  	const char *fw_name;
> -	size_t res_size;
>  	ssize_t fw_size;
> -	void *mem_virt;
>  	int ret;
>  
>  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> @@ -125,7 +123,6 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  		return ret;
>  
>  	mem_phys = res.start;
> -	res_size = resource_size(&res);
>  
>  	firmware = iris_detect_firmware(core, &fw_name);
>  	if (IS_ERR(firmware))
> @@ -134,21 +131,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	fw_size = qcom_mdt_get_size(firmware);
> -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> +	if (fw_size < 0 || resource_size(&res) < (size_t)fw_size) {
>  		ret = -EINVAL;
>  		goto err_release_fw;
>  	}
>  
> -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> -	if (!mem_virt) {
> -		ret = -ENOMEM;
> +	core->pas_ctx = devm_qcom_pas_context_alloc(dev, IRIS_PAS_ID, mem_phys,
> +						    resource_size(&res));
> +	if (IS_ERR(core->pas_ctx)) {
> +		ret = PTR_ERR(core->pas_ctx);
> +		core->pas_ctx = NULL;
>  		goto err_release_fw;
>  	}
>  
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> -
> -	memunmap(mem_virt);
> +	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);

qcom_mdt_pas_load() passes the ctx to qcom_pas_init_image(), which keeps
the metadata buffer in ctx->ptr, and qcom_pas_prepare_and_auth_reset()
does not free it. Who is expected to call qcom_pas_metadata_release()
for iris? I don't see it called after authentication (or on its
failure), unlike in qcom_q6v5_pas.c.

Gourav Kumar

>  err_release_fw:
>  	release_firmware(firmware);
>  
> @@ -166,7 +162,7 @@ int iris_fw_load(struct iris_core *core)
>  		return ret;
>  	}
>  
> -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);

ctx->use_tzmem is not set for iris, so the shmbridge creation in
qcom_scm_pas_prepare_and_auth_reset() is skipped and the behaviour is
the same as the old qcom_pas_auth_and_reset(). Please reword the commit
message accordingly, since it currently implies that the prepare step is
now performed by the new API as a fix.

Gourav Kumar

>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;


