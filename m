Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B017606A321
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gtDItaMv;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlmqgpPE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i/cHgQg+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D/AyflsUAzw465H6bUaOXePHKyaAn5G/VJkaJFWzwu4=; b=gtDItaMv16awpP
	g7pxPmJMlx2B8Zf7IQtyEWrkfxZH7ddJnxhW29HajUAf2L5Y/3xZFNdeS687vih+zrXF1FepDAaIT
	osWyzpqqBdmw774D6iR11q1anVPqkYeeo+woaUZwdAV6pqWcajmFVJPZT4ofkNz3xpZLpa9UwHFQT
	AsBVlqmDbbSkuOZkk9ZSXEQRSDaR3hblrgTtT1QywQE4DEVkr9oUzSvz5pA71QU/zPDchid9f84/g
	jTLXxOkN6WT/rCTwWCSGF+rjU33L9tsH9n48chCBfReXdK9pJGA6Dm5If/JHri/kKUh7A0vAEgYHc
	9ljrZRJoB0R/vWaU5XUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJym-00000008S00-2Bw7;
	Thu, 12 Nov 2026 01:51:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJyi-00000008RzK-42FL
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 01:51:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaPrX3305778
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 01:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/AyflsUAzw465H6bUaOXePHKyaAn5G/VJkaJFWzwu4=; b=GlmqgpPEHfX453eJ
	ja64rubiUGRAWkVRy/R8NLCGbo5ntocBifWFjMcMZj4cWfrjKyseT2/E7mSm5Fd1
	cEUfqbkmGDsJoq9u7KlP/yV/4k/jdXMHIsT+qQxEgKOpyugWfk1a9O1N4/74og+g
	DSIiAEsw1k3C+9mwxX/q8Ln4Eoc71wQSLYycLE+zy4fchW4Ynm3RWDFvpOL31UJV
	bz5HCyyTmtEeaw84+VRXylXDVzoSqvIXRoG8QoR1VuZr27cUphoB9TljJEPNJYfk
	UH7fg5d8e3uuxEX8jZOnWPL2uCkN9W0pQvVGgxrqMioded1ZI4VSTkVPqJ3dq0kH
	BMleGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0hkrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 01:51:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1909109a91.3
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 17:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794448310; x=1795053110; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/AyflsUAzw465H6bUaOXePHKyaAn5G/VJkaJFWzwu4=;
        b=i/cHgQg+N/9e0SVt0Zpk1kG3EEkAw2R2SfDo6Shs/mkCoc91vcaFZTZFLE6NEks0YM
         mNCDLIFhl1JzTS06Xad4Mx+XvE5vTBihsuAxy6/AKyZcmY3ZFN2Cw2v4EiZIZUiQSN9B
         DNVyzONrYKqzQXzG3gjAunu5KDtoFgjahCiUGH9YnQLTt1ZlfTHodGuYSkDVc/tmXFRX
         Ng6dYgYeVnE0VACY6NuwZB6DUutkFhOPm7tdqevIwZ1c8RIpEhvbweVLPMqEFPbcbVH3
         JmjnKELwFWyy+4RbFqszXi8tB1B/cfHBdXI8kRpU3y3kA9DWsFRarW33KBsk9zgwMYGU
         vs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448310; x=1795053110;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/AyflsUAzw465H6bUaOXePHKyaAn5G/VJkaJFWzwu4=;
        b=eD8b0JCTKyn//OGhcSKIKFxpox/5WTYCtbFvbcP3oUwywBGI/L/Wt4w7GDzc9wz1PO
         yfeF7rvIfZDMobEzMDFFB2n/uPot3/X+oTES02ITEnvsXj9eFUm6bBls6YwKRHNq1ULy
         ZePAaR5xwoTg6vMvZltHKHB+/siI4P+pEbRcrM0So4WGSKjj/u7Uf0VlGTKzLxAku6dz
         eBQ8E9m4EsCXdrt+CSAbIyOV05A0zwYi8JIJ1IlfDKO6YTceg2128OcUdrMVwsbutIwm
         JuAdu1QqgXSwLf2rRHiwyTPGDOxSMGkFryoj8jd9bwo1ChvBKI8bB0hQvayfsmgrQAQW
         gR5A==
X-Forwarded-Encrypted: i=1; AL+hErEECxCwM3SSexh5m6fgjzn/wcPuYCYGVbB2xJASCdKvWyFLMibU6nz18DcxHQWzgtR6UnHUVWc=@lists.infradead.org
X-Gm-Message-State: APuU4Z95cqxQbeubxLRFq5YBJNEjMJMKHe3uYjoksLDg5jlJLCrDVQhB
	gIiYzeJh9tGMl0G5GTfS9Vsrhnf4N6Y92pSjFtoS5WwPtrs8Brc2iz3ozg0CFihlNoW/F7ERFFF
	IR3/1/r/VUoQXP0LUF4tMHeR9gheUKvauJ2IQGk2m39yq31udUqc+ysuPL17++X6U
