Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FA3FF5125
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeLN+Cf+q0pIwJp1heaBQRX13+3H6jm6F5Vc6u6zK5I=; b=QG6nONsRfVv3NKoGQqKWFl4I3A
	O4f81MJThCQCewOFLCSmnLyRUBD3ZwvnGNd2EWGezJk9j5kbtsee9pX2qSGJXJMKnM0mmGRV4YQaS
	Tjhq2IXjG2gp90IseGCApILA3Ufmp3dKgV0jtu4jnDX6tQh5ZoiFa8wtWNfEXMp/ZZ3iPk1q1Pc3p
	FnwEYqTOxHsBVhRQQOSWBt6gRTpEzrrfrlhAgU4ALlDbmTJSRHfXjXXznZxrBT3DhJV8GArl4T/Kr
	ex74XzLmrfVH6SoYVIYFFbixISGBj4F9Xn6OF4QHimRCCm4OnO6Bzyxr2OyWL6QbQb0q/rzWrjUtZ
	pUAlsmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Ee-00000006nOA-1Qzz;
	Tue, 07 Apr 2026 16:25:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Eb-00000006nNi-2A5k
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 16:25:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Ctdhx2328170
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 16:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeLN+Cf+q0pIwJp1heaBQRX13+3H6jm6F5Vc6u6zK5I=; b=I5Q6J92DL950P3vE
	2V80jBrdQZzWsElp0M/YjI3XUs+YPHS1A317mDQIldR43zo5dz3Wgr53oO5zvv7c
	aAjlpF9azajXaE3SL/1HKwp+6Fs6FLgTkNZ34e9AVw9UNrNd0Hp6PCLSpg80Nttc
	naCsBczV/fydfwraeI7oJPnqmkFuAkpsFeau/HtiI/ooA6J8kvz/nhmjiR7/ntrI
	NXmONz2iWp7tq27sndFlhBO3MbssRDQB8ZFUudytMgHVbKuA0diFFLQydmsk1XEK
	NhZLYRaesmdfd41aHJII8cNE89JxubtbLE3CfI5s82Cz2yp0fBUwBcsqgI/cLyqF
	O2kdTQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4ukea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 16:25:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so3035709a12.0
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 09:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775579100; x=1776183900; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeLN+Cf+q0pIwJp1heaBQRX13+3H6jm6F5Vc6u6zK5I=;
        b=jc6APjD4yqXOuuyD/OrtwflTTBYKbE0b34b/ysY9pf2WZvNh3RMc90A80u7E90GOD4
         QRO7xvxLK2yzB4XuU/jE9tuzDxDUWGhP2kpVv0KOzMJv6zNge2dTRlsooNinvy7Bpi+E
         76P9dYYCtbjupjELE+lsld3Y8H+eZ2mlBG00+qPQqG3IIhp2kmX8pPO34tl5ts4dO1ih
         aUSmGhD9znnd9LycV6lgwpud2aJPVMPKo+DC04Xj+IEvb3uIFItVWSkVD0tvEZc0Uf33
         waLcy5dtUAivNIvgQTWRr3UjiQ0aUqjZF7UO2mAEhNW7oh/gB6trNw3uhDijgVyBYhhW
         aNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775579100; x=1776183900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeLN+Cf+q0pIwJp1heaBQRX13+3H6jm6F5Vc6u6zK5I=;
        b=LW2mUSkaN/wFTFeLJixmcouEKKsWzcMUhB6IxhggtexLWaVBsw9Bz9Mj7u4kXS8Qfq
         FALrEH5ecmgz1BGFZW1pyRrmdC6ICZjUpb+E5sduafLFkWUd3DKHfZf6yNrA56YHHEfb
         sFzf6YJcUXRiAFGj5WlZBHh1ATGQjDb39lsPhcuaXspkojtp7YfcXiu/BbRbkvdmepLZ
         XR2CgIK8PYpjHjozZzkzf/+d4mXDrxnjs++inpfOjURrmsN4X3VgujJ1ahF6A5z1Jl/r
         2tHhyGf3KVeyjWubKpXlsVjn5JLlvYVJlLfg/cKEir1zCcbwWK1AZGWQ0fMCc16HaAyp
         zPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg1/xM9iFEOyuU+Fde+qrLkI9tc1u8LtBa+sDnoEU8nS2Shn9YK1/4NOQbv7rCbeCEOcUEhlo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxERRYyx0bs5+Zq8t6o9pQDItGbKvuelerkOmztc6ObfKjoWxxu
	SGlLzmX6ZOTe3DT9id5kqvgv0S/5xmJ1oj5JbSkiSlgAyMHhNct8BiaOCo1ogy8FxMXsu037D5s
	LJTrCOLnA/B1rUaVXRAQV9JW1n0BgR4vqa9BCxpzcBweSIBvYDSLmh4FfyqnS8x16
