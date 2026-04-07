Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4B3FF511B
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0f18Oq9boIMyQuBhUbaPDsT2QYQ1+En6l/jUXzn0FQ=; b=F1OLit+/2KvNRzupKu7h+c0Loh
	jfFtHhPZWciAodSux94afeBp1ylqfSPA5fyHy8Thk2NMLrVMQQUfDUm6tREu8m6pJpzy5FwP4oMcE
	D1TAs2lWj3awXAZ5kV3Ogw/63scM/cQ02huZUK09Ad1QYbumHChdqjJVaf81K55hwgeDWui1IPJ58
	5olpVJo5v5XcG96sY+NXOGJ1JQiClEFcAz3oH4oU2hrn7TRauiuL31aPTDxNHMkqiZWTJ9hwoXofa
	e9txO1BWSIsdf1FQoNL8+7yAyhuuF/zStFwJMTAoedEX/qRLeoqcJJc3zwOI7cZJ7PijQ+/B4UZjj
	xCj6MY5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9A0-00000006moN-14I6;
	Tue, 07 Apr 2026 16:20:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA99x-00000006mns-0f84
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 16:20:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CxMDR3815226
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 16:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a0f18Oq9boIMyQuBhUbaPDsT2QYQ1+En6l/jUXzn0FQ=; b=evivHoFT6YT9TVN3
	lTe/Swb3WC14V3UYGg66kwDepgWHvO3tVlIY3Htc5IwzR6n54DHWx4WQBFejwnl/
	WoWc0oiSHb73jfF0lHtwp4l66gj9j9DEyz9YCn20srpm5OjhfwhwFGC8V57vhhrF
	a1ackd15Rlon4vz3QGh8bQRz3Kt7iIcPIqhXjJHtf2p4tiWs2Da2zD23f+5wqJ3r
	vrpOgTP+ysygkOD8812necAVGhDZ/6YjzYYk7ywZDv0Bas5wFucUkw3LFV3xFYM/
	XFYOP6E/9zm5TnPNiV0g+m9EnDtJ3LrqMOXTAY34D5D54AK+AeNIH0f8LO06CzU2
	QMvmJA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4uksx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 16:20:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630753cc38so9977495a12.1
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578811; x=1776183611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0f18Oq9boIMyQuBhUbaPDsT2QYQ1+En6l/jUXzn0FQ=;
        b=eSe2vDUOQJmpw0U6si1qsUrzdTC6h/MHeXllkRMIvF6NnE+1dHTk3Q7XiM7+M0GrT3
         5tZmA8wyVHqHT/6fEBc4MYqgDcray/OHWLdeBJwcB0HwhQgRUJWXLF3D0aNdkW3FgHg5
         VAdCPLBv0NiWR0ya1l3hI6ncXiLK7EldXs3Pi0Ks/g1d7nijo74eTBNSsmUWIQbocNS4
         Q4Wkcd+rhqiALnDHqf3yd65OU+ZZU9Stz1z8UWkG7us2SWzH2bJB2gx3hjURFpHTvv29
         H77KIssUufaRhupUMnffEeNymOWmgdWDdaKlI55TEldCFo1C5plCY+shINIG233DE8vD
         veIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578811; x=1776183611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0f18Oq9boIMyQuBhUbaPDsT2QYQ1+En6l/jUXzn0FQ=;
        b=RCRpKz+uhPLyfkppjnssNTVZbbAlhvTmEB3AW3pXVJKtwxSCCiZ0IJGphn1+mItp3B
         L5gPm5CtQxElHpDj9xNaTaa7b6hVZQHqLGhVNH3RfOdm3yjXyfSFx6MWTPcywPjGcueL
         K9zGWM3SWASFn1PcceOYL7L/C+FtHBlyT9Uqol2zNDDwHc6+rp0dqXEDEoscFIHg/FZs
         lXkw5b0DCsj+C470IiOg0lJuiAAoW1tuyhV5aYgFoiV+kwcd5VOVpZGWcYLi+nrbTTMr
         vUaTp7kryZj3gvFhAEaoUvb6wHENyzSi+lo8Z9nM/mHo/8VJVrZpHhUNwwcBV8vZXAA5
         i0xw==
