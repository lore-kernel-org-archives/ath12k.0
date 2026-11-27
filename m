Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D75606A690
	for <ath12k@archiver.kernel.org>; Fri, 27 Nov 2026 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rEioblv5;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FFYXB7KP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2P7lHc8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=; b=rEioblv5V0Aw1J
	dhpmOfXNHgTPmUprXSP/qLI60oPBerVdhIwA9kVtumZYbXPOyB/znBwXcYqoQJEhMwiTkOMqcsdd4
	NM0zrLYVE9mcMiJbii+GFh3pRU4XMgga2NsxTCV0FTr0BnQ1t3EZF1T9z0Ma2vVn6ZLNVUpp2n01V
	x2dTYIBEo9mmuYWayl/adUiQfUeXMGAWUyU/Z2PLViTck320h7r5EPxeF8OfWIhYp+A/1cMiq593R
	q9zDkHoABrvBWn3+dXE2cfoiZVgfwynuzO/qpc5X8nRZkOwSd1TYPjAQnrz2ItMSsm3HsiIMtoP+E
	AwtaP/1w6ZllG00Cr0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsjJ-0000000FUr7-2H7M;
	Fri, 27 Nov 2026 09:58:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsjH-0000000FUql-1LiL
	for ath12k@lists.infradead.org;
	Fri, 27 Nov 2026 09:58:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7I1hl3118313
	for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=; b=FFYXB7KP8bTOV2BX
	lHqDSuLFy+ONvVxACTAfcO0CcPvghrqu7cQvU0hJAHg9izRSew5SHNQzgloU1tOt
	2ejmJYmLrByKMWSeaxUw4wR3RQHQMp7S03a0/34G+21mydxjgBKrsnjX1dMNjNU3
	mqqU1wfcLhX04/++MpJqONfGqLjQ9h0L7MhCyGqQZIxnugM7FEDhjmAhaWKEdsen
	DFNQB62BMjlqxaMO0Twx9+7tQGgx27NVUPqSuPBGfdKWc0BgsVJE7DxEeN0ZgGXE
	rUWTKabL5d9fZLwjmLDdh3lOqu1DZcML+B/hh+ynKod/01PQDsT7K7vVmGntxHzz
	VU42bw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh92wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 09:58:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f02c63901aso71192455ad.3
        for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773532; x=1796378332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=;
        b=Z2P7lHc8ugB6pF++XpusGUcLMle9ly8n0klOaMtDigN+1wkd/CSZBZfVnVD7ZXhmjE
         Cs9n3wWDk2Ui/MIYm0R08cVTwfcO4zIYhZBLq4+uHkWdCSSNIuCju2mLJ62BWtvpkz9N
         Wnpx+6PGpqSvY1/1Tb8ihaC/rtYY+vHc+jLOjVwrEVZJLZN1j9Iex35RiERM2M5zEODe
         7jppSducR87R2Twzi7/mOA7ivwZxsUM31s+eot4JF0KrWqzJSJIv+S7HNSgnuBl8aF5c
         LQXYO8r0J9u8qbRVVK7NNEIS/+5UJb0bMuvcRklI5DnzWf7VyNw+zIc7mABYxxB2HCeZ
         ZVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773532; x=1796378332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqHlpnv9nCaWc5k/N6xeMuJ92Th9JTg9I+6KoCRS8CE=;
        b=e1VSa5It7y8kLgdsqCPS3BfktUbQTTCar1e2Yj83rGmuhyAZ9Axgo9WZBHuxS0fz0U
         zpWD5SnVY7RS43BS80ZsByo7Ih5kZTw/C35HwuGV1uxvyqY7zYdTZpqzudrevXPfDg1U
         G1IIfuBffSG16Lc+G2UT1FvLOrXaoLud/D6kmoHRiXHmiPVPkHvgb9MhMSvjZv0lRWaw
         1E9NxBl5gxlv/KF3zES0g76xbP9FUYoSp2e/JRJyGPi444AaWVgC7MGM+KANR6esDd2W
         I6eUuUU6patw3oEU5FQ8WuxorI5iykfWB1/otDNnXuougnlv83zpEQS6sklTM5icy/5X
         JSug==
X-Forwarded-Encrypted: i=1; AL+hErEYjyRanMUV6+PhfMAdExbVAU4p2x/zep7vhX1XD2xLr6j5H9/9ccJDNnzK9uncHrTUXYq24kI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/+Q98mNOTvdaaF+XynoGeteMxWKq6TgtyZISY9ul9DoCfDpdbV
	ZITl5ZhOSRHUuxSl+TG0IfGN/rwM8ISU9xCueM/uOn4oqYXw6zjjS+s8W+VzMusuwSAEa9TCfYn
	9onnA7KDJw4SLVBXxcZOnNDaqw16FBmWmuH51o0KVjraI2KXfyI7CVmgchpxnHkl9
