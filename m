Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23288606A324
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BGSi4kcP;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pRH1ILBJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwOgdwTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KPGGWC/2kBi+rBWx3h/b5/WqLPeVhFgeand6Amw/foY=; b=BGSi4kcPYxeVSN
	xO9zzDbI7W4kBzSC3D4VjwN0Pf4ezjEQOCbTqqVE9dBohumLFMVr0Nv632t21onPmpbzF18kyZvwo
	AZ+p+yHN63Oih6uRDmM3Nv13d78vGC9jdLSR4ycVCT/bUtWJcOFNMDeT3UwHnkcHhUx0LkOtL82oe
	SHn1BCt+AbT76dMKW2zJvaWYMxo2pLukEb8dnOblYF1dDP4N8jOiKGDapkuCNP3lQnHtV47YCgp05
	FTpTYl0747t0u74haoPFzpvd0nWzLDYv+x3rYbwoBpAVbRos4DGyFbUls1oOez7dfNY/DTaYuHfyO
	cpxi67k2oBuWyHnSa2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6tk-000000017Xa-0RPu;
	Tue, 03 Nov 2026 05:17:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6tg-000000017XF-42LU
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 05:17:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31ehfn1082965
	for <ath12k@lists.infradead.org>; Tue, 3 Nov 2026 05:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPGGWC/2kBi+rBWx3h/b5/WqLPeVhFgeand6Amw/foY=; b=pRH1ILBJH5f11RCm
	fQ026mVvdf9l/lR62Jbr5JobdX0HhuJd9Cd9pQVgSE+bKzBtS9H3xAFarkRprzr3
	JxEEaqCCEP+O1wL+4/+9s67stSC6oJpmnSk+DfjTpYEhtdCpNquGdl0dnKlFkTjB
	TbVDb1Zip6QjkMp2fwSAZfiCYfO1df3E6vtMdk4g4hoAqph8dwFNLj9sivhD62Dn
	wHzTr6auQzkZfvccsStYu5VijIg4FecPLBhFeXNeXD5ARYTdZqh+Mz4A8agmjpPT
	VQp5lo16AphVn2Cto2/RDlBEuxEHzXayL+aO7plrBw/6cRkObF7ZSwWRigb41+t3
	IvdXrg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r21sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 05:17:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so5087594eec.0
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 21:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793683043; x=1794287843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPGGWC/2kBi+rBWx3h/b5/WqLPeVhFgeand6Amw/foY=;
        b=cwOgdwTRk1Mgh1wq5LQqMg7hks7qsnBrRwyWgBbSzbL03hX9nulH0U7OmBQGcdHh0Y
         YyhTR+5414p9uRVwEezgKImderpPli/guZTRnWDIDQvKaoYjTMUCmjkJzQxrTc7vEQW2
         vfWh7LtanzSdM5nJHoSxjDEEy53WHGbLDKFzs/WGnqfn0GfFUuHZENp0RfEZVk7j3cMP
         09UjixVkRK7gC2QAktC8WncoJyAEgt3d4cd3NTkHUiDYaYkyp/BxkMdrp5rLHLI2EJTf
         nfVn/ywR2ebQ3WcNszbEshgURCCXB/7FQhQsF8aq2xpWTZBGKnhwm6SmZXaBIMs2nqYL
         ilfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683043; x=1794287843;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPGGWC/2kBi+rBWx3h/b5/WqLPeVhFgeand6Amw/foY=;
        b=ZjrTc8vTQYNUYWneQvignT9jythDIn3KaODR6uisoDax+3W1NUEI1+Av6VFZ/+oRPL
         QMtA6XvQ3Ry8Vw0/AYNvT4nKAmTsLkT+awpZjts1MIatTlDQKjBGKVDuXLmFpqf0DeXp
         W9VsbuiGvrwxTFBNRjMlxJRMoO1f93OSO/l/FWHQiTep8HrrMzLtWeOWhbZ1iFtGMKMb
         s0/Wi9RG4pUcv+xblAtJlfKXLfdGJn3PsTMS5md5toLAatUR1ITH/UzKPG3lqBjnM7km
         K9pv5nylFUYThEew9lByv9PMddRW8ozA08TJFU9AuLe3i1/oU0D8v0sduL4xdxysL2Sp
         B1vg==
