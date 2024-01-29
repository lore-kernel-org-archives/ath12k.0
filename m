Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1FEC47258
	for <ath12k@archiver.kernel.org>; Mon, 29 Jan 2024 02:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ITM5XD3gnYa/UxZzddqaowsseIQSCKu+Rpf3SZiR9Q=; b=DL1rmBnNsFG/kbVEq6s6CsrvhS
	QRpz48I5qtBe8LEfEmDvb32ijJ3xp1tpJ48yvA0kp3W0UHknUPHYqQK8DRTi4yG9+2dUkGeRluwel
	1Ys+GFT+ZyOX3SFaFsBPr3yHgPycAPT/6TOk8orLbBf4SwGKonXHSu3EEJVqOSdDXUo92xAhgeZ7S
	BRt35VJs7XTbNZtziLaxiUFhsWi6gxBnS7DbpRKb3uBSRO7u8Yb3EqBGMfqCosa1S+SMXIwNkUxcQ
	4xdG5RJKgDNbq9In1kzaRMeAhscqBBv+2hpRRyDj3zvIDHma8Ws+Y+nRFlczbqGt92rfnQNme5CVU
	07PSyLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUHKq-0000000B1HP-12A7
	for ath12k@archiver.kernel.org;
	Mon, 29 Jan 2024 02:25:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUHKo-0000000B1Gr-0l7p
	for ath12k@lists.infradead.org;
	Mon, 29 Jan 2024 02:25:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T2PGkR020743;
	Mon, 29 Jan 2024 02:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7ITM5XD3gnYa/UxZzddqaowsseIQSCKu+Rpf3SZiR9Q=; b=YL
	fXs0KqH7PQczxo/UwKiKgO43YtcUAsxVmv3U7w+4uiUdbrsRJ1R2VZyq2OjFtmqf
	Y8i4W53mM6ueaqY6dMN1FffvnwOYH8F2XGj2fCKBZ09rUFiGuX1a+zIjEBdORXl7
	U0SaTtvS+wwt4Rr6ECtexFhdFr8b4mrwdH8EaEwz0+3V/x1bPmB7zLoZ0DtpVBMG
	5enA+v6uFEzJszeGepJVT6UB0GZGWVzqO4tMAKjg87OPwBtlV5F2+PY0DmCzkdQ0
	BrNMh0eCisBPe5HhkyDOsu4fbE2112f6sVgP1vMaNrgkFTondYZkKTSycTjuR25X
	FvE+lAcRET/KvgG+ie3g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvtkmahjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 02:25:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T2PF2b005899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 02:25:15 GMT
Received: from [10.253.12.70] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 28 Jan
 2024 18:25:13 -0800
Message-ID: <ef7b72b2-3a34-4e94-8552-834f24e4bddc@quicinc.com>
Date: Mon, 29 Jan 2024 10:25:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] wifi: ath12k: fix incorrect logic of calculating
 vdev_stats_id
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-11-quic_kangyang@quicinc.com>
 <0dd4948b-e967-4562-b98e-2f4643205ca4@quicinc.com>
 <0b39cf96-3ed4-45b7-9254-2604716afe14@quicinc.com>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <0b39cf96-3ed4-45b7-9254-2604716afe14@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WIoNBWvwndpWf-hOAWHMb4fjWpBOyCFR
X-Proofpoint-GUID: WIoNBWvwndpWf-hOAWHMb4fjWpBOyCFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=961 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_182518_287982_F4C181FB 
X-CRM114-Status: GOOD (  20.40  )
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



