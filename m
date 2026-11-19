Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A0606A332
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 03:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JsJYjqmh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0JhvnA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6TSuSqm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NsHZlyBYnBWBlkUBeo+t8OpVdqdxoeIOuPko84vvh+I=; b=JsJYjqmh23W4sS
	FnjalF11Q3FrEEF1ZFKkYK+TqB0En1n/ZCdISRk9eWZ2SOK8/wrTPV0amMhYnltDrTfm8Z22vvidi
	UtWWin9XjQ33OBBl9lH6nQWFkyBCHdchvp+XAm3qBLyCJ5PsuptQVQFBo/MrsIFQt9bgYaBnZkVrb
	MyNU7K7noihDfZjP/wiY3auJaHp6hwVvhmUHqiPsHq3QyVWJGTXMl2JWgAdqzHha+ngtjj+Bt0xRg
	ULPTpAOWhKnCgB4Qxg4xiVtfHGOMxS1Ugbu6zi8kPyuSwH0gEyNXfkKdAt57iNBHboV6RlL0Mb34M
	HrdzBEeNDD7h2+yq899w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsbe-0000000AkkW-13M4;
	Thu, 19 Nov 2026 03:14:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsbb-0000000Akjx-2jMc
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 03:14:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1Awnv935629
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 03:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsHZlyBYnBWBlkUBeo+t8OpVdqdxoeIOuPko84vvh+I=; b=o0JhvnA+AaHuThQw
	htGjLCwfd2lEeJXCmJYuJAXKMQXs49afDokU+/6Tfx4oMRFpXTtliA4pEtiWBRMS
	skA1kHS8LnegiSVm0KRNSB9ofum3kLXYy8lOOGrixe33+zELNpctp6pVIEam6XZ0
	Z70JJXlWN00OQKTIRMifEKsmOmMSMBcSlPxiuaxnrZ7MlnrhT/2A3eLbp05tiu+m
	seYyHF3sS/olVQquWkuvD9xzqALxXODtThWzDlju07ScNPClcSN4ckRtjdDadavx
	l+7D6Keha3WGJSs3QLu+LpPa4JjwcH7MW2zA44Y4Ac6/lSYZrPUxnqMMqBfrOsvH
	aaz+kQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcrm1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 03:14:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so1406170a91.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795058073; x=1795662873; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsHZlyBYnBWBlkUBeo+t8OpVdqdxoeIOuPko84vvh+I=;
        b=Z6TSuSqm8A0/UcZmYLHYPFn632hvbYC8Vmbsr3QXNU1hKd8FKWeDtTFn/s9XbBZYBi
         nBTZtIs2+dVpO/zjL8AdeRaochCdQVm3m9vFdp/dUUN5k6RvcQcG4WmZAa7kVlOa0rE/
         WxcLXeRgw6IXKJf9WPvOBl8M/DIRwTX2mSHBSFat7sRzQ+j/3ytXxAn5nocLsxlKxlW5
         8d76gUChG+2/rb61l5kdX32SGRMPy4MhUVzGAnajQ7X0ZAs8upfDnye0pAHXj5uhtOut
         wVYWcG4PvSg6Ig/SdODmcvZMypdH0c6HR1dgW7BTKs7Zuy4JMT9SkkI2gZPI8j2csVOv
         +N8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058073; x=1795662873;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsHZlyBYnBWBlkUBeo+t8OpVdqdxoeIOuPko84vvh+I=;
        b=rKpFe1SEXGSNFWJLYJNmlHpsYZO4J+UdIvgJlA3SWCdP9cH3UzRl969DPmherOGBUc
         G1zS4tDRy6b0SRPOJ/YxQT+4WcW7lBkoj2KCUY6O5FarqKEszYR//beeIwzaYQk+oVvf
         zJ8BptcSCSMLXNerhFA7Wi/qaLfG9+oNAc5LqrJwYsdnJUhSDJm7Xa7easFItm2zL/nL
         SnWgIVRU1TdoWSNvhzgTKp/ytmRWPcjzw7b67eu7Qi0WqwiEVi21yCItCODonxtczZ14
         Tnf1Y1RLpS0ejwHjQrWLiz3OJ4IvikeptCTr5sf5YUwz3sMrThalV+RndnkSKZDeBkIt
         Ghhg==
X-Forwarded-Encrypted: i=1; AL+hErG+ZgFGKadIT1T5+4jVasET+8JguTKNm68CpvHwUsh4LXN2Y4GDffRetyMP7SLRkSoa56/uqfU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+N0XNRcKTkClGlMpnBbRjcq0EQNX/9a3itzk3S+3z57oPI1OLa
	Sy0Dqqy6juEEv8QCXn+UxlWYAq9tpHoWbY9ptrJNVgbgYylXYn/7BQXeWt9DnWMpVg/NIJu9o6H
	yjk3zf8kLZrKBpAYf9/kZzb92QxJhBtsycic7RtXblAUaoRADovhAUwE7J/a11SLo