X-Forwarded-Encrypted: i=1; AJvYcCUEdeV9b5OAyZe6McWK5iP8naJZTaAyjDTwdpg2H/zWo/IHQl7MBnoDieRe2Jw9+RMZ0lZY+1w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVNEzPAfa1g7TNLxZOZxJ5W9w5RIhod3wncwG/it4JD7RW1KiQ
	xbzegjEZ27M2IdjodZSRnfz6i84J72spn9pncb4FBtfHnEvIDzEpf5VVLSI5DSEamYT06y7IKuX
	J+yXNJ2pphTIYxpiPxeJ3/2qF0HkcW+sgcxm50hXSj1jWUNaE0nkw4PXA/q0PsUmk
X-Gm-Gg: AeBDieusAeSspn+HRZysmQ3Cvg/ty7BNGB8lvV/bdFCcliIh8iIUQSUCLnhLT8Fu2HB
	K5eaycOYZqsDBVPean57gJJvQy6ewlDvH8tS/EPEHsJEaepaMv4eorRP6PTbFfxBJwT+6IjMyw5
	5rg0TFG91JTDXYFLSA/SqZwGJss4RMhU7xsTbfCFaRhOrkE2Y7Rw91dU6UKVEL+PqkVLX8sabVL
	UNSNJabRT/23a2q7NZZrpgTXXP/wKtBsSWDn8iBnWP2hclEnIgZgV8IrRGZnmN825+Tfg8sHdec
	CXIhg2W8J7IOT4bsORP/BHRTlGGsHBTcaNmKSyQEeWfVaR7RkRCFkZ+LPKwq0qC/f8ZT7RLfkOl
	GXAM0cofx+8066vBzj661B4jDiRYtyggkmAeJQwgi1iOryNedACqUa1ybP3A/fWDnKg==
X-Received: by 2002:a05:6a20:430a:b0:395:ccae:d494 with SMTP id adf61e73a8af0-39f2ee10e34mr19028494637.20.1775578810749;
        Tue, 07 Apr 2026 09:20:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:430a:b0:395:ccae:d494 with SMTP id adf61e73a8af0-39f2ee10e34mr19028445637.20.1775578810093;
        Tue, 07 Apr 2026 09:20:10 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm16286043a12.31.2026.04.07.09.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 09:20:08 -0700 (PDT)
Message-ID: <3496f9c2-fe73-4732-9ffb-513ea51928df@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 21:50:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 2/6] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
 <20260407-ath12k-ipq5424-v5-2-8e96aa660ec4@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-2-8e96aa660ec4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d52ebc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RSpPW0pkKGs0CHY-rOEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wkPKBHpRZAH-qsJLdaJbgJ-r8AlRAKwc
X-Proofpoint-ORIG-GUID: wkPKBHpRZAH-qsJLdaJbgJ-r8AlRAKwc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NiBTYWx0ZWRfX7zTp1xxFGfmt
 xOR8LQUgq2JlOUYOpir95prA/R4JMHwXFk2O7K7NAsZZsnkT4RigjUW1SdOuS9VpJ7qwOsC5lOv
 YYU+ti1CL+kNHGgGJwSHi9eW8JslIbQufq1aDmZv+Ib/asZNaa30uhYBR9l2ZOsU2HIBeAzj6+z
 ibHRxIHLfOtg/zbAVhDDZlN2MD/ATUcqmE+1cbRgjFyXs6LbqmGHb+UsKlcLqCBkoefpgwcIyFr
 ALkvYXZbr0HwUoMCNoAsxC7IdA0TOz+HsF4wAQazsLlwiItzJ3Km75C5XKvGgPv03irAQsAq6/d
 r0o3k7Gtyo8uKnQ0mz7kip72/hBqxqTIRJVAlU15P+j+Q/jfPhY5RqujQM9Hs0RULfO8fXvbhmz
 itp3IJFuOVGCPDcrnTPt0v1lZoL5f/xkb0pX50f8EXobnOlOSHd9R/5AH/mU8hUMwBxv2ckEvPr
 498hFFR28pK6wc+EliA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092013_346117_B9C6CF9D 