X-Forwarded-Encrypted: i=1; AKwUvBx2NuLmVfEEl/ZM9D0Cg3C+uMxKv7DrNwQDz53PUlST3Qo9eGwxDd8jjxKgfpnCBNU8GLJzqiI=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Er1bxX57WM0/7Xy4ngK5EpL9g1X1y6s1hyRZM5OUjgqrwMj26
	piJwzaljW8wYAjLtTIlqQBvHd32ozXBAufMSTjdO9aheNfJ75+ZifdA3MueAl6fjHq9wTXTmT92
	1JXC55AyHcG3odyWeu5JzNbOZx5AZEAvMHF32pPHEQ9QmLF3MlJY/+qaDG/dZEdEt22ENACht
X-Gm-Gg: AYBFou0zECbEb30onz7FBPCFfZ3hV/TlXtlDSG/DGDdMoTaZqPYj6zaMLhfdoKyKgGX
	JadhtzlyY6DbKXVzvgOMj2OkLgMRc1yLLNm/aPvVjMqNoYqE8x6vlz2a68rnYjeY5YUHDM6Okfp
	uHM3LV3RAzU0pn+wZqBZLGTZgczj76D9ED50ZLXySlFpEug8Ace71kfSQIt5UcTq4W8la6Ac7ZF
	jHL4BONErkT+/c5ziaaaxi2tINqhm0BF50vJICg7PeL80O/oBGiXNfwDWcbXCceS0JPxS+daRhb
	LJmMHlVZwHWZVEeJLa92VkZOdxdywyc75eYIUB13ZgFqyHskmzWq2Af5mLuacRTxfVMTmeoPf9v
	fpAlfqe/Y0W/gD4LvYGkvVd9Deokii4jQV/RR80ThMSisPs0yP3a4dQpupDKBvwbeEcJm4XsH+k
	S82iZZ5rFIPcYi
X-Received: by 2002:a05:7301:1a15:b0:34d:7ae5:8d78 with SMTP id 5a478bee46e88-36a42418401mr16935923eec.31.1793683042537;
        Mon, 02 Nov 2026 21:17:22 -0800 (PST)
X-Received: by 2002:a05:7301:1a15:b0:34d:7ae5:8d78 with SMTP id 5a478bee46e88-36a42418401mr16935896eec.31.1793683041892;
        Mon, 02 Nov 2026 21:17:21 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm36640109eec.4.2026.11.02.21.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:17:21 -0800 (PST)
Message-ID: <8a301454-a8b8-427a-883f-cddcf31a4879@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:47:17 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath12k: report no AFC memory region
 to firmware
To: Goran Sustek <gsustek@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nazar Mokrynskyi <nazar@mokrynskyi.com>
References: <20261102200235.48973-1-gsustek@gmail.com>
 <20261102200235.48973-2-gsustek@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261102200235.48973-2-gsustek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: viulPunDGTRGGUzsgNTOkPcK9AtsU2LD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMCBTYWx0ZWRfX17yp4ana80b6
 LV27bJ/zfkIXVY72/e/R/65ZKBwSa6V8c9J4S4rfLC3jTpg0B5alql2PVNdeJqILeBcpsV1szWw
 +pITW39S7RHKRiJG4P8lxjXJx9cXXR74S5q/LQ4ueupw7RBSOk2F+HVSdMhM5NoLPdiixMvwOzF
 6DoxVjXQQeZ++gHfspltFf7M32prqjEhqFotuqrhcTNzImHVQVU0ou2qHJ6YDUBNWsvYX4Lc822
 K/73HPTDTM54/UPQByDRlwwiRIYgKyu6CcCu6FbHNyUMNI2HHwMq8hoXJrZouUE4WDiP2WYW6wq
 +lcHMrI1zVJN/y25TzjSI2Piou2yUaDsJvtoxRlK2LMU+BDEWF6KLVjtOO21OKPvXu8SaQ4SYLc
 Oy9cE4sqTlgDuO4EwYwImG9vCdwUlt5J7419zgFCPBHTxvVmJmsv0JfA0R1eABcJu0yMfpvdpRS
 H5F7nYF1XXbs0yMZHhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMCBTYWx0ZWRfX7bjG7HpFFOJP
 PZ40yeMnDcQxaSos5lhJaBc5+LiIiNM2FjsLLiuwaUBLclJOxmCa8q/wMXacsUc3AO03ZFa71az
 Mj4k5WvdPd4lZnG+TlAXtBrc3AFVLAY=
