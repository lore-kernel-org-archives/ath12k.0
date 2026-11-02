Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9FB606A326
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YStjKP2H;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqRMo+cS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHN0Cqct
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j/h1nzyLwLos+57W9zu2/iGj9UgqL5dXrMfiNd2SNZU=; b=YStjKP2HvdfWl8
	xyAbQohKGyMD8URIlu2PoN0AC+QOHj0ZHe6aVFUqN+5r6ImFkpAY5N3qes35eg3ied2CE5woZMdog
	TMJwyxJR1oLOUKK351mLfq9lnh0RT69iDeI51nGkcGRGganNx1Cu9zx0SWTBmJJ/rOXjCG8D6KcX0
	qszrCkiRUdl6zURrCMt+8Q06VjagrGV0V4wozjl0kQKJpviRTllFyNul+cb6v3R8fBLwabTzOwCJt
	K055jdoaF+Wn+VnDUmTxypqAUzyzV7zdftQJTnBl/16DQ7z0dEETcxw1U+pVy0tf6iGT9r+DimOS/
	N/dD83rRQ5pebWm//haw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpOv-0000000GBaU-2uMD;
	Mon, 02 Nov 2026 10:36:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpOt-0000000GBZp-2j8u
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 10:36:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B2Pm4015094
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 10:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/h1nzyLwLos+57W9zu2/iGj9UgqL5dXrMfiNd2SNZU=; b=dqRMo+cSRMsreCgu
	/jQKDuUdCRXiqAJDUQ2UirIhyyJWVFsvA8LlMNa0KNYMgtJLXUhwfWytP1BaGd47
	M5DCeDHRqxfY4DfqHtDCYoVs8G2VZqnQrnKPufVksU+LUk56E+UEu5w0i2pHWkX5
	uCf8jHzk8sQzqLnRVSL7E9DIMWZZHwJzQgP62+ucqxqvAAlx1G6YNWjFmZnqpwGQ
	kH4nioi3AmWiJZiS6g6zR9Zi2Bo+5VtnQ8go/0y4XQ3OLCT5cgjYRPWF5LlODaGc
	GcS+dPi1ZgNGVlykOAXqj39gd9Grf0G6H0CaCILsSF4IJv3jM3jz8h+PMH3opAfj
	H5LW+w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pktk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 10:36:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so6732979c88.1
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 02:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615785; x=1794220585; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/h1nzyLwLos+57W9zu2/iGj9UgqL5dXrMfiNd2SNZU=;
        b=SHN0CqcteG89jdNrEIV0MBIyi5OLrxpiDFB7l0hcOQrbvNpTiv8/1XHejmZQqVbTmW
         +h0CoVwbkTZe7YolkYJQAhTpWK6zCHlpPztKYzUAU4KS+rqs8mdem3J3WRhErZhYuoCG
         f9mdmDy/JF673Alit79yXY/yopVwsySPHL1yT/AvvDoi/QsxeHDi84yIrFsNbtHZkPPd
         znjFpTgktMDQ8JPYC3ebNukW4pOsO25ZczkMv8hN+Hrq9xrzIg5wpaWmGiv2Q07+Dnj5
         QFrINuhHA0JQaFQN6e7tX/6q9PDRAh5izWi5Mf3LK404aWlt/CzU6DqQKd24hI3Nsgz9
         3RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615785; x=1794220585;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/h1nzyLwLos+57W9zu2/iGj9UgqL5dXrMfiNd2SNZU=;
        b=STcgZoVniXLsVzHTyf97dftlJTWNspR+GRfvCfwY/SRpZTBR5m6k8orMzQExjHsila
         mRgudcvexi4I3HRyxBkeOVOU2PtdMexrQAstiV/RUXdCLlzOvchVpECXOT3Cyc1MiBI/
         zViY3zTLYpT13Jz/0X4qodvoP3Mg/SXSivHJsEkTnbxwRAbFgWIeVoIiyXvQVatELPGP
         Yye+RlLq/thp5yQv6fiTDhDILF9qzWbUeHeXPLxjfyNZ6uzL6OnsTER4p/y40KJ9+MxA
         23TvS+K29XzpQ70yoPvITaH3Xp/xCJHkkn/kMauBQBULTJhg5a5aFSZk7Dbax3wKy+Pn
         mZ0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmE+W5hpnbt/WsB+ZGVVzk22fXoD5tLZP+F9uKp+0zYjieb6xmVg0uCkdmJ2bYQA9Vrex1Pes=@lists.infradead.org