X-CRM114-Status: GOOD (  18.34  )
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
> From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> 
> Add ath12k_hw_params for the ath12k AHB-based WiFi 7 device IPQ5424.
> The WiFi device IPQ5424 is similar to IPQ5332. Most of the hardware
> parameters like hw_ops, wmi_init, ring_mask, etc., are the same between
> IPQ5424 and IPQ5332, hence use these same parameters for IPQ5424.
> Some parameters are specific to IPQ5424; initially set these to
> 0 or NULL, and populate them in subsequent patches.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h     |  1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c | 79 ++++++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..68453594eba8 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -157,6 +157,7 @@ enum ath12k_hw_rev {
>   	ATH12K_HW_WCN7850_HW20,
>   	ATH12K_HW_IPQ5332_HW10,
>   	ATH12K_HW_QCC2072_HW10,
> +	ATH12K_HW_IPQ5424_HW10,
>   };
>   
>   enum ath12k_firmware_mode {
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index ec6dba96640b..2b5d1f7e9e04 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -753,6 +753,85 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>   
>   		.dp_primary_link_only = false,
>   	},
> +	{
> +		.name = "ipq5424 hw1.0",
> +		.hw_rev = ATH12K_HW_IPQ5424_HW10,
> +		.fw = {
> +			.dir = "IPQ5424/hw1.0",
> +			.board_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
> +			.m3_loader = ath12k_m3_fw_loader_remoteproc,
> +			.download_aux_ucode = false,
> +		},
> +		.max_radios = 1,
> +		.single_pdev_only = false,
> +		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
> +		.internal_sleep_clock = false,
> +
> +		.hw_ops = &qcn9274_ops,
> +		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
> +
> +		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
> +		.ce_count = 12,
> +		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
> +		.target_ce_count = 12,
> +		.svc_to_ce_map =
> +			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
> +		.svc_to_ce_map_len = 18,
> +
> +		.rxdma1_enable = true,
> +		.num_rxdma_per_pdev = 1,
> +		.num_rxdma_dst_ring = 0,
> +		.rx_mac_buf_ring = false,
> +		.vdev_start_delay = false,
> +
> +		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
> +				   BIT(NL80211_IFTYPE_AP) |
> +				   BIT(NL80211_IFTYPE_MESH_POINT),
> +		.supports_monitor = true,
> +
> +		.idle_ps = false,
> +		.download_calib = true,
> +		.supports_suspend = false,
> +		.tcl_ring_retry = true,
> +		.reoq_lut_support = false,
> +		.supports_shadow_regs = false,
> +
> +		.num_tcl_banks = 48,
> +		.max_tx_ring = 4,
> +
> +		.mhi_config = NULL,
> +
> +		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
> +
> +		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
> +
> +		.rfkill_pin = 0,
> +		.rfkill_cfg = 0,
> +		.rfkill_on_level = 0,
> +
> +		.rddm_size = 0,
> +
> +		.def_num_link = 0,
> +		.max_mlo_peer = 256,
> +
> +		.otp_board_id_register = 0,
> +
> +		.supports_sta_ps = false,
> +
> +		.acpi_guid = NULL,
> +		.supports_dynamic_smps_6ghz = false,
> +		.iova_mask = 0,
> +		.supports_aspm = false,
> +
> +		.ce_ie_addr = NULL,
> +		.ce_remap = NULL,
> +		.bdf_addr_offset = 0x940000,
> +
> +		.current_cc_support = false,
> +
> +		.dp_primary_link_only = true,
> +	},
>   };
>   
>   /* Note: called under rcu_read_lock() */
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>