On 1/27/2024 7:05 AM, Jeff Johnson wrote:
> On 1/26/2024 8:56 AM, Jeff Johnson wrote:
>> And it seems there is another bigger issue here since, as the firmware
>> document indicates, the vdev_stats_id field should be ignored unless the
>> vdev_stats_id_valid field is non-zero, but in ath12k_wmi_vdev_create()
>> we don't set vdev_stats_id_valid -- and we cannot set it since it isn't
>> even present in the ath12k struct wmi_vdev_create_cmd! And comparing our
>> struct to the firmware definition shows we have missing fields!!!
>> Everything is correct up to pdev_id, but then there is divergence:
>>
>> our struct
>> struct wmi_vdev_create_cmd {
>> 	__le32 tlv_header;
>> 	__le32 vdev_id;
>> 	__le32 vdev_type;
>> 	__le32 vdev_subtype;
>> 	struct ath12k_wmi_mac_addr_params vdev_macaddr;
>> 	__le32 num_cfg_txrx_streams;
>> 	__le32 pdev_id;
>> 	__le32 vdev_stats_id;
>> } __packed;
>>
>> firmware definition
>> typedef struct {
>>      A_UINT32 tlv_header; /** TLV tag and len; tag equals
>> WMITLV_TAG_STRUC_wmi_vdev_create_cmd_fixed_param */
>>      /** unique id identifying the VDEV, generated by the caller */
>>      A_UINT32 vdev_id;
>>      /** VDEV type (AP,STA,IBSS,MONITOR) */
>>      A_UINT32 vdev_type;
>>      /** VDEV subtype (P2PDEV, P2PCLI, P2PGO, BT3.0, BRIDGE) */
>>      A_UINT32 vdev_subtype;
>>      /** VDEV MAC address */
>>      wmi_mac_addr vdev_macaddr;
>>      /** Number of configured txrx streams */
>>      A_UINT32 num_cfg_txrx_streams;
>>      /**
>>       * pdev_id for identifying the MAC,
>>       * See macros starting with WMI_PDEV_ID_ for values.
>>       */
>>      A_UINT32 pdev_id;
>>      /** control flags for this vdev (DEPRECATED)
>>       * Use @mbss_capability_flags in vdev start instead.
>>       */
>>      A_UINT32 flags;
>>      /**  vdevid of transmitted AP (mbssid case) (DEPRECATED)
>>       * Use @vdevid_trans in vdev start instead.
>>       */
>>      A_UINT32 vdevid_trans;
>>      /* vdev_stats_id_valid indicates whether vdev_stats_id is valid */
>>      A_UINT32 vdev_stats_id_valid;
>>      /**
>>       * vdev_stats_id indicates the ID for the REO Rx stats collection
>>       * For Beryllium: 0-47 is the valid range and >=48 is invalid
>>       * This vdev_stats_id field should be ignored unless the
>>       * vdev_stats_id_valid field is non-zero.
>>       */
>>      A_UINT32 vdev_stats_id;
>> /* This TLV is followed by another TLV of array of structures
>>   *   wmi_vdev_txrx_streams cfg_txrx_streams[];
>>   *   wmi_vdev_create_mlo_params mlo_params[0,1];
>>   *       optional TLV, only present for MLO vdev;
>>   *       if the vdev is not MLO the array length should be 0.
>>   */
>> } wmi_vdev_create_cmd_fixed_param;
>>
>> (note the deprecated fields must still have their space allocated in the
>> data structure)
>>
>> So currently when host is writing to vdev_stats_id firmware will
>> interpret this as the deprecated flags
>>
>> So it seems like we also need to fix the WMI struct to:
>> struct wmi_vdev_create_cmd {
>> 	__le32 tlv_header;
>> 	__le32 vdev_id;
>> 	__le32 vdev_type;
>> 	__le32 vdev_subtype;
>> 	struct ath12k_wmi_mac_addr_params vdev_macaddr;
>> 	__le32 num_cfg_txrx_streams;
>> 	__le32 pdev_id;
>> 	__le32 flags; /* deprecated */
>> 	__le32 vdevid_trans; /* deprecated */
>> 	__le32 vdev_stats_id_valid;
>> 	__le32 vdev_stats_id;
>> } __packed;
> 
> Sigh. I now realize that patch 7/11 in the series fixes this, and hence
> why this 10/11 patch needs to be part of the series (or the 7/11 and
> 10/11 patches should be separated from the P2P feature).
> 

They cannot be separated from the P2P feature.
Without patch 7/11, P2P won't run properly due to firmware crash.



> Let me re-review the entire series instead of just reviewing the 7/11
> patch without the associated context.

Maybe i need to move patch 10/11 to 8/11, make them closer?


> 
> Must be Friday.
> 
> /jeff

