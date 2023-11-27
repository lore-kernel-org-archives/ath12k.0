Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BCCC4167B
	for <ath12k@archiver.kernel.org>; Mon, 27 Nov 2023 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiNfSUmHGo/YByY8IzrNe2/8Ay9hCVuAq8CDQGMMIwk=; b=vvmkAqECGgN2dt
	ZqmuzUy1pZOvPwZyENj9dM5PsQYpZmXULA/qhQ5SmTYk6Vkr3oN9IG4Z8zgG21SxM/toQuEaSzzBB
	HpIB/jXFuaER+UnzgriNZuroAzl/fByT3+oecV+/f9vuq6JP6Hwn5FB9rHJUMWkfgm5i15LhVSC7d
	L52wo286Vc5DmBhmebB1dLOjiYMo3vQBzFnG2bxATTWX2W7qOKnjGDE49NPIudE9GBi2/x4Y8nWCU
	Gb/8kIl+JUrsXFX5MrlHt8qOT/VdWy82tiDNYgCUNjcCfCNFsT6y+Z0ONGjEFNpv7fBYJc2w3TpzP
	dABxggV82rQQUYc8FUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7i69-003Qss-0e
	for ath12k@archiver.kernel.org;
	Mon, 27 Nov 2023 20:20:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7i65-003QsV-2J
	for ath12k@lists.infradead.org;
	Mon, 27 Nov 2023 20:20:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARGf8ni000705;
	Mon, 27 Nov 2023 20:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PykEI3kBnGArX6ZTILAiHR5jrndvm6I7RF6QCjTaLxM=;
 b=QumiNdThgZdTCIo6a1bU6S1RLbFHn6GQHpsQD4eeqMVdotC+FiuIeJHLi4USf20BbLRE
 iiY1zguvESxyfjQPvuRkEz6rC8gafRyuiVgvtHqzQa7orgWyZuLL7vmeZbV7Q2jFpPHm
 Pt5CF6Qm66uN+TfK5pt3jXcOem9bbC4UvGIXhptov40KJJ6aCwr1MwGLY0eqLaV9tIdz
 fOe8sG0kykhLehwK+H+B/eicjbLPH5RAuj+QYivh7E9Nxny5UJVRAxebzLSqK57/vn+d
 ZH2hU/BXOlhJGhYLR1JVWMdyAVFjF9TsVckKCPxHkk93eZ9hvzkebLm4khJ7xfFQvOgW DQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk69udqu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 20:20:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARKKirc022822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 20:20:44 GMT
Received: from [10.110.63.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 12:20:43 -0800
Message-ID: <13582287-09b3-4da8-8d5e-5521777b2758@quicinc.com>
Date: Mon, 27 Nov 2023 12:20:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix layout of scan_flags in struct
 ath12k_wmi_scan_req_arg
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ath12k@lists.infradead.org>
References: <20231127180425.1695427-1-nico.escande@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231127180425.1695427-1-nico.escande@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _z9fHolTNOK7Dv0jbk9V-CUe-wvBjoTz
X-Proofpoint-GUID: _z9fHolTNOK7Dv0jbk9V-CUe-wvBjoTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_19,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=997 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_122049_891895_DEA75E2D 
X-CRM114-Status: GOOD (  21.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/27/2023 10:04 AM, Nicolas Escande wrote:
> There is a layout mismatch between the bitfield representing scan_flags in
> struct ath12k_wmi_scan_req_arg & the bits as defined in the WMI_SCAN_XXX
> macros. Fix it by making the biefield match de #define values.
> 
> I especialy checked by adding WMI_SCAN_FLAG_FORCE_ACTIVE_ON_DFS to
> scan_flags and the firmware started to unconditionnaly send probe request
> on DFS channels during scan.
> 
> Tested-on: QCN9274 hw2.0 PCI CI_WLAN.WBE.1.2.1-00148.1-QCAHKSWPL_SILICONZ-7
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 629373d67421..2b5b46f8898e 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -3307,17 +3307,17 @@ struct ath12k_wmi_scan_req_arg {
>  			    scan_f_filter_prb_req:1,
>  			    scan_f_bypass_dfs_chn:1,
>  			    scan_f_continue_on_err:1,
> +			    scan_f_promisc_mode:1,
> +			    scan_f_force_active_dfs_chn:1,
> +			    scan_f_add_tpc_ie_in_probe:1,
> +			    scan_f_add_ds_ie_in_probe:1,
> +			    scan_f_add_spoofed_mac_in_probe:1,
>  			    scan_f_offchan_mgmt_tx:1,
>  			    scan_f_offchan_data_tx:1,
> -			    scan_f_promisc_mode:1,
>  			    scan_f_capture_phy_err:1,
>  			    scan_f_strict_passive_pch:1,
>  			    scan_f_half_rate:1,
>  			    scan_f_quarter_rate:1,
> -			    scan_f_force_active_dfs_chn:1,
> -			    scan_f_add_tpc_ie_in_probe:1,
> -			    scan_f_add_ds_ie_in_probe:1,
> -			    scan_f_add_spoofed_mac_in_probe:1,
>  			    scan_f_add_rand_seq_in_probe:1,
>  			    scan_f_en_ie_whitelist_in_probe:1,
>  			    scan_f_forced:1,

+ath12k mailing list

Repeating my same message from the ath11k patch:

You are convoluting two different data structures.

struct ath12k_wmi_scan_req_arg is used to represent a scan request
within the host driver. This does not use the WMI_SCAN_XXX macros.

struct wmi_start_scan_cmd is used to represent the scan request command
sent to firmware. This struct uses the WMI_SCAN_XXX macros to fill some
members of this struct in ath12k_wmi_copy_scan_event_cntrl_flags().

So your change has no effect on the driver operation and incorrectly
tries to foist the firmware definition upon the host internal
representation.

So NAK to this patch.

/jeff

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