X-Gm-Message-State: AFq9FYK8xshBZKQ1MjZ/IGDsk/EMc8v2KQ31PY1LozxUE+fzLW+MVNid
	XTKTztWy7yo1+WQ47E2LyPgISAX8y5fqNYKbe/mmQVrYkUjYJqDemY8aerjhuTVG/96/iGoOb40
	oiIYNm0bts8Ur9AAT6lUHcfwMJcwLAsT/MXRWzHE3l8TV3ZfEJHJpgOPCnW4LQ0tJ
X-Gm-Gg: AYBFou08vgNKrhiRZh+6CYNeNT0OukQA9mF0a2VhwV3KHw+thllYY+UkWA35OpaqzP+
	Ys8iVN8yItxlZPlBUZffquqM6k21XnSq0E2qgY411bDR/MAAhqq+mH7oCf9gg7fuABGN+QKyg0N
	Cc+uC7AK0rMw38mTOzmBVW42ogdT4pT18934ATiN3IKmIvcc7wGbpkncw6C9h/XMIbCLlWjScIS
	zVU3koeE0ZqrIfvcoMy9Ja9SYJC2sfOdvjiLwdKKW2zFx3R5nJ+q7/W8/d3O4DMANCq7AmLTWoT
	QNoHxFk5NvQw6nGpbe431Cy4mf09ZUzKQnI/dvoTqWsW0Rm50txudqDLiNgUmhnAcT1fBXueqPc
	7n6CEK75aLTAWSCxioD4DBUbtV7FQH9Z7dsF0m9zYyTWAbdVZZnZklzigXcnvH4c4MupWpRgPbe
	veuGzpoSfbUE1o
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr14728394c88.38.1793615784516;
        Mon, 02 Nov 2026 02:36:24 -0800 (PST)
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr14728355c88.38.1793615783725;
        Mon, 02 Nov 2026 02:36:23 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm38136990c88.16.2026.11.02.02.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:36:23 -0800 (PST)
Message-ID: <98f13907-fe0a-4a8c-8ac9-3be40edcaff5@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:06:18 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: allocate the AFC memory region
 requested by firmware
To: Goran Sustek <gsustek@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261030220824.915760-1-gsustek@gmail.com>
 <20261030220824.915760-2-gsustek@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030220824.915760-2-gsustek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cAOfb2mGDCj5Sqy23YsebObZf-wUHMbg
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae867a9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=dEvXkhbO6Lc7JD6ITUUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: cAOfb2mGDCj5Sqy23YsebObZf-wUHMbg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX66WVd8jl8S6B
 nbbl1x/Wu4cFzjC81qISSBby3eMcnb9YKRD7HEPyfYV07vdwgW+VRQv/RxyRZMnJZnhITVYTYqn
 Ux1K39wFp81b7QBymsW7z9eEUSz9ttQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX741WxMGJR4zD
 QdBBRZYbFCNCZSgisJoRtahkAxMxAI0+RRZ20Nmad/ifOtK7ektKNLIZos39kX9z6J5hdEg7S3M
 HL3mKV06wJ2O9mqIglgdxW1k9qC9O9kOpkTs6yFDbJvvjbRhVEbouK0pCSw5wy1qSur3Qe56/Tr
 uVnVvSrNAW4tL5IrQthWZcN22ozumyPrfqGnaTyBxS1nvmLSa055EWj0a9kwT4tRivlzjWFl7WK
 VS7VLE1pCJx2KImaItg1GKbrfhbwK/pyU6gbaMIZI92/wi/uDOFzXoT5tDqRI63544wmcppXMnW
 UnwmG/DLf5u5sUnfQuwoftvxq9QITpTJWc3DDRO4bKXgYqQ65wm/Fbvr5qQBkcGU1hlH8iUnrix
 jLn8BXv8ermHm9uPNmROZPiwPxP6pkJ34mWh0J8icVqoMQaaFaA1GlgNmAN9JcRj5Mw/+TKttZA
 FFk2qnxHDXhQgyZz7EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_023627_820416_EBF10489 
