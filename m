Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23075E7E34F
	for <ath12k@archiver.kernel.org>; Fri,  3 Apr 2026 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqFxlfuV8pspBAs2CXOzM9DH0w3Wtyj4158jVPNTSw0=; b=Fzachs5B5H2MGFChJKz+m5t27V
	CzpyqwFVc0Im7y61bqFHrUyNckEtP+NAx+qrhLaSvG3VJQU4yT1hYXAHAp2QhiReFcWJqz8ujBIiJ
	e9O5Qrs4zZ9AL3ZE1Wi7F9wWmlQbYemxhS6YF3lZdO6jIsNNmhIv4D+C7pfRsS1S31EtQgoynisPI
	Sl3M8RvejYd8VT4gZmryhL6IwBLd9k15n+6z5h++s0XDBh+jlkNxwa7Uf1Mi/KiOCUvyDc3XzsZgY
	vtf71KbrSCNDiGVFRrosxY2ypxMo19pligblcQa4uMBDMK6Uj4wjA9Ej5IPsT0kab0GwUWfrRXCbI
	bUJZej8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aPE-00000001lNb-2x1k;
	Fri, 03 Apr 2026 09:01:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aPD-00000001lNS-15Xt
	for ath12k@bombadil.infradead.org;
	Fri, 03 Apr 2026 09:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oqFxlfuV8pspBAs2CXOzM9DH0w3Wtyj4158jVPNTSw0=; b=QnzVf9w8DNjBJ19Y8cOOEPFEX+
	yIV2uYhEbdDtiK45qnqO0YdWNZaGsP97uAkUuVKZv7ju/3P4rzNRF6gxB3qT3RKIrCTUPnCC3Ktrs
	sRr2ZFZ9FBsS8mzhhbV4fZZBSrErkfCn/lurDzC/Zd8FCdsLsw0Xk7iAx7lSMzBgBVat3YE1SlG1t
	HqhaUGrXgekiKN+FCRdVEVtsKIf3eUZ3MnNqLauws3YrbAZDcFhORsKY1P4J6IgJSEHSK7U8BxScW
	PsPards0ZuUJsGCXF+zLVVCeoeElh6iuxUR9n0fG1lrjmMrwDut+yPEAjDt2xD7HDrhBPnMVMwuz9
	9UHEqHMg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aP9-00000003r5B-0FMH
	for ath12k@lists.infradead.org;
	Fri, 03 Apr 2026 09:01:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336Gip83772892
	for <ath12k@lists.infradead.org>; Fri, 3 Apr 2026 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqFxlfuV8pspBAs2CXOzM9DH0w3Wtyj4158jVPNTSw0=; b=MJuVqINBnD/Yyeyf
	XO0FEH61k35SZ0MZfCZiIaX8buCquv/HA3O8+WCTM+DE750FkWOBICkUnqJzvRPR
	A/5AWn4IoLgMYxcfVtzqgJ2w53TVf9VeyE5HsY73x9inaUN3dDrtYgk4/55G/1Bb
	VXZ7reDiil/wTbsfBOKqJIbEmyqABijJOStLGwj4mNLcKeioOa4leWB1O5CzDLjG
	RQZUzx6EP17sKEraLd4OdMHkQAAS1e1+z/ZQB8g2kmevszH4iNDuD/Uy0YtHqADs
	+qFjWo2B8ecRU2HyvtyMPI3Cjaiy6gaKvu7sYYL1A74zGu09lNI5oloaHKOzdoEI
	pekMYw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs2a0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Apr 2026 09:01:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so17541195ad.0
        for <ath12k@lists.infradead.org>; Fri, 03 Apr 2026 02:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775206881; x=1775811681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqFxlfuV8pspBAs2CXOzM9DH0w3Wtyj4158jVPNTSw0=;
        b=b/IfRdHk97xq5/IDSWODWYgtSpDKWPlInv1P6HHK1JgJJSWNXX3H6Cyggj0YSyebzD
         ifKhxbKd5VlMeDcdQKMglY16WTAr18N7UiqWLz9e2mxjq51HWXEmJoj28weteTg7T9kk
         A43/46GzhDluEH0MBDsA3mNZ2sWmj2hx+JgJHlUK5mORNTVU5jz/tuokY6NZuzjK2mN+
         BphIKwLba62n+7Mxgv51m+UI3wihdFMtJay7+flK7eDVljL7kP+wR2TAEHAKkRcZDVEI
         I/FblZ2zbtS6+yrEs9jJSz2cvienKMC4uZlYTOB/+sVBom4tuwTh5eO+xOvFOvqrjy9j
         SztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206881; x=1775811681;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqFxlfuV8pspBAs2CXOzM9DH0w3Wtyj4158jVPNTSw0=;
        b=gesQrbjT1BVLy1L+/mdE1Mck2BxqjRj8KvPyjJEOp4Jvg5hX2Qx5pEnbJfRhv6fkTh
         1QccOBTx3kHRVcQaEykCCBzwV+d5918Gcp7s+uQOcB4/wbox9DdsgI9p5cnQ6B+3N3Eq
         EUbjYhxQ3ER5hXZsZLFU0KFeGtHSInYLDRyBHFxoOAUHusOvQ6Q9uyKi8HJ0gE5lhHfC
         xeONIvXmgXkajpvSToQ/DoCpYr53Q7TJc/r79NNeCx2581KWAW8H13NC3KtUQgmEiWJw
         5ilNsj3WWuCYEPXhf/7YEPrSOkXdCyEXJ6LBzmN82ArMO69pup340kMxks/laqo99obB
         E9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUixhcAHb97EKPwlHCLfK8bkny3sAqNeMl6qfCUauxpXbTHDxr9NHcFoSk5+PeVpv18Adt7W3c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHhsZMDPU/X1clefbK5TxAAwixiPjWP6Qk2fq1s2R3vDfAmjdP
	jUrTZVVYEQZzw5qX6p4Nx6eLJir5QNR79Pm6knsNCEry36Nebx44TK0twe6uNBSEooBamnNSIsc
	aC6WRzPVUZKxcAVgLGDPYpTjmfdsk59s7B0m3LwSFOPZJYHik63lQRg6N+9RWCB+V