X-Gm-Gg: AYBFou3Txxt2GsNLhwVeTAQMASG1rwrrHVuREFzkAjFYKHTTSu3uy9wnfNKW2RkiBG7
	oud+ns+tu9Xnk6UBZOdFFXHSTfMEiqK9lk697uxyCPLOReus4lSfd/pjNtZmQbrWyypxKy83Ui3
	GcYUr9kBWt9TMDpO9LWNzLHlinABeEGP1GxNRTMQkcV93TT6DkDAuihDWb4gB9ctjcjFu1hMOa0
	SLzUcb1KjOPUeesUasQYLi8zTQVaGsLzq+cF/8Dqb8sl/tXjikjONckYcATUFyzDpt6dfzyPfqO
	8mKqR3ki/FvivmjWP4I1htMEBBLUF3gXIJrSiEdqMjAwlp/y5c6+z9S/mBuD8OHP5E3oebYDWpV
	jgyxmwB8PHvd8lGqT1xY2f4j5DFWbe8QNijgD65ZMKLmvGgWWPCkItjJHYllGsMeGA3hc8g94bg
	S7bnJ+DgESmUWkGbBahacq/5NuwfMQzdh04w==
X-Received: by 2002:a17:90b:3d87:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b182d3a4ddmr3950293a91.0.1794448310492;
        Wed, 11 Nov 2026 17:51:50 -0800 (PST)
X-Received: by 2002:a17:90b:3d87:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b182d3a4ddmr3950274a91.0.1794448309851;
        Wed, 11 Nov 2026 17:51:49 -0800 (PST)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b19b533540sm1054997a91.8.2026.11.11.17.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:51:49 -0800 (PST)
Message-ID: <3bb78f8d-8fb3-4d62-91b9-a197cd5b8637@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:51:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: use str_enable_disable() in mac.c
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Julia Lawall <julia.lawall@inria.fr>
References: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SaQNk5_Qcr33QWagmuDeK-zh9ozyn0ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNyBTYWx0ZWRfXyn7MxHbdUySh
 Hp+Qne9J4Qa94vDA414+67holVGFLgNd/8FGj12114LyjpmrzslVV7dYC5NpHjRCx+6Up/mirc5
 s6NxGLyybyfMUsH80YgaCTkniOZdCrPgKSIe0ZM1Y5XK0bDLlx7FpIwro7tWnvL2s5J89jKkuaQ
 jgeFiepcQgAMKK3CyYIw6gZFCxkZ5NPDou43AC1CC3Xa0lFxGV4NJjU6YswjHHbrecLrAIZGt6o
 ttDTstpYfxdyayvQgDQP3Y9lhILVRS/TSHa6TQWj+AKpv2SVUVIpfPuSkdWOmGsLdccvmieHAks
 EdUTiISqCUc/V0X9XNBdn3ua2wUlBJurbgnDfN0qU8lSa2ysUwaN1xLG/xv0vNXzo3HagnDV90Z
 fXU9+Ej0yAImhqEyTg3XU388cjBnnezdOf2IoKhUNbKSA8/E2drYuFmB9+vDskIkIvjdHgyqRMx
 xOhgKY5Syjmy0FkeQjQ==
X-Proofpoint-ORIG-GUID: SaQNk5_Qcr33QWagmuDeK-zh9ozyn0ca
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNyBTYWx0ZWRfX5dXltPzkls5W
 rBAk+saY2OLwn08CcUTkYe890ie55vDFJQnttYDcfoOY6uaI2PHMM8LHB+7IHL7x5UbL0V5+YXS
 m0educj+vaxL51/fsjlMTBfnhxEw1BE=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af51bb7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=6l8UPjPGm3Pco2JvpTUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_175153_160704_88318B49 
X-CRM114-Status: GOOD (  14.29  )
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



On 11/12/2026 12:22 AM, Jeff Johnson wrote:
> "make coccicheck M=drivers/net/wireless/ath/ath12k" reports:
> 
> ./mac.c:4556:21-27: opportunity for str_enable_disable(psmode)
> 
> Update ath12k_mac_vif_setup_ps() to use the str_enable_disable() helper.
> 
> Compile tested only.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202411011943.yYxnp7QA-lkp@intel.com/
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 4f16c78b52a8..b37ec64cb639 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -7,6 +7,7 @@
>  #include <net/mac80211.h>
>  #include <net/cfg80211.h>
>  #include <linux/etherdevice.h>
> +#include <linux/string_choices.h>
>  
>  #include "mac.h"
>  #include "core.h"
> @@ -4553,7 +4554,7 @@ static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
>  	}
>  
>  	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
> -		   arvif->vdev_id, psmode ? "enable" : "disable");
> +		   arvif->vdev_id, str_enable_disable(psmode));
>  
>  	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
>  	if (ret)
> 
> ---
> base-commit: e3485cc885b81314c814a43db2255b1f9100928f
> change-id: 20261110-ath12k-coccicheck-mac-b5a890df86c4
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