X-CRM114-Status: GOOD (  31.08  )
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

On 10/31/2026 3:38 AM, Goran Sustek wrote:
> QCN9274 firmware WLAN.WBE.1.6-01243 requests a target memory segment of
> type 0xa at every boot. The driver does not know this type, so it logs
> 
>    ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported
> 
> and answers the request with a NULL address but the requested size.
> 
> Type 0xa is the AFC region: QMI_WLFW_AFC_MEM_V01 = 10 in Qualcomm's
> wlan_firmware_service_v01.h. The firmware asks for 8 KiB, one 4 KiB
> slot per radio, where the host places the answer of an Automated
> Frequency Coordination server for 6 GHz Standard Power operation.
> 
> The firmware's handler of the memory response records the reported
> address and marks the region as provided whenever the size is
> non-zero; it does not check for a zero address. With the current

In that case, shouldn't chunk->size be cleared when no memory is 
allocated, or should the response only contain the chunks that were 
actually allocated and assigned by host ? (see 
ath12k_qmi_assign_target_mem_chunk() which updates ab->qmi.mem_seg_count)

Allocating AFC_REGION_TYPE while AFC itself is not supported by the host 
looks wrong to me.

> NULL answer the firmware therefore holds a region at bus address 0.
> This driver never enables AFC and no misbehaviour has been observed,
> but the firmware state is wrong.
> 
> Name the type and allocate it like the other host regions, bounded to
> two 4 KiB slots. This removes the warning and gives the firmware a
> valid region. An oversized request keeps today's behaviour with a
> warning.
> 
> Tested as part of the series.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Goran Sustek <gsustek@gmail.com>
> ---
>   drivers/net/wireless/ath/ath12k/qmi.c |   17 +++++++++++++++++
>   drivers/net/wireless/ath/ath12k/qmi.h |    3 +++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 280e50a1f31d..0679e5d2d4fc 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -2707,6 +2707,23 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
>   			if (ret)
>   				goto err;
>   			break;
> +		case AFC_REGION_TYPE:
> +			/* Firmware requests the AFC region at every boot, even
> +			 * when the 6 GHz radio does not use Standard Power. It
> +			 * treats a non-zero size as a provided region, so hand
> +			 * it real memory instead of a NULL address.
> +			 */
> +			if (chunk->size > ATH12K_QMI_AFC_MEM_SIZE) {
> +				ath12k_warn(ab, "AFC memory request of %u B exceeds %u B, not allocated\n",
> +					    chunk->size, ATH12K_QMI_AFC_MEM_SIZE);
> +				chunk->paddr = 0;
> +				chunk->v.addr = NULL;
> +				break;
> +			}
> +			ret = ath12k_qmi_alloc_chunk(ab, chunk);
> +			if (ret)
> +				goto err;
> +			break;
>   		case MLO_GLOBAL_MEM_REGION_TYPE:
>   			mlo_size += chunk->size;
>   			if (ag->mlo_mem.mlo_mem_size &&
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
> index 6da10f3cb597..c438ef6c7680 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.h
> +++ b/drivers/net/wireless/ath/ath12k/qmi.h
> @@ -26,6 +26,8 @@
>   #define ATH12K_QMI_BDF_EXT_STR_LENGTH		0x20
>   #define ATH12K_QMI_WLFW_MAX_DEV_MEM_NUM_V01 4
>   #define ATH12K_QMI_DEVMEM_CMEM_INDEX	0
> +/* AFC region: one 4 KiB slot per radio, at most two radios */
> +#define ATH12K_QMI_AFC_MEM_SIZE		(2 * 0x1000)
>   
>   #define QMI_WLFW_REQUEST_MEM_IND_V01		0x0035
>   #define QMI_WLFW_FW_MEM_READY_IND_V01		0x0037
> @@ -173,6 +175,7 @@ enum ath12k_qmi_target_mem {
>   	CALDB_MEM_REGION_TYPE = 0x4,
>   	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
>   	PAGEABLE_MEM_REGION_TYPE = 0x9,
> +	AFC_REGION_TYPE = 0xa,
>   	LPASS_SHARED_V01_REGION_TYPE = 0xb,
>   };
>   
> --
> 2.47.0
> 


-- 
Ramesh