X-Gm-Gg: AeBDievQ/1x++bV1PVWmjI6vbjpNAlogJaiNbPVhNhDw49r2K455RFnaYyE9jXoiTBR
	Bls40DXQpfzY0joJAafhYbcAPPRCbpIbRNu6swtI2uHwB6rxNpMd1mJU1xClw6aod2vbxME8xNB
	ZsaRIxwxPOU2oendrUblMmRgnztaLF9W6/i85fBT03Wh9EIBzgpB7oBA+wCPYYwMyzlAlSdOhAK
	jQmv6j7+cq3ckZjedAJ2JpzpD6osEq1AYWpBaE4yHKwYYcHm29/nlKAAxQVuOROIUbPVbJdF6Ru
	2Xi1vRR3kegTTr76gqFneoaptRdslQxNwA1Z+6IkQdJhGs6MRraNeWRaaVuTa057WF+CBboKJE5
	eardAYgmkTbFe1E1pKDalYZAcX5C8ESsCTlGMszJkxtQTsk9Vg+D0MnMDBnozlX8BrhSFvx/U9o
	ygRt1q7Fo1bojjJpY9L0Q=
X-Received: by 2002:a17:903:1b4c:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b28182c458mr24575745ad.32.1775206880389;
        Fri, 03 Apr 2026 02:01:20 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b28182c458mr24575075ad.32.1775206879727;
        Fri, 03 Apr 2026 02:01:19 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472cdfesm53090625ad.14.2026.04.03.02.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:01:19 -0700 (PDT)
Message-ID: <5fff7189-fee7-4d73-a9a1-728389900678@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 17:01:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 2/6] wifi: ath12k: Add ath12k_hw_params for
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
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
 <20260402-ath12k-ipq5424-v4-2-cd1e0f0a6c88@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-ath12k-ipq5424-v4-2-cd1e0f0a6c88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bVp-2DgK147UMOxeuqUrcQNIjYOQCvz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OCBTYWx0ZWRfX037sSo9h2c4N
 OdRmdlvKSF+uM+GAIkP2OD+ZAYXBjSRTIbW1chFdfdBY56nrLwWmYZFdKTLDzj1NYDtDqICVI2O
 i/nqqfkh1M+mtM8teRpVTkTsBejg8MaA12zZqYTYT3rn9ReNR4rUOWNCLZ1miapwcFfFs/96LcC
 X2kLYDSyRWef0gghsEOqH5cwGcaHhrUgbrYhVk/FbKGwkgGYpDRAlcO24e2bHfKz7ioWOCuFTDa
 m9Y0wpuZ9YdCsfZ7ii2CISnpmvyKTfY8L/YT6yhI6VkF9iniDbV7dO8v6ANTcyKUBy/By8Sz0Vq
 ZTwsnFVn271hp/O//ZkCwLS1aLNYbFdaQbOWYnGzvQP7II3233oPcP0bgDinc7rh792P/ZfsZLx
 XoVx0PE4WnSt41l7/jkZyLpAyFwRROGSDyMAi95q+Qa87iECkB/VGXKTM3VnOc9C4Nla4mKsHqc
 sksKpXj6F0w/lC6o+Qw==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cf81e1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Z7WYvUlOW1kuK6QZCLMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bVp-2DgK147UMOxeuqUrcQNIjYOQCvz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100127_449104_C53786CF 
X-CRM114-Status: GOOD (  17.79  )
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



On 4/2/2026 11:54 AM, Raj Kumar Bhagat wrote:
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
> ---
>  drivers/net/wireless/ath/ath12k/core.h     |  1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 75 ++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..68453594eba8 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -157,6 +157,7 @@ enum ath12k_hw_rev {
>  	ATH12K_HW_WCN7850_HW20,
>  	ATH12K_HW_IPQ5332_HW10,
>  	ATH12K_HW_QCC2072_HW10,
> +	ATH12K_HW_IPQ5424_HW10,
>  };
>  
>  enum ath12k_firmware_mode {
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index ec6dba96640b..9b9ca06a9f45 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -753,6 +753,81 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  
>  		.dp_primary_link_only = false,
>  	},
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
> +		.dp_primary_link_only = true,
> +	},
>  };

mhi_config and current_cc_support are missing, please explicitly set them.

>  
>  /* Note: called under rcu_read_lock() */
> 