X-Gm-Gg: AZFdTZeWx1tcs0ZMbhqL40rGek0RdBTCjZJ0Tw7mLXyYOE9fHEmPkdWdbDiSyUuVFkn
	+68HT+wdEIxLuhwGQzfAS+eCyO2sprOzssMLn5Ew/0hYPzbjPdzVYNGlwwRg1VBuQBMq5TJJiKc
	ko/6waqrhEt2FUG0CuKZijoVyOOGBi8AQU/nOcVzteUux6FOqGUDPW3abzCPOz6i8IPML5t6HsV
	iSGMnO63++ctx2kfrKY9L4TxWLatDx6tWvxOtBiAZ0QTeP4Q16gZR4QX0S3z8yGhh0wLfJiKBv6
	uRkZYSGuwSQUXuYGzpNHB9pvqqv4Bmyo2HESaEZR7ImiazUNNQ8+MKPpDIz6wQKJ8KrLjhSQQd1
	QrD1a9kmOXOvzNW54BG8q0/rnSD4EaoFHlzTShTY7+nR7tlGVg8kknBc8BB4CqEaGq4Poy2YXNB
	sS4Job
X-Received: by 2002:a17:90a:e7d0:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b41c8d4881mr20897588a91.20.1795773531616;
        Fri, 27 Nov 2026 01:58:51 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b41c8d4881mr20897555a91.20.1795773531067;
        Fri, 27 Nov 2026 01:58:51 -0800 (PST)
Received: from [10.204.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm21547994a91.10.2026.11.27.01.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:58:50 -0800 (PST)
Message-ID: <8ec59e5f-c476-4721-91f7-7fd3fd1018f2@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:28:39 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] media: venus: migrate firmware loading to
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
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX8BhU5YXfa4lZ
 AhbRQDCA9L6Wgm2RHYvFocHDvKycMyyGlv4k+7dGY+tMUgy168GBGny+cpTLymvKTE8us7HMyf5
 p/9yWD8rMd1+UPg5sKs1jx1BXeNjvzPO2RwBDxALySNXqAP8SGD7TYNQ5bGX0FNALDkEMAZC6G8
 s1EziZweLecGfpDaBvWKHn56kB4y/DNFZrVqvzJr50Gku6RVmD9Z7qOe04UULPdkS92A/C1sAp4
 t+8LDGw2rJS6cjlziuUBofZmdrz4NUiuV4X0XwiJ0o+selDSeBRXVoWYeZQYSVRiqUD1zs12gbh
 h3E7Qh5/RJNiWAQjN9lt/TrF2ncHz0ED+/sXC5rSpHliCuqRSSRGfdGkqTqvmnkj1TIC8ja+SaK
 JBMwTBmiFrXTTLxLsVktJr4LoNFuCjTN2Ihakst4KeO5O2CtRHj3/E8K1fQsozdm0WNvoc7VCYa
 yjwch8N6I+zbmhPK/wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX6VNY8TKbei9M
 wtDB4yvVdIUn7u9ZCPbqeFcy9etEadBpBvt779q+LsEvGFfI6a2/+vAgfeQh5ngmn+oooSwLr9Y
 DOhyoP68ZT0npen4rDR7PiCAkYeFvzk=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09545c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qTQABE6tYUUe6KctvrYA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: IvY0Fb1ThwA6shMqTDPXhNST-_Dzme4T
X-Proofpoint-ORIG-GUID: IvY0Fb1ThwA6shMqTDPXhNST-_Dzme4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_015855_481557_1A4B9DD0 
X-CRM114-Status: GOOD (  23.99  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/16/2026 9:51 PM, Mukesh Ojha wrote:
> venus_load_fw() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
> for TrustZone authentication, which is the intended behaviour. However, a
> new qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Embed a struct qcom_pas_context in struct video_firmware and initialize
> it with qcom_pas_context_init() inside venus_load_fw() on each call.
> Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
> replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
> The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
> sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.h     |  2 ++
>  drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 93fa77f05834..84a0d4a8426c 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -10,6 +10,7 @@
>  #include <linux/bitops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/list.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -228,6 +229,7 @@ struct venus_core {
>  		size_t mapped_mem_size;
>  		phys_addr_t mem_phys;
>  		size_t mem_size;
> +		struct qcom_pas_context pas_ctx;
>  	} fw;
>  	struct mutex lock;
>  	struct list_head instances;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..704343e241dc 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  		goto err_release_fw;
>  	}
>  
> -	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> -	if (!mem_va) {
> -		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	if (core->use_tz)
> -		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
> -				    mem_va, *mem_phys, *mem_size, NULL);
> -	else
> +	if (core->use_tz) {
> +		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
> +				      *mem_phys, *mem_size);
> +		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
> +	} else {
> +		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> +		if (!mem_va) {
> +			dev_err(dev, "unable to map memory region %pa size %#zx\n",
> +				mem_phys, *mem_size);
> +			ret = -ENOMEM;
> +			goto err_release_fw;
> +		}
>  		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
>  					    *mem_phys, *mem_size, NULL);
> -
> -	memunmap(mem_va);
> +		memunmap(mem_va);
> +	}
>  err_release_fw:
>  	release_firmware(mdt);
>  	return ret;
> @@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
>  	core->fw.mem_phys = mem_phys;
>  
>  	if (core->use_tz)
> -		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
> +		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
>  	else
>  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>  

Thanks for addressing the earlier comments.

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