X-Gm-Gg: AeBDieuGC+4CXdkDHmaVNP4u86lXSXl0va97OV5SoTF3qQiUyeZlaku/74uAMjoEFlx
	bBEYynoUDHRvNEMhvtu5Eg60gT6fyKCIVMHbrfS3dMOHPyaKUR0x386zr4DKVknRv4as65pl5UU
	GI0NKLRSFCrACEDaYJJbafsVtu0hnTSOmRNFY56M6OqRQqc/LM7iCDnH273lRnztiAIhAqthWvt
	QUAcDl7+y2a8JCiewAUPo+fmJbVEMJW63DtRhqh1BtKk+1BuBFJ3Udh6EYyifNFvJf/XhvWxaDE
	ZQTOfmUknBvvIYfkyj8JGTs6BDRn0Mkq5/Y6oh3dKpkX9CI409ownG499DNPp4/6tiMX+3JQM7y
	tHLkK9ooQwcJ6fzo6VNiYSHVOIYC/IgWsaUO6H2trPZrx67pdcdRFSPLL3K82W0s3jA==
X-Received: by 2002:a05:6a00:1d9e:b0:82c:ac06:3004 with SMTP id d2e1a72fcca58-82d0da2ae27mr16676990b3a.8.1775579100212;
        Tue, 07 Apr 2026 09:25:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d9e:b0:82c:ac06:3004 with SMTP id d2e1a72fcca58-82d0da2ae27mr16676956b3a.8.1775579099647;
        Tue, 07 Apr 2026 09:24:59 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d1d6b221csm12125067b3a.56.2026.04.07.09.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:24:59 -0700 (PDT)
Message-ID: <53817665-ef49-445f-b549-41bdc7a847cc@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 21:54:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 6/6] wifi: ath12k: Enable IPQ5424 WiFi device
 support
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
 <20260407-ath12k-ipq5424-v5-6-8e96aa660ec4@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-6-8e96aa660ec4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NyBTYWx0ZWRfX6t3hUwmB74+1
 0iLKMpuyx+1lAPQuGoihXXDnQaC40FkywPFN+aozIYTnYWsasjbgQGQk5xnXYVcP4KHxPpbTYda
 Ymlq8BEqtmC6LS84lDXpNdHTtlyMTC7hgyVUT8H0N5LZsPL+WjdKxj5y4TYqayvmvkjI9VH9izC
 lBX4Zn5qKzZsIeiqAyDpDSzV7Pi8dsnaX+QnnvYrQorxNTNxC8G02YP5X6ZvG/duSMhYzLDy6ha
 Y4ReYM5q11Z9Pfd3/zr0/ggnOc5vkW8V5wovYyPP8Z1NPtHPtf+0ad0qT+f3StbJvzImW3ke6dA
 Qld0Gw3haxLy4n7CJQrjqzXo0OUZApkKf3LXBRXPrveQrecb2TOkB+Vj9GNsmQl2cXlv2J/SGjL
 UsMNFwWPXg2aH7WLRY+ukqgqnWq2mespQPTXlwDpI8kGj78HJ3OK+rJhD0/7cPTfHC/MyVSjpLu
 J01GlgS4PDDLmiTD2lg==
X-Proofpoint-ORIG-GUID: YL2fK9We45jR5MMb0if3kFl9DgChw0-4
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d52fdd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=lXj5p0v04NcqoRae9OgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YL2fK9We45jR5MMb0if3kFl9DgChw0-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092501_569152_B50EA155 
X-CRM114-Status: GOOD (  24.93  )
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