X-Gm-Gg: AZFdTZfRlElAH7u6Ix+l3NURtvAZHQmH7l58Wdzc2cj4TFyhldAwoMNL37PtvwSh6Ye
	F8SLwL5cIfrTNqQpdZtt5XaanLMb7LXtN9ujxKP8F66s84tFQNjpE97bW5K0pGLh71JTHsve5Dc
	z7zJS4fCIdoxplqie4EPx55LDiaxeZ2lncB6xTJZQG2kE6BI95FOaOFJFa/ZtKQXkU357hYr0Jk
	p3gxYnQnouGlHaYIAKsp4zOa9K1szQjOsay0jnDp1PFDzoWprpKzR59dSelcfdbPdNAb0GZKPIZ
	nwFKnUMt3Q5DTLQdOExrwJbnQsynI4XF/hIFIw+H7dmmK1x2lXVyi9aWOqlBQiSkcpjC5I7iSLr
	pC+/tp2oDQ1Ut/2FUJ2nsoULD2/U7/YQ8vaVGAOpbFX4jyPbvMgp2iAp5EgklIxJGVRbypQdpwd
	hq4nVU4Sdn791AaNYaOawo/RQBtJ5AxoRj0YJl9DSFWx3O
X-Received: by 2002:a17:90b:5643:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b3d07b92d0mr4313059a91.30.1795058073154;
        Wed, 18 Nov 2026 19:14:33 -0800 (PST)
X-Received: by 2002:a17:90b:5643:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b3d07b92d0mr4313035a91.30.1795058072513;
        Wed, 18 Nov 2026 19:14:32 -0800 (PST)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b401f73a4bsm279829a91.0.2026.11.18.19.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:14:32 -0800 (PST)
Message-ID: <616c30c0-8152-46a1-899b-e41b28b195cd@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:14:28 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath12k: parse nested DBS/SBS
 capability TLVs
To: Jonathan Wolf <wolf@pi0.com>, ath12k@lists.infradead.org
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118204307.3154270-1-wolf@pi0.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118204307.3154270-1-wolf@pi0.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: amENKc5OeY-J-DZT-vOjfU6Hjs5QkaLm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfXz0XpXC7sHuT/
 C9aGS3iN3qh31l+qe5rtC283wAinbEd8sT93uNfE2nXVADamOlTKYGRkbmAsgBFiVvmJkRY4j0B
 K9GQFw8JRX88pz9FNWlx8FjOfWqpbBk=
X-Proofpoint-GUID: amENKc5OeY-J-DZT-vOjfU6Hjs5QkaLm
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afe699a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=apydtGMFAAAA:8 a=trgHqd-T1HFGbJ4hnEQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=_GdCGhGMWlTvChih0T78:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfX95uM+/pMwcK1
 DB5OxVDQOy56VjpdIAmQFZ4C+neAFehAlix7B28qaZSaKa8u0NDHG982KE1MHRrT4ZM7JDr/gsK
 GnTm+XAnpu8wzPDEW4lNo+coghXe9FA259rV7aGHmzDWA99Bn1xjEXXdqGGSfPpZkztSaHiQYs6
 P7tDGmNqU99/TVmJgMdlpegUt45ZOKy2ABiwDMjxvrccyjrcaNmW+W1EOs6tfMkDD61xp0mPCvd
 ityKZSiU1rHk27FaPxp/DcTu1yCmmIvn+yycSmgILDJC6X8D8CQSN8Hw/anA+CGQSnZSKjQn6Yg
 M3u2XTsYUe0hbdMGVESkqjnCrU7i1XXtIqROWPCjY8S4TNSMQSLSWipk3uFodiE7YHz63R7xImB
 +JFeRWCssbJNksyTPXGTE93pFQpnrgjBfNELTp21mluq6L5q+unEx17La0gZZnT6f4q+S1M4zgX
 49ppmLmebnFFhHwJVrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_191435_836359_26B23E6C 
X-CRM114-Status: GOOD (  29.60  )
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



On 11/19/2026 4:43 AM, Jonathan Wolf wrote:
> The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
> in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
> therefore points to an inner TLV header, not directly to struct
> ath12k_wmi_dbs_or_sbs_cap_params.
> 
> Casting the array pointer to that structure reads hw_mode_id as
> sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
> 5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
> cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
> a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
> partner-link deactivation.
> 
> Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and reject
> unexpected tags and payloads shorter than the capability structure.
> Use the first record, matching the vendor host extractor, and leave