X-Proofpoint-GUID: viulPunDGTRGGUzsgNTOkPcK9AtsU2LD
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae96e63 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=pQ7Vk2PXlUccqxbdelIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_211725_122216_FBE3E3FC 
X-CRM114-Status: GOOD (  29.87  )
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

On 11/3/2026 1:32 AM, Goran Sustek wrote:
> QCN9274 firmware WLAN.WBE.1.6-01243 requests a target memory segment of
> type 0xa at every boot. The driver does not know this type, so it logs
> 
>    ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported
> 
> and answers the request with a NULL address but the requested size.
> 
> Type 0xa is the AFC region: QMI_WLFW_AFC_MEM_V01 = 10 in Qualcomm's
> wlan_firmware_service_v01.h. The firmware asks for 8 KiB, where the
> host places the response of an Automated Frequency Coordination server
> for 6 GHz Standard Power operation. ath12k does not support AFC.
> 
> The firmware treats a region as provided whenever its size is non-zero;
> it does not check the address. With the current answer it therefore
> takes bus address 0 as its AFC region and maps it for its own use.

What do you mean by "bus address" here? Do you mean the DMA address 
provided in chunk->paddr?

Also, the paragraph below makes it sound like without this change the 
firmware doesn't send the memory ready indication and the radios don't 
come up, which isn't the case. There is no visible functional issue 
being fixed here. Please update the commit message to precisely describe 
what changes with this patch.

> 
> Name the type and answer it with size 0, so that the firmware sees no
> AFC region, and log this at debug level instead of warning. No memory
> is allocated. With this answer the firmware sends the memory ready
> indication, reaches firmware ready and brings up all radios.
> 
> Tested as part of the series.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Goran Sustek <gsustek@gmail.com>
> ---
> v2: do not allocate the region; answer with size 0 and log at debug
>      level. New subject. (Rameshkumar Sundaram)
> 
>   drivers/net/wireless/ath/ath12k/qmi.c | 12 ++++++++++++
>   drivers/net/wireless/ath/ath12k/qmi.h |  1 +
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 817bd820623d..55952da4343b 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -2755,6 +2755,18 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
>   			if (ret)
>   				goto err;
>   			break;
> +		case AFC_REGION_TYPE:
> +			/* The host does not support AFC. Firmware treats a
> +			 * region with a non-zero size as provided, so report
> +			 * size 0 instead of address 0 with the requested size.
> +			 */
> +			ath12k_dbg(ab, ATH12K_DBG_QMI,
> +				   "qmi AFC memory region of %u B not provided\n",
> +				   chunk->size);
> +			chunk->paddr = 0;
> +			chunk->v.addr = NULL;
> +			chunk->size = 0;
> +			break;

I'd rather move chunk->size = 0 to the default: case. That way, all 
unsupported memory region types are consistently reported with size 0.

>   		case MLO_GLOBAL_MEM_REGION_TYPE:
>   			mlo_size += chunk->size;
>   			if (ag->mlo_mem.mlo_mem_size &&
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
> index 1b1c88906f1e..9d9174c6ee60 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.h
> +++ b/drivers/net/wireless/ath/ath12k/qmi.h
> @@ -177,6 +177,7 @@ enum ath12k_qmi_target_mem {
>   	CALDB_MEM_REGION_TYPE = 0x4,
>   	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
>   	PAGEABLE_MEM_REGION_TYPE = 0x9,
> +	AFC_REGION_TYPE = 0xa,
>   	LPASS_SHARED_V01_REGION_TYPE = 0xb,
>   };
>   


-- 
Ramesh