On 4/7/2026 10:56 AM, Raj Kumar Bhagat wrote:
> From: Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
> 
> Currently, ath12k AHB (in IPQ5332) uses SCM calls to authenticate the
> firmware image to bring up userpd. From IPQ5424 onwards, Q6 firmware can
> directly communicate with the Trusted Management Engine - Lite (TME-L),
> eliminating the need for SCM calls for userpd bring-up.
> 
> Hence, to enable IPQ5424 device support, use qcom_mdt_load_no_init() and
> skip the SCM call as Q6 will directly authenticate the userpd firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
> Co-developed-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/ahb.c       | 36 ++++++++++++++++++-----------
>   drivers/net/wireless/ath/ath12k/ahb.h       |  1 +
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  8 +++++++
>   3 files changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> index 9a4d34e49104..2dcf0a52e4c1 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> @@ -382,8 +382,12 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
>   		ATH12K_AHB_UPD_SWID;
>   
>   	/* Load FW image to a reserved memory location */
> -	ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region, mem_phys, mem_size,
> -			    &mem_phys);
> +	if (ab_ahb->scm_auth_enabled)
> +		ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region,
> +				    mem_phys, mem_size, &mem_phys);
> +	else
> +		ret = qcom_mdt_load_no_init(dev, fw, fw_name, mem_region,
> +					    mem_phys, mem_size, &mem_phys);
>   	if (ret) {
>   		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
>   		goto err_fw;
> @@ -414,11 +418,13 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
>   		goto err_fw2;
>   	}
>   
> -	/* Authenticate FW image using peripheral ID */
> -	ret = qcom_scm_pas_auth_and_reset(pasid);
> -	if (ret) {
> -		ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
> -		goto err_fw2;
> +	if (ab_ahb->scm_auth_enabled) {
> +		/* Authenticate FW image using peripheral ID */
> +		ret = qcom_scm_pas_auth_and_reset(pasid);
> +		if (ret) {
> +			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
> +			goto err_fw2;
> +		}
>   	}
>   
>   	/* Instruct Q6 to spawn userPD thread */
> @@ -475,13 +481,15 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>   
>   	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit), 0);
>   
> -	pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
> -		ATH12K_AHB_UPD_SWID;
> -	/* Release the firmware */
> -	ret = qcom_scm_pas_shutdown(pasid);
> -	if (ret)
> -		ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
> -			   ab_ahb->userpd_id, ret);
> +	if (ab_ahb->scm_auth_enabled) {
> +		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
> +			 ATH12K_AHB_UPD_SWID;
> +		/* Release the firmware */
> +		ret = qcom_scm_pas_shutdown(pasid);
> +		if (ret)
> +			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> +				   ab_ahb->userpd_id);
> +	}
>   }
>   
>   static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
> diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
> index be9e31b3682d..0fa15daaa3e6 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.h
> +++ b/drivers/net/wireless/ath/ath12k/ahb.h
> @@ -68,6 +68,7 @@ struct ath12k_ahb {
>   	int userpd_irq_num[ATH12K_USERPD_MAX_IRQ];
>   	const struct ath12k_ahb_ops *ahb_ops;
>   	const struct ath12k_ahb_device_family_ops *device_family_ops;
> +	bool scm_auth_enabled;
>   };
>   
>   struct ath12k_ahb_driver {
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
> index a6c5f7689edd..6a8b8b2a56f9 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
> @@ -19,6 +19,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
>   	{ .compatible = "qcom,ipq5332-wifi",
>   	  .data = (void *)ATH12K_HW_IPQ5332_HW10,
>   	},
> +	{ .compatible = "qcom,ipq5424-wifi",
> +	  .data = (void *)ATH12K_HW_IPQ5424_HW10,
> +	},
>   	{ }
>   };
>   
> @@ -38,6 +41,11 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
>   	switch (hw_rev) {
>   	case ATH12K_HW_IPQ5332_HW10:
>   		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
> +		ab_ahb->scm_auth_enabled = true;
> +		break;
> +	case ATH12K_HW_IPQ5424_HW10:
> +		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
> +		ab_ahb->scm_auth_enabled = false;
>   		break;
>   	default:
>   		return -EOPNOTSUPP;
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