hmm, I don't think firmware can send more than one records. The firmware api clearly
documents there is only one TLV embedded:

typedef struct {
    ...
    /* Followed by next TLVs:
     *     WMI_DMA_RING_CAPABILITIES          dma_ring_caps[];
     *     wmi_spectral_bin_scaling_params    wmi_bin_scaling_params[];
     *     WMI_MAC_PHY_CAPABILITIES_EXT       mac_phy_caps[];
     ...
     *     wmi_dbs_or_sbs_cap_ext             dbs_or_sbs_cap_ext; <== this one
     ...
} wmi_service_ready_ext2_event_fixed_param;


> the cutoff at zero when the array is empty. Only store the cutoff
> after the complete array has been validated. This leaves the existing
> hardware-mode and link-selection policy unchanged.
> 
> Tested on a Steam Frame with WCN7850 hw2.0 using Valve's matching 7.2
> kernel source. MLO advertisement and radio-mapping diagnostics were
> enabled separately. The revised parser reported a 5900 MHz cutoff and
> the driver mapped the associated 5260/6295 MHz links to separate MACs.
> An unmodified upstream kernel was not boot-tested.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
> Signed-off-by: Jonathan Wolf <wolf@pi0.com>
> ---
> Changes in v2:
> - Separate Tested-on from the official trailers, as requested.
> - Log DBS/SBS capability parsing failures before returning the error.
> - Move cutoff storage and debug output into a dedicated DBS/SBS parsing
>   helper, following the existing capability-helper pattern. Commit the
>   first record only after the complete nested array validates.
> - Remove the evidence link to the repository that is now private.
> 
> Local validation: 15 SERVICE_READY_EXT2 parser cases pass with ASan and
> UBSan, including malformed later entries preserving the previous cutoff.
> The failure cases also check that a parser warning is emitted. Strict
> checkpatch on the code diff reports no errors, warnings, or checks.
> 
> v1: https://lore.kernel.org/ath12k/20261118012321.2861920-1-wolf@pi0.com/
> 
>  drivers/net/wireless/ath/ath12k/wmi.c | 47 +++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
>  2 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 75b259990..0cf6e1eab 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -5781,11 +5781,47 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
>  	return 0;
>  }
>  
> +static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
> +				       u16 len, const void *ptr, void *data)
> +{
> +	const struct ath12k_wmi_dbs_or_sbs_cap_params **first = data;
> +
> +	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
> +		return -EPROTO;
> +
> +	if (!*first)
> +		*first = ptr;
> +
> +	return 0;
> +}
> +
> +static int ath12k_wmi_dbs_sbs_caps(struct ath12k_base *ab, u16 len,
> +				   const void *ptr)
> +{
> +	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
> +	int ret;
> +
> +	ret = ath12k_wmi_tlv_iter(ab, ptr, len,
> +				  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
> +	if (ret) {
> +		ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI TLV: %d\n",
> +			    ret);
> +		return ret;
> +	}
> +
> +	ab->wmi_ab.sbs_lower_band_end_freq =
> +		caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
> +
> +	ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
> +		   ab->wmi_ab.sbs_lower_band_end_freq);
> +
> +	return 0;
> +}
> +

as stated above, maybe we can simply have:

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..f7ac9def9213 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5831,11 +5831,28 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
        return 0;
 }

+static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
+                                      u16 len, const void *ptr, void *data)
+{
+       const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = ptr;
+
+       if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(*caps))
+               return -EPROTO;
+
+       ab->wmi_ab.sbs_lower_band_end_freq =
+                               le32_to_cpu(caps->sbs_lower_band_end_freq);
+
+       ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
+                  ab->wmi_ab.sbs_lower_band_end_freq);
+
+       return 0;
+}
+
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
                                         u16 tag, u16 len,
                                         const void *ptr, void *data)
 {
-       const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
        struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
        struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
        int ret;
@@ -5890,12 +5907,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
                } else if (!parse->htt_msdu_idx_to_qtype_map_done) {
                        parse->htt_msdu_idx_to_qtype_map_done = true;
                } else if (!parse->dbs_or_sbs_cap_ext_done) {
-                       dbs_or_sbs_caps = ptr;
-                       ab->wmi_ab.sbs_lower_band_end_freq =
-                               __le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
-
-                       ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
-                                  ab->wmi_ab.sbs_lower_band_end_freq);
+                       ab->wmi_ab.sbs_lower_band_end_freq = 0;
+                       ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+                                                 ath12k_wmi_tlv_dbs_sbs_caps, NULL);
+                       if (ret) {
+                               ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI
TLV: %d\n", ret);
+                               return ret;
+                       }

                        ret = ath12k_wmi_update_hw_mode_list(ab);
                        if (ret) {

