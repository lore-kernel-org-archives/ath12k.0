Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC1AC47422
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 23:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CERkHsU70nO+wGZCCWbleHhRn0h1zZWsX6mSTCTy/dk=; b=CUp+crXmiYs9Nl4y/XAvnVcbxx
	yoc2qV2JHKdlezL2G489G31m4m14ocDbCmxsPwvblPgUhJ5tlQo95EhH32s40jfWMiqwdHqXCloE/
	PBF1EvHKnjlA8IHuyYY4mpFwjfnYTP8bwbuewMoQ3DnT5SY4Yovgck9jI64cXWA31UK/8Zl6LFFwK
	GZT81vaXK/x8Uhxd+Xp6Wp4BEnbNFp7QUmKy2T5hB4dciLclob/cN+CHkWcJPy4I5BqBYanTbS94f
	pOYBQ55e3/RSaVvKiYQu92pGEc7j00bxHvJzzHkPwDWvASG4Gq6tByvAn/ReM0hjm4AuNam9IGFgm
	QFC4jKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVGL-00000005hCI-2qD0
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 23:05:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTVGI-00000005hBQ-3dcH
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 23:05:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QMlOL0010839;
	Fri, 26 Jan 2024 23:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CERkHsU70nO+wGZCCWbleHhRn0h1zZWsX6mSTCTy/dk=; b=Bq
	Ac79VX1NzGCdkYswGDBxv/HopboIcgR4cyE9ob/Mmdq3+pztdOWEihI1wE8mE7Ss
	biPrucQEqpEGV9zP6d+RICqXW3AyOxiPePmO2J6Z4ZbcxC3hDgcqE8fO09g3cXeN
	H0vjSHGIxHLaG7nk0kuLOvyEU0ULVCZSAfXGdhjI5CMDoEE7ZY37IB2iU5UJWXdD
	ejNYDs542QotsFNYzF784FHWv0+kw4xeKdUu708xdBM55Fhql2SlxxlQ7Cnasqgg
	kL8vIHscBVcp48jpXqdH6+2qhigqiuoEdqjuGTDeQlcVpCeArdSbnRjd2W1iPQe1
	akwrZnhyREr1XvnbD2uA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv8e89sg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 23:05:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QN5Prl006555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 23:05:25 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 15:05:24 -0800
Message-ID: <0b39cf96-3ed4-45b7-9254-2604716afe14@quicinc.com>
Date: Fri, 26 Jan 2024 15:05:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] wifi: ath12k: fix incorrect logic of calculating
 vdev_stats_id
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-11-quic_kangyang@quicinc.com>
 <0dd4948b-e967-4562-b98e-2f4643205ca4@quicinc.com>
In-Reply-To: <0dd4948b-e967-4562-b98e-2f4643205ca4@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ckL5O4yvz069kGwa3YCzDUuroDFRat3n
X-Proofpoint-ORIG-GUID: ckL5O4yvz069kGwa3YCzDUuroDFRat3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_150526_956218_4DE3DB56 
X-CRM114-Status: GOOD (  22.26  )
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

On 1/26/2024 8:56 AM, Jeff Johnson wrote:
> And it seems there is another bigger issue here since, as the firmware
> document indicates, the vdev_stats_id field should be ignored unless the
> vdev_stats_id_valid field is non-zero, but in ath12k_wmi_vdev_create()
> we don't set vdev_stats_id_valid -- and we cannot set it since it isn't
> even present in the ath12k struct wmi_vdev_create_cmd! And comparing our
> struct to the firmware definition shows we have missing fields!!!
> Everything is correct up to pdev_id, but then there is divergence:
> 
> our struct
> struct wmi_vdev_create_cmd {
> 	__le32 tlv_header;
> 	__le32 vdev_id;
> 	__le32 vdev_type;
> 	__le32 vdev_subtype;
> 	struct ath12k_wmi_mac_addr_params vdev_macaddr;
> 	__le32 num_cfg_txrx_streams;
> 	__le32 pdev_id;
> 	__le32 vdev_stats_id;
> } __packed;
> 
> firmware definition
> typedef struct {
>     A_UINT32 tlv_header; /** TLV tag and len; tag equals
> WMITLV_TAG_STRUC_wmi_vdev_create_cmd_fixed_param */
>     /** unique id identifying the VDEV, generated by the caller */
>     A_UINT32 vdev_id;
>     /** VDEV type (AP,STA,IBSS,MONITOR) */
>     A_UINT32 vdev_type;
>     /** VDEV subtype (P2PDEV, P2PCLI, P2PGO, BT3.0, BRIDGE) */
>     A_UINT32 vdev_subtype;
>     /** VDEV MAC address */
>     wmi_mac_addr vdev_macaddr;
>     /** Number of configured txrx streams */
>     A_UINT32 num_cfg_txrx_streams;
>     /**
>      * pdev_id for identifying the MAC,
>      * See macros starting with WMI_PDEV_ID_ for values.
>      */
>     A_UINT32 pdev_id;
>     /** control flags for this vdev (DEPRECATED)
>      * Use @mbss_capability_flags in vdev start instead.
>      */
>     A_UINT32 flags;
>     /**  vdevid of transmitted AP (mbssid case) (DEPRECATED)
>      * Use @vdevid_trans in vdev start instead.
>      */
>     A_UINT32 vdevid_trans;
>     /* vdev_stats_id_valid indicates whether vdev_stats_id is valid */
>     A_UINT32 vdev_stats_id_valid;
>     /**
>      * vdev_stats_id indicates the ID for the REO Rx stats collection
>      * For Beryllium: 0-47 is the valid range and >=48 is invalid
>      * This vdev_stats_id field should be ignored unless the
>      * vdev_stats_id_valid field is non-zero.
>      */
>     A_UINT32 vdev_stats_id;
> /* This TLV is followed by another TLV of array of structures
>  *   wmi_vdev_txrx_streams cfg_txrx_streams[];
>  *   wmi_vdev_create_mlo_params mlo_params[0,1];
>  *       optional TLV, only present for MLO vdev;
>  *       if the vdev is not MLO the array length should be 0.
>  */
> } wmi_vdev_create_cmd_fixed_param;
> 
> (note the deprecated fields must still have their space allocated in the
> data structure)
> 
> So currently when host is writing to vdev_stats_id firmware will
> interpret this as the deprecated flags
> 
> So it seems like we also need to fix the WMI struct to:
> struct wmi_vdev_create_cmd {
> 	__le32 tlv_header;
> 	__le32 vdev_id;
> 	__le32 vdev_type;
> 	__le32 vdev_subtype;
> 	struct ath12k_wmi_mac_addr_params vdev_macaddr;
> 	__le32 num_cfg_txrx_streams;
> 	__le32 pdev_id;
> 	__le32 flags; /* deprecated */
> 	__le32 vdevid_trans; /* deprecated */
> 	__le32 vdev_stats_id_valid;
> 	__le32 vdev_stats_id;
> } __packed;

Sigh. I now realize that patch 7/11 in the series fixes this, and hence
why this 10/11 patch needs to be part of the series (or the 7/11 and
10/11 patches should be separated from the P2P feature).

Let me re-review the entire series instead of just reviewing the 7/11
patch without the associated context.

Must be Friday.

/jeff

